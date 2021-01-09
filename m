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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C780FC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B4520897
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 10:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65B4520897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x603HYfeLRFE8YgSuKoOsBdmSqrukcqKMJDpRms38Ak=; b=k6CkrNnb76iqLgKXKQ/pe4Wj5n
	tybNuuFuEwDH8LYWV/LkvDy4Ii2yHzVTAj95lHbybyHjk3pNdBTQ6JTLTU2MBdt36UU1Bp2WehWDW
	gJtM1TjkOEgYMrLjzKWBmGEdgfJHDMzlFK0jil6ODcdsl6DKkJvJJwtxG6VNJcPbpyWqExm1pgnVW
	Nhvg2dglNgIWLLLfpxTd7KVKKgER6hfEyFOf84CXhCHmeN3JHFoNYyWyUOz2AGqGt+Ov8BSd6yXk3
	OXQSPcpSxZjtdmrF/yf4/pVUhMHxSoZ0LmpPj3HbRXdctuNVxp23Lsh9h1bMvPGQTxsl2TyPu1crs
	pQ5Tz+AQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyBZF-0007va-Va; Sat, 09 Jan 2021 10:33:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyBYU-0007ek-UU; Sat, 09 Jan 2021 10:33:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id t6so7033288plq.1;
 Sat, 09 Jan 2021 02:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REJcHYfVpby7r9Plat861Deb3UCTNl3jWnkLKDVNOTw=;
 b=Kor0HaVeHVs7YYUOQZ05gUWuNtOwjxDYJqWrgBtIAReqrojCFtPViV7k6RPsAv6KD+
 f3IMeYXvvn1OfPUsolfH+e6FpkPp3SRA3NbBmcDgWzOQx/iUnhc/KMx0UZmDIBmSYEEW
 hLZFffygYj/kiMSxPIfZ9uuc330Ur7esfHBk3+ac035nG2W9MG9VrCZdpsun99HqjhyS
 ToVa3OiwtZxg2MPh03Cj6VtFS01xIZmWga7Ym75rEvfoDaTBbxuU2tUQNnTI7mI7Tu2o
 K09njQke4fOs1NAcnnhRwaTawGcK0IQxkfgY71NVOV2FMbuc0n9Z99ICnLp4kEBSkyGi
 TcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REJcHYfVpby7r9Plat861Deb3UCTNl3jWnkLKDVNOTw=;
 b=MUBXgwpmfiFKcTsaUZX7uRX2CchUTxXwgfLNK0Cl/4rHj/fmO7FHGKr8EPp19fEpNQ
 jE+FS5/fQJQctqDLNjdJfhAHqEwg5Go9GJyfLgvERYqFdE6oxMCMV/BA+LAGks/P9oFa
 V3urQpRnCYg5z94YmT+1OlSQdn+N+oBQ8KA7IUxG8MvsjhbkOWfSv6iC7ndW4wnipzeB
 9jK6hgnaiDSPljY+K/6L+KHu1UYQgZi9RBYMgNeXECWAbxTHyYgsVCKQ1wpvMuqWTGZ7
 BaUKugcCGcUmJflUupaGZ/9mbG06O+EYHju2CSxOnVCIxOOv+/eDoiD3hOo01vogno3M
 QnaA==
X-Gm-Message-State: AOAM531OSwOzIdzcGrnVU1iq+cQu5hQ7hW4D+jwcZ1vwLJY6T0DHrDRm
 4wJPAP4g2V1CFRKYpdSb2tk=
X-Google-Smtp-Source: ABdhPJyq/Xepgo8/6OP79ismqH9P0ePsxiRCe0nTJ19J50oo5g+37mqRX3WbEC47TgFeliE56SPwKw==
X-Received: by 2002:a17:90b:512:: with SMTP id
 r18mr7980605pjz.166.1610188387613; 
 Sat, 09 Jan 2021 02:33:07 -0800 (PST)
Received: from localhost.localdomain (61-230-13-78.dynamic-ip.hinet.net.
 [61.230.13.78])
 by smtp.gmail.com with ESMTPSA id w200sm11691572pfc.14.2021.01.09.02.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 02:33:07 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Sat,  9 Jan 2021 18:32:48 +0800
Message-Id: <20210109103252.812517-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_053311_051117_37DB921D 
X-CRM114-Status: UNSURE (   7.10  )
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

Linux supports KAsan for VMALLOC since commit 3c5c3cfb9ef4da9
("kasan: support backing vmalloc space with real shadow memory")

Acroding to how x86 ported it [1], they early allocated p4d and pgd,
but in arm64 I just simulate how KAsan supports MODULES_VADDR in arm64
by not to populate the vmalloc area except for kimg address.

Test environment:
    4G and 8G Qemu virt, 
    39-bit VA + 4k PAGE_SIZE with 3-level page table,
    test by lib/test_kasan.ko and lib/test_kasan_module.ko

It also works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL
and randomize module region inside vmalloc area.


[1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")

Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Acked-by: Andrey Konovalov <andreyknvl@google.com>
Tested-by: Andrey Konovalov <andreyknvl@google.com>


v2 -> v1
	1. kasan_init.c tweak indent
	2. change Kconfig depends only on HAVE_ARCH_KASAN
	3. support randomized module region.

v1:
https://lore.kernel.org/lkml/20210103171137.153834-1-lecopzer@gmail.com/

Lecopzer Chen (4):
  arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC
  arm64: kasan: abstract _text and _end to KERNEL_START/END
  arm64: Kconfig: support CONFIG_KASAN_VMALLOC
  arm64: kaslr: support randomized module area with KASAN_VMALLOC

 arch/arm64/Kconfig         |  1 +
 arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
 arch/arm64/kernel/module.c | 16 +++++++++-------
 arch/arm64/mm/kasan_init.c | 29 +++++++++++++++++++++--------
 4 files changed, 41 insertions(+), 23 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
