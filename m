Return-Path: <SRS0=mAey=JI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD81C433ED
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 22:03:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A2D60201
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Apr 2021 22:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A2D60201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=twqu8dzJb7vwqIv6fE64zjNl+prvgl2npf7GAyGVs2Y=; b=qSceM6RRUjn+IZdwjaI4gmOZj
	eubOm7QwWstYNeHP+REDGS7g8ABIsV+3WA/tP7qCIzjUWsftEFzAySTAu+mcT45u+GCSRpBZ4g4JT
	nCCxRY0Zzd1DrYa3cOxlLhStddD5yYjV2ngfXIpOTxn1N9ac9R22+E/qVH7Y9gxso3V+BUetpj9Ip
	jdB1fX+1aCSZnMiPsoGvoIlcE2WELxQfXMjn6WQ0UFT7KU0W2mlwnwK3CvAzN+rUoqAchIzFgzubm
	CR6SR7rsIXhxKpq6yuDovnNxsgJ/MvAc6WTN3c8WeKMwREvh/REtVxdNRqX2itXu3/EfW2Snsxh/U
	57GsUpl8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lViB8-005BZg-FC; Sun, 11 Apr 2021 22:03:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lViAu-005BZC-IP; Sun, 11 Apr 2021 22:03:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=pKgbfkgJ+Io7T9BvlIxsRcKSeSgsnh/PrgYOrtYRPyE=; b=VY6+kWVLVKrcnueNFTMKdoX7py
 8/Rdc+kP8BcQUPkrMkMLDknPJHERGq4OBtjgn5qOwZtA9uT7donXtsvHjh/Xd5R4gtgA+9Ku3kL++
 kNCaz7QXJo7C4FNqEgKRGvkIul9/NGsMut1TpjXUlLD1R38QV+KWwlN/eSWcoOoC12EkuiLlONF+U
 WVgLAJHg93IajufcORe5SwUrkM0xhzI2RKe3tLGArSHk6Uvy1+IuVD5dJEr707rv3iSiA61u83IA+
 uJCqetioRP47XxRWGBDXCBg8s/OxGqf773gKpGi5dVDr/vwR4vEzKvH6MgMEazrO2leNHviblqZfi
 o4V4RBsg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lViAr-005lJ3-8a; Sun, 11 Apr 2021 22:03:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE6AD610CB;
 Sun, 11 Apr 2021 22:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1618178599;
 bh=xr7Bko3nkY/hQzyR34sArUT+yy4zsjhEp/ERlDlaFfw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ASNK5lYWJnV08hEwZiPrc6I7AoSedfw99O8NVwSHpYtW/sKTUrJtRS1uIZR9R6wnF
 t038iXV/UBzK/JbJ/OAtnesctxvwAQ68TpuPYGu1G2sQbDxkDAosgxxY6G+aspKiwD
 d9vdXulvY0qHJo7ky7gEeulX+VJurJteIqXR1/1w=
Date: Sun, 11 Apr 2021 15:03:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrey Konovalov <andreyknvl@google.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>, LKML
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, wsd_upstream
 <wsd_upstream@mediatek.com>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4] kasan: remove redundant config option
Message-Id: <20210411150316.d60aa0b5174adf2370538809@linux-foundation.org>
In-Reply-To: <20210411105332.GA23778@arm.com>
References: <20210226012531.29231-1-walter-zh.wu@mediatek.com>
 <CAAeHK+zyv1=kXtKAynnJN-77dwmPG4TXpJOLv_3W0nxXe5NjXA@mail.gmail.com>
 <20210330223637.f3c73a78c64587e615d26766@linux-foundation.org>
 <20210411105332.GA23778@arm.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_150321_368327_D0CB59DF 
X-CRM114-Status: GOOD (  24.62  )
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

On Sun, 11 Apr 2021 11:53:33 +0100 Catalin Marinas <catalin.marinas@arm.com> wrote:

> Hi Andrew,
> 
> On Tue, Mar 30, 2021 at 10:36:37PM -0700, Andrew Morton wrote:
> > On Mon, 29 Mar 2021 16:54:26 +0200 Andrey Konovalov <andreyknvl@google.com> wrote:
> > > Looks like my patch "kasan: fix KASAN_STACK dependency for HW_TAGS"
> > > that was merged into 5.12-rc causes a build time warning:
> > > 
> > > include/linux/kasan.h:333:30: warning: 'CONFIG_KASAN_STACK' is not
> > > defined, evaluates to 0 [-Wundef]
> > > #if defined(CONFIG_KASAN) && CONFIG_KASAN_STACK
> > > 
> > > The fix for it would either be reverting the patch (which would leave
> > > the initial issue unfixed) or applying this "kasan: remove redundant
> > > config option" patch.
> > > 
> > > Would it be possible to send this patch (with the fix-up you have in
> > > mm) for the next 5.12-rc?
> > > 
> > > Here are the required tags:
> > > 
> > > Fixes: d9b571c885a8 ("kasan: fix KASAN_STACK dependency for HW_TAGS")
> > > Cc: stable@vger.kernel.org
> > 
> > Got it, thanks.  I updated the changelog to mention the warning fix and
> > moved these ahead for a -rc merge.
> 
> Is there a chance this patch makes it into 5.12? I still get the warning
> with the latest Linus' tree (v5.12-rc6-408-g52e44129fba5) when enabling
> KASAN_HW_TAGS.

Trying.   We're still awaiting a tested fix for
https://lkml.kernel.org/r/CA+fCnZf1ABrQg0dsxtoZa9zM1BSbLYq_Xbu+xi9cv8WAZxdC2g@mail.gmail.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
