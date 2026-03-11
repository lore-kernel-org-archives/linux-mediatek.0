Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C401049525
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=; b=VorYhjd6ijyZfYOaaJZxQ8QZtw
	77CfssM7tntYGWVIcRnZZU2D+8Iss5iwexWvLj9xtoQrmdnFeTHAv6ZNZozXPjm2Tttf3bLzUy6Fh
	ggmGV0l06wrERp0YfZHp5D2mEN/lpOKr8YZPb/joicZEEUNQPcTNS5uIPIqSQAaG6SMx4o4e20502
	XuLDHUjkU2F0/W6Pg+EcT5Mcf2X8YHg+ziQeuSmUSgk12aNJ/wvFuTOeJqItMlnwVA2ulTg1reC5M
	j6bkPodnDnF1XVANif5ohu+fBpRdZhqicjL1ei2xLu/QqIhzrsor02sTYhAsttkQKgKD2zQCQCokO
	qzd4Y1wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCf-0000000BJnz-10RO;
	Wed, 11 Mar 2026 09:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCd-0000000BJmm-2ZP6
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=; b=HmqLd4VWqOJ8XZnMKh5AS4xpbP
	0wUoBShj7s3kEPF0l3NlRbmEXSXVVYH+kBid/TP6uIFBPgj2cpgCwLSwq/18RFV8t8SNa3sHmXM97
	JOQXL0UumCZqtTnVqMW3o04eLCEluG0ws5SHy349aXI+9mvC1mcea6rhMkvV9JLrync3twZQMdwSD
	33zB9pNrpFs7h44qwCxr/IQ8bOSeQBqjg2+jeRm1uAlUHAN6PUjUHCimVzrGesXet4Mul0ot5AsOp
	jgfm4f5azOmYPwVrw8rDr3FgpAst4qN5+RjPAckPIiimSSrNzHxmFcVleld6xPjFJucy6IziTGnwv
	NubzDK1A==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCa-0000000GbhM-2vtW
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:06 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-829759ca646so3868782b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222603; x=1773827403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=Rztxc30wRr+9QwGxPWOZWRJk5V3CptaNlorWMJ7JJXjmW0dgLjSU+Mc3uuJOe36klf
         zadHxMGYwnjaD7o5aPwGgbyaLE/LVo64UHRgs0Cmfe7K7uEuL5+oz0UNJfHxEiRLI6uu
         a3KV8ugUX5xsgKHz7XHcJ4dxjGtfe1upIr0Fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222603; x=1773827403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jtkXXLPioyWW3Nha1qMzs0mPGG4eok73ub81lNtbqSo=;
        b=Q+9ngVzcLom0pMBem8xilUYN2QPJuChu5QrFYC1qOjwHZ+jg6Va2e6N/b41GxIM+qs
         YTx7gjIQ+6CufphzMKIohcPWTVHZjaKqpIlT+C7K2ygwy4Vzjb5zd6SGlDutzkVNLLT2
         FKggKGW2znhHWgiO5/bhw7twkJ9kcdThoo9DoY0oa0p6OZ8bFJS4p0Vft5AbJhn/g8G4
         dZHCPDRhYF9tr2+i4l0ce1hnk7/Xaa6+WjNHcbRryiRqDzEffTl7HF8NA8ScU6B23Lm4
         SrFjdWsXrfIvzvfo11J59mzp9RK5KUmE9SJX+GZ1ZMDc9fMWVRqjyei+dM+OFdwast3o
         FEaw==
X-Forwarded-Encrypted: i=1; AJvYcCWm/uDsDFZfq63APq7OdgQie2Qi+teEQZIGEhqeCZCX4ehKV862JlJEe3DmY1z3IrCZD3a3PN4Rl1O+pVmB5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDEF6hNkJa+3ov6lhK5PcgSvwQ0gX/5YbORuTN9KTNT3MhuZyi
	1ZqJtYiru3ItGm2PB2asKd1sCDlxHu+3ZWyHDF0oSed4GtW0XvIMRQoP4TOuk296rg==
