Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1640606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v71yTkdY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=al0wZWTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=; b=v71yTkdYRK165FVhrDGB/+kWyR
	+sE7oePGjQQihfvpZpP1Ml8aR16e84f7XIHrIuZIxrR353+BO9If+f50mB7P/CpLj/qb8djJrv6O3
	+Of15W/dSuXU8jHT96wNDirJWqnpLnwtx83rUwljRloKujLTZ46uyW9qV8tLj3Emv1/vhA2QaUXEB
	zvqpPXCDHIUEJXE4FHH6639PGmd9brClmaaQXhDYQig7Q9MTk/6LYp4ZaXanw/I1TYgtbr5UEeST4
	0vwxRafV+jEIXukXDTIqHkE2hXKKbNDa7THcYQFoQ85AH7+5Bi4WTetNVcJJl6mC9+89SqZD6IuXz
	t/W9ZHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvR-0000000CBZ0-0MTE;
	Thu, 26 Nov 2026 06:25:45 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuz-0000000CBGQ-3GWy
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:20 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1b3acec6677so10090348c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674317; x=1796279117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=al0wZWTRJCjBBm2ZOljQeFEPIawGgGwEIOUTUyxuut7CSup939KfuRITNl7OGBJ5zE
         Dn+hqsRGy4LD7BzKXeJ/bwYMTrSdyYCbwlnVBzc3/XUQenU5YDTlovHqgIKGqF1llYNm
         ilYfgXPqYK/hiRbXF3oKeqE/AsJOZVR0prg9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674317; x=1796279117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNRVcWsUwEqRjHp3GCePDYV+jK31QihzT78TeRmMmIA=;
        b=nGijnndb08tE2E2NewxXxjj/uUXhm1RHsedi3JYeYZuU5+HAqNC6IKD4btviFDznNk
         SVtSZ9qXZgqMbU6dFDULBuulpjdR5bMOH9dwRcrMVy6OdugIHXgGMCn02UBbFeZExHkQ
         nN7/6XC3XrCTdwFGmBn5R6iUExwahzW/ZFDaaP846Oq38PNrfRShGvgScPix5jKHvVaL
         gnrGMCinbqORmx5yYmwtNmpAMPZLspwJVqPK9YcGU9a/LxSfazfA36mu4jtcvix8NS/Z
         PEj9FNb0lUGVxv2XKK6ZGEoBwZwXIAvdRotEMFDvGpKfUPd4uuEj/4KGkIU4FZX301ZR
         bEFQ==
X-Forwarded-Encrypted: i=1; AL+hErEj8n90RJ8qHiPqAkRc7+IZ1UMyW+YsX1u04lcK/uEgcsUkqG45uObSFl/shzjU4W6mTSmgryVWW6Q5Cq+KwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ui96x7+jbLoti4T+mBri/ly87fUyRV2P7OELJXflGd/BjkHr7
	d+C2SVm0RgGN9sKBwW6Se5w4pOtMMjwZm8K8tp8QbdfyLX0iEuIJWs51m7weQMhEIH6P5XBBIt2
	GAcxFkQ==
X-Gm-Gg: AZFdTZdXi8ZTzxnjovxevsZGPZsdZrYaiogrZEHer3rDbIOcG/IEcW3qeHY5C99kkSB
	xivZ1GpDmURcjpwC1yI6SdnYOadRaHDL3NxevPZ7MsY7B84nCWFQowqptcFHc9Fu4ys3NZhnDu2
	4SlQ8zI1d9mV2E0FTMtnxuEYSxvy9pbdnJaJEq4djWo/4DBWw8IrDCtsnPEvlXSFPQJeAufSErZ
	QxTRDBKtt9mrudrCoaXPQ/FEyJK6f6WMnijXn6uJqvPX6EFiSXCugTGgK4OKN8iga1KVkmYDEfx
	xjdK2i88vWUTWWGddNbmp6hWSTTPnlyEOwolPj8KjYzKSJJbnwFsZkGN0Pu0SeRSYH6bt2fkvRZ
	kUDB66vikIdxFAMknkIUF6Qp4DS4SpTIVP3uuRK8/m93wXt6jNuqo6h3mi5oA2/6Zfh85U+rE03
	AfFisqUi5FhhkQWYO4iVoQmz1rxJJG6+EffCnHL7/c9+IhM618ZejL0UntXm/blzJ9rSevL/bBp
	HST4acGCwtrXeOj5NxFqQJA4fU7SYdl/VEbNHVNP6YtdPVkF6RoKt0ki5Q5exarrchDNzMGz9dW
	DcdilqU7tRpc5z8Q9EF8Sj/NxHEyUN12Wy+QzV0vDFZJgJtF7vy9pxaOer2me52UJRCaNvN//4Z
	SqVqYeKLphoal/ktFVLaiiA==
X-Received: by 2002:a05:7022:3a8c:b0:1b5:3490:d715 with SMTP id a92af1059eb24-1b55691e0camr20072859c88.34.1795674317094;
        Wed, 25 Nov 2026 22:25:17 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:16 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:49 +0800
Subject: [PATCH 7/8] accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-7-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222518_548856_B61E7DE2 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

DEFINE_DRM_ACCEL_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default (evaluating to NULL when CONFIG_PROC_FS is disabled). Migrate
the driver to use DEFINE_DRM_ACCEL_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/accel/ivpu/ivpu_drv.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 28cb18dcfa9b..933edc272f05 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -609,13 +609,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
 	return ret;
 }
 
-static const struct file_operations ivpu_fops = {
-	.owner = THIS_MODULE,
-	DRM_ACCEL_FOPS,
-#ifdef CONFIG_PROC_FS
-	.show_fdinfo = drm_show_fdinfo,
-#endif
-};
+DEFINE_DRM_ACCEL_FOPS(ivpu_fops);
 
 static int ivpu_gem_prime_handle_to_fd(struct drm_device *dev, struct drm_file *file_priv,
 				       u32 handle, u32 flags, int *prime_fd)

-- 
2.56.1.839.g22a8290db9-goog


