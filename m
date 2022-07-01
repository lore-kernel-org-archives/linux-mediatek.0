Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31FECCA479
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAb8BhaEnoy6g4TUthkAckgbU5LqWiMd2MpRJwBJ244=; b=grYdipAHMaYQkM94ZjenjUAes7
	M0OHERFKfekv8U0SkQA3It8gSodPp0F1pSxNzMg8N9dM09iiLimHs5kHwfnIRIEvhGv7QDsRtC7Ok
	vzjURokr/z2eoI+jUjwJKTxyaM80sDp8fqePYCoy2T666fZ2a2MxPGAdBAXanSLzo5Z43srNimvwa
	lJE22TsmelLCPkYRt0ylhMyKnOVQ6omrfdKmpU7ji+IBcA51zaYR8WkLtX9YEol3qBArvCZIom6Sm
	tZcLiIwao7BKy18o8kaOs3enA8Fe18tp1BRRea+FQKV6YQw3Ga0WgnBG6q3xvh+3GlnAAxXvjOTU+
	L3F/fxcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EHC-004D5H-Ti; Fri, 01 Jul 2022 10:53:30 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EH3-004CxI-Vq
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id g20-20020a17090a579400b001ed52939d72so2305318pji.4
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAb8BhaEnoy6g4TUthkAckgbU5LqWiMd2MpRJwBJ244=;
        b=iKv4thd0wDQP8anbuEyzEQ+Zqxa2RoLpovoXs077tea1xpsXOBelzTXGmK4y7MqftT
         5BJnXPH8YNdKWTHrIlCKk2Y5qhZu1/pNfrnZsu0+Mx5vhh0AMDhG/LEBw6Yr2orVpLpS
         c9Rif9I0bUJFib7BjpoRdmrjmJJMel7dBcIgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAb8BhaEnoy6g4TUthkAckgbU5LqWiMd2MpRJwBJ244=;
        b=7KUofhW7DMav9LXzTS54NU1gellBIM60auahIR24viUMaLyJq6N1d09KvExsk6kbYm
         SWWxNd1WMUqzJ8ha8P1SXJWlBmQgzN0Za96ZLIGL9WTn4mN+dcj4b/+R32/6i8vmVv4e
         ejXWlbIKffr7Qv4gEmeMkLPXRsLKVnVgit3z1oHtzF+sEUk1NIXvomUf5YPwhj6ElQaf
         1ifszPrxhZpB8Qu982hlYhItGE7+3mQH/lDWp00sgH07I3FiRkeFjZxMAXL6nLHzKZir
         YMt2MvBz4mLwII0Ii62Tz+bio/87xK+9vvydscbVS3ySqs+41OoPw5AyFeR/S9TNIQZo
         eSHQ==
X-Gm-Message-State: AJIora8siUXDuMhWFZbgxBmRTFF0UjukVNnxKMqGpgQLYkqrZ0VIFNWm
	1GK2g0v78QBFNVh32pYpXvvYMg==
X-Google-Smtp-Source: AGRyM1v7WmL7Uss1HNkKbQMy8M5hpzoThkEh0hNwmVYgcfIBghgHA/BIAT8PEL/BvGq+Wt4ZftbeQQ==
X-Received: by 2002:a17:902:9f87:b0:16a:1efc:42fe with SMTP id g7-20020a1709029f8700b0016a1efc42femr20863524plq.124.1656672798693;
        Fri, 01 Jul 2022 03:53:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 6/6] media: mediatek: vcodec: Use default bus_info for encoder capability
Date: Fri,  1 Jul 2022 18:52:37 +0800
Message-Id: <20220701105237.932332-7-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035322_098985_C4F7E702 
X-CRM114-Status: GOOD (  10.50  )
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

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the custom capability bus_info from the mtk-vcodec encoder
driver, and use the defaults.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index cc286e59021e..25e816863597 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -237,7 +237,6 @@ static int vidioc_venc_querycap(struct file *file, void *priv,
 	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
 	snprintf(cap->card, sizeof(cap->card), "MT%d video encoder", platform_name);
 
 	return 0;
-- 
2.37.0.rc0.161.g10f37bed90-goog


