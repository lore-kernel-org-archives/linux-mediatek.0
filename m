Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9111606A32E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3kBhA+pf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=A4wVIF3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=; b=3kBhA+pf15ugLdUKyl7fV4e9jM
	evex0bbZkrMZxXXi1B/8SG8eawzoDl4xVIvYfmuIqfuUtcB0zigTqveg/9ls0MV72HfssoHOFw1um
	flf2dj/nDN6rRGLqx9ags3f3KX3oFRxep6duqzukxRkJOAEFMYWP4Co3H9VcDcwah38OSDgNVnhm9
	B0ZRX1X8Y1/Yj6mcXYUpDhp7nctQcK3/4L4d5+msJ/B12O84HnMhuJ85rApZ5OyoRZMu4QgHncK0w
	fMK5kNaglTElK9c0WhHpNPqSwU7P6MpvXR0DZhnvyc7oF03PxH6oRdgLWCDdScE/4u9sg1F+7fJAV
	3Lr9X4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSu7-0000000CAp7-2jKN;
	Thu, 26 Nov 2026 06:24:23 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSu5-0000000CAny-28d9
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:23 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so4854661c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674260; x=1796279060; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=A4wVIF3OAsVDg+0pSpDz7028fIbBoKPy/hvqhh0Fvn8N60glc4pnux/iFWKo4qrtRu
         OCwhD7eqPBg4uhKieG8OC81cULIXsJdZM7SI8dEzS3v4bRAdNtx+PeqiAcLbksvvp2TX
         9njSr78HllpbgVzT/7pxS1nCXfjWyUnbz60pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674260; x=1796279060;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1smrtCoKPSjZha/dsx0ELlDf7J6mje+6G+R+oE23Xnk=;
        b=IEH3OIodI1T7CnHXzSPGFv8e7uerg9zlyLV8ipdXdEwRN5GX/R6Oaq85rCdUic1nsv
         P/O3hZmM0U89+xSJpDON3Tz5Satp2NBQQ4bkmOfrIn3Rfjatmg0Wpl/sjUm+P/WoGsM6
         GN19E2idwLFnEvpFUxj6T3oxEgMzYama7WVGrhx9e0tnMTJ9knTWYzLoBSJQOqjR/pSr
         FZqB++JHe5bjKGGBovH98S6GOrKg8Fwf+QLaXABDGX4evIPTvAgMTAuzTeOM63WPdgHB
         Ol1WWCWr92QALadylKYdv6Pldn/eHhe06W/TuSxFhA89Z3Aeln42N8Wlu2/nH7r6o/aE
         t2OQ==
X-Forwarded-Encrypted: i=1; AL+hErEKtVMzak0GWQ0qk4lrxgMj/3IzvIglv5iotnWEZIs5QAlIgI9ctrPAVcyOID9P5skdNfMn0GsFGcaoooZfmw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+uOXKd63x7SWv7I9n+iNHMTtCPXrSkSIlq4HEy4DcNXEdQO2Up
	FwtbJJ0SQ0MxFsCteX+9r3C1PHrp1cpK9Tb8ErB9V91jAgcG9k4Yvi57wp3lEaDCDP+MiQ1B/Zf
	dRwg+Ew==
