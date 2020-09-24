Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CEFC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 21:41:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68C13239CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 21:41:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WQNT2GCM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s9aB8dgH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vCvDhw1z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68C13239CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=71ZZHaBfueKcFXhWtgWn0lAOkH5EpbePtJHhmrmgsgg=; b=WQNT2GCMzKN7BqotFlqsWtqJ6
	Cm/nYfjFceWTAGJ8fpGaXFYC363UwLIP/sGX24MfQoGc9V7wy4eegiCDK1vRjvvC5eedNIVOdaN7r
	7irI9u0eizyFdUHXeNqBu5JdETq7k6IjKzqWFCr8wA86fLSswY04TQHIzFmzjxMwfS044fw4kSwK7
	GLtES9b+f7j5lAf3/Twgdv8ZoXlei9YwLBzlAbeuT1cIJagfNV6Z1six4+vSG/yjSaF2RH9A1bWmG
	v0fINxE/Egy+bl8GlphXumFOrK7WGqZu1Vw8+y5t0NVcERSr06eHkOUo7OBkIMH+7XtXcUv65DFjH
	KaiVO2ktg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLYzg-0006al-8c; Thu, 24 Sep 2020 21:41:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLYzb-0006ZS-5e; Thu, 24 Sep 2020 21:41:32 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600983687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PH7EM+jC9sAvN+hNyU7Ecq4szctd2TEmbXpjLXpwHLk=;
 b=s9aB8dgH+LEJxttQJWGE11+AGwucCe4uEwpFHGxM5Il9nb81ncN7r8Hx+3OJ4kNyYgM9dO
 kDfcog9G7Ae/sxkBpu4vLApMbwWN5le+lk70lojuOGsLJL9W9c6CKNvdQeBi3D7xvEu3cQ
 FOU6VlOqEjjJ5knJS9TSLoCP2sg04q4KZmCPxRcRB/WFQb8j9hv6/jKLOJw0xJ8dXflnix
 X4/ncxiUBavxFpN/gfRiblq6Sk192R/KgwTsfJX7aKtPEOTLzvHHMMr2igcXsG8uge6sN0
 byXLKaFRd6o/zeeXaTJuGR7U5fRMTbVuR4LHKBHGLiXrhaCRWJQQiu7ZdRW4rQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600983687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PH7EM+jC9sAvN+hNyU7Ecq4szctd2TEmbXpjLXpwHLk=;
 b=vCvDhw1zpzFDJBuOG8UL0KkN9R1JI3ss+WSRGs73GkIopLFT6yj1AwBS6aQnWh9Fqt8jHQ
 pkn9QBcJV5uqC/CQ==
To: Walter Wu <walter-zh.wu@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Stultz <john.stultz@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Marco Elver <elver@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
In-Reply-To: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
Date: Thu, 24 Sep 2020 23:41:27 +0200
Message-ID: <87h7rm97js.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_174131_713790_BD0A5A2A 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, Sep 24 2020 at 12:03, Walter Wu wrote:
> When analyze use-after-free or double-free issue, recording the timer
> stacks is helpful to preserve usage history which potentially gives
> a hint about the affected code.
>
> Record the most recent two timer init calls in KASAN which are printed
> on failure in the KASAN report.
>
> For timers it has turned out to be useful to record the stack trace
> of the timer init call.

In which way? And what kind of bug does it catch which cannot be catched
by existing debug mechanisms already?

> Because if the UAF root cause is in timer init, then user can see
> KASAN report to get where it is registered and find out the root
> cause.

What? If the UAF root cause is in timer init, then registering it after
using it in that very same function is pretty pointless.

> It don't need to enable DEBUG_OBJECTS_TIMERS, but they have a chance
> to find out the root cause.

There is a lot of handwaving how useful this is, but TBH I don't see the
value at all.

DEBUG_OBJECTS_TIMERS does a lot more than crashing on UAF. If KASAN
provides additional value over DEBUG_OBJECTS_TIMERS then spell it out,
but just saying that you don't need to enable DEBUG_OBJECTS_TIMERS is
not making an argument for that change.

Try again please.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
