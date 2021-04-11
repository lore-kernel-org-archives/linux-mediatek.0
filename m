Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3B4C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 10:54:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26C8C610CB
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 10:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26C8C610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OmSOwZO36q3sqPP+gOKW5h9E9YuSTcV92gAFVAJe29E=; b=efl6BqZOBayJDkv9hoWsmYW0j
	SVhbEPQZxVJaeS5WeBXUUTxLP5AUbWFqRvy7HMEEcFM7HkwJHYNfhKxtlimKaay4TvancW4KeVBSU
	0RHebbXnZp/+/2Od1qRvyOjUMA0xm5SM5QvpvMk4n34+q9Ci7fRGs8TXmOzEa+Ieams+FlP63pWtl
	Xt6CZ3CcwSGwBDzLsZudf/Wrzkh5RYsIWOXEU4NYmDdejKnCYGcjnCtXqlOCd6p6sPJmdbyYwIWoh
	7Snoxy3tG9POZHK9cRl7t6gTZ+JrA0mTFbvZ6SAdZNY7WXaAZvG6AYZbSVu8mZW4QmZWz30Jrvygc
	OJGNlUy0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVXiz-004L9u-6E; Sun, 11 Apr 2021 10:53:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVXio-004L7k-2L; Sun, 11 Apr 2021 10:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4qNsrz6hVkBjp+T7AuqMxu3ZMoE0rcJnMKd3SW8mn9w=; b=oPUMvzsK3s47Q16Xg+gQmQvdte
 Qo/GAeR2oo5zkz9pwd2jLxDGQ8ERSIYxSg/X0sM2tAznEjxCn24ryjrprkQnxcHd9fNnRz4+TiRlE
 qs4hXEvqyCKpluvRYOnJrV3PFGRmGju2bLOPCSuayV7ZLveYp3KLAYmADYOKCLwaImDoy8HEnMU47
 enHw+LZjvWxSu6NymY+8kuF3eMytFBZT40jalSqGqnP5RANb4L7H34iWULthIEBQvvBGFITQn/m3C
 B16kfhJAGvC529gJr006f6sgbB2DMDfYzCenqycHLs33POB0C9pbK3HB8NkcGnZde9BV+wG4pmiv1
 4n7GNJiQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVXil-005Ssr-Bv; Sun, 11 Apr 2021 10:53:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05C5C60241;
 Sun, 11 Apr 2021 10:53:35 +0000 (UTC)
Date: Sun, 11 Apr 2021 11:53:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Konovalov <andreyknvl@google.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4] kasan: remove redundant config option
Message-ID: <20210411105332.GA23778@arm.com>
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <CAAeHK+zyv1=kXtKAynnJN-77dwmPG4TXpJOLv_3W0nxXe5NjXA@mail.gmail.com>
 <20210330223637.f3c73a78c64587e615d26766@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330223637.f3c73a78c64587e615d26766@linux-foundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_035339_470065_FCF5CB4A 
X-CRM114-Status: GOOD (  20.77  )
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

Hi Andrew,

On Tue, Mar 30, 2021 at 10:36:37PM -0700, Andrew Morton wrote:
> On Mon, 29 Mar 2021 16:54:26 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
> > Looks like my patch "kasan: fix KASAN_STACK dependency for HW_TAGS"
> > that was merged into 5.12-rc causes a build time warning:
> > 
> > include/linux/kasan.h:333:30: warning: 'CONFIG_KASAN_STACK' is not
> > defined, evaluates to 0 [-Wundef]
> > #if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > 
> > The fix for it would either be reverting the patch (which would leave
> > the initial issue unfixed) or applying this "kasan: remove redundant
> > config option" patch.
> > 
> > Would it be possible to send this patch (with the fix-up you have in
> > mm) for the next 5.12-rc?
> > 
> > Here are the required tags:
> > 
> > Fixes: d9b571c885a8 ("kasan: fix KASAN_STACK dependency for HW_TAGS")
> > Cc: stable@vger.kernel.org
> 
> Got it, thanks.  I updated the changelog to mention the warning fix and
> moved these ahead for a -rc merge.

Is there a chance this patch makes it into 5.12? I still get the warning
with the latest Linus' tree (v5.12-rc6-408-g52e44129fba5) when enabling
KASAN_HW_TAGS.

Thanks.

-- 
Catalin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
