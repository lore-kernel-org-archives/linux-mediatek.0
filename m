Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A9C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 747242192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bmgc0W8U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oobJNg6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 747242192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcWtLiWUgaWc/pI7InG9R+2zF3QiaOVPvHPAOhwx2Fg=; b=Bmgc0W8UstPj2zvzDdgPTWKTSD
	8lc26hYWMZqdQVs7ed4BxP+tqmkIEpqlS/k0MeAZcYsxSoXrBvKj5PIfzRa1Px+Uj/RhSiNQlY3cb
	AdUvree4QcVaciOtWedyByQZ4cytx/KkXA72OijTsQWTnvcLRhmFpJpypI5JV18mtetfcAEpBijVV
	a9pHTuAaGsWoB3Ia4gt9Jdi5D6tgufKeAsrF12mt58MzUPqnTsy+0YDwEY65fzN4IuVuvEKjbi9hy
	zfhSDzclMuJaQu9h/qqcXLcbgz69h9RnDCNiCO0P4OwPVIX6ZgDon1cG9gS0fv/N4lNOxuYFqjlZU
	TEEOzlCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtMX-0001oz-Me; Fri, 23 Oct 2020 09:27:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM3-0001bS-3j; Fri, 23 Oct 2020 09:27:24 +0000
X-UUID: a18f3a93fcfb4860a1996c2eb63a5d76-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=2dEcXHhZj8uprz2I0uMtY19UYwJ6GtAv+ROdYVdiy4w=; 
 b=oobJNg6CVASSBxsJH3+zrVLUTGumuVLl653SOnqBf4fI26b0N4vcHbQ6C4SPfdYH6jHI2SPSAvylHFFUNds3JdtBPGip8wMkVN/OmPF5FF4zrb7Um9K/I+U0ffEQlAlYxb6FNudZZs7975PTYn1tDxGG16eDAVYgbueYO4Mhf1E=;
X-UUID: a18f3a93fcfb4860a1996c2eb63a5d76-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 200655871; Fri, 23 Oct 2020 01:20:52 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 02:15:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 17:14:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Oct 2020 17:14:51 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Russell King
 <linux@armlinux.org.uk>, Minchan Kim <minchan@kernel.org>
Subject: [PATCH v2 0/4] arm: support get_user_pages_fast
Date: Fri, 23 Oct 2020 17:14:33 +0800
Message-ID: <20201023091437.8225-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: CA7FBCC7665B3CF7C9682EE1888B128867151BADC38FBCA27B3B4FD1D749640C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052723_339253_8D06BAF4 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

get_user_pages_fast helps app's launching time because it could reduce
mmap_sem lock contentions when app is launching.

Minchan posted a RFC patch and patch v1 [1] in 2018 and currently he has no
bandwidth to rework this patch, so I rebase Minchan's patch
(arm: support get_user_pages_fast) and modify the patch according
to Catalin's comment and re-post this patch.

First, to use generic get_user_pages_fast code, use strict mm type in
pgtable-2level-types.

2nd patch: reorder memory type table to use 5th bit of the page table

3rd patch: introduces L_PTE_SPECIAL for arm so that last patch can
support get_user_pags_fast.

4th patch: remove L_PTE_MT_VECTORS and use read-only type.


[1] https://lore.kernel.org/patchwork/cover/986573/

Change since v1:
* modify comment
* remove L_PTE_MT_VECTORS and use read-only type 

Change since RFC:
* Remove CPU_v7M - Catalin
* define DEV_NONSHARED to SHARED - Catalin
* https://lkml.kernel.org/r/20180910165011.zcighyuabshsmxjb@armageddon.cambridge.arm.com


Miles Chen (2):
  arm: mm: use strict p[gum]d types
  arm: replace vector mem type with read-only type

Minchan Kim (2):
  arm: mm: reordering memory type table
  arm: mm: introduce L_PTE_SPECIAL

 arch/arm/Kconfig                            |  4 ++--
 arch/arm/include/asm/fixmap.h               |  6 ++---
 arch/arm/include/asm/pgtable-2level-types.h | 26 ---------------------
 arch/arm/include/asm/pgtable-2level.h       | 22 +++++++++++++----
 arch/arm/include/asm/pgtable-3level.h       |  6 -----
 arch/arm/include/asm/pgtable.h              | 13 +++++++++++
 arch/arm/mm/mmu.c                           |  7 +++---
 arch/arm/mm/proc-macros.S                   |  2 +-
 8 files changed, 40 insertions(+), 46 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
