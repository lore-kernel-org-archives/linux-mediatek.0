Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A09CC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=; b=t5/VSiriNsRMSdA0O8k7e1URq7
	z8VfgAnuwbKzF372Y6YaQOAtEpP6HNR9mmD29SMCy4aEV1zMeNO7Wj5EnDbMEoN2J0kTSiKQAY1TX
	CZUpdPgWVMtJubn9a4JTO87mUZzgNAP1EH7LjZ/nocSTx6Ma3Byv+BBHbOXOulfxnA5KA4btpmmkw
	WQmaoakXbTKGiLKxJq3nHmt2WREuW71mAUkqlVp5iI+5ABP+GCxgFb9xlvk1jHMxuLBqCdZ2AB61B
	JB5VUm3DgD9iN+C2WPsqEEKBjNDULiOXnU5ZGifTu/uMAawPmwbYKK4eXt5cs2ymuaeTdrlgGdhNY
	3M2sv/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJG7-00AKGT-2m;
	Wed, 17 May 2023 15:40:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzJG6-00AKGF-2w
	for linux-mediatek@bombadil.infradead.org;
	Wed, 17 May 2023 15:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=; b=EHuMy4ZnEKrGkT5kc8urJnCV+F
	9p7b6Rs+UtI/m2S2uEMelPvok4g05zHu752dx8lAQX8Ejcd092SXLGagQPUuFggT3t8wxxRytOQXu
	wsNYtTK939S5fxyOo7bIrGLA+s2MkDwUJ1Kfg88GiHE39UJ8+TtDabbtnkfkv/98d3YtfOS8YM+C3
	vH8y0QTDkvx9WLV6q1YPWZ/CfBfe3qbaBLciYAavJJw1SqV55jCwdYGsEX67RiRvECDJh/vfNt/CB
	i0W6XlEMtc/vJjSglftS7qSn9+L08ZERfmXCaeTDEpEFasOCw/oLzB8b8aKAnLRKGGH3AId1oVHxl
	CkSkfs1g==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzIWI-00DFic-1G
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 14:52:55 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-307c040797bso595411f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335169; x=1686927169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=;
        b=iG7od/evTKtot/nJm1gK/1OL6Lc2v1Bmw9HJrvZNepXY3d+ijpP+DWiwPAyVpH4pE1
         whGLUhjKSF4oMqvwtGaC3U7qu0JGLJf2iHcaZHG/KUWeDATqb+7kMGgK4oAbo+BiDQwI
         jpxA3KkT4mge9b6qQfuW6PavzHMyngFUeL5rUs8wtlXokzk0Gl/ytdd5BZqb0/1Z5e/Y
         cIV4AMhkBECqg1zNTCLE/3Y42tLbWIq2Tz99acBQU/rwUfG6htIKFOBvud87i13WKEpC
         cNz6RrsgVyoegDNgLU4Dj6l4jtXBZeukG92pSorCCUG0L5/O72DQRlJqUtdW4XruFu5P
         MPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684335169; x=1686927169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChL28icQVyizqOaIAH3gAMzq5UZ5InLkC1WcC+s6530=;
        b=XIy6XPv6ukTCEN6Y0pUj/0LuJOnAaGwgYwENa4NJcDQ5R3xPknLzfmyL1PswuMlqI2
         iZ8mzwzy/uMiDFiOdPmM77SlPu70AwfKq8DBU6WWeaZaPxKXTNgVyD8lTa8wMcYdp47e
         FrAcHCjUGlJRSDg5YqJTMJYeowSrUp0DsT6+23glmeAtzRlvuldK3gFnfpkWMWhGuNc/
         JNKLkeMmDVcgaEHzSdlT3NrjdG9ueS0Xn/bAStH8MvAwmW4OmurgMqfy8C6ngFXKzGza
         J5K1zEyy4952uHPBIlcUUjK9ToeiDu4PY6+Y3ZQcQF8e14VyPYGp4AxdJhatxlqRUXDy
         XrfA==
