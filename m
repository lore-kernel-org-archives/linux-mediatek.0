Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2C0C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCHAjF0Z7uci82elReH6b009mfaaTOtclxm2AxNJYSk=; b=YOi5p4fKjPo7+bv+jKUYm+/K2z
	aBgntvP5mH9naZZ3G9YTqH4VdNJFp3EvnF2ZV7IjUC2pWRgWGLoSdPuIewxajglfXZk8m4Yl1vhN5
	wRlN76kSK9nuEFwjMwJPVMbE4Jp4wSVVWtkiWnv4TG/3pfC5oYJk3zYlxTs1UGney0mnGC7taEOGE
	2OFwaw2A+2SHZn2YKhtLAn84gi+AvRuyYWQWe0rzoB95Inl1gBpuIESOlgsrikWLmfeWcVxvOVBvn
	IP1xtFeDL01NI9WHu7MIpLyUC93sSRmDmG6Nql8lBUHeP4NLl/pRUYvKYr0sg7ElAkcX8QPAJb2Vi
	oK8c143A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjJu-00000003nYd-0IUN;
	Mon, 10 Mar 2025 20:01:50 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjIK-00000003n8s-1PaY;
	Mon, 10 Mar 2025 20:00:13 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741636795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dTbDcDa5VbZ+n/fO3/EG23vIfbAUbjH25Kvi/6G6UUkf9B43GNk7v0B7XujY+vgRKc3ULX22Xv3G4igq7lXUoOo/WQurSmKjK3HqG6bV+YDybro145U301lWUoF7vXQeAvx2aiZvFlAHswL8uk0nZO+XBJlTBQNCkkKvLNutkgw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741636795; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zCHAjF0Z7uci82elReH6b009mfaaTOtclxm2AxNJYSk=; 
	b=Zor3RI1wzM02pifNC+UKbVhP3LMu419DTQ6JeJaQXGI5c4XaYrBC2B0SdsNGfsgCc9DWhMS20zCfTKuJjtATdDv3exkFIJFd3q9Oc1gPKBLQOgPlYFUqAGEowUm8IT8x/gHOSohvzqJXBFjhlgnfa1tPcqB5XElnEQPPwu38eRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741636795;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zCHAjF0Z7uci82elReH6b009mfaaTOtclxm2AxNJYSk=;
	b=XI445Uks/5ycTftE+M/lmMubk4qJ8c0Uwss88U2YMIF6ZD4lb49GiMzzbHjg7q8R
	BfE3kRH59JTzpaClDZF2aD5Nt9r2z2fDIv7Nxje+yCiBZlZwIurfowMnOcwedYI8EQ7
	8Y7qkXZXIlQThT8OIqSbQU4Jp4371e6FP0p7cY3s=
Received: by mx.zohomail.com with SMTPS id 1741636791693559.3943284745002;
	Mon, 10 Mar 2025 12:59:51 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: boris.brezillon@collabora.com,
	robh@kernel.org,
	steven.price@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	sjoerd@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v1 1/6] drm/panfrost: Set IOMMU_CACHE flag
Date: Mon, 10 Mar 2025 16:59:16 -0300
Message-ID: <20250310195921.157511-2-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
References: <20250310195921.157511-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_130012_441135_2A086B07 
X-CRM114-Status: GOOD (  10.58  )
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

Panfrost does not support uncached mappings, so flag them properly. Also
flag the pages that are mapped as response to a page fault as cached.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb1..9e6f198ef5c1b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -327,7 +327,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct drm_gem_object *obj = &shmem->base;
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
-	int prot = IOMMU_READ | IOMMU_WRITE;
+	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -528,7 +528,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		goto err_map;
 
 	mmu_map_sg(pfdev, bomapping->mmu, addr,
-		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
+		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
 
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
-- 
2.47.2


