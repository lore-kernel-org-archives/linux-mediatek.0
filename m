Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2B5F0182E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlP4+/T8HO4OS9CBYj2Xq6DuqZPRSrnhT+fSfVGyrPw=; b=rL5Pld5whNMX6qfmoz2+pXmANp
	PbAZOwCuH5V6zHSalkb5yDv6bUz+9mKpB7h9r817rWfW7ZeME4LHS8qej7Eou9hatsrhbEcFIG+Vo
	f9zLscZv/57SZ2O/MnjaencNofjWVqvmRI1zsHhrHWnfm5b2qr9s8yFJWkfYh5HnTsvR4sVXbveno
	Kob7rAKlPpbIk57E2Z3sRz2FaoB2Aee80u125qJGspqm2rtUd51Urx1GYqHDfERBrUafZwNpMkGPn
	i/3IUf2e0bXIbfWj1mTMAm2hZ9b3z9D5dG7ZhE9Pt/+DyIHc9ogs4uu0sG/lUcDLK3XWtN+XSowud
	eJ9xWhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxY-00000003bwx-38eD;
	Fri, 06 Mar 2026 12:07:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTxW-00000003buT-0VOX
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 12:07:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso6270664f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772798828; x=1773403628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SlP4+/T8HO4OS9CBYj2Xq6DuqZPRSrnhT+fSfVGyrPw=;
        b=dxLSfoLrXyCQUYlfkeaZQudbKjOA6Kvs6qWYIM+BOlUeCcKwbAUrI/Z22QEMM+kFGg
         LEHdpA8WViJOokwxJSPkcvsbKBS1SFtYRlzxlvbt0v5Vmna6LxXRRuI46z/NCRr7Q4/F
         ql6D42dd3QD7979yo+n4nXQ8TnxCim2MjPtBP9b9AmTMnmTXagneT3mYMEPJWsg19MVY
         SLBchBAZM04I13dqyEhqXmoIxt2+MOjOPb76M+7sBrqt5exB17VB1go3E65MsmTpkGzx
         2FHM19gHgPMnIQWL4+3HYgVBEVB7pO7lNIalGrjctWfZS/IabF3Ok8rMZtvW5VbhvkvZ
         Gqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798828; x=1773403628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SlP4+/T8HO4OS9CBYj2Xq6DuqZPRSrnhT+fSfVGyrPw=;
        b=bjDTCdKapt4icdbkvtSt3Wkd4Oxx4P4kMJ4DX218hmMxAMT6GRwfJFU79Zp9XLP19L
         fp5sch7DRN2BaYcR1yu20oF3cXTlba27oIJ622dTORnG2AwoIFFkwaAst474B0Py81oe
         bilsAKOKy6LvmlW2wSJfM9CVF8AmwENShHOkR1tqvL3r5u8E+8I1+j2o3ezpRcOBNUYl
         BnhTSEh1euCuqAVJTOWTnj+H1QXLx8ZcYCIJwYXTuvjBUHHMjzro5ehnCvRqHRt8094F
         WBXVrEaZ72NN0eG90Jdu4XuWr+ExruiWq00rxmJNXU1MlBglZNsX1g9VHdn675F3Iu26
         dXXg==
X-Gm-Message-State: AOJu0YzmVd4NEvmKfhYcB7eI0L9/1XUbH2EB7McQCME9J9QDQ/Cnmx7H
	oBEMCULJQqNLqDxzzd/Mp2mGwiemXBD9FokkbsGw27r8Ib+aGSsK+xiXQk0hqfq0
X-Gm-Gg: ATEYQzwv2hCtuJ9q2E6V0pv6WE0UTiZsYVjAUcTncM/UmoAIPTimYb82Z0aN/lFd9cA
	kTp9vO159aQGC57Yg/zbxLgKjQ5A0iCCLJ+RyYUsZ1ismxJh2H0AVxCZT/ALTB/YaBfYOWVoa/x
	rswaSMnVYZrmj00W5dsBFPB0iPVpUt4EQk30C00A4P3f4WyzOlnEqJoPlWyHTAtQ75d76LJoVQx
	3M7bj/xjmFJz8gKqfzh9nc0C+kowidC5+AFaR4pzrTCc5wXe36m3Jdk7ks+KJGWgSyC4YqhT1JO
	b5rgP0NRl5X2MyF0w8dVtlcYuXxj3YUvuM8l5ZkLgB+blOF1sE4/PhVRioKkGwfkwwBu8WKO+Rt
	ess5YomrGvWlwuwOHjsaW90eOO4QJ2sWm4+Ia+bpemKRPKiA97cQBQ32Ln59iv9IdUraks5pEKx
	ESg40tZ/vfs8gLciILjrg=
