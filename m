Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80764C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=; b=hvUDRj/tfmAO2xVz6rZytvCYqQ
	JLdP8jCE+oOb9DWJGpf0kfDXoZw2Qu4tHlNSp572e1/qL9Njchs8MnarbGOWUisU/mBRUBK57VSHP
	/RsfNBl2ZzMKle9bYC/p3ROSmYQi0yds4Kv/JeHjTT6VFuVinmi/KmpHIF1Zm6kHSaEFpCC/hq9Bg
	JmVuV2v3FEmDGbrLDBB9Ue/ngI8sCpsnCsvwO+5IsN8BjkGihR5KumI88STA3g3MeuiFv51BKF+EM
	SuzFb/C6yN2yNv142Dip/F7LOry25OkMp7KGvJ1xjDDzLQehSmYbLRP8/Od1JkvoQgc3zijr0ICdY
	Ze1L1K+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rzo-00000006PWX-2oxL;
	Tue, 15 Sep 2026 12:10:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Rzn-00000006PVn-0uze
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=; b=j9rcVnFZ7tu4I0+KkJ9YGGdx5K
	3IUWatV2fl7Sq8CDPCVGsYgMk/NTnwiFbDw41106kNDudwCCXFMkIglj2Ot1G1+fSrdC7OuywPblP
	XM5SZnCkxKrEfbqffoIWFC3PZx299KwCuazRsfvaKyR7wJ7cbri2dZU0cJxXNjtNxGjEa4M1nJlUY
	w8oUa/o21ZzxrhJKc8s+BQpvlkMkcKQiGB8LxtcUvMCmPhfW2z3S/ZwBdWt8uwYqtbl+hWe/b0kIy
	jwbDv4RZ43eyKRhknJHPkmz7qQWx3thfYPxKgDjw9GO6ivE2oXP11zhBhogYtAkDc1GKdtPKMw32r
	V60ZGyqA==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Rzk-00000006i3q-1CLZ
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Sep 2026 12:10:42 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd53691be5so28606675ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 05:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789474238; x=1790079038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=;
        b=ZoBCEmF35jS++3ggxmfu47mlV0ELnU8fz51BVGjk5pImbuNfgwciOFaXO2D6c/Z9XH
         ZdW5pIZrMDXRwNx7jY4HlO/MMiJh1QYjkfVhka0FyJAiqiWxTzYuxisd93Rz+YJggWC9
         aFQg4ejXsIe2a/7GRP6GV7fJfX4UQDR5gABTQhWaS4pbHmCCyUU8bD+WcBiwelYsX7UV
         RsVF9qUkgxD+ngomhFWpbIQXYdkVItZIkWqWThdiY2/gV3jBRAzUZQDD2ayqlhz/yIxV
         J/m6FlUFz417sF1LZEhsau+kd5UBqUK0uPwPr61hdj/9IbD3ufs+ZwQAMKOJi002rSCA
         x34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474238; x=1790079038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ARc4u49b6G5t0LuKLqwXD8cu3X9ELbFHgcHDb7cDF2U=;
        b=xxhp1rjWar5JTTixUZs01vGkcw9LfC5ESkUhbteOV2LcbhzSlSTm3BVyG2eAsafOCt
         MlfNMUaEkML3w27S2EoidXkX88R3M2TRz7GaCXa70wHm/xo/ZWJOjAFIJCKq3rkjI/Hd
         2/FFNcgCrHwpOkEfbP3rGXf6tvcrYpVqDh+CzuEBKJogIlCJKhW8D2wBRWeHFCP/w1fH
         220wIZbIAkQmGcLjtT37EMLMi5BkwWk5rumSOBri+PPTRWAGbigwYs4htkFLh2rOw/mr
         QNWhgU0s95pwpz7bCNSmLMuMFqAzoomMKfj/Cjrwlu7ZOeTmwEgSZ0Vw7OENBoaGl+Hc
         ACjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwV4/AAGYHifRv6r9cI6MTxe0K4Kjwnl7G7Mt8ujemowtlxsQlAKbNcQvZCyE3OLYVeFaBLG4GveIdHRPsC6A==@lists.infradead.org
X-Gm-Message-State: AFuF++nRPG+JAxTPv3SPOREhA2bFYX3BMHDdSYOQEXnNlozqg7jP28z1
	ikJrFHezpfQUaBHOIkn6tPvc4m6TlhyoTdLgWqD7zVm2TlhfRmgBU2F8il6hc1kB
X-Gm-Gg: AYBFou0apETcL+LB3a2fbGaiXN61kYN32mpao+jdkjopLtix2tJoYZ5PHadRT/YSNcB
	wHdT6jxiFJfQObsudhYWT8+EXN60PdKUhF+FPssqaTh7ASXqR56/tfuWRLj2rjJnoOiopfLmg4i
	xtc+jIiONCLqLzXZFcnpv/uJRqWEIuCu8LMuEyVI0MyRk4JAZX9qqfIUPM3oy3hbIf7lbbUV40n
	s3dha4xu4W0wKng1S4km2i9d9N9Vb4x3Uf4Cb867BwfuV6saUHivIObYoXciveRntwwfFOsk2Sx
	RU6BClju1clTHKZWn5l0lvaI9VLmVnSuE8B5lHM7uZfyMJocEnOsbqw9/PT2xWa+wwxnRbSiVHI
	H5efS5OnPpv1k0C9JDaivwc/sQSS1Wen7aWYctkShDjZK43EdOjNRotIVlncSkUEjFyri8R13JB
	odPCO0FYeTAjgUX5c86u/p06BZMfg0mLJAPzHIFCdJkjGCn/5UhowtPA==
X-Received: by 2002:a17:903:2c07:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2dd6c6e9b11mr142531885ad.11.1789474237753;
        Tue, 15 Sep 2026 05:10:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm66466685ad.55.2026.09.15.05.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:10:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vpu: release reserved memory on remove
Date: Tue, 15 Sep 2026 20:10:25 +0800
Message-ID: <20260915121025.2412446-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_131040_499257_8BF2F78E 
X-CRM114-Status: GOOD (  11.11  )
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

mtk_vpu_probe() may assign a reserved memory region to the VPU device
with of_reserved_mem_device_init(). The probe failure path releases the
assignment with of_reserved_mem_device_release(), but the normal remove
path does not perform the corresponding cleanup.

As a result, removing the VPU driver after a successful probe can leave
the reserved memory assignment associated with the device after its
lifetime has ended.

Release the reserved memory assignment after freeing the VPU external
firmware memory, matching the cleanup performed by the probe failure
path.

This issue was found by manual code inspection.

Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..16b5bdc2f2c0 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -966,6 +966,7 @@ static void mtk_vpu_remove(struct platform_device *pdev)
 		destroy_workqueue(vpu->wdt.wq);
 	vpu_free_ext_mem(vpu, P_FW);
 	vpu_free_ext_mem(vpu, D_FW);
+	of_reserved_mem_device_release(&pdev->dev);
 	mutex_destroy(&vpu->vpu_mutex);
 	clk_unprepare(vpu->clk);
 }
-- 
2.43.0


