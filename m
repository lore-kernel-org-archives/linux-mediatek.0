Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B6DC369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsCVpY7/Uvm0yDYeDIAoS8Xqn+DAacrFu0NfOVTRztk=; b=ES1baNq2rzG5lDsEDNXCOrUQjA
	GWivXiQXVS78h8OhZCBGx9PGEovD+ZwSirK6P/3viO5L6nec/1nrf0bb0fONNaJJrVdhNS//c2fQl
	K02hNWpgZkbavdoId/6TxFuchmVFJKuUR0wzLeEO6ezzjPbHeNUe99vuAlhXvRvVn8XpAa2LzYKt8
	FsngnjRmhQNR9BkB6AxIOgsaLyZ5iq2FJyZ5nZSG55LNoQy/242DI3dD/rclk3r1Vgak4BaTGfM4j
	P/pZrJU3XuoEb3CHshCjtvuX8iL9FX6SEazrFuv+owr6Dpl8/cFeUGNeAaVzqfKiJIFeZqcRNlUDF
	dPOHKIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rMU-00000004M3C-21lQ;
	Mon, 21 Apr 2025 13:39:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6rMS-00000004M1Q-2LtZ;
	Mon, 21 Apr 2025 13:39:01 +0000
X-UUID: f8e4c74e1eb511f0b1a74d0c5e11a509-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nsCVpY7/Uvm0yDYeDIAoS8Xqn+DAacrFu0NfOVTRztk=;
	b=jEPkEK14Zdjq3d7j2XOtyPBbsEpG7gxk3/pPWB+GdBEE1lEIVBThGg0Urp2ghFtsBBsPHF64mbotPUmBI+jksqU1BtpcwFbVqt9O/6OKRiT1K93i9+yETjFxNRFk1zR5+gE7rI60+3Co/02AF0OWfXkE8TlRqxT9KGaUF+fkStA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:483d94f5-c283-4cbf-adf7-fddb383c9ab0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:1424808b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f8e4c74e1eb511f0b1a74d0c5e11a509-20250421
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <sunny.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1822537042; Mon, 21 Apr 2025 06:38:56 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 21:38:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 21:38:53 +0800
From: Sunny Shen <sunny.shen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 5/5] drm/mediatek: Change main display path to support PQ for MT8196
Date: Mon, 21 Apr 2025 21:38:32 +0800
Message-ID: <20250421133835.508863-6-sunny.shen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421133835.508863-1-sunny.shen@mediatek.com>
References: <20250421133835.508863-1-sunny.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_063900_597641_9AC8257E 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Pin-yen Lin <treapking@chromium.org>, CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, "Paul
 Chen --cc=devicetree @ vger . kernel . org" <paul-pl.chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Sunny Shen <sunny.shen@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to the path mux design of the MT8196, the following components
need to be added to support Picture Quality (PQ) in the main display
path: CCORR0, CCORR1, DITHER0, GAMMA0, MDP_RSZ0, POSTMASK0, TDSHP0.

Signed-off-by: Sunny Shen <sunny.shen@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
The method of using OF graph for display path is still under investigation.
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index aa7eec1fc7e6..5ca2b9badbe0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -242,6 +242,13 @@ static const unsigned int mt8196_mtk_ddp_ovl0_main[] = {
 
 static const unsigned int mt8196_mtk_ddp_disp0_main[] = {
 	DDP_COMPONENT_DLI_ASYNC0,
+	DDP_COMPONENT_MDP_RSZ0,
+	DDP_COMPONENT_TDSHP0,
+	DDP_COMPONENT_CCORR0,
+	DDP_COMPONENT_CCORR1,
+	DDP_COMPONENT_GAMMA0,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DLO_ASYNC1,
 };
 
-- 
2.45.2


