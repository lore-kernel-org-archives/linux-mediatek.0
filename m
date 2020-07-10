Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4F6C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:21:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A02620657
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 16:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MLNGNb7f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AzVCRYD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A02620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XuFYXOGuFCKcnDRO0+gygK+nV0w+eNmUTj0ubK2WN0Q=; b=MLNGNb7fy4AVOZwXku+zPO4wgg
	zItEY8fVFTZ7LYU9tOxgnRkty8ryYV/SOpmrbUjPf5U94FXL2lXbcOvhsICeIWj2OoDb50q7kmBm0
	P7PwFFjSysASoAazbOV/N7UiAT2Z+7Yf0GnhOA7PK8LwTXfA8izfoxxgMsGijCPw6cxaJYm1m9WUY
	y/ILBUXVSS3EY+0ry1KHzlplJyBxyUFp8K/bqs1PTX08zwjECWeJguEEXUgUeWtIiCnLTAsAeVkta
	4EHnVPeq0541NOXl+i0xeIiSuq6eAyEosLdiL2wgmBJK7ebg04bBDPD+6cRxuj/KB3O3whmUYBH9L
	EzeP8qMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtvmP-0000rm-62; Fri, 10 Jul 2020 16:21:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtvmM-0000pa-Tb; Fri, 10 Jul 2020 16:21:40 +0000
X-UUID: 92a4a382d6564fdf93af4c0849fc65a3-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LoI2c6gi3jQYjLM5dZfi8Lk3EE1492i2ph2ScUkCE1Y=; 
 b=AzVCRYD7jMgWJEFyBZY+6zeTRaliGMihlUhA11+g0uoFMyawWuun5mgYcrG8GYVaQP+1XOFLsj699ajE8k8Fq83mkiz+4kV6UYXQgIlgTw60oWy9VZ3mwZCWxIkbbonLdQspFncmBHaE5ET7HDVI4y+gYbkhZx/D2QjCpt+n+rk=;
X-UUID: 92a4a382d6564fdf93af4c0849fc65a3-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1396889665; Fri, 10 Jul 2020 08:21:32 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 09:21:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 00:21:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Jul 2020 00:21:30 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 0/4] kasan: memorize and print call_rcu stack
Date: Sat, 11 Jul 2020 00:21:23 +0800
Message-ID: <20200710162123.23713-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_122139_104564_A23EEAF1 
X-CRM114-Status: GOOD (  14.56  )
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
 wsd_upstream <wsd_upstream@mediatek.com>,
 Andrey Konovalov <andreyknvl@google.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Dmitry Vyukov <dvyukov@google.com>
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
 kasan_save_stack+0x24/0x50
 kasan_set_track+0x24/0x38
 kasan_set_free_info+0x18/0x20
 __kasan_slab_free+0x10c/0x170
 kasan_slab_free+0x10/0x18
 kfree+0x98/0x270
 kasan_rcu_reclaim+0x1c/0x60

Last call_rcu():
 kasan_save_stack+0x24/0x50
 kasan_record_aux_stack+0xbc/0xd0
 call_rcu+0x8c/0x580
 kasan_rcu_uaf+0xf4/0xf8

Generic KASAN will record the last two call_rcu() call stacks and
print up to 2 call_rcu() call stacks in KASAN report. it is only
suitable for generic KASAN.

This feature considers the size of struct kasan_alloc_meta and
kasan_free_meta, we try to optimize the structure layout and size
, lets it get better memory consumption.

[1]https://bugzilla.kernel.org/show_bug.cgi?id=198437
[2]https://groups.google.com/forum/#!searchin/kasan-dev/better$20stack$20traces$20for$20rcu%7Csort:date/kasan-dev/KQsjT_88hDE/7rNUZprRBgAJ

Changes since v1:
- remove new config option, default enable it in generic KASAN
- test this feature in SLAB/SLUB, it is pass.
- modify macro to be more clearly
- modify documentation

Changes since v2:
- change recording from first/last to the last two call stacks
- move free track into kasan free meta
- init slab_free_meta on object slot creation
- modify documentation

Changes since v3:
- change variable name to be more clearly
- remove the redundant condition
- remove init free meta-data and increasing object condition

Changes since v4:
- add a macro KASAN_KMALLOC_FREETRACK in order to check whether
  print free stack
- change printing message
- remove descriptions in Kocong.kasan

Changes since v5:
- reuse print_stack() in print_track()

Changes since v6:
- fix typo
- renamed the variable name in testcase

Changes since v7:
- fix this commit dependence in the series

Walter Wu (4):
rcu: kasan: record and print call_rcu() call stack
kasan: record and print the free track
kasan: add tests for call_rcu stack recording
kasan: update documentation for generic kasan

Documentation/dev-tools/kasan.rst |  3 +++
include/linux/kasan.h             |  2 ++
kernel/rcu/tree.c                 |  2 ++
lib/test_kasan.c                  | 30 ++++++++++++++++++++++++++++++
mm/kasan/common.c                 | 26 ++++----------------------
mm/kasan/generic.c                | 43 +++++++++++++++++++++++++++++++++++++++++++
mm/kasan/generic_report.c         |  1 +
mm/kasan/kasan.h                  | 23 +++++++++++++++++++++--
mm/kasan/quarantine.c             |  1 +
mm/kasan/report.c                 | 54 +++++++++++++++++++++++++++---------------------------
mm/kasan/tags.c                   | 37 +++++++++++++++++++++++++++++++++++++
11 files changed, 171 insertions(+), 51 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
