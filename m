Return-Path: <SRS0=qWQ0=HI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEECC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:47:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B38564FCA
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Feb 2021 08:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B38564FCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgpKEuqxfItZut3rmu/RNmKuRVlw/V+L5PPm9NPbiWw=; b=jix79YQkrOcFtFGVDwHEr/J9Nn
	8V+GSWFGQJ1fWEdhTbGlO8wTAbqc/3hUVmNKBrEdUv83bh+uq5c+sKE2ezkrokgLFn9FtIkFN962W
	aJLRfknG9eLKP226cpKA9PK7xoWkrLHhqMPYPcD9zs58RaAfNoLeEI8vsH9CUbh/+zMY8gTXhXsvK
	nUj5toKTPHxNj+LL8FoTPrXv0mIicP4RNkDikNVx6zcHcNE8vConqRqLtZmbd0wUbrTiRCmfnTfU+
	DhP20d+EgIWJ/Q1gH5fDAeNFubCb0BqNShN/bgcCz+/XghQrf64BrNXlvGt2uBFzD+tPFHDc67x4y
	gNz6MNOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8JF7-0003Lq-Rk; Sat, 06 Feb 2021 08:47:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8JEk-0003CK-97; Sat, 06 Feb 2021 08:46:43 +0000
X-UUID: c2688788d9f240f99586bf8a714d24e1-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GNL5TnXZWao9h2DFDrcMnQF6C7i6wQ7dc36keENPRnY=; 
 b=nNqpwDIwpnh2fRLXJhhW8KaVxFhNZxk3qtq4g86tqgvgkoTOmAL2EU7Be2rRXUAzot6QQ2d10Ui4ROFoLo1XFi0zlf7VpRFhThLb0CzUldDMpCu2UHl/SrxkMDtsLTduJJfzGAZLEVBXeVfYXX6/9yxrf9fheVU/+MFAciL+ei8=;
X-UUID: c2688788d9f240f99586bf8a714d24e1-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 337313232; Sat, 06 Feb 2021 00:46:21 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 00:36:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 16:36:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 6 Feb 2021 16:36:04 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <linux-arm-kernel@lists.infradead.org>,
 <will@kernel.org>
Subject: [PATCH v3 0/5] arm64: kasan: support CONFIG_KASAN_VMALLOC
Date: Sat, 6 Feb 2021 16:35:47 +0800
Message-ID: <20210206083552.24394-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 48ED01F9EB92388DB50C25F6565B6744F8836A662E8B2C774BE4F94EFBD8AA522000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_034638_752460_D8BE32BB 
X-CRM114-Status: UNSURE (   6.13  )
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
Cc: tyhicks@linux.microsoft.com, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 glider@google.com, yj.chiang@mediatek.com, gustavoars@kernel.org,
 andreyknvl@google.com, ardb@kernel.org, lecopzer@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux@roeck-us.net, rppt@kernel.org,
 catalin.marinas@arm.com, aryabinin@virtuozzo.com, dan.j.williams@intel.com,
 vincenzo.frascino@arm.com, robin.murphy@arm.com, akpm@linux-foundation.org,
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

  -----------  vmalloc_shadow_start
 |           |
 |           | 
 |           | <= non-mapping
 |           |
 |           |
 |-----------|
 |///////////|<- kimage shadow with page table mapping.
 |-----------|
 |           |
 |           | <= non-mapping
 |           |
 ------------- vmalloc_shadow_end
 |00000000000|
 |00000000000| <= Zero shadow
 |00000000000|
 ------------- KASAN_SHADOW_END


Test environment:
    4G and 8G Qemu virt, 
    39-bit VA + 4k PAGE_SIZE with 3-level page table,
    test by lib/test_kasan.ko and lib/test_kasan_module.ko

It works in Kaslr with CONFIG_RANDOMIZE_MODULE_REGION_FULL
and randomize module region inside vmalloc area.

Also work with VMAP_STACK, thanks Ard for testing it.


[1]: commit 0609ae011deb41c ("x86/kasan: support KASAN_VMALLOC")


Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Acked-by: Andrey Konovalov <andreyknvl@google.com>
Tested-by: Andrey Konovalov <andreyknvl@google.com>
Tested-by: Ard Biesheuvel <ardb@kernel.org>

---
Thanks Will Deacon, Ard Biesheuvel and Andrey Konovalov
for reviewing and suggestion.

v3 -> v2
rebase on 5.11-rc6
	1. remove always true condition in kasan_init() and remove unsed
	   vmalloc_shadow_start.
	2. select KASAN_VMALLOC if KANSAN_GENERIC is enabled
	   for VMAP_STACK.
	3. tweak commit message

v2 -> v1
	1. kasan_init.c tweak indent
	2. change Kconfig depends only on HAVE_ARCH_KASAN
	3. support randomized module region.


v2:
https://lkml.org/lkml/2021/1/9/49
v1:
https://lore.kernel.org/lkml/20210103171137.153834-1-lecopzer@gmail.com/
---
Lecopzer Chen (5):
  arm64: kasan: don't populate vmalloc area for CONFIG_KASAN_VMALLOC
  arm64: kasan: abstract _text and _end to KERNEL_START/END
  arm64: Kconfig: support CONFIG_KASAN_VMALLOC
  arm64: kaslr: support randomized module area with KASAN_VMALLOC
  arm64: Kconfig: select KASAN_VMALLOC if KANSAN_GENERIC is enabled

 arch/arm64/Kconfig         |  2 ++
 arch/arm64/kernel/kaslr.c  | 18 ++++++++++--------
 arch/arm64/kernel/module.c | 16 +++++++++-------
 arch/arm64/mm/kasan_init.c | 24 ++++++++++++++++--------
 4 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
