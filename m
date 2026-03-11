Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EEB1049524
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=; b=r8e6j80iAZc0Az5z4V3TPbh2kX
	3HjECWdymF6yVYokdFVfKvQT1ngyc8zu0XLK48eE3VqvgDPV61V5oIa6U60U5h25ObMzsRlvPl7yP
	WLVQazX5Ggoli4Zw8lBvBUtR2SEcRmwj9eW7Im59aKCDEw5IYeUg8Mkr/xyT7UuQ60LI+cm8h9e3K
	ieOgAlfWftewRkK6+JcnGbLMIPa3NDXHAdxOD9ZgO5elHRdJeA998y4LRfKpKdYydVu9cAZ+diKn0
	WsKyGnEsrRzB9nh9m7XDNpfuSgOiQO9+UBxVQLGnMkx4NYP5HIlkdIkfAkMjX6r7jrTY+KSQKafqi
	vMX50Hww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCm-0000000BJsV-0Umv;
	Wed, 11 Mar 2026 09:50:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCl-0000000BJqq-0pdd
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=; b=n1ckW/1KBbhpl7z4uQOpjvSFWp
	Yz5nbsLfsKeRgbRTl682FGihDmMRH9eiBouJAmylcTZWUtCGTLMokoBoXGEHAFLi/kbN5UJuDZmQo
	fVgubV0LG6YJP7akqBc5tYJHQ+09PMymxawazC4OW9aryXO8k7FLoyaZKViUdaoo6gdyle1LmL+fW
	XJf1HS+v62BNV2/dIn7Rbz/cjYX6ViJXydQ7i4uTjdHrLAsscwCYgRNaxPjJ8nNniV+Ookpk1pLEv
	9VHlwqxU0yW+93fQvMJTjJwtVGst34NdL1O7HAOW/HzTGQXkstx/HOen3Plh5VFgrmHYyPmUpvLD3
	KA3aW7LQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCh-0000000Gbjs-2COI
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:14 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82984c077b2so3213983b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222610; x=1773827410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=SqmOEeKNwfe/CWfZRZIpGbs4sAoFiP9ThftR2xXSdZIEdl2mzBQRWATW9SN9foR0sh
         RW4AQgtKz1lBvxnMwT6M6nbOWSBENVvf/Qc0/bHZDKE+0i2XHl5tTBFG504Y4rO4h9VI
         A+7HtlLQBCqBG17n4XDXBNkG0wX+zG/07nnV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222610; x=1773827410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1z9EtizHwE3LeSySxAXfxT/FNlt1Ydhsh1vDf6WdY0=;
        b=Rh82aVnxJRhDAJ/MM3EnN7rRVK2rddb2TwpQus1ZwwSbXyQkrM9vOY5HlfuaTyIsnK
         LcAqxxAVOrbDsLIOm1Fk99EjZMrtEqrlzA9BlKKMNmI1FYzmmRXwYCDnkRCu5ImHCWDn
         pMuxgW2d0H5UQq5nlMbTYV+ISDjRGEx4RUIJR3MSTrBoosuqvnKEnMC3riQ928kaSxBv
         tLvPlN6mGzdlkbVRbA/MF6VuVPbWrSy+R7fcT1yPigqhJsFGgNihPCSjj3c/Tuzqv0H1
         Pn5xWua+a4uZUkEnZpnFTrupp4IXudZc2t5Dc1/XjELKUqU8t45XY/MpEVY21CFl/gL8
         udqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPqFHXmciED3JsWtTuLQX1CSi6KoGIIbMskXvd44zlu8lWNZlQGDNVl/kAP1Er1iMRKXBYU6SnYYm1PeJ1lA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHxaMjsx7hq6wsi2F4a3DlocTHx3hi7YVI3vkc/ndPOvskzs6I
	kQ+3IYJ5pWAxyyCJ7hDRSbVF3iBxremd+wYo0OqiBrrP9Z91PCZi5zzN7KmqDNwtCQ==
