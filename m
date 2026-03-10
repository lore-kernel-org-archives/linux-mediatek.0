Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A20FCC9AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 03:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=; b=nffV7y9pNNXN2q6bvhxNWq80lm
	wd0x0Grq2eLSgp9y6nEZU9doKhB88KQYSzwsxjKs3feoY1QYcI7QMslkT0Hiw7iqUX3KY2JGfShim
	Yv/TIDScYGJgJqzWGXJ0/88NYptgioFSm2rSA/hm5L3H/wZIhO6eLbaiZW+NCGN4OIisuEn3xSTZF
	b/NomlGKGlCXFEOnF44dtteEMBh92pBND8DEcQHh1v3NLmrxjbxp/fJbdpI7cbp9nltHsoNVr3fF5
	jsEEMs5pot/Oe8I3cFyPw6tBQovwrxd5/1wD9PI1mAHBCYm2BDFB4wM35MI+cR8ggL+laf1WeAGAi
	ox+W6SQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznjA-00000008eCu-03Xg;
	Tue, 10 Mar 2026 03:25:48 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vznj7-00000008eAr-0ldy
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 03:25:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ab46931cf1so84671565ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773113144; x=1773717944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=VebyXercAqYVTAf4H1PhX60HbGE8UG2DnJDyTBxRAz7efS4Eo2SVVZx7QJSPB6TWcu
         Ek3v8qZoEgvj5ln/r/EiV2WpMD8Sx3CnOyWCyXhn/dgx5lpYzvmn0tqTHMXzDc3sWuZS
         wPNovrcI77e/0FNo231os+9NHTRfRKaxwzOfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773113144; x=1773717944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHxroCmvUbDZdSuabhWIfcDNQo8xx33ypV1WgOxP5VE=;
        b=Akle/o1kNdRIqV7njqechgyZ1befTQdbC9fbVOoL1QZazeZOylcCp3fRrx0HaRD0aE
         2i2Bc8sMdHGSRhcbEtFBeY0OCYTPs201OhXo80QVsHmKYwRfRXUFVfsFMcFJFlvD+oqu
         VlRGSgaDZIO7ZcTtv5cb3Rj6HMu2clWZu3ANyLCMsgwfRip9EzEOkI1CI7imY8RNzZDq
         9pG4XGSF2bpGB3iDdIntLkXx/DpkjXXi8DEMz+IeO3kJdCUHCy16j/Aoh9AnkVBWOesT
         1EzAeCPvSy6mAtMhkVv9AXpLwKj3KrYenzf2PvlR81Lu7EP6AKgJ9QQaGNoXYKOyPlvW
         gK+w==
X-Forwarded-Encrypted: i=1; AJvYcCXhndfQO6a3r4G4O694EtoMsqcmnfhxrvXhUCjIZbG91NxOtIBA4apqQ9OHnvejmA94pvJ0ZGjgWyJ/m0vWmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuGlQZExrbobG5ZLhcmNzfIiPvfS8fJh7wNYDPcnAwdsQqXPgq
	1pvjk8dUPZPXIfikcsTlcBHSil+PLDurSFIXqr33fBu8XKGNFyh68H+g2GLXeNpUQQ==
X-Gm-Gg: ATEYQzyhcRjeCinXJw3YSSS/TFL3ol4bThWuKmrQb4N4UCvdY8JCLBRUqXuQTLiTCOT
	k41NOWP29DDb2RjRuKoz9LklPu2TLHYNtfSXzbLre53hUGysmN421Yk5vvHjWIvt7Fkd6j2qwwK
	wz+kwGsbgTjidUvJeTkh9tn71FeHDI6wIKuvx641qkw4MxYTOBjtxMQCpt/PREVCLg2fkWpZ9CN
	y5t51yvDoGeCxhlp/v/hfInvkDAgQ0x6rrIEG3zDUoKJZWCVmaZk7a/5KPlIFmgks6lIhw556E5
	V8vHB4+2bSxXu1FI5ETLfYMgRn+zO0SMwTt3Ht13pwigQiEiTdXMtMy4wm2D9LY4yIosmLphIMu
	UhGPMPu0w/pd9t1QSQ4TVGdvu1QRqixOjPyIMqWXZw6qU8xVlSY/wiVC1PW24gRblIjXcnTdDDH
	+1T29GpoY8NuCMPn9PZwei7JI2059dInrknxScyl/o5o0k1wpFsYk0iYYGLsBMy2VJ+TELHM3gU
	Un08vUv
X-Received: by 2002:a17:903:2349:b0:2a0:d454:5372 with SMTP id d9443c01a7336-2aea1f2f79emr17542375ad.22.1773113144386;
        Mon, 09 Mar 2026 20:25:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm126695095ad.5.2026.03.09.20.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 20:25:43 -0700 (PDT)
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
Subject: [PATCH RESEND 1/4] drm/prime: Limit scatter list size with dedicated DMA device
Date: Tue, 10 Mar 2026 11:25:06 +0800
Message-ID: <20260310032511.2545500-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310032511.2545500-1-wenst@chromium.org>
References: <20260310032511.2545500-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_202545_223603_75B11EC7 
X-CRM114-Status: GOOD (  14.08  )
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

If a dedicated DMA device is specified for the DRM device, then the
scatter list size limit should pertain to the DMA device.

Use the dedicated DMA device, if given, to limit the scatter list size.
This only applies to drivers that have called drm_dev_set_dma_dev() and
are using drm_prime_pages_to_sg() either directly or through the SHMEM
helpers. At the time of this writing, the former case only includes the
Rockchip DRM driver, while the latter case includes the gud, udl, and
the tiny appletbdrm and gm12u320 drivers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 51fdb06d3e9f..9b44c78cd77f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -859,7 +859,7 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	if (dev)
-		max_segment = dma_max_mapping_size(dev->dev);
+		max_segment = dma_max_mapping_size(drm_dev_dma_dev(dev));
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
-- 
2.53.0.473.g4a7958ca14-goog


