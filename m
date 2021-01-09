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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A4AC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274C5238EC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 274C5238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V6sCFa9G6cBwsyLi6+YI1rL78UkWX67TuGPBpHGgdw4=; b=MXJLl6EFe6nC3fhwRyisV+vJB
	mqwBPpfOEO7W6kLNnpY3S0sOdDf6QASonmSSp9mmuehSEbeqtMdVPfjbihVQurUGezUN4VGzF7T9K
	LMsvJaiYha8awJ409MmM/GJauD/Lz7Q8Szkauforg0WLMTgQemEwDCOi/JMeiEh3cNe8UCNN3Fc8X
	vDP0K9d0dZnpEtDnpS/lN0qZe3PPK+MiTb5BwHx7IhEbDUKfXYOP/m2JqcTcleXufFJEcDDU+BOoD
	m65j9aOo6peJrYSUHMMXMmDDA19v8LT84mbsNLrGxyaFAPcvGqBhLw6E2cHi+yABLPw7WYb/PNgKJ
	mNqZ3/20Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyBZX-00081C-J5; Sat, 09 Jan 2021 10:34:15 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyBYn-0007ll-JX; Sat, 09 Jan 2021 10:33:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id f14so5028194pju.4;
 Sat, 09 Jan 2021 02:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UgUJ81KV4RLYeQfSGzwX3AUr5zkvCkqoF7/Wom4eVQ=;
 b=tIBodBVvD3dM/tPcoS7jhBbToG4VyWQROjl7yols9+8ORS/CcPAm5b20IC5Jbs9tWr
 yVOLQtwCCXvMimceRWBUO3zhKGWQjw7EHrfg5RSASgGqK8LLFbezIk2DCr5vc/pfiFnF
 JV6iQ2JA+Tw6kQMauQ4Z99oHP/u9IuHGhrJnVZaraWhMs00rxoSZ3aZ/hnNT+XYPjx/e
 UKfTzi1j/93nWOO+MObZpu/CQ5vP357FBpGxyOqQ4YFTPgngWp8raasL/lH/dTgxRD7p
 PLNtLI5oX9npD+u8BZKHa2tHKv0Fubd+WvDVhI9ejaqOXD0W5NgE6ZHTUmiYwluIMzHv
 lwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UgUJ81KV4RLYeQfSGzwX3AUr5zkvCkqoF7/Wom4eVQ=;
 b=UseSWNdUoIJeRRvcrg256CK7gWoiKsRB54egqsvCr3PjLc6YH6OlsSloC4u1i8b8M9
 01ox1ChbLn8+L4GagHuihwa9PiZKGXgpVwjzlDKdCzJlEezoAB3W8NW4vu9GkIXEOZYn
 5Um6jZVDbd5YvtsTqhNS/CrsxJdaUL2GrvSocYPZuOoLsnxp1yenTlVO3j4fZ6RaFKtv
 SNRTnQ/pVSiHQ9+0d+icj2rfoNJpDoGNYacHRCb0JFYiPJHMQajbEAPNrrPGiQuIBKsF
 R2hRacZRTO5Wr7us8uN+1JyKq9gvPlzcA/v120P9yR8iSVCGBZt69fbPpJ4/Mrlovs8N
 ouHg==
X-Gm-Message-State: AOAM530Xpub4taD86870AnY135nartpRQl/WoeO7XOkdSjT7g343SfhW
 YuWLhwSe4YLv8mCdsJRyuZU=
X-Google-Smtp-Source: ABdhPJy4QsiaNLvy4Wi6V3VyP08TTOZIk5pdsPpG8vK4ovPwJSYRAs9Lig3+CqO4Uia7rBMWDffypA==
X-Received: by 2002:a17:902:9a02:b029:dc:3481:3ff1 with SMTP id
 v2-20020a1709029a02b02900dc34813ff1mr11034416plp.28.1610188407451; 
 Sat, 09 Jan 2021 02:33:27 -0800 (PST)
Received: from localhost.localdomain (61-230-13-78.dynamic-ip.hinet.net.
 [61.230.13.78])
 by smtp.gmail.com with ESMTPSA id w200sm11691572pfc.14.2021.01.09.02.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 02:33:26 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] arm64: kasan: abstract _text and _end to
 KERNEL_START/END
Date: Sat,  9 Jan 2021 18:32:50 +0800
Message-Id: <20210109103252.812517-3-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210109103252.812517-1-lecopzer@gmail.com>
References: <20210109103252.812517-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_053329_785087_FD9DFEAD 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Arm64 provide defined macro for KERNEL_START and KERNEL_END,
thus replace them by the abstration instead of using _text and _end.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/mm/kasan_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 39b218a64279..fa8d7ece895d 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -218,8 +218,8 @@ static void __init kasan_init_shadow(void)
 	phys_addr_t pa_start, pa_end;
 	u64 i;
 
-	kimg_shadow_start = (u64)kasan_mem_to_shadow(_text) & PAGE_MASK;
-	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(_end));
+	kimg_shadow_start = (u64)kasan_mem_to_shadow(KERNEL_START) & PAGE_MASK;
+	kimg_shadow_end = PAGE_ALIGN((u64)kasan_mem_to_shadow(KERNEL_END));
 
 	mod_shadow_start = (u64)kasan_mem_to_shadow((void *)MODULES_VADDR);
 	mod_shadow_end = (u64)kasan_mem_to_shadow((void *)MODULES_END);
@@ -241,7 +241,7 @@ static void __init kasan_init_shadow(void)
 	clear_pgds(KASAN_SHADOW_START, KASAN_SHADOW_END);
 
 	kasan_map_populate(kimg_shadow_start, kimg_shadow_end,
-			   early_pfn_to_nid(virt_to_pfn(lm_alias(_text))));
+			   early_pfn_to_nid(virt_to_pfn(lm_alias(KERNEL_START))));
 
 	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)PAGE_END),
 				   (void *)mod_shadow_start);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
