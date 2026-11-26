Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CFC606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bwVyTHIs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=STbFTdMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=; b=bwVyTHIsHcOuJe3T0YZhKbOJsy
	bBbHdAB9QMu01Iibguq53N4QykfANPI3YiEu+M9bqMIzehcG7uwhNO5I8kAClpU3YZcQkpRAuyLHg
	NhQaY7U+O+c3X4yfOW5FCej6KVL/exZ+8kQl54p3eV5egOqB5mT8+DVb2Z1/tr+Tsiugpp2TGp437
	jfx/eOdvK4l8MP7fSaW1Xp9XGaUCRErKyf/0Jpjc7rxLbkp6uR77TR3crtYQg6+Uwh+i2njFabsgX
	5JpzrMgkt6GHenhjUyfPvQERebVeZ2aQPKkRSW88sOTlACwxn2lsUIB/DkD42dx1gJ+O6CWcgZVDu
	39HAABeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvg-0000000CBh2-4ADE;
	Thu, 26 Nov 2026 06:26:00 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv9-0000000CBOM-0d98
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:30 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1ae58d17cd9so7385846c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674325; x=1796279125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=STbFTdMgASb8Ai8A9R/1ILZQkY0kOOqJVZ9hZZUq94Q0mDqnT1Ui0+E3arSzeNdwfl
         aBsDc7QFOhu5UVfSWNaV2DEUThSH843w/AivT5DVNIuDSWT4XLaKOyZ73r9wjIKQXG7Z
         lZZIJyD3cZksFu/56ZgZ7F1aTlECM7B3iGR6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674325; x=1796279125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZe39WaA8R6UeVIikLXAN07ESOsxBSo6V3fin9PGn8M=;
        b=yobgB23iEIYoMw1BV93dlEB61sxM2203kA62rzrOAKBkKMRzafm8AgBUpbwkJlC5uO
         BaxkPYLcR1XxL15pKquntQ1SyQ1GYLtQeF1WgXwgcdG8A3BBHIQgh0fU1rz0CYsk2QcR
         5FzPZqBzik73HYzfhmdDzIWj76A+uO9cnyzV7LiIKh0fErucRcqRcd2mykig7sp6l33d
         fowscUqGfeQflPQwSWoy3H/jpgQF0wYJbMGKV2x/Sdfm2iEV9ezD5fB8nJGAkubcz8sp
         ILCEP8WRtsPCby4y69m1pX4qUzv/Wo2g3s9ismItjIB2JLH44tW0z2Fbn/xVV9wIMeMA
         ld9g==
X-Forwarded-Encrypted: i=1; AL+hErGnKeLlf4jT8WAKjRu+/tcgy8FLAUMjq76HXXRyFzlbIjurGgJlYYZ9JAgMB5VNsosuGIosKooDw5hoLExfbw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ggZNPFUzazMk8mA60uSsyqaUqK+qO6/ylmc3/JzMISJuSPbnk
	4bctpCwBYFnug/EEnNoM+knXyS4iIKCX+39cEzUjNXa48Z4FHow7FU49X7xsSZE3FYSkkCb2GA1
	2DdG7/w==
X-Gm-Gg: AZFdTZf8rIxsVxRXm3jQMSRNfjug10MnLiL83OUt6X8uSGC7rwXFCCXp+uKlFAyF5nm
	uXfhVTNz0z39OYqNhxwR4vQ4TcK+bwnK8wU+Ur/ihKYPJM3Q0LI+ZkPZ7SM+VLu1A7+ZUm4aNqx
	/uiMf5317EVnUObqu9zBeMvPIA1WY985CD9blXMhJ3k02NmaL56gPCCfQgJ8JdFtFTSD+kYp/k9
	gcCZQ7DAxxDlkT7gsyTu8S6j0trSt+5AhEwLCwwc9Y3NrVNNVu5G7OyO76XVopYM+7qNh9Jg/DW
	XsWMtwRF6PDRFDZ4+NVYwyI3XAyYa9CHk63RBCFJHsfa0HSBIN63oLT4/caByFi273RUdmxN7AK
	lLjxAHQmbYII7E4TnMO/W1cmNLSXybW4TmDlmjJpAY2xXHba1CHbdCybyTZzLzmZej1kQ17d2XG
	qOWkRYIPxgOAxVJEuP4JXn/RAElfTo2FUhIwEUmiS4i1meuP6frXMGOQ7qPesoD8v0DjeQUoiN7
	yetdDsQY85dEuVoAN1z0mMdOYoDZZv5G1npVj7PSaEDQ6KNviQe0KzckISEupwirgLThHfZQ1x0
	g87/ZKBnYCKrkbEETKhChjzRGo3vyJZJSen8MJb95xlgSuGliJ4c+HTKWFp+8BnMnneuYYXaG6+
	COxt9UGeGo2BYDFgasY3JNA==
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr17922707c88.29.1795674325489;
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:25 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:50 +0800
Subject: [PATCH 8/8] drm/mediatek: Expose GEM memory usage stats via fdinfo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-8-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222527_849354_EEA84287 
X-CRM114-Status: GOOD (  10.00  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Marijn Suijten <marijn.suijten@somainline.org>, Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, Rob Herring <robh@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Steven Price <steven.price@arm.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>, Melissa Wen <mwen@igalia.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Karol Wachowski <karol.wachowski@linux.intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, freedreno@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Set .show_fdinfo to drm_show_memory_stats() to report standard GEM
memory usage stats in /proc/<pid>/fdinfo/<fd> via DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a8bf0690756a..9d646740c468 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -18,6 +18,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
+#include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
@@ -607,6 +608,7 @@ static const struct drm_driver mtk_drm_driver = {
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops = &mtk_drm_fops,
+	.show_fdinfo = drm_show_memory_stats,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,

-- 
2.56.1.839.g22a8290db9-goog


