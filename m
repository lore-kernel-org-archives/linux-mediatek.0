Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4974AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 00:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMvWmbI67JqC5C59JgViedpFg9aFX60Wvv+SkOZsV4g=; b=mj+Admb2oi5h6Xzl6t1bVrDA4t
	mtYvA42KKsuvIXEyqSopKL8AiOySUqzxJLKchFEmynglmUxsLUtXdXjwljWK6N6wAXOo38yWAHtNq
	LLGeEjRt1lCBZgcskPOmqI86kcg/lUr1yk6fxdeYms4XGZhCtzXCORuTnTsFq1LYOcMWTJ4A3culm
	HiE24NdZeDdVNKHqYagMdLK9zY8MCs2eSbsYjZh49iKd0N/9PEToDfN1X3tjAdLykQIVcGqhjMWE0
	VskVLShnhUqCARiLjfVzX2Q6nR5N0keUN0D9XIYbwsMS3aqfulBuW9yNLUc3pIcMHd0XY98kwvjcw
	xJvU8HHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oim9f-009u4B-5C; Thu, 13 Oct 2022 00:32:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oilyr-009oq2-52; Thu, 13 Oct 2022 00:21:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 91669B81CDC;
	Thu, 13 Oct 2022 00:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CC6FC433D6;
	Thu, 13 Oct 2022 00:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665620502;
	bh=i1lndpiEkYrYAtQpDMBbdOudkzLK1aVb7W6EgX5Yd3A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2BLZLyggaDgsax3xO3TQy9M+dyFbP4ZpSPjKD6trFqlic0eMh9Pp+Qfs31bGEqWV
	 i9yl+hF79wtvVvoH4FWMQgZsqnXhkPtvwDanO+iW2H9Pi67xYKT/9TjMcFnALHPMbu
	 EBPCYZy+/0N/Q3Joi9Ga4gA0iPRTtaJs+6vk/bVKS43SGLIImnlN7YOv+J0XZfdcOQ
	 FlgmIXlGBMe03hkbZBhI6joIiPjcT1W+SC/ogg8Z09hkwhdNhltVrlWWmWvagNPiVu
	 S7d+4D73pewDj/eOPfq11kmynWlHSpWFGVun1FFEsapkgv0AnYBVtSYEaaJuMLwE81
	 IZnVKVuC5GO/Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hangyu Hua <hbh25y@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	matthias.bgg@gmail.com,
	dafna.hirschfeld@collabora.com,
	vulab@iscas.ac.cn,
	rick.chang@mediatek.com,
	yong.wu@mediatek.com,
	colin.i.king@gmail.com,
	christophe.jaillet@wanadoo.fr,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrzej.hajda@intel.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 03/47] media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
Date: Wed, 12 Oct 2022 20:20:38 -0400
Message-Id: <20221013002124.1894077-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013002124.1894077-1-sashal@kernel.org>
References: <20221013002124.1894077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_172145_538109_68B1F2AE 
X-CRM114-Status: GOOD (  11.04  )
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
 drivers/media/platform/meson/ge2d/ge2d.c        | 1 -
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 1 -
 drivers/media/platform/s5p-mfc/s5p_mfc.c        | 3 +--
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/meson/ge2d/ge2d.c b/drivers/media/platform/meson/ge2d/ge2d.c
index a373dea9866b..a885cbc99e38 100644
--- a/drivers/media/platform/meson/ge2d/ge2d.c
+++ b/drivers/media/platform/meson/ge2d/ge2d.c
@@ -1032,7 +1032,6 @@ static int ge2d_remove(struct platform_device *pdev)
 
 	video_unregister_device(ge2d->vfd);
 	v4l2_m2m_release(ge2d->m2m_dev);
-	video_device_release(ge2d->vfd);
 	v4l2_device_unregister(&ge2d->v4l2_dev);
 	clk_disable_unprepare(ge2d->clk);
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index a89c7b206eef..470f8f167744 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1457,7 +1457,6 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
-	video_device_release(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
 	v4l2_device_unregister(&jpeg->v4l2_dev);
 	mtk_jpeg_clk_release(jpeg);
diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index f336a9543273..4fc135d9f38b 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1406,6 +1406,7 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 /* Deinit MFC if probe had failed */
 err_enc_reg:
 	video_unregister_device(dev->vfd_dec);
+	dev->vfd_dec = NULL;
 err_dec_reg:
 	video_device_release(dev->vfd_enc);
 err_enc_alloc:
@@ -1451,8 +1452,6 @@ static int s5p_mfc_remove(struct platform_device *pdev)
 
 	video_unregister_device(dev->vfd_enc);
 	video_unregister_device(dev->vfd_dec);
-	video_device_release(dev->vfd_enc);
-	video_device_release(dev->vfd_dec);
 	v4l2_device_unregister(&dev->v4l2_dev);
 	s5p_mfc_unconfigure_dma_memory(dev);
 
-- 
2.35.1


