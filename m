Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B358606EEB1
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDjXfSUd;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nmx+DxtE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=; b=XDjXfSUd6TMAw1
	4pl6Ew84yn56J4BEbPrG0L+0/iWkgjKCyrJLYXXbzemazK26H2hLyw9oyj17qJKRykYUCFQk9tjo6
	UOFOeZRT5tQZdw01AAxEiJGB8NMCxctlU4PUXsfgbuxgdqXwOy+zX1XQybtvdZOchbX3cTyX1nfXx
	w4ZYjvuzz2CFKLSNcYCK++LAeE2hkhWUNjSyP/gb0qFgsAvaBiMYcXBLBq5vT6LdtIOLOnj26a0Tz
	zhsygVpcjDU6b5SILdTphD3iCW5wgh6SsqRA8JM1whhPcUY1dEO1d9HPeXwSLZ7x7uNYsY2CWu4db
	S9oNlXzaN5CC31GSnYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7O-00000000v6e-1TUV;
	Mon, 09 Nov 2026 14:13:06 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQQ7G-00000000v0a-1jnB
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 14:12:59 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b24f4b15c4so123462c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 06:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794233577; x=1794838377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=;
        b=Nmx+DxtEUVcPmVo7KxlSOe7F9/N2bcZ3Z9EobVQPhjNOvwy8kNwjzRb0NK4Gn5zWNr
         6cBiQius3ds5NhERO2/XZcnwhCecUuwjmFphQZDjj877g2Av7XCRIDRPrvHdPky07AG8
         vuPIdvenSaWVmimDLlS7b3GSNdjwqp3RzOoqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233577; x=1794838377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klIxjWCSCyeIyNyPcN11805WdHiHiffCHGRnbaOYfKI=;
        b=MgJ1lNWrmNerB2inkrHX/awieJJtBvM1l7yy/VyzIHMkirzlCSk9ixXZYCO87h1Lqg
         QO2wEsRbNi+g/kWG++tIgbUfGi/EBaGY4lzQl9cJWk04xzAXYix6M+ipA404DELpWDbt
         I5Q72dIeUhXgZgc1vp/k/VOrCI8ohtlwkhEvOBhLfgpndSNGCNPLBEib+zNXc3BfCyfc
         Bso+RiNvr2na4Tuk9Mue6biG1BBzyCVGocs+TipPfMaY5IdKKy8BTW+6h86coyjOaM/X
         Gmg/8MbdYuoRse6JIQWeFHYJ1fNhjs35MaoqLh7Qk06CcYqE6+IaKqik7YVVhBrafzVr
         z2sw==
X-Forwarded-Encrypted: i=1; AL+hErHpZGHLfjtmaVWv93nWBi2x0bGrc37vLGvf9p15U4Xhyl2L/TIHlGfvPdQb7CIVAClckneIDsOEpS8MdQzrpA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8wIyAOboB/cSHGEE0Af2+r+wfcFWWo6JM6OPmULbE13bZb5nyu
	IozsH5++M5/oMotawKT5tzW1XsM3OghG31aYg9rvmNbo21YKO48s3D7cZutxTwDsPA==
X-Gm-Gg: AYBFou1fDKg80azzQe5QTMBZ1eOLITKaw3GnvAfivXhgHFhPBOayV28ycO7g6/Yxzhp
	vuVyRxuCbVMDIxBpjCJp08MpexKUgbRknh1ZHK3+w+e4R8jX43aO7UXOSTYkNcAFoF2YKSl+VwE
	9WRr8I5sSKQ5wML8hBFB93khKxXyRJuT+iAIRui70L8hrEqaOl4OA85ROgmAi7+wUSdm0fXuvvf
	lQ4LznDF5Rtuel1P+1sDW4E1ICzdZKQWj1wJVw9i7mVGEIGUDm4lffoCro9w7ZnYuRch8m+9F67
	M3Jqv+DigHXiDUbzfOeFNZInqd4x+lpTwdXgRIGRxuOR+av4C03s21tRlK7POPIXZ9HBvqHELQq
	gx7c2p9/erxY8cCq//yfRtWRooIieOCBrufUOfaHZSt+Gid5R80y/HvzTEgBxkB+r2xKbYBr3w6
	3cVZCCbMyeZSlv1eMqDUKdrT8gGB7/WDuLLDzWK58RmdMr8sVULSiIZv7m1erQ7KVcCUif0nLo3
	tMUs2dasndgxwsrm9omHltnmWGar7fgg0VRxMAEsd1ufEiGp13tdMXSYBRC5OwHb0m0jI5bk3Q0
	m5aAbax4iP+Z/i6IRspiDpwaOu+LE3mwFvTrUIJe5H44F0etPccPX7Y8yFMU
X-Received: by 2002:a05:7022:ea8b:b0:1b3:a8ee:a0e5 with SMTP id a92af1059eb24-1b3a8eea140mr4053093c88.2.1794233577260;
        Mon, 09 Nov 2026 06:12:57 -0800 (PST)
