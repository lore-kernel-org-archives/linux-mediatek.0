Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9CBECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IPd+yNhEEbyPiT0k0o8ZJIdSI74U6bOUQ9kyzB9b6oI=; b=hDkOl9uqGNZ7GjggU9iPULANfW
	MlUBXXoAuivmZypXig1meapLcSXmPbRdtZSp0m9tV3ABJJ39+cDY30zJID+dqlLWj3MM1vLuUMIGC
	OMVTETPrfAVVLMoN8409DkE4BymqwNdl3tsB7UAogW2lzJ4ypTJwkpcqSkxvEghedDpyvUE13zhYT
	rL3+/9J/hY6KLFVuDxU2EJvd1Uaaxw9xMNgQDwhzWxBw6OTUKAR4sYM+wEhwJGMONy2xvHWLRqDR+
	7QhJiy1YN9GZJRg/7WuSAe+7GxL/klXsfOUoC2EkLteRvvh0656dX3PFW9BVW9rS8mffvd7Ks7mA8
	MzJDM4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so1wT-00000005sq5-3JBD;
	Tue, 10 Sep 2024 14:34:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so1wR-00000005snW-077B;
	Tue, 10 Sep 2024 14:34:04 +0000
X-UUID: b5a6d2b26f8111efba0aef63c0775dbf-20240910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IPd+yNhEEbyPiT0k0o8ZJIdSI74U6bOUQ9kyzB9b6oI=;
	b=cwcnUmC8Mrce1Jchx8572iNcyk7zvhSZRzbOUTkBlnZZzq+DJGvTwQWPgoHEqGVlA+6jLgFIWInFUP7DF1ewdUBQv4XKBYQvQdD5oRlv3QAi4qdboh5Xsh06qWf2JbF0YzE0xLa5jOJryujnsdGLWmVrdzxIeIOWihh+Snhihyk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:c9856c2a-9041-4cc6-8a26-677cf930c302,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:8f70fdcf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b5a6d2b26f8111efba0aef63c0775dbf-20240910
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <pablo.sun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1040684030; Tue, 10 Sep 2024 07:33:56 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 10 Sep 2024 22:33:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 10 Sep 2024 22:33:53 +0800
From: Pablo Sun <pablo.sun@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Pablo Sun <pablo.sun@mediatek.com>
Subject: [PATCH] arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU
Date: Tue, 10 Sep 2024 22:32:45 +0800
Message-ID: <20240910143245.5282-1-pablo.sun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_073403_095743_6C066759 
X-CRM114-Status: GOOD (  12.92  )
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

Enable the Mali Valhall GPU on Genio 1200 EVK by providing regulator
supply settings and enable the GPU node.

In addition, set the GPU related regulator voltage range:

1. Set the recommended input voltage range of DVDD_GPU to (0.546V-0.787V),
   based on Table 5-3 of MT8395 Application Processor Datasheet.
   The regulator mt6315_7_vbuck1("Vgpu") connects to the DVDD_GPU input.
2. Set the input voltage of DVDD_SRAM_GPU, supplied by
   mt6359_vsram_others_ldo_reg, to 0.75V and set it always on for GPU SRAM.

This patch is tested by enabling CONFIG_DRM_PANFROST and
on Genio 1200 EVK it probed with following dmesg:

```
panfrost 13000000.gpu: clock rate = 700000092
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x1 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7,
	               issues: 00000001,80000400
panfrost 13000000.gpu: Features: L2:0x07120206 Shader:0x00000000
                       Tiler:0x00000809 Mem:0x301
		       MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x50045 l2_present=0x1
[drm] Initialized panfrost 1.2.0 for 13000000.gpu on minor 0
```

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
---
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts  | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index a06610fff8ad..9b7850b0b9b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -194,6 +194,11 @@ eth_phy0: eth-phy0@1 {
 	};
 };
 
+&gpu {
+	mali-supply = <&mt6315_7_vbuck1>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&i2c0_pins>;
@@ -407,6 +412,13 @@ &mt6359_vrf12_ldo_reg {
 	regulator-always-on;
 };
 
+/* for GPU SRAM */
+&mt6359_vsram_others_ldo_reg {
+	regulator-always-on;
+	regulator-min-microvolt = <750000>;
+	regulator-max-microvolt = <750000>;
+};
+
 &mt6359codec {
 	mediatek,mic-type-0 = <1>; /* ACC */
 	mediatek,mic-type-1 = <3>; /* DCC */
@@ -839,8 +851,8 @@ regulators {
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
-				regulator-min-microvolt = <300000>;
-				regulator-max-microvolt = <1193750>;
+				regulator-min-microvolt = <546000>;
+				regulator-max-microvolt = <787000>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
 			};
-- 
2.45.2


