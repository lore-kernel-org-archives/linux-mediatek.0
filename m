Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAE0C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:35:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8496823A01
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8496823A01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C/J2dWEp4JGSPP+Ys6YZTOtT7mdNSdl7cLDPTVaHpqA=; b=nCzTOJ2oR/O3w+cEgum61+7K8
	aT6mhfD5TQHXfWOLolt+myahwDsj1+x4N6DTebDphHmY/cuZIxJS2YHmBMbiuf14QkQHKLupoaFyK
	VtvH0ISEkg2EUsZT93SSPei3jBaijPhnmuYpfZzjN0v2tPjnfbfK38oDMQWx+3BGHMN1YIRmB5l3Z
	FdoOqO1KcxqFVCnsUK4/ZQgo3Y6xMS4Z+vjLyI2S8HeuaQ3/cHur8muEXOdDJjObXPjo86zfxBaVU
	po7tJTelnpLisXiC9poUmMadIyqLuGuakteGnFqIaAJl/5CxiB7eF4HTA0jOoBYRa4PEMSWglbJeK
	rqKDj7f2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyBZy-0008DZ-Lk; Sat, 09 Jan 2021 10:34:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyBZ5-0007sN-5n; Sat, 09 Jan 2021 10:33:49 +0000
Received: by mail-pg1-x536.google.com with SMTP id z21so9312790pgj.4;
 Sat, 09 Jan 2021 02:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjESqlUb86RQ6iRPUx+QrIUmLWqLivYfrQTN5THOZlI=;
 b=BPZllgi5j123yuQfqVOrYEdSznE7JM0iGEn20PN86SJp5LuMZ02GpJIdXxKU5f06lo
 v0sdJbXah37egbezScUS75h3gFsVDu2TvXVT4wFU6e07EoexWe5Bfxd5/0DXNT9OF4Ak
 0BfyFOyQpbC+ZIru/6UpoqCsDY1grAObtZGP4e+3+b78hIzVb7r8kKLhNZM+whZ+dUr5
 8rwbKK0V3+7uN+aKrVU+tVUCiBK/hwZjD/3DnB0SKZVrL8zaqHjoCai9Dw9i0EwI4+pF
 J7hzl7aC7QzoLIXtNAXCicyX085vdBopmyvdwudeQrwfrw2GsvrRfZ4MxlvBZnY5DQ8f
 DKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjESqlUb86RQ6iRPUx+QrIUmLWqLivYfrQTN5THOZlI=;
 b=EhtNLpZ4v7HU5yF+p+LJBj1jQv3ibV5DXD22xL7aa/vHGM9Ej2EVNMKJNnU+UKXZAd
 9sHrry73jS5j33UbxDEuMX0QwSk84ZnpBi9doUPXffPVAbOCu8oanBRpXX10VZS0ZvxB
 W9whziK3eSL5beEOEK9YEQL3O/3fu1bxp1SrwWN9ixK5i1c001kWdU68W1/TRQmJT4dm
 6IhuepBKX8b4rAb8fbad2QPWpDOnfkWn5Ob81tYHr++HOVCoieFGhnOotHW9V0nbm3GZ
 6tfFLjBtCdwD4093EOwO16HwWYJ7nouUmfq+L5Ggkw7oI/kOq81WXYMhcjl/hrioqgT8
 Qi8w==
X-Gm-Message-State: AOAM531sJqxi46CIUbnzAav7SPfHlQs9DtvL8/bxjrhkoz7mskDCu5zd
 XmW5YUrwFEepAVS9CjfClN4=
X-Google-Smtp-Source: ABdhPJxnAfGcjjOzp0O5bC+zZRpiwF3pGnF0uWlC/oLTtAZ685s5ouGYEu3QKd0emh/MPnfAeJ4Z0Q==
X-Received: by 2002:a62:25c1:0:b029:1a9:ee40:3fd3 with SMTP id
 l184-20020a6225c10000b02901a9ee403fd3mr7620101pfl.58.1610188424692; 
 Sat, 09 Jan 2021 02:33:44 -0800 (PST)
Received: from localhost.localdomain (61-230-13-78.dynamic-ip.hinet.net.
 [61.230.13.78])
 by smtp.gmail.com with ESMTPSA id w200sm11691572pfc.14.2021.01.09.02.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 02:33:44 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: kaslr: support randomized module area with
 KASAN_VMALLOC
