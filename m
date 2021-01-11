Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810D7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:30:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4019022473
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 19:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4019022473
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=srAgfLFT8jdtjdZ7YW5dG8qW//HKd0qYhQbDvGYjImo=; b=FsYZWkuGngMQlJL7N0mxDgTw7
	gc1pgPymEVENLSmchOP6SXdOT1ttT1vLMgzW/2rDJC8RY/G2+FsZy5qHHDpmnV6RjH8ZMatCMc8+b
	OhFrpOml/cgE/OuDPL1VVV+wKfPzjVBBbQ15tofGbk8Zbe5h7A1wygoIaCzJ9nHUc1bNkU80czD43
	ARg+kGcmLgyYikFp4jLfx0aou5faCLt2OLu1kr1BJsA1loVBxGVqC8cjMVPS+C42S/V+DmpTD1raa
	Wm3IJU0fKLAAFKkY8Y5aFRzXhKHpIzMB4lY7T8TgFryVVgjZwYu9kXk7w7rAtaJdOrSkYYm/oGUMu
	J2lj2frzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz2to-0002Ak-Kf; Mon, 11 Jan 2021 19:30:44 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz2tl-00028f-Tx
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 19:30:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id p18so301111pgm.11
 for <linux-mediatek@lists.infradead.org>; Mon, 11 Jan 2021 11:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qo2fQAXd+OsMiLPHSUfSpNVkpbDbRR3kE8tJYakNl9E=;
 b=ax0g20+io9+hknWBPpMxAQv86e3BV9BnGMFgIqXJ9pFv1sGGayp8i3795ZIxSkMX8w
 sbhmLQZbNam8/SGqG8EAQzIj2k55phmPp6LF3oUCv0Ys+SZvKDJPdZpq7/YAVAXY8s62
 c+LidHl99KI5JXqsljDZrcrpJPEMVXH4vAL6MtI56FSRor4vCDSD3vv0bg3IWq5cVANZ
 GLDHUEO3zwD0hgxSKUdlCf1dsNIbmaiekqEHoyzlSXmDfWpvhMESBCOXOTlLrxsfjlJv
 Y8Y43ATIACr24S3GqGb6p3pg5RaYkhN0eHtAvg/DD7XAGQCRN6gUP267twpShI2WGMvP
 QX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qo2fQAXd+OsMiLPHSUfSpNVkpbDbRR3kE8tJYakNl9E=;
 b=M0ujGaoXX4TXq96Dute0Pw4Yh52NYrJRtGxcKs/ffrb76zt4me+fBLa5GFypEbfG7Z
 No6igN/+VnGkf6CyPC4SjIqmGNXkgQvJh28yLLvI2qHRahbJSlczPN31Fh5jhaequE9e
 B3tX9CnmqJFV/9cZbmU/W+vUIVFl3L9l847+u1g3TSNX3WMV+BMdU/CMVPqBOpQtUwZ+
 bifhMi4ivMl4J8V4KC3OCmoox01gHtXv/e8Lvroz98sWT7N7jxBXjhRCiVIPJK3vymS0
 qDn2Fqan/LfzLPHgWi7OALfNKTBQm7QVR19K6rqb3shYV4jsnLwZuvPxUbJrCLqesj+M
 Uwfg==
X-Gm-Message-State: AOAM533n7oqoK5xiP8Y2UhZZQdNRkkVjwNTrQeUBMuZ8DC/4ndZLSAcx
 m9huV1K6nxMnnHPi8S27+E3pPVjnH0OFEB0WGWfFhQ==
X-Google-Smtp-Source: ABdhPJxfnVekwDDs7W26tTKMU0LtLEZSR7eufar20rcVzDPc4DtJT/9lOoaOHA5Sf6AozuXRQZaWL4OnIHnX0NlzO/4=
X-Received: by 2002:a62:e309:0:b029:1ae:5b4a:3199 with SMTP id
 g9-20020a62e3090000b02901ae5b4a3199mr927134pfh.24.1610393439604; Mon, 11 Jan
 2021 11:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20210108040940.1138-1-walter-zh.wu@mediatek.com>
 <CAAeHK+weY_DMNbYGz0ZEWXp7yho3_L3qfzY94QbH9pxPgqczoQ@mail.gmail.com>
 <20210111185902.GA2112090@ubuntu-m3-large-x86>
 <CAAeHK+y8B9x2av0C3kj_nFEjgHmkxu1Y=5Y3U4-HzxWgTMh1uQ@mail.gmail.com>
 <20210111191154.GA2941328@ubuntu-m3-large-x86>
In-Reply-To: <20210111191154.GA2941328@ubuntu-m3-large-x86>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 11 Jan 2021 20:30:28 +0100
Message-ID: <CAAeHK+x5VaQ5U4G0pei7Bzf6CWcz+BqADj411rd9P6b=j4uNvw@mail.gmail.com>
Subject: Re: [PATCH v3] kasan: remove redundant config option
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_143042_005318_46F2C8E7 
X-CRM114-Status: GOOD (  20.74  )
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

On Mon, Jan 11, 2021 at 8:11 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 08:03:29PM +0100, Andrey Konovalov wrote:
> > On Mon, Jan 11, 2021 at 7:59 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > > > -config KASAN_STACK_ENABLE
> > > > > +config KASAN_STACK
> > > > >         bool "Enable stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
> > > >
> > > > Does this syntax mean that KASAN_STACK is only present for
> > > > CC_IS_CLANG? Or that it can only be disabled for CC_IS_CLANG?
> > >
> > > It means that the option can only be disabled for clang.
> >
> > OK, got it.
> >
> > > > Anyway, I think it's better to 1. allow to control KASAN_STACK
> > > > regardless of the compiler (as it was possible before), and 2. avoid
> > >
> > > It has never been possible to control KASAN_STACK for GCC because of the
> > > bool ... if ... syntax. This patch does not change that logic. Making it
> > > possible to control KASAN_STACK with GCC seems fine but that is going to
> > > be a new change that would probably be suited for a new patch on top of
> > > this one.
> >
> > The if syntax was never applied to KASAN_STACK, only to
> > KASAN_STACK_ENABLE, so it should have been possible (although I've
> > never specifically tried it).
>
> CONFIG_KASAN_STACK was not a user selectable symbol so it was always 1
> for GCC.

Ah, indeed.

Thanks for the clarification!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
