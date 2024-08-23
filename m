Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E56C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 14:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2buiGMeTLw8HjLSI+F+yr2JIk87pbMCEy24zw5cgsOQ=; b=R+rkG2r54Xw8JF
	MpUFQsURvbj+NnOhn7y3EdDTsG7Z7nlaEvHC4a/hzak9MJkoRCXdJAgPYimU4cfUDDShr+kl310I1
	z9JOiRbJS+V3MU2+nODLt2bjapw/w5CFE9K9iBaupzCZKHd8UTn+Uzfsq53/Ls4p6UyiwTbMoumdT
	UoXlapAs+uCL75HdAbjGY/vhOgayIQ0AenVOUVEvcYFkie8IQ6cN2NOVxqyHJ4U9BFBpo+WH/ZaTi
	AIri89qgRD5QDFtOE5lxSHfRJ1XxJ1KGaYjL0mcZvJ6oAQ/HPDRd1Lzpc011UDRsxq6ImJSb2SFCE
	C1acpIrW5zYfh6HjY1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUro-0000000Gz4A-3ZHP;
	Fri, 23 Aug 2024 14:02:16 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shUr1-0000000Gyke-39Tf;
	Fri, 23 Aug 2024 14:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 68A6ECE09D0;
	Fri, 23 Aug 2024 14:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF39BC32786;
	Fri, 23 Aug 2024 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724421684;
	bh=v2GAa73zU3iAPH4GtRJqLTx0Fal/h2Cne66iizWEres=;
	h=From:To:Cc:Subject:Date:From;
	b=sEY6Lmg2697Gb5W7EOVk2j2o0tsWUniwfwvn//pp5zFQeEYbEcC3E+sp1V33Vedrk
	 tSnjRASP4DASHj0tacdzJUu5Iq4hDy1HXgRPddNnPQshtAGNabDL5W3iHBzSUnZal5
	 BlgyPyEpifi9FwXgV0IOgT2wZYyTwmHYuYbjxpW4S+TA6ERV7w1aoPOwAnjfyXth+C
	 8NsRgzAm9ojH0SY0Hc8zOiImIoXq1oPSHgaFzBTv9NAjPWdQmYr07dDCaZk7FTSUzw
	 qS6atd4+QPVYn54+hacIaCKOr14P1xkFtXCuk0ewdu+l9rzuQfMKTTbPLncdMLaHRP
	 EIu20ucH+Hm6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 01/24] drm/mediatek: Set sensible cursor width/height values to fix crash
Date: Fri, 23 Aug 2024 10:00:23 -0400
Message-ID: <20240823140121.1974012-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_070127_989324_DAE5865D 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: Sasha Levin <sashal@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de, CK Hu <ck.hu@mediatek.com>, daniel@ffwll.ch, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

[ Upstream commit 042b8711a0beafb2c3b888bebe3c300ab4c817fa ]

Hardware-speaking, there is no feature-reduced cursor specific
plane, so this driver reserves the last all Overlay plane as a
Cursor plane, but sets the maximum cursor width/height to the
maximum value that the full overlay plane can use.

While this could be ok, it raises issues with common userspace
using libdrm (especially Mutter, but other compositors too) which
will crash upon performing allocations and/or using said cursor
plane.

Reduce the maximum width/height for the cursor to 512x512 pixels,
value taken from IGT's maximum cursor size test, which succeeds.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Daniel Stone <daniels@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20240718082410.204459-1-angelogioacchino.delregno@collabora.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 56f409ad7f390..ab2bace792e46 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -539,8 +539,8 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	}
 
 	/* IGT will check if the cursor size is configured */
-	drm->mode_config.cursor_width = drm->mode_config.max_width;
-	drm->mode_config.cursor_height = drm->mode_config.max_height;
+	drm->mode_config.cursor_width = 512;
+	drm->mode_config.cursor_height = 512;
 
 	/* Use OVL device for all DMA memory allocations */
 	crtc = drm_crtc_from_index(drm, 0);
-- 
2.43.0


