Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673B6C2BB41
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UV497+nq9aRZ6EHD8/12Y71WbNxm7+fRZfBRKqrBQwM=; b=sp7HZDZGoPi9qIaXt2q3REFehD
	R1Twr2i3WI4HcMouJCMsItqLnQqKfr0Foe4cC4lrrGDS1pPOO6FCZaEJmPwc2ubpMJ6SMlisnQj0I
	pOIIcVqwGbsL5ju7Mvmp1skC9eCcW/Vr69xlFupXe4Q/tXgAZW/67GSxWHx8khabeRm0qml5vEmZF
	SEROyFak62W+os9cMDQgkYx7thHmy4Eh2+RCfa5GtpKbXn6d21h7uyRRsV+7wFJYHGbArf9gt0ivL
	Sq5Id9qjhjwvjhodu2w+RfqTkbgPuGmXqo1GJLN2Q5HmDItKjoFMbNlMRw4bdk8z2U5e1vVHcUP+F
	Yla3+0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsPo-00H4Yo-8O; Tue, 16 Aug 2022 08:59:12 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNsPc-00H4Rk-0l; Tue, 16 Aug 2022 08:59:01 +0000
Received: by mail-pj1-x1044.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so9025542pjf.2;
        Tue, 16 Aug 2022 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=UV497+nq9aRZ6EHD8/12Y71WbNxm7+fRZfBRKqrBQwM=;
        b=CQoQ8WFq7aduitDEdmjUkyykiF1V1Q40rxJ6zyuzNCuJ7Xu0CDc+RMhO1m3ehYAgdy
         wVMlVAakJKiadX6VSivL79hJriVdtS8XHoTHYi4DZeh3Aqla1eiO6Os0BejcmJ+xJC93
         lrw0gEC8B1HHQOxGSMBoD2IXv0LjmUzT8l3vrhF7aYLs0F+XB0Kj2TAWj6qz23l4zZ/T
         7mC+i1TTPI4/EVDVjtW3HtETDG/jOjk1kp+m1tdCaHUqMN7zu6hy7PNzfsvyuTZEEpJe
         6Wz8Hjae39X2ErNk38HqXXftFUeIZHlSCVrrbZQh5za9q9/wzEKCSP4oWhNo0eh8eL0Z
         QN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=UV497+nq9aRZ6EHD8/12Y71WbNxm7+fRZfBRKqrBQwM=;
        b=HugREv93pir6Mh99sEKfXAZu+DEPSahFigrj37kVyXLxLqwevdjyDFg37zlx9Um+VB
         rlm6BGtUpZtC5wxpu7a2DVBb0NcGV8S4g0x6hFSpgZMmvRWgTo1QJPP/2qCweLTKipxi
         /nFpf1tIiN365NHIW42Q7XSBBKl7SjP3GQs6gZC7rL2hinwSAJsPvSlH8QGqNqb+exc5
         nxCdToBn0Fe/2k9FMImsKjUJUu1Rpd0THntGDgoAE4bj3Z93ZWH+VR9OnRec40vG1nSv
         /s80RYSa5PbmSZflTfe5v5Rg3sFNqlK9fhaLszKfn8/pXjzKsowtyQ2qjropJZrnWsam
         IbjA==
X-Gm-Message-State: ACgBeo33wpz+i4Kpgw3/GNLR2jPN4oG1DYF60QXPHn3Zzyd77SkYU0/H
	aZ29Atdib8+8oKYzKpt8YqM=
X-Google-Smtp-Source: AA6agR6h4VsRwPE0IQM4jMyBWSUeeD40gs80UzAbpro2X2WbTUDtRikbrK3DGxrU6kDvw7MrxB0zsw==
X-Received: by 2002:a17:90b:390c:b0:1f5:5bbc:2e8 with SMTP id ob12-20020a17090b390c00b001f55bbc02e8mr32891611pjb.233.1660640336247;
        Tue, 16 Aug 2022 01:58:56 -0700 (PDT)
Received: from localhost.localdomain ([129.227.148.126])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090300c100b00170a8973137sm8446285plc.17.2022.08.16.01.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 01:58:55 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	m.szyprowski@samsung.com,
	andrzej.hajda@intel.com
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] media: platform: fix some double free in meson-ge2d and mtk-jpeg and s5p-mfc
Date: Tue, 16 Aug 2022 16:58:19 +0800
Message-Id: <20220816085819.39108-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_015900_249693_D37DBCDA 
X-CRM114-Status: UNSURE (   9.90  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

video_unregister_device will release device internally. There is no need to
call video_device_release after video_unregister_device.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
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
2.25.1


