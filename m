Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A85DC4727C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 22:59:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05CAE208B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 22:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rHlfWnzt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="i68A1tT8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2mWokoRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05CAE208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XDYGucfkt5Skvg8kYjJOBxnADzAK4EejpiG+61vLpjc=; b=rHlfWnztEFAvxVEa07DFoXu0U
	RPdLs8NxhOEmeiYj7rBDgszT6Np1gZ2nrTWaCXocgKgr4HzdZWisZ6MlPTJ55ioV3hfy6DivexZK8
	iXEvI6fLW5uqnLpAYnFBpmFy2iToRorGpZr1e9Z7xeO6bNGeJGYW10rj+vLT+27V1vqGoWU0Qe4BU
	GAPDNhcZmB0NY4ECa0gOGeaflE/N4WGvd4FXu/46Z6HitGhiT4un1ji1be50nyIf9OiIFB0aw2gf8
	a+Q+cOAi3UUcWLR7KN9ArboSmtSej7dP23IrFZ42Z0zABFd9oM2qSg+xNRNpjCL1tAk51RorEoTNL
	Rg68HlhBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLwgo-0004qs-SX; Fri, 25 Sep 2020 22:59:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLwgk-0004pn-8W; Fri, 25 Sep 2020 22:59:39 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1601074776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xNfIywwa8zLp7Ze2sUjIPjT6qUcXBaqd2I3y05VFQpk=;
 b=i68A1tT8A/9EgAmBPvJHilJ6RBDhd4/QF+g/MLgQuc/v1+mdbNY8WaeAszXaDnCric2Akk
 KmDZ/Lc1xD6A/6ODG9xAPKNYDDsBE2nybK5rmyc4G20JNX4edmbL7MriKBcYu4Q23Du+xq
 quDNOluI2E7ZWAPNm6p4t1HiWrnqxRvryKC5u45mpVVpm3XaICWRoRjC9Ob5ruJaf5l14a
 wpig8PghERkqsJaSQBkduAOY5R012KtRu5gwJBw+RvVGbKgjvY9LoakcRfmEYOb+sp/BET
 NRJu3zb0X3mD7QAmUifsEaNQWw0UUBUOt7xmVnnxT7WBSmHlm/dhxSfwMCwy5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1601074776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xNfIywwa8zLp7Ze2sUjIPjT6qUcXBaqd2I3y05VFQpk=;
 b=2mWokoRSIrGozji4bFmvucaPRe+NHLQXPr6rwiZVkAx2M7CgxaJ05sXDgjvu2vMLGeEZbx
 PCndjBlCAkGPwYDg==
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH v4 1/6] timer: kasan: record timer stack
In-Reply-To: <1601025346.2255.2.camel@mtksdccf07>
References: <20200924040335.30934-1-walter-zh.wu@mediatek.com>
 <87h7rm97js.fsf@nanos.tec.linutronix.de>
 <1601018323.28162.4.camel@mtksdccf07>
 <87lfgyutf8.fsf@nanos.tec.linutronix.de> <1601025346.2255.2.camel@mtksdccf07>
Date: Sat, 26 Sep 2020 00:59:35 +0200
Message-ID: <87wo0htqco.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_185938_446100_D6FC6086 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Sep 25 2020 at 17:15, Walter Wu wrote:
> On Fri, 2020-09-25 at 10:55 +0200, Thomas Gleixner wrote:
>> > We don't want to replace DEBUG_OBJECTS_TIMERS with this patches, only
>> > hope to use low overhead(compare with DEBUG_OBJECTS_TIMERS) to debug
>> 
>> KASAN has lower overhead than DEBUG_OBJECTS_TIMERS? Maybe in a different
>> universe.
>> 
> I mean KASAN + our patch vs KASAN + DEBUG_OBJECTS_TIMERS. The front one
> have the information to the original caller and help to debug. It is
> smaller overhead than the one behind.

For ONE specific problem related to timers and you have still not shown
a single useful debug output where this information helps to debug
anything.

> I agree your saying, so that I need to find out a use case to explain to
> you.

Indeed.

Thanks,

        tglx

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
