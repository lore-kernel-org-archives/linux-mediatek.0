Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35BEC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBCF206F4
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DBCF206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ad7lutE9Bq/NUFJk1J67j9iKS5lyutK9vBv/awwfMCw=; b=SLe65dDSKEyXpZ5z578ul2atp
	2+nuduBb0UfZDUymIP2BK/zaAL3JtlHFcRJByeRVIQiiE4uG9XwidMmNZ6GaHx8kEtTUeEho07GQ2
	ONYqtL+Sm6X0uNPrbajEINv5j4nvJHLc9rxR4g2lFU2fqZ6I3xs7FZ70GR4JWrfTlriOtg/m+sCWv
	JA8I6ANBFL0Wthq4LXfUSytsXvQdSEpTwwmuvh27GVCwxUDlEHBTeTl94Dh1geSrJPMSJS2T5fhVI
	wTIw22VV2JnaQJiCz3TJLomqMVLa42KQB/XrjtUd2fYSr7UR280qF41ODLDzo+2XUZ3djfvt3XOIx
	lzkX7saFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6w3-0003UD-JF; Sun, 03 Jan 2021 17:12:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6vx-0003RL-Ic; Sun, 03 Jan 2021 17:12:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id e2so13137878plt.12;
 Sun, 03 Jan 2021 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+qF0SijNFO/T+7vPigxBwLWfcVu8oPsZO7isaPG+ku8=;
 b=OMdVh9zxiZv9azAo9+0yvKEkkHlQiRNekWETEHuEwCBvQ/iy+NnfWuO6Su8nvxl4TR
 sVszfeEmM3v6ig7Bfge2C/f8TMwms22mkgt/r+S1gm5pQD30UUMNB1ccdgcJe+m94I5t
 J15E8JULz9YMpwuHH0YoR8QOJTPyYKmqYBUcuJIUOFiTqlTiqFCwcJhW5+bclo1I1bHh
 xSrS1+tkxQklhB+96h6QdMKFDflPTJ8CCmoRsXLd3RrPWQf+NVhZwQFHDjjueJLgPXkC
 s6/eYfDfshOnGDGGwAocvHfl7zfhoVnfeXVVnTl77GfSS2IZjeyhhVx+kDPivmTfxEFY
 NCow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+qF0SijNFO/T+7vPigxBwLWfcVu8oPsZO7isaPG+ku8=;
 b=nrzFpM2btKXeqyuruqrdFlAqF9lnKhQS3H6XOxgtiv3ByeZctNkWk5kAkHI0yAnsIE
 3L+hE82GcpB/VvmgaTkwm8rcIqdts5sU5LyLqFCpz9UxUEDng/RQafpi1eOMFIK4e1XV
 K0GpYxFOs6b3/yBU5GREcxkw2Yl75OEetIApFU7fi3RYcHHXIYrdDHgTlDcjwMdwcMjA
 jPP3kZgtbaFUBKPIwhvh5oVLwrHyCPhmGuzwRmJ2BkFrueoYyZ+85AXeJirO7rmZQwye
 XxDJLons/vQqOBs8huBpZbXTM+mwbCdLVuYo+LqJXanir/6PLsFoPxHpDIQ6WzohL1CO
 a9WQ==
X-Gm-Message-State: AOAM530L4M2J/ZmdifnaiOZH9+YGeJuo9W99JXVwYnLLO56Jb6bkulUF
 1aRFkfVo8/3/Clbvlm4b+vM=
X-Google-Smtp-Source: ABdhPJw3OQwhq9OxHmMcioQgHt+p48eMqxA1ZNlpDr311WozdKIFyTrL8TttCW0PNA95g+ifOua7dw==
X-Received: by 2002:a17:902:7207:b029:da:fd0c:521a with SMTP id
 ba7-20020a1709027207b02900dafd0c521amr68665365plb.45.1609693967387; 
 Sun, 03 Jan 2021 09:12:47 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id y3sm19771657pjb.18.2021.01.03.09.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 09:12:46 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Date: Mon,  4 Jan 2021 01:11:35 +0800
Message-Id: <20210103171137.153834-2-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103171137.153834-1-lecopzer@gmail.com>
References: <20210103171137.153834-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_121249_651003_6A140E96 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, Lecopzer Chen <lecopzer@gmail.com>,
 linux-mediatek@lists.infradead.org, catalin.marinas@arm.com,
 aryabinin@virtuozzo.com, dan.j.williams@intel.com, will@kernel.org,
 akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Linux support KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
("kasan: support backing vmalloc space with real shadow memory")

Like how the MODULES_VADDR does now, just not to early populate
the VMALLOC_START between VMALLOC_END.
similarly, the kernel code mapping is now in the VMALLOC area and
should keep these area populated.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/mm/kasan_init.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d8e66c78440e..d7ad3f1e9c4d 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -214,6 +214,7 @@ static void __init kasan_init_shadow(void)
 {
 	u64 kimg_shadow_start, kimg_shadow_end;
 	u64 mod_shadow_start, mod_shadow_end;
+	u64 vmalloc_shadow_start, vmalloc_shadow_end;
 	phys_addr_t pa_start, pa_end;
 	u64 i;
 
@@ -223,6 +224,9 @@ static void __init kasan_init_shadow(void)
 	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
 	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
 
+	vmalloc_shadow_start = (u64)kasan_mem_to_shadow((void *)VMALLOC_START);
+	vmalloc_shadow_end = (u64)kasan_mem_to_shadow((void *)VMALLOC_END);
+
 	/*
 	 * We are going to perform proper setup of shadow memory.
 	 * At first we should unmap early shadow (clear_pgds() call below).
@@ -241,12 +245,21 @@ static void __init kasan_init_shadow(void)
 
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
 				   (void *)mod_shadow_start);
-	kasan_populate_early_shadow((void *)kimg_shadow_end,
-				   (void *)KASAN_SHADOW_END);
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+		kasan_populate_early_shadow((void *)vmalloc_shadow_end,
+					   (void *)KASAN_SHADOW_END);
+		if (vmalloc_shadow_start > mod_shadow_end)
+			kasan_populate_early_shadow((void *)mod_shadow_end,
+						    (void *)vmalloc_shadow_start);
+
+	}	else {
+		kasan_populate_early_shadow((void *)kimg_shadow_end,
+					   (void *)KASAN_SHADOW_END);
+		if (kimg_shadow_start > mod_shadow_end)
+			kasan_populate_early_shadow((void *)mod_shadow_end,
+						    (void *)kimg_shadow_start);
+	}
 
-	if (kimg_shadow_start > mod_shadow_end)
-		kasan_populate_early_shadow((void *)mod_shadow_end,
-					    (void *)kimg_shadow_start);
 
 	for_each_mem_range(i, &pa_start, &pa_end) {
 		void *start = (void *)__phys_to_virt(pa_start);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
