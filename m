Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7FBC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:19:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30A422211
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 07:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3Nolwslv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ojRsscfI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30A422211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bFY2TsxZkd8hZlkPue7tDDp70tB8W3wE2oBRU3K1HCY=; b=3NolwslvNZhJqrIUnMCaOWQT6
	TPzAs4zzxqeC7J/TqVzkdVVGlLcF55KPNerj1/YOiQCym4mdcKhvgpe+KX/ULlqYddUYK0YjtHZTy
	+VifcMn8Lx4C7hlfo/W2dXGHv2c6tWUX+6l9AgQSVlkcCVOHH0jjhtD0vvUhL7tFUAdyAtw6R7FJX
	kKkmU8vyppEm59A5Ld9+rJEqYBSIW+lEtM388o2iLqGYBinAw+FbXHXgWzrV5EtydP+4iVThPvWI+
	wwz3SLCpfKIsRvr9xV4IcKQlMLY8hobHghwlRnKkNykwFwcrOFcmpZ7U+lBYd2NcvSRErQQCmQdBI
	WsCw0IiiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLi0V-00080S-LD; Fri, 25 Sep 2020 07:19:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLi0R-0007z0-12; Fri, 25 Sep 2020 07:19:00 +0000
X-UUID: 1d4a0b0b06cd41299470efbe4cc70bf3-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+dWfAWVSC8G82KV3JSBP7Prglhd5Yr0C7+OX0zeM2BU=; 
 b=ojRsscfIzTXQLgXYBEn2hJnJi4bPMNVbwMB8Oc9SDnJp2Cg7GmME9bG68g5h49B6+v7EVNFdVW/YCsozJYSHE6fl+wb3P7KS4LVBlTiwdHWmb5/aDytI5CMF8/IM+xD/js94Cq4xBNoNwFFBAuE/Um+FMKZ5e6bsUhz/f15WYTI=;
X-UUID: 1d4a0b0b06cd41299470efbe4cc70bf3-20200924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 897084481; Thu, 24 Sep 2020 23:18:47 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 00:18:45 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 15:18:42 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 15:18:43 +0800
Message-ID: <1601018323.28162.4.camel@mtksdccf07>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Fri, 25 Sep 2020 15:18:43 +0800
In-Reply-To: <87h7rm97js.fsf@nanos.tec.linutronix.de>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
 <87h7rm97js.fsf@nanos.tec.linutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3C3089F7FF02F5E21612A0E8793CCC1F5A4AAE300078785DD5266310F77958DD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_031859_197625_FBF88757 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, 2020-09-24 at 23:41 +0200, Thomas Gleixner wrote:
> On Thu, Sep 24 2020 at 12:03, Walter Wu wrote:
> > When analyze use-after-free or double-free issue, recording the timer
> > stacks is helpful to preserve usage history which potentially gives
> > a hint about the affected code.
> >
> > Record the most recent two timer init calls in KASAN which are printed
> > on failure in the KASAN report.
> >
> > For timers it has turned out to be useful to record the stack trace
> > of the timer init call.
> 
> In which way? And what kind of bug does it catch which cannot be catched
> by existing debug mechanisms already?
> 

We only provide another debug mechanisms to debug use-after-free or
double-free, it can be displayed together in KASAN report and have a
chance to debug, and it doesn't need to enable existing debug mechanisms
at the same time. then it has a chance to resolve issue.

> > Because if the UAF root cause is in timer init, then user can see
> > KASAN report to get where it is registered and find out the root
> > cause.
> 
> What? If the UAF root cause is in timer init, then registering it after
> using it in that very same function is pretty pointless.
> 

See [1], the call stack shows UAF happen at dummy_timer(), it is the
callback function and set by timer_setup(), if KASAN report shows the
timer call stack, it should be useful for programmer.

[1]
https://syzkaller.appspot.com/bug?id=34e69b7c8c0165658cbc987da0b61dadec644b6b


> > It don't need to enable DEBUG_OBJECTS_TIMERS, but they have a chance
> > to find out the root cause.
> 
> There is a lot of handwaving how useful this is, but TBH I don't see the
> value at all.
> 
> DEBUG_OBJECTS_TIMERS does a lot more than crashing on UAF. If KASAN
> provides additional value over DEBUG_OBJECTS_TIMERS then spell it out,
> but just saying that you don't need to enable DEBUG_OBJECTS_TIMERS is
> not making an argument for that change.
> 

We don't want to replace DEBUG_OBJECTS_TIMERS with this patches, only
hope to use low overhead(compare with DEBUG_OBJECTS_TIMERS) to debug
use-after-free/double-free issue. If you have some concerns, we can add
those message into commit log.

Thanks.

Walter
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
