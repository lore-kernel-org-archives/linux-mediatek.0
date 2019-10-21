Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89970CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0C72086D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:47:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="clDKd4Zu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0C72086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwcn6dthG6dPOFt4seLHKaQZiaKwg9wwHdrtQ+fOCVA=; b=clDKd4Zu4ZMn2B
	YLtobwzqehc4cRwabeK/hpFs/Ud8H+TTaC+sN/AHqgMu146Zw93f29BQOLzBNpY0xtrioT4S3ZGVA
	wyzZFKyZlM3+YH8T3NB4ona2/mzE1mASE1tmVdGbXo2TTNAEVAVULOMe9uqodrNgM9E1yUJNMoVUD
	bisV1ziHW4Qwm01R34BZM01uY0guk75ldv72Xd/B/n0R2kC7ovwYMx2IkxjufPOXn+dz4nrczUrda
	zMuzGSFaqNMVC5MBFtwc5Aombh+o+Uq1fI6KiBgvzVcqszY77oAWDzR3AcM32y8qogNnWlAk2rb3X
	aP2ZjYdsn1HB6ivtnqog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMfWM-0001bA-Qv; Mon, 21 Oct 2019 21:47:22 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMfV2-0000FY-H5; Mon, 21 Oct 2019 21:46:02 +0000
Received: by mail-oi1-f194.google.com with SMTP id w6so12381072oie.11;
 Mon, 21 Oct 2019 14:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dtmBYecTmxMYIL93VEKcTUybHl02f54X+UyJdNEnFs0=;
 b=grVLfjA6uIqqDXQRxq/oROkkGRhOWylVsccMBvzhXpAo7FvKOnwYzHswKk9yuyBtM3
 c6VCWBECr6D6nUsUr/RXLgVrAtq9F5HAqbBuCaOxOkNlieHv6g+4u7dZXAFq0citri0b
 YIoEcqfewbQLGtwuJn7aUu27h1tdW8nElAIUQtzVIaG0LGn3Smg68EmHHkdP8KL0a/Tb
 8fKalyvYLm99GFhaoYuStQWvfwGdYEwAK/HQcZrc8091Iqf/pV8yGlfSpKFvpq0ukX8v
 jAPX8QjBZ0MI8vVikll1KhNfnnb8fjiSkDf9T08iV2sGKqs1rwV6LHGZuxWJyRapSc24
 ylFQ==
X-Gm-Message-State: APjAAAWAFPOlZkTU2wn7zFKMCLIVyRQdSBTiJIJxHhqwPMhVziYuCGtq
 g2kvBSV4vvwaAmD5SB4m5Q==
X-Google-Smtp-Source: APXvYqyz1m7uoM6wvUfRplSP1iQymDszqO/9xcsWMNqwVBdfqFtz0UeGdkdMsN8oAPMI7ImLHrZS7A==
X-Received: by 2002:aca:bd08:: with SMTP id n8mr193003oif.107.1571694359449;
 Mon, 21 Oct 2019 14:45:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/cma-helper: Use the dma_*_attr API variant
Date: Mon, 21 Oct 2019 16:45:47 -0500
Message-Id: <20191021214550.1461-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_144600_608706_CEA57D4C 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation to allow DRM CMA users to adjust the DMA_ATTR_* flags,
convert the CMA helper code to use the dma_*_attr APIs instead of the
dma_*_wc variants.

Only the DMA_ATTR_WRITE_COMBINE and DMA_ATTR_NO_WARN attributes are set
in this commit, so there's no functional change.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 20 ++++++++++++--------
 include/drm/drm_gem_cma_helper.h     |  1 +
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 12e98fb28229..4cebfe01e6ea 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -70,6 +70,7 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
 		goto error;
 	}

+	cma_obj->dma_attrs |= DMA_ATTR_NO_WARN | DMA_ATTR_WRITE_COMBINE;
 	return cma_obj;

 error:
@@ -102,8 +103,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
 	if (IS_ERR(cma_obj))
 		return cma_obj;

-	cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
-				      GFP_KERNEL | __GFP_NOWARN);
+	cma_obj->vaddr = dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
+					 GFP_KERNEL | __GFP_NOWARN,
+					 cma_obj->dma_attrs);
 	if (!cma_obj->vaddr) {
 		dev_dbg(drm->dev, "failed to allocate buffer with size %zu\n",
 			size);
@@ -184,8 +186,9 @@ void drm_gem_cma_free_object(struct drm_gem_object *gem_obj)
 			dma_buf_vunmap(gem_obj->import_attach->dmabuf, cma_obj->vaddr);
 		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
 	} else if (cma_obj->vaddr) {
-		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
-			    cma_obj->vaddr, cma_obj->paddr);
+		dma_free_attrs(gem_obj->dev->dev, cma_obj->base.size,
+			       cma_obj->vaddr, cma_obj->paddr,
+			       cma_obj->dma_attrs);
 	}

 	drm_gem_object_release(gem_obj);
@@ -279,8 +282,9 @@ static int drm_gem_cma_mmap_obj(struct drm_gem_cma_object *cma_obj,
 	vma->vm_flags &= ~VM_PFNMAP;
 	vma->vm_pgoff = 0;

-	ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
-			  cma_obj->paddr, vma->vm_end - vma->vm_start);
+	ret = dma_mmap_attrs(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
+			     cma_obj->paddr, vma->vm_end - vma->vm_start,
+			     cma_obj->dma_attrs);
 	if (ret)
 		drm_gem_vm_close(vma);

@@ -434,8 +438,8 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);

-	ret = dma_get_sgtable(obj->dev->dev, sgt, cma_obj->vaddr,
-			      cma_obj->paddr, obj->size);
+	ret = dma_get_sgtable_attrs(obj->dev->dev, sgt, cma_obj->vaddr,
+			      cma_obj->paddr, obj->size, cma_obj->dma_attrs);
 	if (ret < 0)
 		goto out;

diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 947ac95eb24a..d042213c3595 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -24,6 +24,7 @@ struct drm_gem_cma_object {

 	/* For objects with DMA memory allocated by GEM CMA */
 	void *vaddr;
+	unsigned long dma_attrs;
 };

 #define to_drm_gem_cma_obj(gem_obj) \
--
2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
