Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A05C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE0C238EC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE0C238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OiGMyfzcbWKzA5YjEiXSYzyVChQ6oqocHVnY7d5e3kA=; b=Qr9bbi74Ckt7oJydO5CgYSxWY
	QDBdncJfXhtF/Gl/YzU12sLR/Oac5wJU/KwFcFER0kOvbt7rRvyfb5joyfT9YkRNuem17Wc7hTPYz
	H1pzOpPQga3De6GuYyi3E+hT4huThfvp1jRN9r+VjbFBgS/kJnd3ojZGhAJuMXE+kSFZpYW73rvmY
	pob7Y1oGKmCi4IQ4P57iFrFV4UBmQk+HVhS80xE7GAi5Mv1+e8l/GKtihiWoZeLaommum5a2l7WKJ
	VjyC+D9ILRhsSXWeTALg+VP4TxFsYAswHDwir2rjejTcP+Ltomat20BE+9FtHrkWBQv1Pf8vcNuWA
	Usq79AcjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyBZQ-0007yV-4j; Sat, 09 Jan 2021 10:34:08 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyBYf-0007jE-Hz; Sat, 09 Jan 2021 10:33:23 +0000
Received: by mail-pj1-x102e.google.com with SMTP id f14so5028064pju.4;
 Sat, 09 Jan 2021 02:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0xLmuarIgQdWn84D3wx5rQsfGRtDVE6UQliEht6Oq48=;
 b=tznSyNRiMyzItLUMQF6oR/88pqEwX9kk7kTQfKdCANR4RIg/jSGWow+vKdXCem/hFb
 3hSA000zXc3fyKUBdl/ZjSgR2sEYKmFdqPf4S63Pq3QJjj+bNy413T645P3RQ23jgmVt
 3J3FN8KfuLI2UcJsPN3IuNUC+xuBK2yRVHcTCAS5lB5ZR5KUApOT3cZsVhs984Mmsz+/
 V4Z6OZsDrFjz+MRDH1hiEauKdGXjagzEXCWcgckQrokmREpHGU7Y6/Z2qKMRYnBqpqtE
 iEY5t/mq3PAmOu1pAJ8pySebW15PR/thBHPuWzHkZqim021luT+y9tkl8tBRN4AkugJS
 Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0xLmuarIgQdWn84D3wx5rQsfGRtDVE6UQliEht6Oq48=;
 b=QaS4YI9ecqFL5HAz/jeu/ZZZadoP66GeQvC2+vVtKwibUj9v/cMBlGLftrmcGuyYUt
 k1Zpd8RiMh6YKxcYE6sLpNPE8t6LLgQ2yx3hG4qI28BhSJbapMZrmeRQQxC0UQFTNg4v
 OJf7hdv6hVxN5agoUWyRsGTtkC2xdaNUYpnsDYTwHhTs/MNpUUNQvLhYsTXov+mA0gNT
 DfcqMGOSuSj/uL9mx4YDDtI/X6ZI+6EDamyYMA+QHZ1wtQJ0DoEg8NkhzbH9VfAR0k7o
 XgytdF5bBBY1VZ2M42udTqEURJSBqbRM5mKWUgN0neaqf7qI2juHVLYsROJ0jMklPWnx
 SIfA==
X-Gm-Message-State: AOAM530p0+JqPrY2XXpSW9sO5TUOTpP80l4R02A+P5GpDEQww7AP0qE5
 o2YdWR6plqBjFFivPrYjgkk=
X-Google-Smtp-Source: ABdhPJwBW139zzmCSB7i8s5twWc31e2pZPSPq4BBWMA49N6/L9k08yfNKeLBW6qnhsn2aMKeT1auFA==
X-Received: by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP id
 s9-20020a170902b189b02900dc41024edfmr8031040plr.80.1610188399222; 
 Sat, 09 Jan 2021 02:33:19 -0800 (PST)
Received: from localhost.localdomain (61-230-13-78.dynamic-ip.hinet.net.
 [61.230.13.78])
 by smtp.gmail.com with ESMTPSA id w200sm11691572pfc.14.2021.01.09.02.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 02:33:18 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Date: Sat,  9 Jan 2021 18:32:49 +0800
Message-Id: <20210109103252.812517-2-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_053321_803423_F1CAE136 
X-CRM114-Status: GOOD (  13.49  )
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
index d8e66c78440e..39b218a64279 100644
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
+					    (void *)KASAN_SHADOW_END);
+		if (vmalloc_shadow_start > mod_shadow_end)
+			kasan_populate_early_shadow((void *)mod_shadow_end,
+						    (void *)vmalloc_shadow_start);
+
+	} else {
+		kasan_populate_early_shadow((void *)kimg_shadow_end,
+					    (void *)KASAN_SHADOW_END);
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