X-Gm-Gg: ATEYQzwu8iBh3CxpmdxkuWLz0q0Sg+n5pNOZ+HalUQ62KSBgqSBxpUU+j/omMQT5R+e
	f5/BueZAtVAX6sV10CL4Hp0N4otVo9d8cKF5K3pcAmXa3D6zbqlV7tlifzHy/qZ74HLZoyxlNwr
	1ZMkqi15wyOszNTV57Nu1vTR9DBV5wFASdcE1pgODZZ7C/FHRt81Eo5aDj0RahwOpFKTx9dlSgN
	tHWX2xK2MiBMpGi+IrSOv3LnqyKLySWGxTLD8emj1zkzF5QarZIDapf1SMJlgKpmVRNjKzuPNS2
	Xg47Xh0Of0+Ltn7DWhweZtMgM8C/Uok8dFgWnBkj1LST6rcJoCZ4gJlnr3nuAsbpFuNUg+DCdcJ
	FDynl9BKY6uuyGRE+YXFT/xYSnRW0nKqacouzelWEpRplrb34t2ju5nrZIeU1WcU0bo8/ux5+8R
	tQ+pcbXhoHhUXPD/M4Osgw/Hm2VADXF00F129u3D4VXiXCpGXYXgfVDWyNV07SVE7bHtXY6Dl9g
	E6W9E1u
X-Received: by 2002:a05:6a00:950c:b0:829:6f28:1d6 with SMTP id d2e1a72fcca58-829f6e7b408mr1826676b3a.13.1773222610050;
        Wed, 11 Mar 2026 02:50:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/sun4i: Use backend/mixer as dedicated DMA device
Date: Wed, 11 Mar 2026 17:49:28 +0800
Message-ID: <20260311094929.3393338-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095011_776840_558DBFD8 
X-CRM114-Status: GOOD (  22.45  )
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

The sun4i DRM driver deals with DMA constraints in a peculiar way.
Instead of using the actual DMA device in various helpers, it justs
reconfigures the DMA constraints of the virtual display device using
the DMA device's device tree node by calling of_dma_configure().

Turns out of_dma_configure() should only be called from bus code.
Lately this also triggers a big warning through of_iommu_configure()
and ultimately __iommu_probe_device():

    late IOMMU probe at driver bind, something fishy here!

Now that the GEM DMA helpers have proper support for allocating
and mapping buffers with a dedicated DMA device, switch over to
it as the proper solution.

The mixer change was tested on a Pine H64 model B. The backend change
was only compile tested. Though I don't expect any issues, help testing
on an older device would be appreciated.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 27 +++++++++++++++------------
 drivers/gpu/drm/sun4i/sun8i_mixer.c   | 27 +++++++++++++++------------
 2 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 6391bdc94a5c..a57fb5151def 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -798,18 +798,21 @@ static int sun4i_backend_bind(struct device *dev, struct device *master,
 	dev_set_drvdata(dev, backend);
 	spin_lock_init(&backend->frontend_lock);
 
-	if (of_property_present(dev->of_node, "interconnects")) {
-		/*
-		 * This assume we have the same DMA constraints for all our the
-		 * devices in our pipeline (all the backends, but also the
-		 * frontends). This sounds bad, but it has always been the case
-		 * for us, and DRM doesn't do per-device allocation either, so
-		 * we would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	backend->engine.node = dev->of_node;
 	backend->engine.ops = &sun4i_backend_engine_ops;
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 02acc7cbdb97..4071ab38b4ae 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -536,18 +536,21 @@ static int sun8i_mixer_bind(struct device *dev, struct device *master,
 	mixer->engine.ops = &sun8i_engine_ops;
 	mixer->engine.node = dev->of_node;
 
-	if (of_property_present(dev->of_node, "iommus")) {
-		/*
-		 * This assume we have the same DMA constraints for
-		 * all our the mixers in our pipeline. This sounds
-		 * bad, but it has always been the case for us, and
-		 * DRM doesn't do per-device allocation either, so we
-		 * would need to fix DRM first...
-		 */
-		ret = of_dma_configure(drm->dev, dev->of_node, true);
-		if (ret)
-			return ret;
-	}
+	/*
+	 * This assume we have the same DMA constraints for all our the
+	 * devices in our pipeline (all the backends, but also the
+	 * frontends). This sounds bad, but it has always been the case
+	 * for us, and DRM doesn't do per-device allocation either, so
+	 * we would need to fix DRM first...
+	 *
+	 * Always use the first bound backend as the DMA device. While
+	 * our device trees always have all backends enabled, some in
+	 * the wild may actually have the first one disabled. If both
+	 * are enabled, the order in which they are bound is guaranteed
+	 * since the driver adds components in order.
+	 */
+	if (drm_dev_dma_dev(drm) == drm->dev)
+		drm_dev_set_dma_dev(drm, dev);
 
 	/*
 	 * While this function can fail, we shouldn't do anything
-- 
2.53.0.473.g4a7958ca14-goog