Date: Sat,  9 Jan 2021 18:32:52 +0800
Message-Id: <20210109103252.812517-5-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_053348_309399_8DEBA999 
X-CRM114-Status: GOOD (  16.00  )
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
Cc: tyhicks@linux.microsoft.com, gustavoars@kernel.org,
 Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, robin.murphy@arm.com, andreyknvl@google.com,
 ardb@kernel.org, Lecopzer Chen <lecopzer@gmail.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux@roeck-us.net, rppt@kernel.org,
 catalin.marinas@arm.com, aryabinin@virtuozzo.com, dan.j.williams@intel.com,
 vincenzo.frascino@arm.com, will@kernel.org, akpm@linux-foundation.org,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After KASAN_VMALLOC works in arm64, we can randomize module region
into vmalloc area now.

Test:
	VMALLOC area ffffffc010000000 fffffffdf0000000

	before the patch:
		module_alloc_base/end ffffffc008b80000 ffffffc010000000
	after the patch:
		module_alloc_base/end ffffffdcf4bed000 ffffffc010000000

	And the function that insmod some modules is fine.

Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
 arch/arm64/kernel/module.c | 16 +++++++++-------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
index 1c74c45b9494..a2858058e724 100644
--- a/arch/arm64/kernel/kaslr.c
+++ b/arch/arm64/kernel/kaslr.c
@@ -161,15 +161,17 @@ u64 __init kaslr_early_init(u64 dt_phys)
 	/* use the top 16 bits to randomize the linear region */
 	memstart_offset_seed = seed >> 48;
 
-	if (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
-	    IS_ENABLED(CONFIG_KASAN_SW_TAGS))
+	if (!IS_ENABLED(CONFIG_KASAN_VMALLOC) &&
+	    (IS_ENABLED(CONFIG_KASAN_GENERIC) ||
+	     IS_ENABLED(CONFIG_KASAN_SW_TAGS)))
 		/*
-		 * KASAN does not expect the module region to intersect the
-		 * vmalloc region, since shadow memory is allocated for each
-		 * module at load time, whereas the vmalloc region is shadowed
-		 * by KASAN zero pages. So keep modules out of the vmalloc
-		 * region if KASAN is enabled, and put the kernel well within
-		 * 4 GB of the module region.
+		 * KASAN without KASAN_VMALLOC does not expect the module region
+		 * to intersect the vmalloc region, since shadow memory is
+		 * allocated for each module at load time, whereas the vmalloc
+		 * region is shadowed by KASAN zero pages. So keep modules
+		 * out of the vmalloc region if KASAN is enabled without
+		 * KASAN_VMALLOC, and put the kernel well within 4 GB of the
+		 * module region.
 		 */
 		return offset % SZ_2G;
 
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index fe21e0f06492..b5ec010c481f 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -40,14 +40,16 @@ void *module_alloc(unsigned long size)
 				NUMA_NO_NODE, __builtin_return_address(0));
 
 	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
-	    !IS_ENABLED(CONFIG_KASAN_GENERIC) &&
-	    !IS_ENABLED(CONFIG_KASAN_SW_TAGS))
+	    (IS_ENABLED(CONFIG_KASAN_VMALLOC) ||
+	     (!IS_ENABLED(CONFIG_KASAN_GENERIC) &&
+	      !IS_ENABLED(CONFIG_KASAN_SW_TAGS))))
 		/*
-		 * KASAN can only deal with module allocations being served
-		 * from the reserved module region, since the remainder of
-		 * the vmalloc region is already backed by zero shadow pages,
-		 * and punching holes into it is non-trivial. Since the module
-		 * region is not randomized when KASAN is enabled, it is even
+		 * KASAN without KASAN_VMALLOC can only deal with module
+		 * allocations being served from the reserved module region,
+		 * since the remainder of the vmalloc region is already
+		 * backed by zero shadow pages, and punching holes into it
+		 * is non-trivial. Since the module region is not randomized
+		 * when KASAN is enabled without KASAN_VMALLOC, it is even
 		 * less likely that the module region gets exhausted, so we
 		 * can simply omit this fallback in that case.
 		 */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
