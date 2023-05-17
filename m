Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3118FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v9W6xTSdLFIJuQ/KjRd4yXxi7gzv1/GuKhJzV0MwXqg=; b=BnHWGangAE6EgtAcXleI0pZBga
	N+sffaSCeYNzuJI+P+o1Flzv7NjA7vF2LY875vQMDLCZcaY3G5K+0sHe6MiuAyXmu2DHtlHnzVlQd
	EKCyqk7QMzpeqmigP96k9hwIQ0WKxdIv0/PFHUzsDRzJDO7uxCxuOPPUSGPQ8s6O/j5GVvzxDqWqo
	+miwcKDFQ01gTgixSCnPGWqtqpiAXttSNhZiqTpbWtBT641iYYrJQAeRD6zLNDVzIUY4Bk9AKp6P7
	hyf78PHRtlsg2h7lSgAbKvr+3lzJK4WlnkS/Ysw5E6vQ+I2C1eyUI2SODNe3OAPnGZxxkSE1QEiXK
	lPq1MEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJZs-00AOLk-2w;
	Wed, 17 May 2023 16:00:37 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIWF-00ACA5-08
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 14:52:49 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-3f42d937d2eso5937895e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335164; x=1686927164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9W6xTSdLFIJuQ/KjRd4yXxi7gzv1/GuKhJzV0MwXqg=;
        b=U6DObmhKv1Q/NeXMNtscNlGUJxhj4j2R1C6zujYJ7GYGm6RfKyHRK5rbpxOyQCRr7p
         9wmVRKphBLBj8MafZEBG1rA5CFz7KS70zcAz/4RuL5ItJXDP6C6mnVePcC7sg+PtOyK7
         GX0rkHrtku6mDN69D2KdFk+cTyqH5eGb+lklYFi4mCti31SxZJ1z6zJ7jWhpec4tgylp
         5QET8jdB/pkb2enuppJmj+frSrUbJ15LBNRRj80E2/ynzgDytoBdxYKVmP0OUFMEo9Ab
         gR9cJ/+3ZSqKvTvqeybQmboG6MXAgKdPr24rCyfy5XrkqMCByzu7P8I+GlRexg2KZJZu
         jQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335164; x=1686927164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9W6xTSdLFIJuQ/KjRd4yXxi7gzv1/GuKhJzV0MwXqg=;
        b=NFpVpFw1hUPVh2HUOiROq2DfaZKYq6ZdaUUA6u9AkYWq3/Wx2OWaBVKcCyhS0WrU86
         6TwIazk2l2hmUXC6XxKvByUxJ9++W7vm58VogPg3OzfpPUxDCpID1bOduOkFc9MadlG2
         IOBliB0UfA9mK7F+ND9b9X+bpTdH7Y8mGmg0n1TqTVv84zLWgs13h/UCbaz5BeWNgGws
         gdJMJarQ5CCU3A7LoV4NN8ztHzBejiPMc9qQUgsmXr5k6vDBtl059nW67i1a5iolxKKy
         fj8GN7O4FIvA6G1E2I3Wfx/xmIYi/Pc/ZS5LccEKUj6J/OguyfP0xbo7TFUk0kfE55Dn
         XFSw==
X-Gm-Message-State: AC+VfDyJFHc/VdVxMsZVM9xk2TGybiaD54VkLynYUwiNTMlohAKmcUFn
	1qPoccuVy/iEmE4HAK/+qRAbHA==
X-Google-Smtp-Source: ACHHUZ7IUdIfSJ/RjD1XHlXKNgHreYBrpH+v8F3m/6tEEkXNve0qaiL5jYWNc/RtwyFAENvpakbl+g==
X-Received: by 2002:adf:e0c4:0:b0:306:3b39:9a3d with SMTP id m4-20020adfe0c4000000b003063b399a3dmr920596wri.15.1684335163959;
        Wed, 17 May 2023 07:52:43 -0700 (PDT)
Received: from blaptop.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:52:43 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	jstephan@baylibre.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	khilman@baylibre.com,
	nbelin@baylibre.com,
	bero@baylibre.com,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
Date: Wed, 17 May 2023 16:52:30 +0200
Message-Id: <20230517145237.295461-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_075247_078218_38F93B39 
X-CRM114-Status: GOOD (  12.08  )
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

This adds a DRM driver that implements communication between the CPU and an
APU. The driver target embedded device that usually run inference using some
prebuilt models. The goal is to provide common infrastructure that could be
re-used to support many accelerators. Both kernel, userspace and firmware tries
to use standard and existing to leverage the development and maintenance effort.
The series implements two platform drivers, one for simulation and another one for
the mt8183 (compatible with mt8365).

For the people interested by the firmware or userspace library,
the sources are available here:
https://gitlab.baylibre.com/baylibre/libapu/libapu

The support of APU has to be upstreamed to libdrm.
Until this is done, you could find the source here:
https://gitlab.baylibre.com/baylibre/libapu/libdrm/-/tree/abailon/main

The driver for mt8183 depends on this series (which is currently blocked):
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=620429

Alexandre Bailon (5):
  drm: Add support of AI Processor Unit (APU)
  drm/apu: Add memory allocator
  drm/apu: Add support of requests
  drm/apu: Add support of IOMMU
  dt-bindings: Add bidings for mtk,apu-drm

Julien Stephan (2):
  drm/apu: allow platform driver to implement their own mmap function
  drm/apu: Add support for a simulated APU

 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/apu/Kconfig                   |  22 +
 drivers/gpu/drm/apu/Makefile                  |  10 +
 drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
 drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
 drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
 drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
 drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
 include/uapi/drm/apu_drm.h                    |  81 +++
 11 files changed, 1776 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 drivers/gpu/drm/apu/simu_apu.c
 create mode 100644 include/uapi/drm/apu_drm.h

-- 
2.39.2


