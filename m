Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBEEC28B30
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 15:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+fTK3txOlyskp4W/rEPx48F2NlCVYh8mb8E/EDT8nE=; b=Fow/cvRTh5s/9SC8EFdsee3qcO
	NINo4NCWCKnFJNpiRzElDlARUYccJMlUwUZTbDNtA+KZ1Vzh8GLXZ1AXIo0JgIwb1neqwLKUH/WeI
	eAbhjj7N/Oi7rpYJGK94B0ddOhl8FEeVZmKRx8nG9tx9UVDz29RzolqapZVqMD7UGMXTDWicXOEUk
	4gc3fbvS8DT3iVGzJD8mXoyv2o6dwPE09o92r9faVukMAsMH4U9vGvsbw09L4jhaxwj9VP2W4WNe1
	OvZwuHHCA6A7ZB7M28feVMKmLfr1oiOM///CspYFvSstKkpq8OlcXyfCxGeliSfI96ptmLKMVgpzk
	KTEWz9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuC2D-0000000359y-34uM;
	Mon, 17 Mar 2025 15:05:45 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuBsC-000000032q4-2ggl;
	Mon, 17 Mar 2025 14:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742223312; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cjLTeVl8RlyKIZ/QdHUaKerqGeDESqvOkY/+eZ1jwLu9GkcdQf9nAFXSzTcFe5GaouJMnNFfM9MYkeHXTCmyRUvsa97HpaTlrzmNNeno/JPQRPxACTV5pHpouCHIZ9ucj/7X3mRz3h9loSJl7HUC8seOo/VKBAiE1wzt3oTkumE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742223312; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E+fTK3txOlyskp4W/rEPx48F2NlCVYh8mb8E/EDT8nE=; 
	b=DLm8UjqD4aE1K0wV4k+f9pNKFe4xCLFycMo456jtCnIjL6d1OaIaNnG3EjrzScQZeqZsWMwyARzy0QWX5hwAdJVHtboPAutcVU4mgNSx2QfVCYgkvcZnUVGzLyj0X+jvo3rsTx6BgMpxocj+uo/1EHpg9Jj+1WHxigoZWKMZ/B8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742223312;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=E+fTK3txOlyskp4W/rEPx48F2NlCVYh8mb8E/EDT8nE=;
	b=NTUbiO3eOtOfXcGE3zsM5cHbMgB0FbalMDMywLJpMkWttRCmNSVmwmELrd075NR+
	d+nhJvM0QIWACW6cmNPfP4ySjCR3mBBQVq4zzRe29hBTcnoykStHDCGe+EBdyrOOMuH
	OBYnnLizQ64pJ5+CMdSzOMcm8sdpvt/2xCGvLB3A=
Received: by mx.zohomail.com with SMTPS id 1742223301853895.315747173944;
	Mon, 17 Mar 2025 07:55:01 -0700 (PDT)
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
	angelogioacchino.delregno@collabora.com,
	Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Subject: [PATCH v4 5/6] drm/panfrost: Force AARCH64_4K page table format on MediaTek MT8188
Date: Mon, 17 Mar 2025 11:52:44 -0300
Message-ID: <20250317145245.910566-6-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
References: <20250317145245.910566-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_075524_729537_8BAE4364 
X-CRM114-Status: UNSURE (   9.98  )
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

MediaTek MT8188 SoC has an ARM Mali-G57 MC3 GPU (Valhall-JM), which
constantly faults with the current panfrost support.

For instance, running `glmark2-es2-drm` benchmark test:
```
[   79.617461] panfrost 13000000.gpu: js fault, js=1, status=JOB_BUS_FAULT, head=0xaadc380, tail=0xaadc380
[   80.119811] panfrost 13000000.gpu: gpu sched timeout, js=0, config=0x7300, status=0x58, head=0xaaca180, tail=0xaaca180, sched_job=000000002fd03ccc
[   80.129083] panfrost 13000000.gpu: Unhandled Page fault in AS0 at VA 0x0000000000000000
[   80.129083] Reason: TODO
[   80.129083] raw fault status: 0x1C2
[   80.129083] decoded fault status: SLAVE FAULT
[   80.129083] exception type 0xC2: TRANSLATION_FAULT_2
[   80.129083] access type 0x1: EXECUTE
[   80.129083] source id 0x0
```

Note that current panfrost mode (Mali LPAE - LEGACY) only allows to
specify write-cache or implementation-defined as the caching policy,
probably not matching the right configuration. As depicted in the source
code:

drivers/iommu/io-pgtable-arm.c:
```
* MEMATTR: Mali has no actual notion of a non-cacheable type, so the
* best we can do is mimic the out-of-tree driver and hope that the
* "implementation-defined caching policy" is good enough...
```

Now that Panfrost supports AARCH64_4K page table format, let's enable it
on Mediatek MT8188 and configure the cache/shareability policies
properly.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 0f3935556ac76..e854f290858f9 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -824,6 +824,7 @@ static const struct panfrost_compatible mediatek_mt8188_data = {
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
-- 
2.47.2


