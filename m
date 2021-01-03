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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D473C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 352D2206F4
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 17:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 352D2206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G/owxF3+x3upOxOmrXwm5+wW0xcCtBkUFW2XA8TcVNQ=; b=TAvVYcARLxDU7Ln+ikJRmzk8U
	3PIN188hsAOJxzJ40WfmPFxGF2AgLi75SnL+qWI02JuJORcQSAracFSIyargaGzVo03/QLrrCWcqJ
	oSY0Iba/wshhNsbOYpELBoJiTVQ7QaT6U1krfa8GBQU4bt464i89SgXN8hQJFCpw7nQJgoqzkqDIi
	T+d6o4ICMy3aG3mVEHoL94y+eGBTIGTO0alJyplnEjFagQ8OkFnRDjKDOlsfvlbGUk9S1pEY6CZ45
	bZZu4iMagAhgTn4rabUuOW98XVtu8zACHLFUBPavLEEvlA7jLl+bd0MFZFg60exGHT+ejwuPhTaR5
	ql8fp4Lcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6wH-0003au-63; Sun, 03 Jan 2021 17:13:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6w5-0003Uf-Qw; Sun, 03 Jan 2021 17:12:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id j13so8919451pjz.3;
 Sun, 03 Jan 2021 09:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zcihLP7J+zvmlqvpCHNLNMn5gBB4sRocIGyVUTdgvis=;
 b=ZscOQ6cT7SGXbsyGrP7LqEThhcvbyy24898khh22BD7Fu/H0UxOpAIELLl3r+EqjD7
 MmnJYZc49kc7pL7yKi1xo/2qhiZZ+0X1+MVIfgQNAsvP2sFwzT84vkyO6I5ONCJTbTSA
 G79jEqpmI2sQOlFc68ao4aNRrxodHsahsS7kKJ7TBlKcI8YUvOW0NTI8yKQ968Ftun8g
 uwVYk3EctRRNVm2qc93TxvUWOKJc7aY3l3bKw6FXmIrhhn7r0juvJyrnQXXkLWIARE2/
 /6qCzhwFqYOadxbxxYaXpADRfBlmX2B07/v2mKz5p/V5zdxbJnqK3iMtUzqudxPO3eEN
 MQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zcihLP7J+zvmlqvpCHNLNMn5gBB4sRocIGyVUTdgvis=;
 b=potmG21M55y/zan8BSiHzTAjqTHYMRo07fKg255V5qwzH7quDKFIc7j8r00tefroqp
 5nBJoLHnaNpzxN/jLiPs8xCDbcBS1NpjpfDHzsq1AshKKp/1TnMUWkwrRJFElFGN7IPz
 aCx0798tqIdRBWWCmcI3wod4XW8QPmjP/FNR5lyXC9vD7Kn4RcNKB25At9lDeBMtibCZ
 scaRIRiAsynMh7Yie348XWuVPpPg9E1dedZ/bJr4zJWXvNllxxjtHWs/elm0bLUMQ+Ow
 dHjLsGX/lsr9SitcR8K88NpMzHIAkHgVF2bp6G0HOLy0mtg6yDW2JbbQ+Qe43bAG7/+M
 WPHg==
X-Gm-Message-State: AOAM533ZNJOrZawPL0g9tYz+vdUXYRrAGTi4v0ciUgkJI/NkwOU+Zgin
 vIi9cvkqq2d+OZjV/Rho72Q=
X-Google-Smtp-Source: ABdhPJx+iEuKqbcGx4lndjhagQr1+v/81mg079S4Dgf37vjcORpgsvukDld0Xa8LwJHTq8YbzLCBow==
X-Received: by 2002:a17:90a:4209:: with SMTP id
 o9mr26729316pjg.75.1609693975741; 
 Sun, 03 Jan 2021 09:12:55 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id y3sm19771657pjb.18.2021.01.03.09.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 09:12:55 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] arm64: kasan: abstract _text and _end to KERNEL_START/END
Date: Mon,  4 Jan 2021 01:11:36 +0800
Message-Id: <20210103171137.153834-3-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103171137.153834-1-lecopzer@gmail.com>
References: <20210103171137.153834-1-lecopzer@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_121258_402832_90EC25E9 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, Lecopzer Chen <lecopzer@gmail.com>,
 linux-mediatek@lists.infradead.org, catalin.marinas@arm.com,
 aryabinin@virtuozzo.com, dan.j.williams@intel.com, will@kernel.org,
 akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arm64 provide defined macro for KERNEL_START and KERNEL_END,
thus replace by the abstration instead of using _text and _end directly.

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 arch/arm64/mm/kasan_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d7ad3f1e9c4d..acb549951f87 100644
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
