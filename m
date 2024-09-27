Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B6FCEBF91
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 10:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pX6Bx2UDow/yH3v2m2llMgyTYlhfmP3tKJ6OGoPnUw=; b=SYsa/46sM520dmd7TP1p5XBkO0
	Uo16qThbIjeetYH7keMsYx55OnUyfvTvjZhxf6PzkMV/R2tH4BQC1MJh9OeAMZnhsU05F0+esAfx/
	aM2sIlB2zbDEFJw4h3v1euLzWha/Q6l07nhTztzIOOVU23+rdKcEaxr3c1Ryp4EDGSR8VfE7dvI9Z
	6VcJFE5BE3CsD1vOmcbSac0mfDiF2YNsRa2P+8pb9iZ8Va259MGE4dtU4gMGRG74nC6PNGHoNNDlr
	BoZuXVFWb33+n64QT7ASMnoQ40NjZDiu9VdMvbX/Aj/NSE7XrzGKC1KRCEFPEAhxxAnhCqjUu3egk
	K0HLbCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su8LV-0000000Apnf-1LcH;
	Fri, 27 Sep 2024 10:37:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8Fp-0000000Aomx-3Ujd;
	Fri, 27 Sep 2024 10:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7pX6Bx2UDow/yH3v2m2llMgyTYlhfmP3tKJ6OGoPnUw=; b=gSIPS1beyOHBguZHl8MLff+pAY
	23DxLOnZBbUrkKaycuLLKcc7yh94M1OQGFm22hrh7mpHYcSDxPp6Lq4Ot1qwMX+uLNvpKHiZYIvw+
	5J/cE0abZjx1GlnIFMMx/Cq1oXpPvS678B0mC6cHOh46MgIdPAcTM0AZcZs5buvKcoJAF0RwEWQRP
	+XItvA2O28IDSOOT0Nuyciev7C9/G8hOh4cX8RoNmYawfpauNvwBnWCQPZJxH6WXFn0wLrviQ5at6
	3G84dVP+5HfODdjTGbq547r4Bn1noP+Z8LGI29MQnFwIKI0JCKx/Kag5c3pNuZ6SbHHrCXETbx/bd
	saQgVPZw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su8Fi-00000002KVi-3y0y;
	Fri, 27 Sep 2024 10:31:15 +0000
X-UUID: 96f50e0a7cbb11efb3adad29d29602c1-20240927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7pX6Bx2UDow/yH3v2m2llMgyTYlhfmP3tKJ6OGoPnUw=;
	b=sdHECydXUPxJbzrcVaSLHNJ3nJrQxaRYBjHSiskm9Xk7X3yfiSe7iJBOnu4c+QPoyHIzkOcX4+lxISQPPDoi2I3HLvM5fg0QwIDsBqrNN2cLMDDpMMp+ujT6bBPMY8gneP82ZYeHVSDfzSn5h5Zj2s41AbOHZa2vgN4oLrYhw5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:d686bc1b-9230-4933-8814-626af5ef4d2e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4938aa9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 96f50e0a7cbb11efb3adad29d29602c1-20240927
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1778130518; Fri, 27 Sep 2024 03:31:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Sep 2024 03:30:57 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Sep 2024 18:30:57 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH v2 6/6] arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU
Date: Fri, 27 Sep 2024 18:30:05 +0800
Message-ID: <20240927103005.17605-7-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240927103005.17605-1-pablo.sun@mediatek.com>
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_113111_442031_1C27A5E2 
X-CRM114-Status: GOOD (  10.70  )
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

To further optimize power saving, we couple DVDD_SRAM_GPU to
DVDD_GPU according to the following relation:

- For opp-880000000 or lower frequency, keep 0.75V
- For opp-915000000 and higher, DVDD_SRAM_GPU should follow
  DVDD_GPU. The exact voltage for DVDD_GPU should be decided by
  speed binning.

This rule is derived from the OPP table in the link.

In addition, set the voltage spread to 6250 uV, the step size of
'ldo_vsram_others' regulator of mt6359, otherwise the regulator
set_voltage operation fails.

Link: https://gitlab.com/mediatek/aiot/rity/meta-mediatek-bsp/-/blob/eedd6aedd4b0cfc0ee79b9c9b9650dfa73cf87f6/recipes-kernel/dtbo/mt8390/gpu-mali.dts
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 1474bef7e754..0a6c9871b41e 100644
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
@@ -314,6 +327,15 @@ &mt6359_vpa_buck_reg {
 	regulator-max-microvolt = <3100000>;
 };
 
+&mt6359_vproc2_buck_reg {
+	/* The name "vgpu" is required by mtk-regulator-coupler */
+	regulator-name = "vgpu";
+	regulator-min-microvolt = <550000>;
+	regulator-max-microvolt = <800000>;
+	regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
+	regulator-coupled-max-spread = <6250>;
+};
+
 &mt6359_vpu_buck_reg {
 	regulator-always-on;
 };
@@ -326,6 +348,15 @@ &mt6359_vsim1_ldo_reg {
 	regulator-enable-ramp-delay = <480>;
 };
 
+&mt6359_vsram_others_ldo_reg {
+	/* The name "vsram_gpu" is required by mtk-regulator-coupler */
+	regulator-name = "vsram_gpu";
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <800000>;
+	regulator-coupled-with = <&mt6359_vproc2_buck_reg>;
+	regulator-coupled-max-spread = <6250>;
+};
+
 &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
-- 
2.45.2


