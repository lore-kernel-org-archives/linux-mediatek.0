Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A9CC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:26:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81AE220738
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 09:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md1T0p1Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MHPfO+56"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81AE220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GqqkzahAHrZjwMJejhOhDzda47QLtII2ZOIDtrPNbRk=; b=md1T0p1ZbPNj1V6XG0T7AWota
	hyGEJ7YcPvEOIraY9sGwyKNSVbwBggCnTOBDEk1nRzRBtYt8nJw10kGuCW/yhfAktOmGjcc8fdhzz
	iAJft7gDYAKoB2jyLKJeey1lSampbgQrnztoIunnFVIAyFuSsY6DotoHIAfZe6HEwnHNH9HcWPYhA
	pWeJwsDWr9JG1cZjZjnr+FpHljVhUy1imQQD8BHOUiWWrXWM7Tx45z6oC8fWLdNGCLlYWQqE/tUKK
	boEjx2SOoxcwGrjMndqX7TMkx4YTqW3vnGeu88wa8aMiSdHL9EzNCH6BqHiVT84v4FhcAb3lsgIW5
	dWzW0ny4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjzS-0003RG-1X; Fri, 25 Sep 2020 09:26:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjzN-0003Pm-24; Fri, 25 Sep 2020 09:26:02 +0000
X-UUID: de2735e2efd04ab59b4642c31da2a7a8-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wYZQKOZQHIfcecchTzNpFHCWhysG2MkETQF4DKJWtpw=; 
 b=MHPfO+56Lvs0cVAsoafWeEXIVmcaD79P+HUVuF3Q0ob6Z/vMVS8TmJuszuiDLav5BTNcmgUpaRODTSuSx1/igM89HmaYzTnpfvfyxvKvId94eUL2bHcpjEZ9J7vyiQO41RboXPnAtjkExn8LDHBxqBJhaQUoQmKh0C/PhDVtrp8=;
X-UUID: de2735e2efd04ab59b4642c31da2a7a8-20200925
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 390051840; Fri, 25 Sep 2020 01:25:57 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 02:15:54 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 17:15:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 17:15:45 +0800
Message-ID: <1601025346.2255.2.camel@mtksdccf07>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 25 Sep 2020 17:15:46 +0800
In-Reply-To: <87lfgyutf8.fsf@nanos.tec.linutronix.de>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
 <87h7rm97js.fsf@nanos.tec.linutronix.de>
 <1601018323.28162.4.camel@mtksdccf07>
 <87lfgyutf8.fsf@nanos.tec.linutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 226A7A570B87CE4811210E74AF646C2772ABB9F1C3FA85FE059A86BBF585F5742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_052601_300871_F3B46519 
X-CRM114-Status: GOOD (  30.44  )
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
Cc: Marco Elver <elver@google.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Alexander
 Potapenko <glider@google.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Andrey
 Konovalov <andreyknvl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-25 at 10:55 +0200, Thomas Gleixner wrote:
> Walter,
> 
> On Fri, Sep 25 2020 at 15:18, Walter Wu wrote:
> > On Thu, 2020-09-24 at 23:41 +0200, Thomas Gleixner wrote:
> >> > For timers it has turned out to be useful to record the stack trace
> >> > of the timer init call.
> >> 
> >> In which way? And what kind of bug does it catch which cannot be catched
> >> by existing debug mechanisms already?
> >> 
> > We only provide another debug mechanisms to debug use-after-free or
> > double-free, it can be displayed together in KASAN report and have a
> > chance to debug, and it doesn't need to enable existing debug mechanisms
> > at the same time. then it has a chance to resolve issue.
> 
> Again. KASAN can only cover UAF, but there are a dozen other ways to
> wreck the system with wrong usage of timers which can't be caught by
> KASAN.
> 
> >> > Because if the UAF root cause is in timer init, then user can see
> >> > KASAN report to get where it is registered and find out the root
> >> > cause.
> >> 
> >> What? If the UAF root cause is in timer init, then registering it after
> >> using it in that very same function is pretty pointless.
> >> 
> > See [1], the call stack shows UAF happen at dummy_timer(), it is the
> > callback function and set by timer_setup(), if KASAN report shows the
> > timer call stack, it should be useful for programmer.
> 
> The report you linked to has absolutely nothing to do with a timer
> related UAF. The timer callback calls kfree_skb() on something which is
> already freed. So the root cause of this is NOT in timer init as you
> claimed above. The timer callback is just exposing a problem in the URB
> management of this driver. IOW the recording of the timer init stack is
> completely useless for decoding this problem.
> 
> >> There is a lot of handwaving how useful this is, but TBH I don't see the
> >> value at all.
> >> 
> >> DEBUG_OBJECTS_TIMERS does a lot more than crashing on UAF. If KASAN
> >> provides additional value over DEBUG_OBJECTS_TIMERS then spell it out,
> >> but just saying that you don't need to enable DEBUG_OBJECTS_TIMERS is
> >> not making an argument for that change.
> >> 
> > We don't want to replace DEBUG_OBJECTS_TIMERS with this patches, only
> > hope to use low overhead(compare with DEBUG_OBJECTS_TIMERS) to debug
> 
> KASAN has lower overhead than DEBUG_OBJECTS_TIMERS? Maybe in a different
> universe.
> 

I mean KASAN + our patch vs KASAN + DEBUG_OBJECTS_TIMERS. The front one
have the information to the original caller and help to debug. It is
smaller overhead than the one behind.

> That said, I'm not opposed to the change per se, but without a sensible
> justification this is just pointless.
> 
> Sprinkling kasan_foo() all over the place and claiming it's useful
> without a valid example does not provide any value.
> 
> Quite the contrary it gives the completely wrong sense what KASAN can do
> and what not.
> 

I agree your saying, so that I need to find out a use case to explain to
you.

Thanks

Walter

> Thanks,
> 
>         tglx
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
