Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9165C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 08:56:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2797120878
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 08:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zkd64Hyl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Byg4yL3t";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UBbd3YTV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2797120878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tn2CmdbSMlMhTWJzHF5Oon24kX51U9S46LeXZ34Wcm4=; b=Zkd64HylaGvtkDRunTvj6usIO
	0HE3BTl/e8KyMgbJ0gVSpy6tpUUq6MMHzHRI8T7UNZ7N9F2Z3aZVXDevdp2RSGYBejk9UJtp4QQUs
	DvbWueaSY8+f7hLuL89Aw1fPqpVPzjUg4O4RYINO88GbGuaqKtHRuFmp6yBniDhDt+vPFdDKodqS3
	Mu7xDDIXt6j/CLG5sHDnFl7itTWJBQeInK5mJPT7uFXjC/RhB58fyFM6vpH3mBcfvZ2ftIz4qwquC
	M14taWtCo11I/1ost2gFDi5HZAXZAWgJxEK1sBUmqTWm7oMkrqapw+X0vrz30WDRGotqTOM4+ifwV
	5enNmBAjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjW8-0007M4-A9; Fri, 25 Sep 2020 08:55:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjW2-0007JX-Jk; Fri, 25 Sep 2020 08:55:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601024139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27rpXJWZJemqCR5/J+kJk/Ytwunk5JlcbUzkum+S4N4=;
 b=Byg4yL3te8ivcMS4F2H8gOSQgqsZFJMj7/3QGL1zpD+Uh7rAUCaut5ynvf9S5fDMomckOp
 U5NB52hUfA2U6b3+cKPcx4a4SV0DKzu47kDUHuaXyQB3h6c/zTi8HkZRbpHchKrjOmVKvR
 WzM0VPP/baGMhhiSoGWCH7oiH6uphutlfMaExg5R4H/NBJYE84qYc+05sJbCMCS2sXrWk6
 NXtbO2rgbxrUFvRLlnR3+pdP0qO+xTGpIX12bTcavQl+D3AQI1oN0JuV/sUI9EqoYPq6eT
 ZniwmFxZjcNhCpZY1YxANngzOLk9EIUxSeG+WYk4sDTAGTYDDj4qVSROVGOvWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601024139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=27rpXJWZJemqCR5/J+kJk/Ytwunk5JlcbUzkum+S4N4=;
 b=UBbd3YTV3lBvSjOcMTIlxl7PlmxXWJcM7BthmUp44vKv9Dy511FWWrHXVYtIyr0/6UCITS
 jzGULCttqvgHCcDQ==
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
In-Reply-To: <1601018323.28162.4.camel@mtksdccf07>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
 <87h7rm97js.fsf@nanos.tec.linutronix.de>
 <1601018323.28162.4.camel@mtksdccf07>
Date: Fri, 25 Sep 2020 10:55:39 +0200
Message-ID: <87lfgyutf8.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_045543_216445_BE23E2B7 
X-CRM114-Status: GOOD (  18.08  )
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
 Stephen Boyd <sboyd@kernel.org>, Alexander Potapenko <glider@google.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 John Stultz <john.stultz@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Andrey Konovalov <andreyknvl@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Walter,

On Fri, Sep 25 2020 at 15:18, Walter Wu wrote:
> On Thu, 2020-09-24 at 23:41 +0200, Thomas Gleixner wrote:
>> > For timers it has turned out to be useful to record the stack trace
>> > of the timer init call.
>> 
>> In which way? And what kind of bug does it catch which cannot be catched
>> by existing debug mechanisms already?
>> 
> We only provide another debug mechanisms to debug use-after-free or
> double-free, it can be displayed together in KASAN report and have a
> chance to debug, and it doesn't need to enable existing debug mechanisms
> at the same time. then it has a chance to resolve issue.

Again. KASAN can only cover UAF, but there are a dozen other ways to
wreck the system with wrong usage of timers which can't be caught by
KASAN.

>> > Because if the UAF root cause is in timer init, then user can see
>> > KASAN report to get where it is registered and find out the root
>> > cause.
>> 
>> What? If the UAF root cause is in timer init, then registering it after
>> using it in that very same function is pretty pointless.
>> 
> See [1], the call stack shows UAF happen at dummy_timer(), it is the
> callback function and set by timer_setup(), if KASAN report shows the
> timer call stack, it should be useful for programmer.

The report you linked to has absolutely nothing to do with a timer
related UAF. The timer callback calls kfree_skb() on something which is
already freed. So the root cause of this is NOT in timer init as you
claimed above. The timer callback is just exposing a problem in the URB
management of this driver. IOW the recording of the timer init stack is
completely useless for decoding this problem.

>> There is a lot of handwaving how useful this is, but TBH I don't see the
>> value at all.
>> 
>> DEBUG_OBJECTS_TIMERS does a lot more than crashing on UAF. If KASAN
>> provides additional value over DEBUG_OBJECTS_TIMERS then spell it out,
>> but just saying that you don't need to enable DEBUG_OBJECTS_TIMERS is
>> not making an argument for that change.
>> 
> We don't want to replace DEBUG_OBJECTS_TIMERS with this patches, only
> hope to use low overhead(compare with DEBUG_OBJECTS_TIMERS) to debug

KASAN has lower overhead than DEBUG_OBJECTS_TIMERS? Maybe in a different
universe.

That said, I'm not opposed to the change per se, but without a sensible
justification this is just pointless.

Sprinkling kasan_foo() all over the place and claiming it's useful
without a valid example does not provide any value.

Quite the contrary it gives the completely wrong sense what KASAN can do
and what not.

Thanks,

        tglx


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
