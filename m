Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE27C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9L84OZjF4WOz0zPEZnr9/avuUjm8MDXhSEkt/M3EmU8=; b=UQngk4Oub2z/uTIO8PJgVTjIfS
	MBzHqs/S3iFzpPBh+yDH/ZLfxJpILGneigMqdGR1boQHr29V2hePIzMFXjJQJs9lNduWg/xQyxfWQ
	ArC3gs/zTX4Wbg99pys8Qb00hM2MbkR9fegEW4IH6iSalzDhh+Sx/PsfKFjT2WoNRFoI/bKkv5dEI
	zBJboTPWPsUk9xydtz9GuAz+e+p6tCrci/zp0GZSHfdbf/RjZhEqgbdE9QdvsuD8DeMJN5qXXhA++
	m+jM+QzE7wzicc+uhqcBdISnEPUXpoWq84m+J+QuubUrsKwUgZqOzTuYVXS9vNtKVSvko0lh0xDyR
	qEI+lCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsu-009JI1-1I;
	Fri, 07 Apr 2023 06:47:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkfsq-009JFb-05;
	Fri, 07 Apr 2023 06:47:41 +0000
X-UUID: 14e937e6d51011ed8687db9d93187ff1-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9L84OZjF4WOz0zPEZnr9/avuUjm8MDXhSEkt/M3EmU8=;
	b=nwOD1ONV34AlpNl6+IX9UUjHpRDMXUVK4s/wAQJ1B5aOpAOwTjBNogCe+F7XKjWa6HnqMspNDR3v8tHrT8S3IZ4Zc7mOIdV+NnggMJILu3kUNO7l92wkECKBxr0q960Wz4imkY5Q1hyLHz63ue5Z/VIu6pVe+NjMqzl9k8n7pbU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:a1e4003c-0837-4a3b-8c43-5688694baa91,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:24819c2a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 14e937e6d51011ed8687db9d93187ff1-20230406
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1138441857; Thu, 06 Apr 2023 23:47:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 14:46:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 14:46:59 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rex-BC Chen
	<rex-bc.chen@mediatek.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung
	<shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/5] drm/mediatek: Add initialization for mtk_gem_obj
Date: Fri, 7 Apr 2023 14:46:55 +0800
Message-ID: <20230407064657.12350-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
References: <20230407064657.12350-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_234740_071670_4967BEEE 
X-CRM114-Status: GOOD (  13.00  )
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

Calling mtk_gem_obj = kzalloc() which returns uninitialized memory,
because mtk_gem_obj is uninitialized.

It may cause using uninitialized value mtk_gem_obj->base.resv
when calling drm_gem_object_init().

So add initialization for mtk_gem_obj.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index a25b28d3ee90..9b8f72ed12e4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -33,7 +33,7 @@ static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 						unsigned long size)
 {
-	struct mtk_drm_gem_obj *mtk_gem_obj;
+	struct mtk_drm_gem_obj *mtk_gem_obj = NULL;
 	int ret;
 
 	size = round_up(size, PAGE_SIZE);
-- 
2.18.0


