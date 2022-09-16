Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC861C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 03:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=; b=seTKlCz8o8NLT5gAnv4W5R0Qws
	0XU5YH2SwxNXQDByRavXePo5dJy3wxYDGRXWB+16jxMq+pC8Op6PBTemM/Wg7VhlJi1joceZ7qXGp
	rL4ky6NuVuALGJ4YZp4fgb/LiXg718NRANFaOR9C7+O9lzl9D6G0cBjbnWlCmtNKVbH7YdLAwW56q
	gk0AmfIGDXp9MrbdE17fciTvBO7Cv9AmJrsS+d8uWkh3XftrIUySYVS+/Pp+jvTI37C8J2kxo/Q5i
	pt4v5ITkZ2DWn2f1sCW69NnufkUij9WEuLEJV1e6XtoRHXukyDfx74V0XdlUV0LPOgOa+wZvS0n2B
	ZSCvqttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ25o-006Iko-T6; Fri, 16 Sep 2022 03:32:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ25m-006Ijw-5W; Fri, 16 Sep 2022 03:32:39 +0000
X-UUID: 63dce63ce6214f44befcf6ec5455214a-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=;
	b=ur7oYMGFTjBoOEWmOCNF7+PRmYRlysJlo8T8HWBRGr+/HWXnfz3STkJ2bwPyT6ENj1oaJioGLZPd9oaqXe4GAh/fp53BxyDVbsqGLeVKlZsU4kefIIiVCofFe7gAxZ5yWNZ3ZiamLl2xo3zuyuGOJEb9mI7sb2ZagXEd2dR8fiA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:dd48a47b-9ad9-4b64-9fe3-4d6ffa44cc2a,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:a3e8d27b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 63dce63ce6214f44befcf6ec5455214a-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 51883148; Thu, 15 Sep 2022 20:32:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 16 Sep 2022 10:51:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Sep 2022 10:51:00 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v3 3/4] arm64: dts: mediatek: cherry: Add dp-intf ports
Date: Fri, 16 Sep 2022 10:50:58 +0800
Message-ID: <20220916025059.16673-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
References: <20220916025059.16673-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_203238_220751_8A559C9F 
X-CRM114-Status: UNSURE (   8.40  )
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

Dp-intfs provide the pixel data to edptx and dptx. To support edptx
and dptx, we need to add dp-intf0 and dp-intf1 ports.

Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9b62e161db26..303dc32c64dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -120,6 +120,24 @@
 	};
 };
 
+&dp_intf0 {
+	status = "okay";
+
+	port {
+		dp_intf0_out: endpoint {
+		};
+	};
+};
+
+&dp_intf1 {
+	status = "okay";
+
+	port {
+		dp_intf1_out: endpoint {
+		};
+	};
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.18.0


