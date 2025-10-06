Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5D6CAC5B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Oct 2025 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n8cOIisVxdBzcqYw8fWRjcUoe/ZvQ9UYWbToNTKxWm0=; b=bkIrMIxAqnByzSFDm1jJVTsXjg
	q/Kq952kjC9ub11Iz2SRGJ53UNOirrXb3G0mU8jccv25XugmCHzlw9VQKYYhys/fdxI8AJ+Llq9tT
	27PWRhv6j3hJehYz9sPfOvedlCQ/IefdqipYUe2RNRaGX6nqNQd3RSs8mkMxopWAR50O2Yi4S00E3
	Nlvilhwb5F46s6XmOtBzQM/34swAZUMcQzArGhhgM6UgcjQiWhP7TzzO0mosG5iMN+qriVeEzbMS9
	rvAB+w+GVOyt+qSZJFQhDGa+Z0hgFVRLcOg0HWsWBTa5aiwjClCIZxgwysJtiUGRhMZc3ZgDs4pyz
	OCx2QfAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hpO-0000000HGnI-4AUE;
	Mon, 06 Oct 2025 09:48:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hpM-0000000HGmh-1id8
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Oct 2025 09:48:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5D0143A7D;
	Mon,  6 Oct 2025 09:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE33C4CEF5;
	Mon,  6 Oct 2025 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759744098;
	bh=11bNMYyZMUwsQqMUsvi0X3mz9BqFp/BUiE3cpj9uHmo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ur8POXtbkzOL6qjhq7MdssPEc9+vJgK2MlLDJHH5kGeZzO37hzg7/oKpSR3wJGmdz
	 yPdejFaHMgc7Z5+vN+u+XHgdqARpXB/5UQnKM2FM3rMXa+MvwjkIFRxMTpdatfj0Z7
	 bkvmlzOITPBMvyXOdN0IgZxg4KlCVBS4RJPzOQrckxJx7xTAL4ZUpMsG14MpBpMedB
	 oIiLv14nfvIsxk7IqNBr/ycF4kjkjCZGPSVMFW9+u+ZrOBBxxRN2XE/nAzUC0YD5+r
	 EQX3ujGdZeENoFoGCpNKgzqBAF0vKrZW60mjiNC6mYkgwsouXKp/Halnfn99NV5279
	 EUnH8fjywB6gw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v5hpH-000000007MH-34s4;
	Mon, 06 Oct 2025 11:48:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Sjoerd Simons <sjoerd@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: fix device use-after-free on unbind
Date: Mon,  6 Oct 2025 11:39:37 +0200
Message-ID: <20251006093937.27869-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_024820_596948_0667D938 
X-CRM114-Status: GOOD (  13.06  )
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

A recent change fixed device reference leaks when looking up drm
platform device driver data during bind() but failed to remove a partial
fix which had been added by commit 80805b62ea5b ("drm/mediatek: Fix
kobject put for component sub-drivers").

This results in a reference imbalance on component bind() failures and
on unbind() which could lead to a user-after-free.

Make sure to only drop the references after retrieving the driver data
by effectively reverting the previous partial fix.

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Fixes: 1f403699c40f ("drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv")
Reported-by: Sjoerd Simons <sjoerd@collabora.com>
Link: https://lore.kernel.org/r/20251003-mtk-drm-refcount-v1-1-3b3f2813b0db@collabora.com
Cc: stable@vger.kernel.org
Cc: Ma Ke <make24@iscas.ac.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 384b0510272c..a94c51a83261 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -686,10 +686,6 @@ static int mtk_drm_bind(struct device *dev)
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->drm = NULL;
 err_put_dev:
-	for (i = 0; i < private->data->mmsys_dev_num; i++) {
-		/* For device_find_child in mtk_drm_get_all_priv() */
-		put_device(private->all_drm_private[i]->dev);
-	}
 	put_device(private->mutex_dev);
 	return ret;
 }
@@ -697,18 +693,12 @@ static int mtk_drm_bind(struct device *dev)
 static void mtk_drm_unbind(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
-	int i;
 
 	/* for multi mmsys dev, unregister drm dev in mmsys master */
 	if (private->drm_master) {
 		drm_dev_unregister(private->drm);
 		mtk_drm_kms_deinit(private->drm);
 		drm_dev_put(private->drm);
-
-		for (i = 0; i < private->data->mmsys_dev_num; i++) {
-			/* For device_find_child in mtk_drm_get_all_priv() */
-			put_device(private->all_drm_private[i]->dev);
-		}
 		put_device(private->mutex_dev);
 	}
 	private->mtk_drm_bound = false;
-- 
2.49.1


