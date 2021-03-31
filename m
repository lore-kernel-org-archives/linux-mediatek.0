Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E180C433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 05:37:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F28619D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 05:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F28619D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qw/jU1dqeIf+XwP/ZblBIkgxw7PPEoffGpn4oguq7PM=; b=GWJ6mKIC9Fd8AT7r8PIEYR1Fv
	m98/CuQWzUUSCy5ub18+Lo0kS2rtphqqGYNsFrblO+TRhFRbPn9p9/QRHfV8EjLf0mSQQ0xvGJ31r
	YVBYfJOHMVzq0M6mu1vX3//JLalEMV1yM9uE8jVjV4XOkr4YHc7mcK+YkXKwLRnT8xxm5FQToSsqS
	89prZMEvdGjACopXI4SLfD9I53wcAxSFtroMpJZ3HzrPf5k18QcfocYIavaNllIpC0AfRsuuCH0a4
	p4QKoZ8bZ43zEiU94jJsiFL0Ng8bFQasLQVYAS4yNpYyZo/3pF19YSHFn17BE7o4rK8VL07A4C7oG
	KxhE/sPFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRTXD-005Xvq-Sc; Wed, 31 Mar 2021 05:36:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRTWz-005XvC-Ud; Wed, 31 Mar 2021 05:36:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47026619D6;
 Wed, 31 Mar 2021 05:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1617168998;
 bh=A+/iyXhYmUd1Chjclmg8Qj+R34Mk/6o9vstaVVjDevk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cBwsi3nspFGQ+Zcaf07hLFV9MUMcPzSNvZdSVqHHq6+xsp0lbYzaL10O2SSPfgKsR
 tv9W+cyaA96DW9Irw5kpvTNp3lP/vgFbX5hqPKASNUBrxHq1sdrLCEULembBIK/FiP
 7uhsj82jjmiPgwvZ7mApOFODlIjjjeyaogjrxaoA=
Date: Tue, 30 Mar 2021 22:36:37 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor
 <natechancellor@gmail.com>, Arnd Bergmann <arnd@arndb.de>, kasan-dev
 <kasan-dev@googlegroups.com>, Linux Memory Management List
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4] kasan: remove redundant config option
Message-Id: <20210330223637.f3c73a78c64587e615d26766@linux-foundation.org>
In-Reply-To: <CAAeHK+zyv1=kXtKAynnJN-77dwmPG4TXpJOLv_3W0nxXe5NjXA@mail.gmail.com>
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <CAAeHK+zyv1=kXtKAynnJN-77dwmPG4TXpJOLv_3W0nxXe5NjXA@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_063642_344893_452B6414 
X-CRM114-Status: GOOD (  15.65  )
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

On Mon, 29 Mar 2021 16:54:26 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:

> Looks like my patch "kasan: fix KASAN_STACK dependency for HW_TAGS"
> that was merged into 5.12-rc causes a build time warning:
> 
> include/linux/kasan.h:333:30: warning: 'CONFIG_KASAN_STACK' is not
> defined, evaluates to 0 [-Wundef]
> #if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> 
> The fix for it would either be reverting the patch (which would leave
> the initial issue unfixed) or applying this "kasan: remove redundant
> config option" patch.
> 
> Would it be possible to send this patch (with the fix-up you have in
> mm) for the next 5.12-rc?
> 
> Here are the required tags:
> 
> Fixes: d9b571c885a8 ("kasan: fix KASAN_STACK dependency for HW_TAGS")
> Cc: stable@vger.kernel.org

Got it, thanks.  I updated the changelog to mention the warning fix and
moved these ahead for a -rc merge.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
