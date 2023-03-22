Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F0BC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 03:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSPxWcIg1Osvz8bIovKM5keV/3d/k1WnFlYzKJH8ckM=; b=zjv8WnP8bDLORL3qW7lJpO1yCo
	Lf0mzNAw5B9CkMHmKU9cazGlCnG75KifFOaFt0rGDtmW7LZPCuI4YP9deNY81BQfxpM/VSkoHW5MB
	aF3xUYnbLfVRYKTXFjHunrDeBiDDyievqr650wQEhGxklUugjXCwlOBfo1MmL8YTjXonJzJllasbB
	9C8zE9MSh3NbVWLtGb+Vqvm9VXpGkZVqj4hZtXVdcbbrXWUi1sTaFHW4bp9rQZE4QJ+8aEORs5Pau
	h0nh9KHCxHcb4MfaCzV9R/Cc+38UDjK5ObFdoLzMAzM4cdVEMK+TIy1T5ld9qzrMwbDigsA+u+7N/
	pc/s30OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pep4P-00EQXB-0E;
	Wed, 22 Mar 2023 03:23:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pep4L-00EQVy-2r;
	Wed, 22 Mar 2023 03:23:23 +0000
X-UUID: e2d4f27ec86011ed8687db9d93187ff1-20230321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RSPxWcIg1Osvz8bIovKM5keV/3d/k1WnFlYzKJH8ckM=;
	b=q7bK7iGsM5dGmF0a+mA1l6kfeRKnMePKyUKJzWoUXF5B5OeTBbP2MuDQGHmUa9tn/B7MZdUyOUGkRNlsqbiDyevR+/ECebSMhwk37K0+ZXiepbNeALV68E6GqE7+Iq5hZI2fs+yrJ3IrP90BIWoGOX5M0xp6NGzgKYAYbQ/25Ps=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:4315a876-ea31-4ae0-96cb-f475b27c8218,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:4315a876-ea31-4ae0-96cb-f475b27c8218,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:c930f9b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230322112259RNNV5FA2,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: e2d4f27ec86011ed8687db9d93187ff1-20230321
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 98042199; Tue, 21 Mar 2023 20:23:16 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 11:22:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 11:22:40 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Singo Chang <singo.chang@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, "Shawn
 Sung" <shawn.sung@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: reset: mt8188: Add reset control for DSI0
Date: Wed, 22 Mar 2023 11:22:01 +0800
Message-ID: <20230322032202.12598-2-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230322032202.12598-1-shawn.sung@mediatek.com>
References: <20230322032202.12598-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_202321_925732_CA826F15 
X-CRM114-Status: GOOD (  11.06  )
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

Add reset control for DSI0.

Signed-off-by: Shawn Sung <shawn.sung@mediatek.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 377cdfda82a9..5c9e74130ef0 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -33,4 +33,7 @@

 #define MT8188_TOPRGU_SW_RST_NUM               24

+/* VDOSYS0 */
+#define MT8188_VDO0_RST_DSI0                   21
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
--
2.18.0


