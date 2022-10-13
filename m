Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B26DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 00:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONzs0fVmve/S5ghcbzdDMuQ75IIJkGqSlNozVFCWB0E=; b=qicioagIKBC5to4eek6gaA1wqP
	uzVt3p6jmy8n9jISM/IMXGYbgIfMCu61flpGGwzDID6xoVf9xwYe0u4vQKtNeJSwcRHx/PlHwh0Ur
	L96Y+G1pQV7smZUEmVaUGAN6f69whi5s97YYjQtacBpU++13m5jXG0RHKD5h3gRvTYxJ2pXAWmbl1
	CNyhbizsqCN1FJxY5iVcWnMhGMMplH+ld6i6547QZO+s3EwBPsz4u4oVS3KbCfZofi9um8PnA6dsR
	Hvp2ME64Byt283pqTGxgwh503/bVmYl9rL/y21iofCmWPfst4meAk1WmUmH9Ds22lW0wKlWFF6yAl
	TVxDWOOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiltr-009mCL-PU; Thu, 13 Oct 2022 00:16:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiltT-009m6J-BN; Thu, 13 Oct 2022 00:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CB434B81CC0;
	Thu, 13 Oct 2022 00:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05167C433B5;
	Thu, 13 Oct 2022 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620168;
	bh=YJbnZ0RTeY+t7PcY4eYKEecQAqN2QYIiIc5b5AmosT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oJ6dHqTSlwLb9N/GHfxE2AAcsyZn9sGyBL9uSvBeFJGmoQYDfk36CDO6OXZAT3Qpk
	 Y4rKHa39CpgSCXGfy3EAlmUzJGLoN1fXNMrjP/aa24pS/8R3F9ka2AH49NNWiy02Zz
	 5fcTKHZ50GeKHUF3e0qVY1ettdZoXkcPhLGRgeRP2UTtCMjCLMmbQaCmrkWq3aCRby
	 dQAxtQ81ixSzT5UEc4xmQW5oBQcrPaKNkxsn+ECFBZ+XkIMU7P4knttRWKNsMUS8FA
	 xD5P7emQMyMMpT+cKe13UwlsGoY01cSuq+fzLN1AwVYf0Iv+pJVJIBbPvzXClSkHn/
	 pFXJjwfeF8zHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hangyu Hua <hbh25y@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	m.szyprowski@samsung.com,
	andrzej.hajda@intel.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.0 04/67] media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
Date: Wed, 12 Oct 2022 20:14:45 -0400
Message-Id: <20221013001554.1892206-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001554.1892206-1-sashal@kernel.org>
References: <20221013001554.1892206-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_171611_698157_2B71E9F6 
X-CRM114-Status: GOOD (  11.15  )
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

From: Hangyu Hua <hbh25y@gmail.com>

[ Upstream commit c65c3f3a2cbf21ed429d9b9c725bdb5dc6abf4cf ]

video_unregister_device will release device internally. There is no need to
call video_device_release after video_unregister_device.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/amlogic/meson-ge2d/ge2d.c     | 1 -
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 -
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c     | 3 +--
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
index 5e7b319f300d..142d421a8d76 100644
--- a/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
+++ b/drivers/media/platform/amlogic/meson-ge2d/ge2d.c
@@ -1030,7 +1030,6 @@ static int ge2d_remove(struct platform_device *pdev)
 
 	video_unregister_device(ge2d->vfd);
 	v4l2_m2m_release(ge2d->m2m_dev);
-	video_device_release(ge2d->vfd);
 	v4l2_device_unregister(&ge2d->v4l2_dev);
 	clk_disable_unprepare(ge2d->clk);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 87685a62a5c2..3071b61946c3 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1414,7 +1414,6 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
-	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 
diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 761341934925..f85d1eebafac 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1399,6 +1399,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 /* Deinit MFC if probe had failed */
 err_enc_reg:
 	video_unregister_device(dev->vfd_dec);
+	dev->vfd_dec = NULL;
 err_dec_reg:
 	video_device_release(dev->vfd_enc);
 err_enc_alloc:
@@ -1444,8 +1445,6 @@ static int s5p_mfc_remove(struct platform_device *pdev)
 
 	video_unregister_device(dev->vfd_enc);
 	video_unregister_device(dev->vfd_dec);
-	video_device_release(dev->vfd_enc);
-	video_device_release(dev->vfd_dec);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	s5p_mfc_unconfigure_dma_memory(dev);
 
-- 
2.35.1