X-Gm-Message-State: AC+VfDwgTuCmq7Ua014+DMSrmKTcErd42CXYTZS+IF29mBPvsb+94+Lg
	vnem1n/xeRZdNu5oQgmVxR2MQQ==
X-Google-Smtp-Source: ACHHUZ5uCAqHjUKdV/6t3weODX6sjiburDexUUIvFFfFHhqo6Yq6iD6TS/qXA3nyRGAEZJG5rutnCQ==
X-Received: by 2002:a5d:4cc9:0:b0:2fb:7099:6070 with SMTP id c9-20020a5d4cc9000000b002fb70996070mr839383wrt.47.1684335169252;
        Wed, 17 May 2023 07:52:49 -0700 (PDT)
Received: from blaptop.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 07:52:48 -0700 (PDT)
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
	bero@baylibre.com
Subject: [PATCH 5/7] drm/apu: allow platform driver to implement their own mmap function
Date: Wed, 17 May 2023 16:52:35 +0200
Message-Id: <20230517145237.295461-6-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517145237.295461-1-abailon@baylibre.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_155250_496303_931F4FC9 
X-CRM114-Status: GOOD (  13.45  )
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

From: Julien Stephan <jstephan@baylibre.com>

By default we will call drm_gem_mmap() unless the apu driver has
declared it's own mmap handler.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
Reviewed-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/gpu/drm/apu/apu_drv.c      | 38 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/apu/apu_internal.h |  2 ++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/apu/apu_drv.c b/drivers/gpu/drm/apu/apu_drv.c
index a0dce785a02a..703d4515f075 100644
--- a/drivers/gpu/drm/apu/apu_drv.c
+++ b/drivers/gpu/drm/apu/apu_drv.c
@@ -29,7 +29,20 @@ static const struct drm_ioctl_desc ioctls[] = {
 			  DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_DMA_FOPS(apu_drm_ops);
+static int apu_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
+
+static const struct file_operations apu_drm_ops = {
+	.owner          = THIS_MODULE,
+	.open           = drm_open,
+	.release        = drm_release,
+	.unlocked_ioctl = drm_ioctl,
+	.compat_ioctl   = drm_compat_ioctl,
+	.poll           = drm_poll,
+	.read           = drm_read,
+	.llseek         = noop_llseek,
+	.mmap           = apu_drm_gem_mmap,
+	DRM_GEM_DMA_UNMAPPED_AREA_FOPS
+};
 
 static struct drm_driver apu_drm_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -45,6 +58,29 @@ static struct drm_driver apu_drm_driver = {
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(drm_gem_dma_dumb_create),
 };
 
+/**
+ * apu_drm_gem_mmap()
+ *
+ * @filp: DRM file pointer
+ * @vma: VMA for the area to be mapped
+ *
+ * by default will call drm_gem_mmap() unless the apu driver has declared it's
+ * own mmap handler
+ *
+ */
+static int apu_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct drm_file *priv = filp->private_data;
+	struct drm_device *dev = priv->minor->dev;
+	struct apu_drm *apu = dev->dev_private;
+
+	if (apu->mmap)
+		return apu->mmap(filp, vma);
+	else
+		return drm_gem_mmap(filp, vma);
+}
+
+
 /**
  * apu_dev_alloc() - Allocate a new APU device
  *
diff --git a/drivers/gpu/drm/apu/apu_internal.h b/drivers/gpu/drm/apu/apu_internal.h
index ea4183f3fb15..46e0b2be7821 100644
--- a/drivers/gpu/drm/apu/apu_internal.h
+++ b/drivers/gpu/drm/apu/apu_internal.h
@@ -45,6 +45,8 @@ struct apu_drm {
 	struct iova_domain iovad;
 	int iova_limit_pfn;
 
+	int (*mmap)(struct file *filp, struct vm_area_struct *vma);
+
 	struct list_head cores;
 	struct list_head node;
 
-- 
2.39.2


