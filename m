Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA17FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCdrImEXKo83n09QYKuOrC1YOHHcCO+i9OM2MVIeyU8=; b=2+Mzs+ZOoTp/DS
	Yon9QWxVYd7xkxe1JB9nk+5QWbyTSsZGOPMMmPkWpBp1DsTPko0RCtRT0wPdQUAChCI1eer9FVmxm
	UsdOeqB+efhOFdKQpvWaAIIZUNmpG3Z9UA/xfTkfh9y33LI+xWCCIJPUc2GEd60lweg8ZilOcEz6S
	8c9f/7yTRnUfj2ANNSgn3YWGZkiSyywoBHm7oG1/v+YNMw2M0oWfVlGHkSV2gC0iLW8FU+0kf25w6
	ZMK+SkDCfA7yw9yoM2P7at7JIBviw3/DYpz3aXEWf6ijuW2cr0REVyxG4k6ZMLpAQF1CLkD2M4pIq
	ihnhgsK+hTfovWLzBp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrXY-00BL0s-CU; Wed, 25 May 2022 13:59:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntrXJ-00BKsu-LH; Wed, 25 May 2022 13:58:56 +0000
X-UUID: 459cbffafb044e2aa10f173dd76bd162-20220525
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:fbc333db-0bbd-4b35-859b-23541ea6451f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a5b37247-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 459cbffafb044e2aa10f173dd76bd162-20220525
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 678999818; Wed, 25 May 2022 06:58:47 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 06:58:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 May 2022 21:58:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 25 May 2022 21:58:43 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jason-jh.lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v21 5/5] soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
Date: Wed, 25 May 2022 21:58:41 +0800
Message-ID: <20220525135841.32078-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220525135841.32078-1-jason-jh.lin@mediatek.com>
References: <20220525135841.32078-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_065853_741229_CB66DE38 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "jason-jh.lin" <jason-jh.lin@mediatek.com>

After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
mmsys header can remove the useless DDP_COMPONENT_DITHER enum.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 59117d970daf..fb719fd1281c 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_CCORR,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_DITHER,
-	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DITHER1,
 	DDP_COMPONENT_DP_INTF0,
 	DDP_COMPONENT_DP_INTF1,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
