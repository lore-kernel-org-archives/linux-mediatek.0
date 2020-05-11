Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05663C38A2A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 02:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF7A208CA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 02:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tHC9Vwg5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iOtaRZEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF7A208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UaXJ2R+lRdN4jibctf71ODm+x0yQdk+XPTHx+kk9C4s=; b=tHC9Vwg5PV/1GG
	0KWI4jdIajuBZCC7w1I5mPKqc5JKXPqD+oQNYDEgluhtl+r/SaqRVyF0SwOnDjnUSfudFFTffNKOC
	KL2h7iHafdyOXlDE1ew/APK+aGb9GMaU2dChEVfZDh1hSHE2TFOZZzoKMR/OYQR9T1Ta2iVesKM3y
	m2D80p5i16haavJ5/FnW6hJya3eF4hUn7TLszse8BlpfsTWrBAaEpqFic3a8C/9Y5Q0b8ftwE7aWK
	liyegbsjI2hVq31mPFoRVXGY9kgR4XWa4dFY6d546AxPkkMPnuPYEJh0rljaddk2zQSheb6Z6Dd3E
	6N1rf1zPxYtW3PmHNdzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXyH1-0002VF-8L; Mon, 11 May 2020 02:34:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXyGe-00024p-9C; Mon, 11 May 2020 02:34:09 +0000
X-UUID: b195569c74af4b058bb32914ff936ec4-20200510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fxR+3x6dfchTUCq1rEZKfrKVHn0oaDflYS25MJ56o6M=; 
 b=iOtaRZEJrfZrFyp8o9aHZn+PMxZeVo3t20kE6ChrSvpTyTZDSUJiyrJLlityA+jY4uR8fOA5DRxjRpfow1U5+dvfD3slAlEsbP9TKYU/FoCEt1KNHjBaUmSic0S7v5CgmVrgGepsC8uIFNXxf4Jvj8+2f9pSaag6tDH04FYsMKE=;
X-UUID: b195569c74af4b058bb32914ff936ec4-20200510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1961648567; Sun, 10 May 2020 18:34:04 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 May 2020 19:23:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 10:24:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 May 2020 10:24:00 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Josh
 Triplett" <josh@joshtriplett.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] kasan: memorize and print call_rcu stack
Date: Mon, 11 May 2020 10:23:59 +0800
Message-ID: <20200511022359.15063-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B313EB8E7A005151BC9122FE7936DF9B364C35100A83A879C7D0BF8EF3E92D172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_193408_321750_B47AEE71 
X-CRM114-Status: UNSURE (   6.23  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset improves KASAN reports by making them to have
call_rcu() call stack information. It is useful for programmers
to solve use-after-free or double-free memory issue.

The KASAN report was as follows(cleaned up slightly):

BUG: KASAN: use-after-free in kasan_rcu_reclaim+0x58/0x60

Freed by task 0:
 save_stack+0x24/0x50
 __kasan_slab_free+0x110/0x178
 kasan_slab_free+0x10/0x18
 kfree+0x98/0x270
 kasan_rcu_reclaim+0x1c/0x60
 rcu_core+0x8b4/0x10f8
 rcu_core_si+0xc/0x18
 efi_header_end+0x238/0xa6c

First call_rcu() call stack:
 save_stack+0x24/0x50
 kasan_record_callrcu+0xc8/0xd8
 call_rcu+0x190/0x580
 kasan_rcu_uaf+0x1d8/0x278

Last call_rcu() call stack:
(stack is not available)

Generic KASAN will record first and last call_rcu() call stack
and print two call_rcu() call stack in KASAN report.

This feature doesn't increase the cost of memory consumption. It is
only suitable for generic KASAN.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
[2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ

Changes since v2:
- remove new config option, default enable it in generic KASAN
- test this feature in SLAB/SLUB, it is pass.
- modify macro to be more clearly
- modify documentation

Walter Wu (3):
rcu/kasan: record and print call_rcu() call stack
kasan: record and print the free track
kasan: update documentation for generic kasan

Documentation/dev-tools/kasan.rst |  6 ++++++
include/linux/kasan.h             |  2 ++
kernel/rcu/tree.c                 |  4 ++++
lib/Kconfig.kasan                 |  2 ++
mm/kasan/common.c                 | 26 ++++----------------------
mm/kasan/generic.c                | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
mm/kasan/kasan.h                  | 23 +++++++++++++++++++++++
mm/kasan/report.c                 | 47 +++++++++++++++++++++--------------------------
mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
9 files changed, 149 insertions(+), 48 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
