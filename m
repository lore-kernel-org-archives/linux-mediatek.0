Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D1F2C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB1B20721
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSNUhPxs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k44CS2Ll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BB1B20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XaSPIN6ydqbSjNJayIaWNcu0l5GfhSnwqGEZHDa0kog=; b=kSNUhPxsDE7N6X
	gTY1PKqSwiJEyh5rIXNFUMnu73hq9ESai9Fm23PTFD7j1TFWYUSV3+6RnFSRT3jRJEJvMHc6nsSfL
	HUGtmltVm6YWzFzd7ziR12rsxfYNlE/6cyxbo5fR8AzoKgZNkNz41o+xrTSOxyuStMWo9Ynfq/HJ/
	8DSe4ZVC5WN1kVX+y54OXjnpzxXWH9cXkw4kd9ynJ1lQEWOQEdNVHii0IlpAqM4yT8vCf2Lv5SYwr
	0STg4tPVgNOPH7bQlno897uH9StEVlTTB/3lbWPu0NS0TsfxEYLaa+fC+/lWgU2KfJhhMBtNM6sEo
	l49NhFncDePdpY9UAmBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCSj-00085K-Ca; Wed, 06 May 2020 05:19:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCSc-0007uH-1Z; Wed, 06 May 2020 05:19:11 +0000
X-UUID: 239b9850cf734aeb8ec895547c17d0cc-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uJZg8sC2cd+BcgzYcwDrLwJbXHxd7+JuJtTz708pa/0=; 
 b=k44CS2LlRpxQv6lvYXno+3Sjpq9/ZPI4iMAGKZtv93nnCrAg/Tyll/eu/cMiOF4ax5f8TtvXaiVPehx6R1BymS23ck57bCUo4wuPmUoK8lB99I4fuwRpQinKQ6PMvbd7zV7ht4mHbbg+IJZ3JZwgVkDyfN1EHleM+9DVLJDsvvY=;
X-UUID: 239b9850cf734aeb8ec895547c17d0cc-20200505
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1835603799; Tue, 05 May 2020 21:19:05 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 May 2020 22:19:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 13:18:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 May 2020 13:18:54 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Josh
 Triplett" <josh@joshtriplett.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: [PATCH 0/3] kasan: memorize and print call_rcu stack
Date: Wed, 6 May 2020 13:18:53 +0800
Message-ID: <20200506051853.14380-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_221910_093025_6239EE22 
X-CRM114-Status: UNSURE (   6.85  )
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
call_rcu() call stack information. It is helpful for programmers
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


Add new CONFIG option to record first and last call_rcu() call stack
and KASAN report prints two call_rcu() call stack.

This option doesn't increase the cost of memory consumption. It is
only suitable for generic KASAN.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437

Walter Wu (3):
rcu/kasan: record and print call_rcu() call stack
kasan: record and print the free track
kasan: add KASAN_RCU_STACK_RECORD documentation

Documentation/dev-tools/kasan.rst | 21 +++++++++++++++++++++
include/linux/kasan.h             |  7 +++++++
kernel/rcu/tree.c                 |  5 +++++
lib/Kconfig.kasan                 | 11 +++++++++++
mm/kasan/common.c                 | 31 +++++++++++++++++++++++++++++++
mm/kasan/kasan.h                  | 12 ++++++++++++
mm/kasan/report.c                 | 53 ++++++++++++++++++++++++++++++++++++++++++++++-------
7 files changed, 133 insertions(+), 7 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
