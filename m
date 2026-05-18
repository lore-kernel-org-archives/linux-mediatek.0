Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FFDCD4F52
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8459ka1i7cq2n7IBawpfs6eiuW3MTLtx44g6qMux+Ps=; b=GeLFZJ2YMTnhfGVnm+SNvjzWFu
	kch7aXAZHcEM09DqUdVlNGdQfLF1xhELr3qjaPMmoZg3NSv7Wn1GHEXQfa1n80vlbhQfkiJAAAnPS
	hfbkq4/7gr9gQ/kA2INgwK0m4gkrx4tLJOqDyT3f/7Rw/pHtvettgdEsZFqiSFDwBB2TKF4EVj4AM
	Nafu4cBmoDMuA7uWxy6pZFiSQKj+gTcPdlNgEiUayl9hvYaJchD5XeXGWRNyGDUm9JgV2A/NwZR3+
	u+4ytiYRPwZcA6lGvj13op0b5+5wKDuvzuhxmUHMlbLWV3HVcQPY9spb/SVWt+V+sz0/xvoAghO6P
	GSg77lKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxSI-0000000Fhg7-0vJG;
	Mon, 18 May 2026 12:52:22 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxSF-0000000Fheq-1TzV
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 12:52:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso1505938a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 05:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108738; x=1779713538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8459ka1i7cq2n7IBawpfs6eiuW3MTLtx44g6qMux+Ps=;
        b=M//0q8Soul4Yl3IEI+xrTGRUVZKWsI1l5sqWU0Ro8Y4bAxzL7cHHvE5SDj/fa37LBF
         /4OarcT/8t9DX9q8V4ConXqJGt/i76yjgel6vDNpPWL+W90SNb05rxP7c7o4witOT3Vq
         n/pSE06eb8vydVO0s08P3pIVV96eqxNGKzsMq+NhU1oY+HerqNX76u6Qz/GSHVOjvdQq
         4JuFTHrF2MJWWR5YVslhgVnHW2yBD49tILUIIUB4j0SvkrJYOZ1NXwOgTKafbO4+pHlO
         /cZzse8vE3KsYoDqXq887GF0V4q4xO0GHXc4lU0y3xl4xTEdwRl5L4LH1lZCbczadr9s
         plzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108738; x=1779713538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8459ka1i7cq2n7IBawpfs6eiuW3MTLtx44g6qMux+Ps=;
        b=nXwZLx93t313WTlEfINGfkpnxHUNmx9nEs3VGU7/NJmWi/olgruyZU2fnVp09+LiOq
         D5sHWWa505vgpxdFar6Ln0C/eys30ev3aVWVOG2YDTb1CpSuXnU8EG2Gi0YCxsmuj+wx
         VBvKBv3bCGv0Y15QiIi2SrVZDgw7/RFgKoGpunL1EGasY47mE/HeoTSzmrb6oebOoqTY
         IvT/isfdO38eGrm7Tuw5zkyW6BCq6LSVOZH0nZpnbab06lA1jOIlsEiXPnDW/rPLSRqh
         Q9uVJTGOSMdlZ0pAlmXvRQhwZ9stWJFhjhxSLGRozYVZKJ66LvB37v7slUK8Dp3muMH2
         0d7g==
X-Forwarded-Encrypted: i=1; AFNElJ95kw12j3XjMa5OhrPojnbzpWPlW8PN5416Ya8bnUfby/Vq83yh2rXMGmI3RwHUNDmUune+6TlUTiW8VmW14g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq6urTgfLPSiVm0YckFXdkqqBqcUo8LdR7wfwU57h+uf9qrhaU
	gO4f9sZASB6TSEPSyK83sqpYfR/S2dCBLGZz3zr064sTrt+6vjDMXZpj
X-Gm-Gg: Acq92OFIuWuE8cOqgRlWFm8aHyzVsSVJxVqsDxDDMb6IMyyQjb2m85k/uMy8PPEZ+HJ
	C21wpGdiD8e4I7tAE3RIpObe5LOWv/X+IxW2vEn0jwjbg2Ns9iJl6kNIWoi1vKu+fs50bon7Lim
	StWilDsb9gD/il6tb01/vPzHimvIJeHgsvn6t899x4AkRfbuuyVgrjHAkg/YaMoI4ATGvUj2eSO
	hMBJMfK9UfxQ8a+Q9r+XP8GenXMmVrqD35/MoJxf5HQ44Z0Svx/T6wf3VuTJwt8SSi3hq8UE1hZ
	Lxo4u7gCjz62ykRfby2cfC35NQBsQ2kJvy7g3a3FtVb0lMlTZhJ8uKyzht0neQkZZ1gyNS5/QJt
	e5DrBQ4Fl/VvWbkK4viCaQsjRtxGIam9q65RBKIl8vDE0komvpluNNjLTR8Qq6Ix7JUL3AJ9eOD
	17Yc/z1f0SlPo7OIbcS4FMBkg=
X-Received: by 2002:a17:90b:1d8e:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-3695137f713mr10939480a91.5.1779108738463;
        Mon, 18 May 2026 05:52:18 -0700 (PDT)
Received: from lgs.. ([101.36.111.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517ed182sm11265900a91.15.2026.05.18.05.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:52:18 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tomasz Figa <tfiga@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mediatek: jpeg: avoid double free on video register failure
Date: Mon, 18 May 2026 20:51:43 +0800
Message-ID: <20260518125143.998572-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055219_394594_643BCDD0 
X-CRM114-Status: GOOD (  12.12  )
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

mtk_jpeg_probe() allocates a video_device with video_device_alloc() and
releases it from the err_vfd_jpeg_register error path if
video_register_device() fails.

This can double free the video_device when __video_register_device()
reaches device_register() and that call fails:

  video_register_device()
    -> __video_register_device()
       -> device_register() fails
          -> put_device(&vdev->dev)
             -> v4l2_device_release()
                -> vdev->release(vdev)
                   -> video_device_release(vdev)

  mtk_jpeg_probe()
    -> err_vfd_jpeg_register
       -> video_device_release(jpeg->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free jpeg->vdev through vdev->release().
mtk_jpeg_probe() then releases jpeg->vdev exactly once from
err_vfd_jpeg_register. Restore video_device_release() after successful
registration so the registered device keeps its normal lifetime handling.

This issue was found by a static analysis tool I am developing.

Fixes: 2ac8015f156b ("media: platform: Rename existing functions/defines/variables")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index c01124a349f6..9888ac8dd6e4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1362,7 +1362,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->vdev->fops = &mtk_jpeg_fops;
 	jpeg->vdev->ioctl_ops = jpeg->variant->ioctl_ops;
 	jpeg->vdev->minor = -1;
-	jpeg->vdev->release = video_device_release;
+	jpeg->vdev->release = video_device_release_empty;
 	jpeg->vdev->lock = &jpeg->lock;
 	jpeg->vdev->v4l2_dev = &jpeg->v4l2_dev;
 	jpeg->vdev->vfl_dir = VFL_DIR_M2M;
@@ -1374,6 +1374,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		v4l2_err(&jpeg->v4l2_dev, "Failed to register video device\n");
 		goto err_vfd_jpeg_register;
 	}
+	jpeg->vdev->release = video_device_release;
 
 	video_set_drvdata(jpeg->vdev, jpeg);
 	v4l2_info(&jpeg->v4l2_dev,
-- 
2.43.0