X-Gm-Gg: AZFdTZfptu1g2qZLqt0nVVDa46yYOzoetDMeU/CqJPpm1+vo8mEeKFllRhg3KrOkpaf
	UPOQnHZxeEN867xYrzWngq+W++wND5gWK8dyqpZEOwnFUqxdyJaZGopFWJmRhFqE5JkOFNwdp6U
	c2vCEUoydRejI9VQqcVcVnoeBOKZ3Wn/a7+n/nsHW07UlU5pGkrLo75ADnzZJQB+mlhKRM8u12O
	ExaBlikTTBWkaNaPvL7Y0yMFUoN+UUckT/A7BPyF5w/wmn2ejLfZH2qQ1BKkMzDC3PFkihIR0+G
	iqC9GRv3+QFch9gjkQmwYBiCWFY1rBPWAgc2iO71aa/jChIqU335YrHShiMCnQS+zZPzUVv0jI6
	2CmDMzkejh7AGa2QNFtqRQYD/bYtLbgRtBo1nSnFkuX//rn+nXnMLmGKp/9pJu7K/7yuZKezGbe
	G8LnUXoaJTXtnR15q8rYhfjUaB2d0kkhzbtMcU42vyC/sDwsxvkFueCxyCNbB+3tc1iHg2nGq4l
	u7jiXyQhq0HVirfNn0kVA8tqnuLI2q0Pf0nu6lg/dh50ex+IeGBqmxUnju4OJNNGPu/HdN5JcVs
	KmUvOqUvAtXq4BO0CGewz0qIDUXkvaneYeCMID60qtxk9+b83QkzaOACUAc1W14BtrCVNTTbq9l
	/wkRH+a69XXHtrtrpBNfaUg==
X-Received: by 2002:a05:7022:b902:b0:1a5:9abb:fdd7 with SMTP id a92af1059eb24-1b556877a2bmr18501590c88.9.1795674259793;
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Subject: [PATCH 0/8] drm: Attach drm_show_fdinfo() in default fops helpers
Date: Thu, 26 Nov 2026 14:23:42 +0800
Message-Id: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/QB2sC/yXMwQqDMAyA4VeRnBdYgzjxVWSH2SYzA1tptimI7
 27djt/h/zcwzsoGXbVB5q+apljgLhX48RGfjBqKga7UOEc1hjyhpNnQxrSgBI2SsGmlvnlyLUm
 Aks6ZRdfftr//bZ/hxf59vmDfDwYnpUF4AAAA
X-Change-ID: 20261124-drm-fops-show-fdinfo-68f47c2182fd
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222421_560139_BF45518E 
X-CRM114-Status: UNSURE (   7.75  )
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

DRM core's default DEFINE_DRM_*_FOPS() helpers currently don't expose
fdinfo, so any DRM driver that wants standard GEM memory stats or client
names must declare custom fops to attach drm_show_fdinfo().

This series consolidates that into the default fops helpers and migrates
existing drivers for consistency and simplicity.

- Patch 1: Guard drm_show_fdinfo() for !CONFIG_PROC_FS builds.
- Patch 2: Wire drm_show_fdinfo() into the default GEM, GEM-DMA, and
           accel fops helpers.
- Patch 3-7: Convert existing drivers to the default helpers.
- Patch 8: Enable GEM memory usage fdinfo in drm/mediatek.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
Fei Shao (8):
      drm/file: Define drm_show_fdinfo as NULL when CONFIG_PROC_FS is disabled
      drm: Wire drm_show_fdinfo() into default fops helpers
      drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
      drm/msm: Use DEFINE_DRM_GEM_FOPS()
      drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
      drm/v3d: Use DEFINE_DRM_GEM_FOPS()
      accel/ivpu: Use DEFINE_DRM_ACCEL_FOPS()
      drm/mediatek: Expose GEM memory usage stats via fdinfo

 drivers/accel/ivpu/ivpu_drv.c           | 8 +-------
 drivers/gpu/drm/drm_file.c              | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_drv.c   | 6 +-----
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 ++
 drivers/gpu/drm/msm/msm_drv.c           | 6 +-----
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 drivers/gpu/drm/v3d/v3d_drv.c           | 6 +-----
 include/drm/drm_accel.h                 | 1 +
 include/drm/drm_file.h                  | 4 ++++
 include/drm/drm_gem.h                   | 2 ++
 include/drm/drm_gem_dma_helper.h        | 1 +
 11 files changed, 17 insertions(+), 27 deletions(-)
---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261124-drm-fops-show-fdinfo-68f47c2182fd


