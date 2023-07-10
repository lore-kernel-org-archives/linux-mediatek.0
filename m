Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B97FEB64D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OHTjYXmEzIxUquNxc12N2ed97hoxj5Q5yMhXNmLYxUg=; b=DsoZOMrQWezNGjY8s4kGSwtHJf
	pbe361zxjx9JUThxnhctCnQVD30qx7CpcE58shwN9SRa3gMohA/VLOZUpMq5f4r7+aSH9ES2IBOpW
	C89y8hDZmefHZncI+LEukYfGEo5E4ptz7MO9o84594dWMi6BngtFOHqvjvog+zp4hl1T+EhkukBeA
	rUgIQ2zUOiLLhEerLhIEaUNDQIGnewdiCa7pgA0UUmHjcAszy9rxpQAX1aiXGWRXpPkdB10y8gO7m
	OvdlAZrf7hiqPS8U3wBomFxiD8zRKxXeTTbOkey1PYwc9e1De4/4MkIs8hbyD3onuG+Ql362almIB
	UlJzyMzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkkf-00AdHX-1q;
	Mon, 10 Jul 2023 06:52:05 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIkkc-00AdFA-2B
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 06:52:03 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55bc22375b9so2021058a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Jul 2023 23:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688971916; x=1691563916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHTjYXmEzIxUquNxc12N2ed97hoxj5Q5yMhXNmLYxUg=;
        b=dWRiLXZrSKSFSMWsHBCQVAB/OlaHEOIh/Oml1FQLpvcm3sfSG6ev2fCiruI7p3ku7T
         5K625KuWeejYo4UbkfJukPnHuiZaAm5ajcflQvjH11+2dW7FXXGIR/6kcsAN/6BQat8b
         7klmo5pQBs08mERbff+G4nguqLH+zekW7LJ7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688971916; x=1691563916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHTjYXmEzIxUquNxc12N2ed97hoxj5Q5yMhXNmLYxUg=;
        b=NfNpYfdZv6E4VWPlfFmEaxTtmiIAssSFQu5xKQXBJzM7uyQ4xRtZZ0FFRitltlT/DP
         IovOEXntIsRS3IqOYmIiPnWu6RozEIbburC8J6TOmCS1ZVXi/rlksda0qM/awtzaExuq
         yM7StqYkGFlI5tazAfXBrbmUBrDSG2LG/CVbw0da/hdU6PmE8wvG0dWnt2BMnN+BL6QO
         SbASH464w5rpXIXT0BLnA21a/mchkGkwMH0ARoyNHgCVgdHCBc312Vtt62Uz+yjJs2+2
         /HNR6uSr31FydwppvwLq0J+Z9x1NeGBI+DP8KuQHFmkZNJxkhJz6TA+SJXikaAEQBHPj
         t5KQ==
X-Gm-Message-State: ABy/qLbyXOfOknLq5OIVoHvIChFGwQGnprzpobDIdGTokUJ05corqF5v
	kh2WlprMoE4jAgnceY/I9ywzdg==
X-Google-Smtp-Source: APBJJlEsK/dk4vJ7TGYCMmKUwZ7bo7xtcJrx/4aPs/O3RjBKNkmBBpuDQjFcEeGNWyeUrP7crV8msA==
X-Received: by 2002:a17:90a:5317:b0:262:d2ca:e209 with SMTP id x23-20020a17090a531700b00262d2cae209mr8935382pjh.18.1688971916071;
        Sun, 09 Jul 2023 23:51:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:be97:1d05:f9b6:36a6])
        by smtp.gmail.com with ESMTPSA id s24-20020a17090aba1800b0026302348ee4sm5537135pjr.30.2023.07.09.23.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 23:51:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kyrie.wu@mediatek.com,
	irui.wang@mediatek.com
Subject: [PATCH] media: mtk-jpeg: Set platform driver data earlier
Date: Mon, 10 Jul 2023 14:51:36 +0800
Message-ID: <20230710065139.1763695-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_235202_712513_A3AE37DC 
X-CRM114-Status: GOOD (  15.86  )
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

In the multi-core JPEG encoder/decoder setup, the driver for the
individual cores references the parent device's platform driver data.
However, in the parent driver, this is only set at the end of the probe
function, way later than devm_of_platform_populate(), which triggers
the probe of the cores. This causes a kernel splat in the sub-device
probe function.

Move platform_set_drvdata() to before devm_of_platform_populate() to
fix this.

Fixes: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Not sure what caused this to surface just now, given that the driver
changes were merged in v6.2-rc1, and the corresponding dts entries
in v6.3-rc1.

This fixes boot failures on MT8195. Please apply and send to Linus ASAP.

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 4768156181c9..6a8eea9dde67 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1312,6 +1312,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
 
+	platform_set_drvdata(pdev, jpeg);
+
 	ret = devm_of_platform_populate(&pdev->dev);
 	if (ret) {
 		v4l2_err(&jpeg->v4l2_dev, "Master of platform populate failed.");
@@ -1383,8 +1385,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 		  jpeg->variant->dev_name, jpeg->vdev->num,
 		  VIDEO_MAJOR, jpeg->vdev->minor);
 
-	platform_set_drvdata(pdev, jpeg);
-
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-- 
2.41.0.255.g8b1d071c50-goog