X-Received: by 2002:a05:6000:4205:b0:439:c9d0:5fd4 with SMTP id ffacd0b85a97d-439da656affmr3257347f8f.16.1772798827969;
        Fri, 06 Mar 2026 04:07:07 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3457225f8f.21.2026.03.06.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:07:07 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 7/7] arm64: dts: mt6392: add mt6392 PMIC dtsi
Date: Fri,  6 Mar 2026 12:03:11 +0000
Message-ID: <20260306120521.163654-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306120521.163654-1-l.scorcia@gmail.com>
References: <20260306120521.163654-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_040710_202290_C466E6D6 
X-CRM114-Status: GOOD (  12.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 134 +++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..c7e54c30bc3a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		regulators {
+			compatible = "mediatek,mt6392-regulator";
+
+			mt6392_vproc_reg: buck_vproc {
+				regulator-name = "vproc";
+			};
+
+			mt6392_vsys_reg: buck_vsys {
+				regulator-name = "vsys";
+			};
+
+			mt6392_vcore_reg: buck_vcore {
+				regulator-name = "vcore";
+			};
+
+			mt6392_vxo22_reg: ldo_vxo22 {
+				regulator-name = "vxo22";
+			};
+
+			mt6392_vaud22_reg: ldo_vaud22 {
+				regulator-name = "vaud22";
+			};
+
+			mt6392_vcama_reg: ldo_vcama {
+				regulator-name = "vcama";
+			};
+
+			mt6392_vaud28_reg: ldo_vaud28 {
+				regulator-name = "vaud28";
+			};
+
+			mt6392_vadc18_reg: ldo_vadc18 {
+				regulator-name = "vadc18";
+			};
+
+			mt6392_vcn35_reg: ldo_vcn35 {
+				regulator-name = "vcn35";
+			};
+
+			mt6392_vio28_reg: ldo_vio28 {
+				regulator-name = "vio28";
+			};
+
+			mt6392_vusb_reg: ldo_vusb {
+				regulator-name = "vusb";
+			};
+
+			mt6392_vmc_reg: ldo_vmc {
+				regulator-name = "vmc";
+			};
+
+			mt6392_vmch_reg: ldo_vmch {
+				regulator-name = "vmch";
+			};
+
+			mt6392_vemc3v3_reg: ldo_vemc3v3 {
+				regulator-name = "vemc3v3";
+			};
+
+			mt6392_vgp1_reg: ldo_vgp1 {
+				regulator-name = "vgp1";
+			};
+
+			mt6392_vgp2_reg: ldo_vgp2 {
+				regulator-name = "vgp2";
+			};
+
+			mt6392_vcn18_reg: ldo_vcn18 {
+				regulator-name = "vcn18";
+			};
+
+			mt6392_vcamaf_reg: ldo_vcamaf {
+				regulator-name = "vcamaf";
+			};
+
+			mt6392_vm_reg: ldo_vm {
+				regulator-name = "vm";
+			};
+
+			mt6392_vio18_reg: ldo_vio18 {
+				regulator-name = "vio18";
+			};
+
+			mt6392_vcamd_reg: ldo_vcamd {
+				regulator-name = "vcamd";
+			};
+
+			mt6392_vcamio_reg: ldo_vcamio {
+				regulator-name = "vcamio";
+			};
+
+			mt6392_vm25_reg: ldo_vm25 {
+				regulator-name = "vm25";
+			};
+
+			mt6392_vefuse_reg: ldo_vefuse {
+				regulator-name = "vefuse";
+			};
+		};
+
+		rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6397-rtc";
+		};
+
+		keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+	};
+};
-- 
2.43.0


