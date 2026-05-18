Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F86CD4F54
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2026 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1eFHqTiE371KCrLlYGgbVFRxRtaxnf3rFpulm5ChXcQ=; b=zh1vBVBClXQ6AGSolsLgKfBZlv
	gT1avOGitjTwM+NlxdWL5HVTNep51vQ42fuyVi5rwc4NMeo8152r0evAjwSnzZW5nQJdINfHnyA8t
	wmxMa4j/jfTFvaVC0qeqloDdlTSXbm0bypqLJ2DV2px5qJhulV6jsEhQ6DyjO4VRkhQCS8oSgynbG
	0LT9kvcu91DWR3CtNeswDWuq4CVYpo9v394lzYDFmJOWsDv+yJtaqpcQvn4l4tfgYjm9xhdvWUj6G
	zBRNqGV43sPoJLJPefAtWrFdFxdw1Xc0VE6VlSvq9/2wulICUKOnwH5yP8tz5vTwK2VR01KqLFASM
	Bhrn13mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxVH-0000000FiZ1-2iNg;
	Mon, 18 May 2026 12:55:27 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxVD-0000000FiVd-2uVm
	for linux-mediatek@lists.infradead.org;
	Mon, 18 May 2026 12:55:24 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so2110676a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 05:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779108923; x=1779713723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1eFHqTiE371KCrLlYGgbVFRxRtaxnf3rFpulm5ChXcQ=;
        b=Ay9bePZDi7aSnF4jCBbvk9XVeE/TsU2P23/u0j60ZXujzYrJvdhgAG66EmbZoOZY4Z
         QNaEwQ5KbwUOfqCHizVpQsYE8qRzstKmT9/KViR25K6ObN/dJPLJ3F+wdjjwTCwV7fhz
         XfyjXFfEiL4gbk3BLppW/FXRwnS451PT+cExq8YxlnSddKCprRtVJbuQfE1RNNM4nQq3
         x3iKRGOjXfio/OkQvNk96qft+gqE/4DAh38We/fIVjtu0xNuWnOr6PgJTDk2BWpnsdyF
         3o4a7RZp6ge6kldr8aIMXXjmFmVAaGi9xwizYDb4JTIhFcy5OWloH02/suGrM4TTF/Kg
         o+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108923; x=1779713723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eFHqTiE371KCrLlYGgbVFRxRtaxnf3rFpulm5ChXcQ=;
        b=SBmos7Q8X0VeC9AaGLYwuwPbuO3RaMNa6gjX6RkdUT/bWZvVEQ0GzyB2xbmDnVs4rA
         WBO5r2fUKg1KVPySceryuv1zu6LMnLkkuB//VF7PaH7G+ApL0OCnEjqUWXcGOOl5Xqih
         W03X+CUG/pgAoOXg7n9voJ9Y/s83z7ycrZ5pMuk5+Qh+Gi+LNS9SpUIxJfScnj90qPVi
         P8XC8Xn0pHP5qU5b7q8xJvMGm4yUtxCV2YBOrbwnm68rAEdxOzWB/ipW6bRqJcJTiGM9
         uq6Bu5JitTR1nYAL+6BBClz/Dl4qJsNEJGu+DDP8+1Iqs6oWGmQZjEgK8xfgW2zlGurJ
         7/rw==
X-Forwarded-Encrypted: i=1; AFNElJ/lOQEHMa15S3aPNfgRTPnyBxUQXBujcbiD0Nb7RX9YwvpQCQ/mYc6rGlQ/DMoXpHij2SP6uGf4/YHp7uHvPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmLUiH9e4GGOkxjWOltsR77HJUKwvdGeZAcnfbU4uDPK1ge8wb
	JR509nLHaHxx2p7jn8j9uwbpYFgtUEdjnN7YId02gARTj1cIfFdVFdAN
X-Gm-Gg: Acq92OHDPqF6w+FQ1N/w/DOQVlV+wXMP8pb+NLOT6h8pTWIEWGP5v8DnXcojIYSBpI0
	zVSvIWfNJdv56V/2TpDbLnlmn9x6DwYoOeFRTjOx4PCrvfdAwWq6ZPlAds1CqmTUV4STcfUxQQD
	kXdBJo0hVKc6J6OYqmyQNB4fnYjKBvEBNOWC7XD+tYvkzypBP8QlvnXYS9m5m74515EJIOn7Zdo
	Xq8p+fNxmWz0OnAV5FNNJjG5kDekSaJaw5gcXfOJwt4fsVqOE27DsTY3jDjpuQSZ7oAO+jchy6R
	CZNrFipShxl7Bw7+n7PfOCEsGx93/o4VGvEJnOaCh6xHtrw58SFiHEquLjdjJ25IlrVefHs+wbB
	d9C4e1tGxmsJWUNatVpqf6UpAWy+ZVkBvYoaUe84Y0JPlsh+mI7AyLg5gYazhkx5FAdy/eqoIN4
	Ng0kaRzeVYMWq1
X-Received: by 2002:a17:90b:5290:b0:368:a297:bd38 with SMTP id 98e67ed59e1d1-36951a044b5mr14533669a91.7.1779108922965;
        Mon, 18 May 2026 05:55:22 -0700 (PDT)
Received: from lgs.. ([101.36.111.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d11cbdesm150135295ad.71.2026.05.18.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:55:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mediatek: mdp: avoid double free on video register failure
Date: Mon, 18 May 2026 20:55:00 +0800
Message-ID: <20260518125500.1000083-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055523_752957_11A42A95 
X-CRM114-Status: GOOD (  11.25  )
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

mtk_mdp_register_m2m_device() allocates a video_device with
video_device_alloc() and releases it from the err_m2m_init error path if
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

  mtk_mdp_register_m2m_device()
    -> err_m2m_init
       -> video_device_release(mdp->vdev)

Use video_device_release_empty() while registering the device so that
registration failure paths do not free mdp->vdev through vdev->release().
mtk_mdp_register_m2m_device() then releases mdp->vdev exactly once from
err_m2m_init. Restore video_device_release() after successful registration
so the registered device keeps its normal lifetime handling.

Clear mdp->vdev after releasing it on failure to avoid leaving a stale
pointer behind.

This issue was found by a static analysis tool I am developing.

Fixes: 7febb418a32a ("[media] mtk-mdp: allocate video_device dynamically")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..5cc80a542eda 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -1185,7 +1185,7 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 	mdp->vdev->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
 	mdp->vdev->fops = &mtk_mdp_m2m_fops;
 	mdp->vdev->ioctl_ops = &mtk_mdp_m2m_ioctl_ops;
-	mdp->vdev->release = video_device_release;
+	mdp->vdev->release = video_device_release_empty;
 	mdp->vdev->lock = &mdp->lock;
 	mdp->vdev->vfl_dir = VFL_DIR_M2M;
 	mdp->vdev->v4l2_dev = &mdp->v4l2_dev;
@@ -1205,6 +1205,7 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 		dev_err(dev, "failed to register video device\n");
 		goto err_vdev_register;
 	}
+	mdp->vdev->release = video_device_release;
 
 	v4l2_info(&mdp->v4l2_dev, "driver registered as /dev/video%d",
 		  mdp->vdev->num);
@@ -1213,7 +1214,8 @@ int mtk_mdp_register_m2m_device(struct mtk_mdp_dev *mdp)
 err_vdev_register:
 	v4l2_m2m_release(mdp->m2m_dev);
 err_m2m_init:
-	video_device_release(mdp->vdev);
+	video_device_release(mdp->vdev)
+	mdp->vdev = NULL;
 err_video_alloc:
 
 	return ret;
-- 
2.43.0


