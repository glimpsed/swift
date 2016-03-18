// RUN: %target-swift-frontend %s -profile-generate -profile-coverage-mapping -emit-sil -o - | FileCheck %s --check-prefix=SIL
// RUN: %target-swift-frontend %s -profile-generate -profile-coverage-mapping -emit-ir -o - | FileCheck %s --check-prefix=IR

// SIL-DAG: sil hidden @_TF8coverage2f1FT_T_
// SIL-DAG: string_literal utf8 "_TF8coverage2f1FT_T_"
// IR: @__profn__TF8coverage2f1FT_T_ {{.*}} c"_TF8coverage2f1FT_T_", section "__DATA,__llvm_prf_names"
internal func f1() {}

// SIL-DAG: sil private @_TF8coverageP33_[[F2HASH:[_a-zA-Z0-9]+]]
// SIL-DAG: string_literal utf8 "{{.*}}coverage.swift:_TF8coverageP33_[[F2HASH]]"
// IR: @"__profn_{{.*}}coverage.swift:_TF8coverageP33_[[F2HASH:[_a-zA-Z0-9]+]]" {{.*}} c"{{.*}}coverage.swift:_TF8coverageP33_[[F2HASH]]", section "__DATA,__llvm_prf_names"
private func f2() {}

// SIL-DAG: sil @_TF8coverage2f3FT_T_
// SIL-DAG: string_literal utf8 "_TF8coverage2f3FT_T_"
// IR: @__profn__TF8coverage2f3FT_T_ {{.*}} c"_TF8coverage2f3FT_T_", section "__DATA,__llvm_prf_names"
public func f3() {
  f1();
  f2();
}