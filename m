Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0ABC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C688422795
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C688422795
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pr/iCAz7roKYHJQJ1lwWja++lWbkeb/lo4krxDpeY5M=; b=q4tflhG+jER36es0zXckQShRo
	JsYKXwiAsZhCDfIxOuaL32layiXCHl7GqxVsOc6oUTfE1UvBReVxRvJplDO/L2uHgiaaFfFCaTrx8
	PTFT4BFm5EmkE2+7X+HVyI8LfZHYIn0AvIbZTMnSi+2uTYxvZ/CTTpg8u9QCfvTpdYuQTwDlv9fmZ
	bIyxN7efx/nq036qb/TVEsRX7wy0AWIfSqiqjUzCbh71IBVUe3PKJnV7h9AuV35c0J7uweQNEZYrS
	w2qeOktmsUAdRgZC91zXGSyXfUrKri2UQRrNArJT8qirMcJSi5VH3lnFmFRGFMuMpjXyXAJj7isX7
	2zKDR3g1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2Tp-0002Gq-TQ; Mon, 11 Jan 2021 19:03:53 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2Tf-0002CO-Ba
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 19:03:44 +0000
Received: by mail-pf1-x435.google.com with SMTP id a188so484995pfa.11
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Jan 2021 11:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0M90n7WjWo+X1yIVKHdOTyfvfwcWqL9tkBr22HLMVsY=;
 b=mQxWWfxrpoJqQpQ0teH0JWLWjRlCD6LzwnF9DaADN1VituMO7/JZhJSc19maKjmKa0
 XAhLsG6GziZLcTS2nrs4aZgJyR1MwzUKmkGihnYT4kRyKGczg0UL7kcyLDEfJM67gV4o
 C6Qe1DfX/qHHCoZSiQr1IC3yt5haB46iMoLbiVigq5Z4Wk9LZWV1EsqDj7jVKI0Idjm+
 9FgiQytvEQ6ZkCGZeiYITKvdh+L8AFRXr2eHwaMMEDY3+zyb7fJvMawbCCycvQOicRPY
 459LZinhBEH0OuPe0NVfJ99MWMN4iZoQOUkf3GKueztCB5U3p47j+G6zeNylLPU3TE3A
 l7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0M90n7WjWo+X1yIVKHdOTyfvfwcWqL9tkBr22HLMVsY=;
 b=DYFTR8YMgQbiJDiaWlE2+jSqaJbfICNFIDeCR+CY1lyG1Yi+aswO9QyNgBGBGeUzFZ
 6vtlSx5KNJjcvIPZXOeXMT0ysKYhKPGrc6llGyrZwAaT6SNdBJGo8Lhn7AsQeERoZkvI
 ibUrbuZTqyt9CEIegf0g62FcOuhiY+qmtv5aKfWiNFx17xOiH6uDKVQhQz1KZr8zSKho
 w6s6vVKviWsSQ0dAsaGyLxEWQuqpRc9+4MIE38AXfDPG+aIExJOI4trJe2tBqLmvZ0cD
 +c4wxW1A8pLLCbWSw+NUeDY0aec072dt0aBuuNwqrCtrVM8KBw6LMCDDt2IlDLuzhW/t
 oQfQ==
X-Gm-Message-State: AOAM5327cHcE3PAKUAHfP8Q0D3RP/u6tVQtEkWaC8XDwH8oRe++SeqFG
 Cj+Bt0bLPv5Y6p4mEaX8cwp0KP+JjKDmMqNTWvQ1dw==
X-Google-Smtp-Source: ABdhPJwE4imAaZmMhSvygLJ7bWjPPKzRbOvPeN2tNIIdl6OeQBhwMi9C6hF05YOIW4ESl/Tn4KeOeJ11tsXFRkISwUg=
X-Received: by 2002:a62:14c4:0:b029:19d:d3f5:c304 with SMTP id
 187-20020a6214c40000b029019dd3f5c304mr991822pfu.55.1610391820883; Mon, 11 Jan
 2021 11:03:40 -0800 (PST)
MIME-Version: 1.0
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+weY_DMNbYGz0ZEWXp7yho3_L3qfzY94QbH9pxPgqczoQ@mail.gmail.com>
 <20210111185902.GA2112090@ubuntu-m3-large-x86>
In-Reply-To: <20210111185902.GA2112090@ubuntu-m3-large-x86>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 11 Jan 2021 20:03:29 +0100
Message-ID: <CAAeHK+y8B9x2av0C3kj_nFEjgHmkxu1Y=5Y3U4-HzxWgTMh1uQ@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_140343_440829_B8E2230D 
X-CRM114-Status: GOOD (  15.70  )
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
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 7:59 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> > > -config KASAN_STACK_ENABLE
> > > +config KASAN_STACK
> > >         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> >
> > Does this syntax mean that KASAN_STACK is only present for
> > CC_IS_CLANG? Or that it can only be disabled for CC_IS_CLANG?
>
> It means that the option can only be disabled for clang.

OK, got it.

> > Anyway, I think it's better to 1. allow to control KASAN_STACK
> > regardless of the compiler (as it was possible before), and 2. avoid
>
> It has never been possible to control KASAN_STACK for GCC because of the
> bool ... if ... syntax. This patch does not change that logic. Making it
> possible to control KASAN_STACK with GCC seems fine but that is going to
> be a new change that would probably be suited for a new patch on top of
> this one.

The if syntax was never applied to KASAN_STACK, only to
KASAN_STACK_ENABLE, so it should have been possible (although I've
never specifically tried it).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
