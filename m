Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4376AD2FFE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZLLeXqOR+j4J5K80kKtmagY5cg9UQK6bpjzIEEsrbRk=; b=l1/lGgDl8SYWyvN8+j84xPhsMV
	b+lEbPMGB6M6xrpS7m9eWVlL4rAsBxQ/ZXZjJ/yz5vFK6A+L4DqB7TkgVT1ZMUGVeD/PEJf4Q2G7S
	vD1UbmmCg2uDhkkKhrxZIq1UZ1tnccimCN1akpApvetiU1tYlpmgQagkglpf+sMS6CgzimjgWNOQu
	18itpekUp8KmbwuAQGInaAIGF8blbGqiDSKdHhDdIY23FL6E8mv3M7NBDuK7ozAmLbWuimORsEDQ5
	Da3ZL0jBQ6h41/YkbAiihoLtZZpY/TDjuou+Q4iF53jcqFn7PGomjHzANz5QKylZM8NXoX9i/jBEa
	ff94bqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jXE-00000000EWr-2EMS;
	Fri, 18 Oct 2024 09:44:40 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1jVW-00000000E45-2ewj
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 09:42:56 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e293150c2c6so4118922276.1
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729244572; x=1729849372; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLLeXqOR+j4J5K80kKtmagY5cg9UQK6bpjzIEEsrbRk=;
        b=U7SCxtFVxqUNgECwmgCYF1Q1J2y/NqQ1Rvw6TbgH1N+pIrM7i1N16gRm91aFHYpF5s
         YYQvV+KIS6LqH+JD/ZU6KX2wv8idi8wCaT8dezKSmCfmW/1x/ZviDUnHJVnQrGpQeZPd
         XLZ7fGWhjtr6Tx1WtjvWxc5K0W3WvIntsvKli976/zBz4LhNqoi9M81qTkpMhoZUOGdV
         1R3EYMr4HKAxSQ+5MLkYwZsKdpuuUe55EL5xAEO2fWE9LAa7LysAxSBkuzH01ezs9AW5
         Dz/hnf9eY8Ubwoj16SyGCfslRtL8EtNoZKPLSuy4hTxr98FXoGaAMD8PZ5VCfzu/daaO
         pykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729244572; x=1729849372;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLLeXqOR+j4J5K80kKtmagY5cg9UQK6bpjzIEEsrbRk=;
        b=HOTq13K0u2CeyDxaU1MZlQ2EW0YgSMXLUBr5fq746df0jA2u1EWU+OXhE8TX1JLZTQ
         gmHZbqBnYgMLvBbyDXJSh/1k3T7EJo3gdhd3pMNo1bOK6xuTGzS1NaBAaVFKthjx2E3a
         4tzHOiXGWiDjm8MXCYMfnjvPf6oELFkma1SKVVicnd68ViOO7y5+fOi9ruCnAhj5SsT/
         qt79yrsxeAfDGsltUgb6RLo7CXKA0k22gacI/iLUO61Gt7Kc9JnxcKfq5uthvsi097HB
         D8O8zv2pj5VDdd+eWp9apLGnYKiweTL2FETKPb2PYDg7qVGNcX7YtACr/b3KD0YkOtkn
         KwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIyjQz71LlEQmaJVubadrsnKkpD59f7lJTou4mkxpO09AjxVdUTj7xA56fwDJK/y5ZRksB7sQKFfEK90juCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTvPjtyaM2iPTYMt8L6WziIwjMKBoYTwfv5gZap9DlSdhxSoBQ
	Xc/uzoSTTqfp3HheQ4rqALEU16Q08dNhPfO2hdpdMoymeQNIlfs6iMdXEFPb9HRSrwGbK0dkHRB
	4b/2R3Q==
X-Google-Smtp-Source: AGHT+IGSb0cw0pG+y/p+bObtKjZ2/Bbc3rekx20QPwcvKWAaCsQSzG1nltOqjouiHxq2r34MIkLGayvZUvNB
X-Received: from malysz.c.googlers.com ([fda3:e722:ac3:cc00:cb:de80:ac1c:6aa9])
 (user=jakiela job=sendgmr) by 2002:a5b:702:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e2bb1699b0fmr1108276.8.1729244572306; Fri, 18 Oct 2024 02:42:52
 -0700 (PDT)
