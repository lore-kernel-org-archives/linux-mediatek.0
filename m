Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA400C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 05:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iNzrUnoT89Wnha0OC6N//7pV9rXMk5Grem520gIyQxs=; b=Pm5xfOcE5CDpuhYlgAeoKsCvgT
	UbOq/EpmjqUh3SFRZLAnOjvE5NLWdvT2cKANbNtFg1uM84a683agoQlF2kW+GDicCy1x7xDO4Gn9M
	ERpbf+naffMFs+9L2CGaGbmqbo/c8mnDlJ2jaqVHl0076iQIoIFC8qIfzG9WQxLgEY1tV9cT+DR4N
	EcbgPGu3B3m8OYCNBt/KAWBoGJKJ1DXBFU2bUG1Q/ZdLF5yH9xEOfyi2nMjN8aOVbVvlEvz4/3gh7
	1K48swLc01IqlnDRIH0vQh/Tnk8mHiWmp8hpneo/7WHkHFHe7loJsi3DHqqZGzorO2kDGaMdDaZDC
	SE3JiqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKAdk-00000003i3T-0EPd;
	Thu, 20 Jun 2024 05:47:20 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKAdg-00000003i2j-3wYZ
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 05:47:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70109d34a16so473991b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 22:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718862435; x=1719467235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iNzrUnoT89Wnha0OC6N//7pV9rXMk5Grem520gIyQxs=;
        b=jTlWrHQqLoU+JpideVq8Yg3epNkHMzeXGVmjEyZTLq6RJdUJnBVdTJJ/YYQhn+QdUH
         g8fXbgTN1oDbgntkas+7ZIi9xDxHD53glBYxrnJQxdhi7Sj01JHCt8MwAXAc8Gd1AsaS
         xEonkjmMLhd29HdLyn3l9/ALVI40gILw/JMt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718862435; x=1719467235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNzrUnoT89Wnha0OC6N//7pV9rXMk5Grem520gIyQxs=;
        b=A9EGjhwJsdZgZ/P7aMhjfNpsjSCjZne4fvxBU+CFb7ZcUJczo38Swzm5sis4jOwvEo
         RJIqvC+3ewCSnAxJfT0ZkU5AU/JKA1BwFIb5+99rfr7tc2A4KAJmUJo4mcMaqkB23T96
         iH8Z1xva0YJlss2SOIOzzm0JZx8E9kUkzlAfuYNhydhqMEEJWFPczAKFuvm1XdPRWjRS
         M+Qd6JRO3FRNFAW3xHw68+1DPB4a4ooLN0Q4juUTpLuYnNT/NUSeg9TOKzNGLtLVOLEv
         jw3Q85DCbL3D4TAIsXnQ91ImaQqI6qcqmEiVC0HWDFsINh6l504zd7J5MA95Km45uA4S
         xz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVPksP4cUFfQgoxXxJZBUp40vs2jZ7wuA0uUMksTsBinNiDKvLXTEZt3uq+v8fs7rT5IyFJwOq6s1AaydaVdaeT/WbAyOIP7WS5HZDn4XbNWLly
X-Gm-Message-State: AOJu0YxssJcpoBpivYnj2gSbaZ50cjTjwlOxNDxBanp4kLsLXHAvDFu4
	EDpuJVLpbJnWY/z3MMf0+G9YCIpcYRlA9Ww3LZaIXa0lCQz42r41UgG4zXzLD/cEbHjyAgJ31n9
	L43De
X-Google-Smtp-Source: AGHT+IE2FF/BSNYYoA5CyxWSZxhSRVn0heb6yaE7ZZyCHXnLwSE/RVFQurgMXOXNAI+BaOP6s+Xb6w==
X-Received: by 2002:a05:6a20:4aa8:b0:1b2:b104:594 with SMTP id adf61e73a8af0-1bcbb40df3fmr3758328637.21.1718862435071;
        Wed, 19 Jun 2024 22:47:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee805asm127339535ad.128.2024.06.19.22.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 22:47:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y
Date: Thu, 20 Jun 2024 13:47:07 +0800
Message-ID: <20240620054708.2230665-1-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_224717_101029_C7F3BD53 
X-CRM114-Status: UNSURE (   9.31  )
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

With the recent switch from fbdev-generic to fbdev-dma, the driver now
requires the DRM GEM DMA helpers. This dependency is missing, and will
cause a link failure if fbdev emulation is enabled.

Add the missing dependency.

Fixes: 0992284b4fe4 ("drm/mediatek: Use fbdev-dma")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The commit this patch fixes is in drm-misc-next. Ideally this patch
should be applied on top of it directly.

CK, could you give your ack for it?

 drivers/gpu/drm/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 96cbe020f493..d6449ebae838 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -7,6 +7,7 @@ config DRM_MEDIATEK
 	depends on HAVE_ARM_SMCCC
 	depends on OF
 	depends on MTK_MMSYS
+	select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
-- 
2.45.2.741.gdbec12cfda-goog


