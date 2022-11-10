Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E78C43219
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=; b=pnowkKaGjZMIs3PvEoqxw5OZ/k
	MMI9/sQX3jXnHO/iWt2/Jle8LGc9rS01LS2PylNYxs5Hr3J2jHhyVlzVarqJlQRzyo4j4UvJTNj5C
	nl4PIA+T1AIvcEgk8l8sUigzRhwJGamb3IYK5lN8tVnIFiBDeaFzv2aOaL/U7YKrb3NsaAQ51xm6M
	2/xSetSLMY3d1YK5chGfSBPH9+1Ynfy1RqlbdZVUa9TNC5Bnj9gCq7momNtiqQx+iker3s8Zv7i+u
	JcDfwAB0JY+/gQhhg1zkMTUjiE4VQuCkB3dK370djxaLqULSRwtCiWcdEPXm4tcU2HjgQ4mQG6Da9
	NhAs/olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot28Q-003ryF-L6; Thu, 10 Nov 2022 07:38:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot28N-003rta-SW; Thu, 10 Nov 2022 07:38:01 +0000
X-UUID: c169637394654c6099bd0154750c1543-20221110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=g8vhFKeVZODszpNNdcs1n44q8B0+ixfLD0v3NWycG2k=;
	b=IBiW34Q24VMck8asBhnkcKvtdizaveZPW063PBBUXsj5mA2TMQCVtbNIHg4E4v0uHZDJZpkvZI99s3B2yggzLXN7ICkyAC22PjKGTuRBdxNaOsYD+vs6tIt0m81yN0xnkEIBym9qKKZO4hfJFLZZ56Yn1Pjx6+MrFeq8gENfJHk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:37faf310-9894-408e-9d2b-48d5eea0acca,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:58ab285d-100c-4555-952b-a62c895efded,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c169637394654c6099bd0154750c1543-20221110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 918214662; Thu, 10 Nov 2022 00:37:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 10 Nov 2022 14:37:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 10 Nov 2022 14:37:18 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v4 3/4] arm64: dts: mediatek: cherry: Add dp-intf ports
Date: Thu, 10 Nov 2022 14:37:15 +0800
Message-ID: <20221110063716.25677-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
References: <20221110063716.25677-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_233759_939558_99D6DCFB 
X-CRM114-Status: UNSURE (   8.58  )
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