X-Gm-Gg: ATEYQzwPx1wEhRHApJEugVozKw6hpZ7mCdBAID8r6GEjmvE6/wOCT7Y3p0NiDmm0T1a
	ELyiFTtwcQIvhfSt4SAs2X+GhiemdwMiyFbisEdt0D8I4d410y6cwkfUSeVwKb104QoGMlKe+zB
	5r9nrKUcf6KASdx6hkoUuw06avl4VmpqRpJ+/9skvs9/OZSwlBMlgR1S19uOiQqZKkjRqKh6mqz
	AmoVkTxJWy5Y1URsZfdAokbAQaBrvkcjcUW5XuusHrUoX5aaS7H2u9PUgR8o87DwQD77G2TidCZ
	VSQbBiCnf7fNntQjeaJXY6lNW87G6rWTIpZWghLcAWEf6j4PKr7sKmsP3rdpLSjc1TIcal4JDVP
	h9d/sv5PHOFHCzFP0h4BWUKVzC3KOSsWZ4nyHo3FobeKfce41sUmsyKQa2AEes28qteH7hJzhye
	81cdWlVPCoBBMre+7ZF3ZykMCWTCzxova75Dg/pxJYsgguNHwVNY0X0nLwgnLrYo3JvYVxP+ZAU
	/1t/We0
X-Received: by 2002:a05:6a00:3006:b0:81f:9b0a:812a with SMTP id d2e1a72fcca58-829f70af1ebmr1872729b3a.14.1773222602308;
        Wed, 11 Mar 2026 02:50:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:00 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm/gem-dma: Support dedicated DMA device for allocation and mapping
Date: Wed, 11 Mar 2026 17:49:26 +0800
Message-ID: <20260311094929.3393338-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095004_838534_2141BDA3 
X-CRM114-Status: GOOD (  17.36  )
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

Support for a dedicated DMA device for prime imports was added in commit
143ec8d3f939 ("drm/prime: Support dedicated DMA device for dma-buf imports").
This allowed the DRM driver to provide a dedicated DMA device when its
own underlying device was not capable of DMA, for example when it is a
USB device (the original target) or a virtual device. The latter case is
common on embedded SoCs, on which the display pipeline is composed of
various fixed function blocks, and the DRM device is simply a made-up
device, an address space managing the routing between the blocks, or
whichever block the implementor thought made sense at the time. The
point is that the chosen device is often not the actual device doing
the DMA. Various drivers have used workarounds or reimplemented the
GEM DMA helpers to get the DMA addresses and IOMMUs to work correctly.

Add support for the dedicated DMA device to the GEM DMA helpers.

No existing driver currently uses the GEM DMA helpers and calls
drm_dev_set_dma_dev() to set a dedicated DMA device, so no existing
users should be affected.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..70f83e464476 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -146,12 +146,13 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 		return dma_obj;
 
 	if (dma_obj->map_noncoherent) {
-		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
+						       size,
 						       &dma_obj->dma_addr,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
+		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
 					      &dma_obj->dma_addr,
 					      GFP_KERNEL | __GFP_NOWARN);
 	}
@@ -236,12 +237,14 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
-			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
+			dma_free_noncoherent(drm_dev_dma_dev(gem_obj->dev),
+					     dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
-				    dma_obj->vaddr, dma_obj->dma_addr);
+			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
+				    dma_obj->base.size, dma_obj->vaddr,
+				    dma_obj->dma_addr);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -432,7 +435,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
+	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
 			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
@@ -539,12 +542,12 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 	if (dma_obj->map_noncoherent) {
 		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
-		ret = dma_mmap_pages(dma_obj->base.dev->dev,
+		ret = dma_mmap_pages(drm_dev_dma_dev(dma_obj->base.dev),
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
-				  dma_obj->dma_addr,
+		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				  dma_obj->vaddr, dma_obj->dma_addr,
 				  vma->vm_end - vma->vm_start);
 	}
 	if (ret)
-- 
2.53.0.473.g4a7958ca14-goog


