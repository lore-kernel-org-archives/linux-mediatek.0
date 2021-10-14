Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B516C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 18:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7ADE61139
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7ADE61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ufz9zzLOH29dHZuEjPIeQXMl3IwRvrt9iHnjZx0qb4I=; b=hI1LWOiZoqTZsI
	nHhuAnjNcNOYvE6AnYyl7IFXFvT1LbBHPVjX2ilwEOoHb/AZ4SN4ZiCRlj+v+C1CYLe8IWZC8at2P
	xTwcEQJohu9Cl+K9YL6ZKztdzLxiQ+y2crY8x81JcDeDJC2PHCD+RN2wpIIgpYuuxBQJ/cKqu+vl8
	0S2RSl4Gdh6cptCjmzwIF7mLWfTPbN+jQW/vsyDRBR5gilLzi0NdAlo+djNBBXMz1a0iaAIFJXGrm
	XgSHAxJ3Gb0C67JOfmsd+Xb4LmfYw3FCckUaENpufrMKG4LzWyFcvmNvsBCMWZPM/ESypjkJaclLj
	MhkB8TzdoaGthNx1wUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb5E0-00444m-UO; Thu, 14 Oct 2021 18:13:04 +0000
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb5Dw-004413-Fu
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 18:13:02 +0000
Received: from pop-os.home ([92.140.161.106]) by smtp.orange.fr with ESMTPA
 id b5DZmB3dgBazob5DamY5G0; Thu, 14 Oct 2021 20:12:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 14 Oct 2021 20:12:42 +0200
X-ME-IP: 92.140.161.106
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] media: mtk-vcodec: Remove redundant 'flush_workqueue()' calls
Date: Thu, 14 Oct 2021 20:12:35 +0200
Message-Id: <8b7137f1d15c64fc3bc8df27e55095dc8d1d80da.1634235066.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_111300_695092_5530FE04 
X-CRM114-Status: UNSURE (   9.25  )
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

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 1 -
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e6e6a8203eeb..68abb1422c40 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -390,7 +390,6 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 {
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
-	flush_workqueue(dev->decode_workqueue);
 	destroy_workqueue(dev->decode_workqueue);
 
 	if (media_devnode_is_registered(dev->mdev_dec.devnode)) {
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index eed67394cf46..b576f44ce505 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -461,7 +461,6 @@ static int mtk_vcodec_enc_remove(struct platform_device *pdev)
 	struct mtk_vcodec_dev *dev = platform_get_drvdata(pdev);
 
 	mtk_v4l2_debug_enter();
-	flush_workqueue(dev->encode_workqueue);
 	destroy_workqueue(dev->encode_workqueue);
 	if (dev->m2m_dev_enc)
 		v4l2_m2m_release(dev->m2m_dev_enc);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