Date: Fri, 18 Oct 2024 09:42:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241018094234.2633366-1-jakiela@google.com>
Subject: [PATCH] arm64: dts: mt8186: Update regulators voltages
From: "=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?Albert=20Jakie=C5=82a?=" <jakiela@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_024254_741547_64D42651 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Update minimum and maximum voltages and add
missing regulators.

Signed-off-by: Albert Jakie=C5=82a <jakiela@google.com>
---
 .../boot/dts/mediatek/mt8186-corsola.dtsi     | 107 +++++++++++-------
 1 file changed, 63 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/=
boot/dts/mediatek/mt8186-corsola.dtsi
index 682c6ad2574d..62158eac45d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1302,8 +1302,8 @@ mt6366_regulators: regulators {
=20
 			vcore {
 				regulator-name =3D "pp0750_dvdd_core";
-				regulator-min-microvolt =3D <550000>;
-				regulator-max-microvolt =3D <800000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <200>;
 				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
@@ -1313,8 +1313,8 @@ vcore {
=20
 			mt6366_vdram1_reg: vdram1 {
 				regulator-name =3D "pp1125_emi_vdd2";
-				regulator-min-microvolt =3D <1125000>;
-				regulator-max-microvolt =3D <1125000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <2087500>;
 				regulator-ramp-delay =3D <12500>;
 				regulator-enable-ramp-delay =3D <0>;
 				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
@@ -1322,6 +1322,16 @@ mt6366_vdram1_reg: vdram1 {
 				regulator-always-on;
 			};
=20
+			mt6366_vpa_reg: vpa {
+				regulator-name =3D "ppvar_dvdd_vpa";
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <3650000>;
+				regulator-ramp-delay =3D <50000>;
+				regulator-enable-ramp-delay =3D <250>;
+				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
+							   MT6397_BUCK_MODE_FORCE_PWM>;
+			};
+
 			mt6366_vgpu_reg: vgpu {
 				/*
 				 * Called "ppvar_dvdd_gpu" in the schematic.
@@ -1330,19 +1340,17 @@ mt6366_vgpu_reg: vgpu {
 				 */
 				regulator-name =3D "ppvar_dvdd_vgpu";
 				regulator-min-microvolt =3D <500000>;
-				regulator-max-microvolt =3D <950000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <200>;
 				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
 							   MT6397_BUCK_MODE_FORCE_PWM>;
-				regulator-coupled-with =3D <&mt6366_vsram_gpu_reg>;
-				regulator-coupled-max-spread =3D <10000>;
 			};
=20
 			mt6366_vproc11_reg: vproc11 {
 				regulator-name =3D "ppvar_dvdd_proc_bc_mt6366";
-				regulator-min-microvolt =3D <600000>;
-				regulator-max-microvolt =3D <1200000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <200>;
 				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
@@ -1352,8 +1360,8 @@ mt6366_vproc11_reg: vproc11 {
=20
 			mt6366_vproc12_reg: vproc12 {
 				regulator-name =3D "ppvar_dvdd_proc_lc";
-				regulator-min-microvolt =3D <600000>;
-				regulator-max-microvolt =3D <1200000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <200>;
 				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
@@ -1361,10 +1369,21 @@ mt6366_vproc12_reg: vproc12 {
 				regulator-always-on;
 			};
=20
+			mt6366_vmodem_reg: vmodem {
+				regulator-name =3D "ppvar_vmodem";
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
+				regulator-ramp-delay =3D <6250>;
+				regulator-enable-ramp-delay =3D <900>;
+				regulator-allowed-modes =3D <MT6397_BUCK_MODE_AUTO
+							   MT6397_BUCK_MODE_FORCE_PWM>;
+				regulator-always-on;
+			};
+
 			mt6366_vs1_reg: vs1 {
 				regulator-name =3D "pp2000_vs1";
-				regulator-min-microvolt =3D <2000000>;
-				regulator-max-microvolt =3D <2000000>;
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <2587500>;
 				regulator-ramp-delay =3D <12500>;
 				regulator-enable-ramp-delay =3D <0>;
 				regulator-always-on;
@@ -1372,8 +1391,8 @@ mt6366_vs1_reg: vs1 {
=20
 			mt6366_vs2_reg: vs2 {
 				regulator-name =3D "pp1350_vs2";
-				regulator-min-microvolt =3D <1350000>;
-				regulator-max-microvolt =3D <1350000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <2087500>;
 				regulator-ramp-delay =3D <12500>;
 				regulator-enable-ramp-delay =3D <0>;
 				regulator-always-on;
@@ -1397,7 +1416,7 @@ mt6366_vaud28_reg: vaud28 {
 			mt6366_vaux18_reg: vaux18 {
 				regulator-name =3D "pp1840_vaux18";
 				regulator-min-microvolt =3D <1800000>;
-				regulator-max-microvolt =3D <1840000>;
+				regulator-max-microvolt =3D <1800000>;
 				regulator-enable-ramp-delay =3D <270>;
 			};
=20
@@ -1410,8 +1429,8 @@ mt6366_vbif28_reg: vbif28 {
=20
 			mt6366_vcn18_reg: vcn18 {
 				regulator-name =3D "pp1800_vcn18_x";
-				regulator-min-microvolt =3D <1800000>;
-				regulator-max-microvolt =3D <1800000>;
+				regulator-min-microvolt =3D <600000>;
+				regulator-max-microvolt =3D <2100000>;
 				regulator-enable-ramp-delay =3D <270>;
 			};
=20
@@ -1424,8 +1443,8 @@ mt6366_vcn28_reg: vcn28 {
=20
 			mt6366_vefuse_reg: vefuse {
 				regulator-name =3D "pp1800_vefuse";
-				regulator-min-microvolt =3D <1800000>;
-				regulator-max-microvolt =3D <1800000>;
+				regulator-min-microvolt =3D <1700000>;
+				regulator-max-microvolt =3D <1900000>;
 				regulator-enable-ramp-delay =3D <270>;
 			};
=20
@@ -1438,15 +1457,15 @@ mt6366_vfe28_reg: vfe28 {
=20
 			mt6366_vemc_reg: vemc {
 				regulator-name =3D "pp3000_vemc";
-				regulator-min-microvolt =3D <3000000>;
-				regulator-max-microvolt =3D <3000000>;
+				regulator-min-microvolt =3D <2900000>;
+				regulator-max-microvolt =3D <3300000>;
 				regulator-enable-ramp-delay =3D <60>;
 			};
=20
 			mt6366_vibr_reg: vibr {
 				regulator-name =3D "pp2800_vibr_x";
-				regulator-min-microvolt =3D <2800000>;
-				regulator-max-microvolt =3D <2800000>;
+				regulator-min-microvolt =3D <1200000>;
+				regulator-max-microvolt =3D <3300000>;
 				regulator-enable-ramp-delay =3D <60>;
 			};
=20
@@ -1482,30 +1501,30 @@ mt6366_vmc_reg: vmc {
=20
 			mt6366_vmddr_reg: vmddr {
 				regulator-name =3D "pm0750_emi_vmddr";
-				regulator-min-microvolt =3D <700000>;
-				regulator-max-microvolt =3D <750000>;
+				regulator-min-microvolt =3D <600000>;
+				regulator-max-microvolt =3D <2100000>;
 				regulator-enable-ramp-delay =3D <325>;
 				regulator-always-on;
 			};
=20
 			mt6366_vmch_reg: vmch {
 				regulator-name =3D "pp3000_vmch";
-				regulator-min-microvolt =3D <3000000>;
-				regulator-max-microvolt =3D <3000000>;
+				regulator-min-microvolt =3D <2900000>;
+				regulator-max-microvolt =3D <3300000>;
 				regulator-enable-ramp-delay =3D <60>;
 			};
=20
 			mt6366_vcn33_reg: vcn33 {
 				regulator-name =3D "pp3300_vcn33_x";
 				regulator-min-microvolt =3D <3300000>;
-				regulator-max-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3500000>;
 				regulator-enable-ramp-delay =3D <270>;
 			};
=20
 			vdram2 {
 				regulator-name =3D "pp0600_emi_vddq";
 				regulator-min-microvolt =3D <600000>;
-				regulator-max-microvolt =3D <600000>;
+				regulator-max-microvolt =3D <1800000>;
 				regulator-enable-ramp-delay =3D <3300>;
 				regulator-always-on;
 			};
@@ -1518,6 +1537,7 @@ mt6366_vrf12_reg: vrf12 {
 			};
=20
 			mt6366_vrf18_reg: vrf18 {
+				compatible =3D "regulator-fixed";
 				regulator-name =3D "pp1800_vrf18_x";
 				regulator-min-microvolt =3D <1800000>;
 				regulator-max-microvolt =3D <1800000>;
@@ -1526,8 +1546,8 @@ mt6366_vrf18_reg: vrf18 {
=20
 			vsim1 {
 				regulator-name =3D "pp1860_vsim1_x";
-				regulator-min-microvolt =3D <1800000>;
-				regulator-max-microvolt =3D <1860000>;
+				regulator-min-microvolt =3D <1700000>;
+				regulator-max-microvolt =3D <3100000>;
 				regulator-enable-ramp-delay =3D <540>;
 			};
=20
@@ -1540,18 +1560,17 @@ mt6366_vsim2_reg: vsim2 {
=20
 			mt6366_vsram_gpu_reg: vsram-gpu {
 				regulator-name =3D "pp0900_dvdd_sram_gpu";
-				regulator-min-microvolt =3D <850000>;
-				regulator-max-microvolt =3D <1050000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <240>;
-				regulator-coupled-with =3D <&mt6366_vgpu_reg>;
-				regulator-coupled-max-spread =3D <10000>;
+				regulator-always-on;
 			};
=20
 			mt6366_vsram_others_reg: vsram-others {
 				regulator-name =3D "pp0900_dvdd_sram_core";
-				regulator-min-microvolt =3D <900000>;
-				regulator-max-microvolt =3D <900000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <240>;
 				regulator-always-on;
@@ -1559,8 +1578,8 @@ mt6366_vsram_others_reg: vsram-others {
=20
 			mt6366_vsram_proc11_reg: vsram-proc11 {
 				regulator-name =3D "pp0900_dvdd_sram_bc";
-				regulator-min-microvolt =3D <850000>;
-				regulator-max-microvolt =3D <1120000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <240>;
 				regulator-always-on;
@@ -1568,8 +1587,8 @@ mt6366_vsram_proc11_reg: vsram-proc11 {
=20
 			mt6366_vsram_proc12_reg: vsram-proc12 {
 				regulator-name =3D "pp0900_dvdd_sram_lc";
-				regulator-min-microvolt =3D <850000>;
-				regulator-max-microvolt =3D <1120000>;
+				regulator-min-microvolt =3D <500000>;
+				regulator-max-microvolt =3D <1293750>;
 				regulator-ramp-delay =3D <6250>;
 				regulator-enable-ramp-delay =3D <240>;
 				regulator-always-on;
@@ -1578,7 +1597,7 @@ mt6366_vsram_proc12_reg: vsram-proc12 {
 			vusb {
 				regulator-name =3D "pp3070_vusb";
 				regulator-min-microvolt =3D <3000000>;
-				regulator-max-microvolt =3D <3070000>;
+				regulator-max-microvolt =3D <3100000>;
 				regulator-enable-ramp-delay =3D <270>;
 				regulator-always-on;
 			};
@@ -1586,7 +1605,7 @@ vusb {
 			vxo22 {
 				regulator-name =3D "pp2240_vxo22";
 				regulator-min-microvolt =3D <2200000>;
-				regulator-max-microvolt =3D <2240000>;
+				regulator-max-microvolt =3D <2200000>;
 				regulator-enable-ramp-delay =3D <120>;
 				/* Feeds DCXO internally */
 				regulator-always-on;
--=20
2.47.0.rc1.288.g06298d1525-goog


