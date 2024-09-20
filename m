Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BD4C78850
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 13:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4jFeuq4sBdpGeCMt/guFSx2fzZMvzmjV65aeAueGRM=; b=4nLbZL9uqUkElDNIGASNvBkqbe
	I+TiSxSRXnvUqRL4ggFIClV2g2Ecx4KR6ZKDxxb3X9CGkv8KLDKuCzPamKoqdVWq5EvSKLlqk4scV
	Fs4vhG/y/FVV4/VLYOlLyInQUuK5ACp52lyBcuD1HbsMVFiQbsuqMsoPLbCekVNQIzp29120SK1yh
	TKCI72m+XSz5R0yPiNrIfCrU3LCLMZmYe7syBJgEhu+IqZ9nmp+hv51w/RYMRThRgjuuiGqh587A1
	eEBds4GfIJnLCphszUko9ob0QkZQE96K66buiE5FQscpqL9wKUTqdZJ0LIyy0VgvPw13NQfGRgHWO
	/dIj9Xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdzL-0000000CIbk-3qRA;
	Fri, 20 Sep 2024 13:47:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdu6-0000000CHjr-0ksF;
	Fri, 20 Sep 2024 13:42:35 +0000
X-UUID: 2dfdbd08775611efb3adad29d29602c1-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D4jFeuq4sBdpGeCMt/guFSx2fzZMvzmjV65aeAueGRM=;
	b=f+C/r1tSHKwLikqBSA1OqN/1j6XQlJBWDL/WorG6H/5xqhe7UARf7bxfZQHAT1nnzncZDrklGFIHabwKjHsqRnvKlNCbdLgoBJqvB8hkIA6yzyDQq3EDhSjyRkxcgsMV/1qykLs0SIY7++h1tj42hfl99lbZgGzQlQqTsz92fq4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:eab7cac1-14e9-4f15-b606-18b618dbd518,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:10bf82d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2dfdbd08775611efb3adad29d29602c1-20240920
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 130523657; Fri, 20 Sep 2024 06:42:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 21:42:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 21:42:26 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Srinivas
 Kandagatla" <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU
Date: Fri, 20 Sep 2024 21:41:11 +0800
Message-ID: <20240920134111.19744-6-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920134111.19744-1-pablo.sun@mediatek.com>
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.132500-8.000000
X-TMASE-MatchedRID: yKCfkewtMJNcgzmua3ALxodlc1JaOB1TIfZjRfGTydjCJQ8asLA2FymF
	OYJJbPqpf146W0iUu2vednYgFc6jdmoOvZKQqN7ksyw+ZJnFumR9LQinZ4QefCP/VFuTOXUTKYO
	cjnHaFYKOhzOa6g8KrUNZLx701ylLZNlabEp+beNgV30RsrzFkpsG9tZP2PDMCxXIK6ID3jMoKN
	LuxkrzxPJboJY9QimDkaMcawjb1snfsU0wOw8Q+MGQYFMiVRG5ehcPPz6UzEWlb5ogMngNpHOTE
	n5IiRSOady5RJQR05c=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.132500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1205DADD2A2EEDD3CF06167194CE62D4F6C98BED4D4CE9704DCD6AE8E579CEAD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_064234_249940_DE8FDCCF 
X-CRM114-Status: UNSURE (   9.75  )
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

Configure GPU regulator supplies and enable GPU for GENIO 700 EVK.

The GPU in MT8390 & MT8188 has two power inputs: "DVDD_GPU" and
"DVDD_SRAM_GPU". In Genio 700 EVK, DVDD_GPU is supplied by
mt6359_vproc2_buck_reg, and DVDD_SRAM_GPU is supplied by
mt6359_vsram_others_ldo_reg.

According to section 5.2 "Recommended Operating Conditions" in
MT8390 IoT Application Processor Datasheet v1.9, The recommended
operating voltage ranges are:

- DVDD_GPU: min 0.55V, max 0.86V, typical 0.75V
- DVDD_SRAM_GPU: min 0.71V, max 0.92V, typical 0.85V

In this commit, we set DVDD_SRAM_GPU to typical 0.85V. It is possbile
to couple it to the DVDD_GPU in future patches.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 1474bef7e754..a1d6f4cd4e5f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -190,6 +190,11 @@ usb_p2_vbus: regulator-10 {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6359_vproc2_buck_reg>;
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -253,6 +258,14 @@ &i2c6 {
 	status = "okay";
 };
 
+&mfg0 {
+	domain-supply = <&mt6359_vproc2_buck_reg>;
+};
+
+&mfg1 {
+	domain-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &mmc0 {
 	status = "okay";
 	pinctrl-names = "default", "state_uhs";
@@ -314,6 +327,11 @@ &mt6359_vpa_buck_reg {
 	regulator-max-microvolt = <3100000>;
 };
 
+&mt6359_vproc2_buck_reg {
+	regulator-min-microvolt = <550000>;
+	regulator-max-microvolt = <860000>;
+};
+
 &mt6359_vpu_buck_reg {
 	regulator-always-on;
 };
@@ -326,6 +344,12 @@ &mt6359_vsim1_ldo_reg {
 	regulator-enable-ramp-delay = <480>;
 };
 
+/* for GPU SRAM */
+&mt6359_vsram_others_ldo_reg {
+	regulator-min-microvolt = <850000>;
+	regulator-max-microvolt = <850000>;
+};
+
 &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
-- 
2.45.2


