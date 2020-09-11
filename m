Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F267EC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 11:22:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74DA422204
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 11:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EdjQ3vgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74DA422204
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NP3weFAp9NML9n7VrKeOpsqM1R+u1TwELJUzMBVPy50=; b=EdjQ3vgyKHjGLzJewUiQLib3oV
	iyyKDBMEggg/Qa6Ml2b37erZBXfNIf6K2NXWdj6My0DcUvUlu6TBVVYVnVolqPODxjKzPSbk65CkH
	38VZKIK6Z0joIF+ue01ai2T3kbu2/j2C2fbyNnPvzM/Y/iO0JP/3GKE7vpCSl4GznT3yW08eXWpfT
	WZ1Ci//iAKunqsROTE9yvjOsoA9FwnI0+hgd/zzDGxuiGGtDQ14lr6Vl2aGtpn5WtiN/EPNoRf4dS
	JCOhgy2anwVpG5J6pObU3XFa85ANXFk9larjo83VP5MZ2Sdm6VDN5zsTnP8/Y5HxdK9BKBZ8Y6zS0
	KfVVBpEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGh8D-0002ca-Cv; Fri, 11 Sep 2020 11:22:17 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGh89-0002br-Vc; Fri, 11 Sep 2020 11:22:14 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 276D44D483AD00BB640F;
 Fri, 11 Sep 2020 19:22:11 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 11 Sep 2020
 19:22:01 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <djkurtz@chromium.org>,
 <yt.shen@mediatek.com>, <ck.hu@mediatek.com>, <littlecvr@chromium.org>
Subject: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_drm_kms_init()
Date: Fri, 11 Sep 2020 19:21:19 +0800
Message-ID: <20200911112119.3218073-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_072214_256520_DC6EEF1C 
X-CRM114-Status: GOOD (  10.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 yukuai3@huawei.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

if of_find_device_by_node() succeed, mtk_drm_kms_init() doesn't have
a corresponding put_device(). Thus add jump target to fix the exception
handling for this function implementation.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 040a8f393fe2..7aceace94ebf 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -165,7 +165,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		return ret;
+		goto put_mutex_dev;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -182,7 +182,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = component_bind_all(drm->dev, drm);
 	if (ret)
-		return ret;
+		goto put_mutex_dev;
 
 	/*
 	 * We currently support two fixed data streams, each optional,
@@ -229,7 +229,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 	if (!dma_dev->dma_parms) {
 		ret = -ENOMEM;
-		goto err_component_unbind;
+		goto put_dma_dev;
 	}
 
 	ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
@@ -256,9 +256,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 err_unset_dma_parms:
 	if (private->dma_parms_allocated)
 		dma_dev->dma_parms = NULL;
+put_dma_dev:
+	put_device(private->dma_dev);
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
-
+put_mutex_dev:
+	put_device(private->mutex_dev);
 	return ret;
 }
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
