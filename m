Return-Path: <SRS0=1nN3=KH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB05C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 08:39:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01019613C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 May 2021 08:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01019613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qpt65RihFf5LsSD+B/GRJ+NZC+x8YxkmODwoL4lgyug=; b=XyDrfOlFTqjmjM6vLs+VDREFr
	36Px7tVGktQ/9cyx8eMYFbxPb/wsTVVPJ9OJF3pIUklDsdULnecLw2pyoD6B4PEytRYfNsVgtmN3B
	k3D6Li3Et5dsrRcbiTxPDdVD6s/tq4+f1YelnHL/hL9azDV+efDGMF60zHIVDuRol21RRPjv9kRFT
	eUU9fFAbc37yh0I0LaIEDXmmO2JIYmxXA1wUsi8oagu0vKJJXqreXnh2tRaXuQbsMYX6stzvuwDIf
	DxifwYU2Pc7DP4MkGUb0Q+1Lg3LJva/z1uB3NwiVKi6sXD2FwiwvvIr02tTsdEZpHAf9wd2i+cxe8
	Ab7V4k5pQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgkOZ-002LG5-I8; Wed, 12 May 2021 08:39:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkOM-002LBR-07; Wed, 12 May 2021 08:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=F7GCMG4LGnBHyhgH0fMXkvEutGoXK6lxgQV819IY7hk=; b=i1WRY78QwvwbjPOSd8UokmDpKG
 nZfhiXm2733AL27542r+1uQ5XL/6O/wBik8kxfDH5xoKocSek94/Ww4Xri8vUCTrr3wvpoX8qpzQR
 YzsCq5NH3lRdFPA8kKR2/yGN72ENLk8Y3fBj3+4BlFbpVnaz7Xq2bPOCUx7fWWrnlbCOzKWt8bxh5
 lZOSXI6H2KYBu6iMLQQPDUxl6EmXbTI4h16vMPX/J4gSngDRk9FKVrStiCnbULkiKZr05ikbvpp/R
 dQyRZsmzwkbH3/cnihN4Ykzf7ZnnYc8SOZRTGcCEWVTeDh7RhO7iBT+hoTJwFTTM69CxOlSaBdhmI
 yyxQKGlA==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgkOG-00ADfA-2P; Wed, 12 May 2021 08:38:51 +0000
X-UUID: 300faea398c04924be674937a5b429e1-20210512
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F7GCMG4LGnBHyhgH0fMXkvEutGoXK6lxgQV819IY7hk=; 
 b=ah0cU7hT25BZVRTWDap4tZwD0mbOw8+koKniYl7/pbWWjOOTg6VjnqyldD/5QlI5BqZNsempm8jDRWRkSIQ6I0rNd47AVwG/b1yRla3O4f6KpXEx1EBaqoPoHJECffSNEmY4VxfYEnmRWZBZPl7dex0C8UzuYfzK8rWYngRK9zw=;
X-UUID: 300faea398c04924be674937a5b429e1-20210512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 673486075; Wed, 12 May 2021 01:38:42 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 01:38:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 May 2021 16:38:32 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 May 2021 16:38:32 +0800
Message-ID: <1620808712.30754.62.camel@mhfsdcap03>
Subject: Re: [PATCH][v3] rtnetlink: add rtnl_lock debug log
From: Rocco.Yue <rocco.yue@mediatek.com>
To: Cong Wang <xiyou.wangcong@gmail.com>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, LKML
 <linux-kernel@vger.kernel.org>, Linux Kernel Network Developers
 <netdev@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>
Date: Wed, 12 May 2021 16:38:32 +0800
In-Reply-To: <CAM_iQpVWSJ8BdRoLDX0MdiqmJn2dp+U9JM4mcfzRbVn4MZbzcg@mail.gmail.com>
References: <20210511113257.2094-1-rocco.yue@mediatek.com>
 <CAM_iQpVWSJ8BdRoLDX0MdiqmJn2dp+U9JM4mcfzRbVn4MZbzcg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2A9A11B506E22992C9FA6257C88DB58DA55B784EAB31817063BCF46E6A1B99952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_013848_142771_0922BC3B 
X-CRM114-Status: GOOD (  19.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-05-11 at 10:00 -0700, Cong Wang wrote:
> On Tue, May 11, 2021 at 4:46 AM Rocco yue <rocco.yue@mediatek.com> wrote:
> >
> > From: Rocco Yue <rocco.yue@mediatek.com>
> >
> > We often encounter system hangs caused by certain process
> > holding rtnl_lock for a long time. Even if there is a lock
> > detection mechanism in Linux, it is a bit troublesome and
> > affects the system performance. We hope to add a lightweight
> > debugging mechanism for detecting rtnl_lock.
> 
> Any reason why this is specific to RTNL lock? To me holding
> a mutex lock for a long time is problematic for any mutex.
> I have seen some fs mutex being held for a long time caused
> many hung tasks in the system.
> 
> Thanks.

Thank you for a good question.

It's a problem to hold rtnl_lock for a long time, and other locks are no
exception.

the reason for adding rtnl_lock debug log:

1.rtnl_lock is a widely used lock:

In my view, for some other mutex locks, such as "f2fs_stat_mutex" in the
fs/f2fs/debug.c , there are not many codes that use this lock, and the
module involved is relatively single.

But when we search for rtnl_lock in the entire Linux kernel, we will get
a lot of matching results. Obviously this lock is a widely used lock,
which makes it difficult for us to locate the problem. If we do not
enable CONFIG_DEBUG_LOCKDEP and CONFIG_PROVE_LOCKING, it is often
difficult for us to find out where went wrong.

2.codes that use rtnl_lock include some basic functions of networking:

There are many networking modules that use rtnl_lock, and some functions
that use rtnl_lock are infrastructure part, such as unregister_netdev(),
dev_ioctl(). Perhaps this can also explain to a certain extent the
importance of adding a lightweight debug mechanism for rtnl_lock. And
mediatek and our customer have benefited a lot from such log.


Hope above contents can answer your question.

Best Regards
Rocco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