Received: from localhost ([2a00:79e0:203d:7:24d0:a2cf:66c5:ef86])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b375726fd1sm13297103c88.14.2026.11.09.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:12:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: mediatek: mt8173-elm: Tighten MT6397 regulator voltage ranges
Date: Mon,  9 Nov 2026 22:12:31 +0800
Message-ID: <20261109141233.983830-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
In-Reply-To: <20261109141233.983830-1-wenst@chromium.org>
References: <20261109141233.983830-1-wenst@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_061258_466244_69BF4E93 
X-CRM114-Status: GOOD (  18.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Most of the MT6397 regulator voltage ranges in mt8173-elm.dtsi were
copied from the EVB dts, and are much wider than what the supplied
parts allow. Tighten them according to the board schematics, the
MT8173 datasheet, and the CPU OPP tables in mt8173.dtsi:

- buck_vpca15 supplies DVDD_DVFS2 (the Cortex-A53 cluster), rated for
  0.72V to 1.131V. Limit it to 0.725V to 1.125V, which still covers
  all the operating points in cluster0_opp, up to 1.125V.
- buck_vpca7 only supplies the 1.2V rail of the USB hub. Fix it at
  1.2V.
- buck_vsramca15 and buck_vsramca7 supply DVDD_SRAM2 and DVDD_SRAM1, the
  SRAM of the Cortex-A53 and Cortex-A72 clusters respectively. The
  datasheet requires the SRAM supply to be higher than the CPU supply,
  but by no more than 200mV. Since both cluster0_opp and cluster1_opp
  go up to 1.125V, the SRAM supplies must be able to go above that.
  Limit them to 0.93125V to 1.15V. The lower limit comes from the
  datasheet's recommended operating conditions. The upper limit is
  slightly above the 1.131V given there, but matches the tracking upper
  limit read back from the PMIC. buck_vsramca7 uses the same limit.
- buck_vcore supplies DVDD_CORE, rated for up to 1.125V. Limit it to
  1.125V, the voltage firmware sets.
- buck_vdrm supplies the LPDDR3 memory, DDRV and VCC12IO_HSIC, all
  rated for up to 1.3V. Limit it to 1.3V. Firmware sets it to 1.225V.
- ldo_vgp5 supplies DVDD18_EFUSE, which is nominally 1.8V. Fix it at
  1.8V. However it is normally disabled.

Note that buck_vsramca15 is actually controlled by the PMIC's voltage
tracking function, which is set up by firmware. The rail tracks
buck_vpca15 with +100mV until it reaches a set upper bound of 1.15V.
Under this mode the register used to set the voltage does not change. If
the OS driver wants to read real time voltage, there is a separate
register that can be read out. buck_vsramca7 has tracking disabled by
firmware and is controlled by software, which is correct since the rail
providing power to the CPU cores is from a different chip.

Comparing the voltage ranges against the schematics, datasheets, drivers
and OPP tables, and drafting the change, were done by an agent. Manually
tested on a Hana (Telesu) device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index c6751adb1c2a..579ce73de7ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -948,8 +948,8 @@ regulators {
 
 			mt6397_vpca15_reg: buck_vpca15 {
 				regulator-name = "vpca15";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 725000>;
+				regulator-max-microvolt = <1125000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 				regulator-allowed-modes = <0 1>;
@@ -957,8 +957,8 @@ mt6397_vpca15_reg: buck_vpca15 {
 
 			mt6397_vpca7_reg: buck_vpca7 {
 				regulator-name = "vpca7";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-ramp-delay = <12500>;
 				regulator-enable-ramp-delay = <115>;
 				regulator-always-on;
@@ -966,16 +966,16 @@ mt6397_vpca7_reg: buck_vpca7 {
 
 			mt6397_vsramca15_reg: buck_vsramca15 {
 				regulator-name = "vsramca15";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
 
 			mt6397_vsramca7_reg: buck_vsramca7 {
 				regulator-name = "vsramca7";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-min-microvolt = < 931250>;
+				regulator-max-microvolt = <1150000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -983,7 +983,7 @@ mt6397_vsramca7_reg: buck_vsramca7 {
 			mt6397_vcore_reg: buck_vcore {
 				regulator-name = "vcore";
 				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
+				regulator-max-microvolt = <1125000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -995,7 +995,7 @@ buck_vgpu {
 			mt6397_vdrm_reg: buck_vdrm {
 				regulator-name = "vdrm";
 				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1400000>;
+				regulator-max-microvolt = <1300000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
 			};
@@ -1081,8 +1081,8 @@ ldo_vgp4 {
 
 			mt6397_vgp5_reg: ldo_vgp5 {
 				regulator-name = "vgp5";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3000000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-enable-ramp-delay = <218>;
 			};
 
-- 
2.56.0.455.g6c5a503b38-goog


