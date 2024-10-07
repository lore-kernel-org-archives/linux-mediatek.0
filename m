Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98346CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xRF+WqijDSYeiE+tIaQ004Lnw2TEBFE2Gfpl2FGIHNs=; b=Tx5Mp3UbVFYymzkmIGfoJCiJUd
	2OP1O94cOo8CDiyJewV+tmw7wD+5nnUzFRHd8sMd96f+VxSLM28eb/GQERfG24AUcYxUn1a0lp9hK
	ej3DehaiTWTRu2ZQzUHH3k3d1nzP1b8poX7KA9jaekKZRnnr3JFyJp6tYXZm9gxC30JUSdsdnCY43
	sI30zVac0MZIi01V8XxUxebuk1pjl9Oe8iSpzVk2qXXytBSwEZBrCw+XyecE0XCW4RPUy3hXGlNWu
	ffvd2fFU+xEumG9aDe+9FiH+2VJjbnZosY3l33JxhmQinudJJV/E6qSkeRkH3AvqzN0Eat64Q0uqN
	FbR5QpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkgC-000000020l3-26Tn;
	Mon, 07 Oct 2024 10:09:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkes-000000020b8-3oPI;
	Mon, 07 Oct 2024 10:08:09 +0000
X-UUID: 0a1ede80849411efba0aef63c0775dbf-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xRF+WqijDSYeiE+tIaQ004Lnw2TEBFE2Gfpl2FGIHNs=;
	b=jSn/UOxAXl5jZDKgPrOkOR3ZlvXw3+fdqrOTsctLfqcXm7fzKdbtJwZ73e8hCYKc6WqlxJ8A5B02iSvC2T3JLrmFyvGcOvBahe5DtybLb9e7621mIp0/a8bqoxSvtSuShzI+9eZvkdBBB/HSRFsOUHNqS0PemFVE/1jAKjltghY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5e779224-be2a-4674-bf0a-5cef2f87fd1f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:af30dd64-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0a1ede80849411efba0aef63c0775dbf-20241007
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1464454624; Mon, 07 Oct 2024 03:08:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 18:08:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 18:08:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Jieyy Yang <jieyy.yang@mediatek.com>,
	Jian Yang <jian.yang@mediatek.com>, Jianguo Zhang
	<jianguo.zhang@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
Date: Mon, 7 Oct 2024 18:07:49 +0800
Message-ID: <20241007100749.6657-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_030807_782593_2A6F2809 
X-CRM114-Status: UNSURE (   9.92  )
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

Enable PCIE, PCIEPHY and related Pinctrls for mt8390-genio-700-evk
board.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8390-genio-700-evk.dts     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

Changes for v1:
 - This patch depends on the pcie patch of mt8188.dtsi
   [1] https://lore.kernel.org/all/20241004081218.55962-3-fshao@chromium.org/

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 3e77f59f2c74..bb68665f0b2d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -393,6 +393,16 @@ &mt6359codec {
 	mediatek,mic-type-1 = <3>; /* DCC */
 };
 
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins_default>;
+	status = "okay";
+};
+
+&pciephy {
+	status = "okay";
+};
+
 &pio {
 	audio_default_pins: audio-default-pins {
 		pins-cmd-dat {
@@ -758,6 +768,15 @@ pins-rst {
 		};
 	};
 
+	pcie_pins_default: pcie-default {
+		mux {
+			pinmux = <PINMUX_GPIO47__FUNC_I1_WAKEN>,
+				 <PINMUX_GPIO48__FUNC_O_PERSTN>,
+				 <PINMUX_GPIO49__FUNC_B1_CLKREQN>;
+			bias-pull-up;
+		};
+	};
+
 	rt1715_int_pins: rt1715-int-pins {
 		pins_cmd0_dat {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
-- 
2.45.2


