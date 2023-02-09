Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391A6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQirvFkXJNys2L/QVLtaaVUPThdd0nYg4wfN1XkQF9k=; b=FhnbLCSUv0Tf/dX0BL3AYmgB1+
	GfqqFJYOLk5qyala9LMwWCNwh+FCercWiYMbdsRfGwkzZOyXe0fq6pzzuM5v80Cfz4R3i0luAROLe
	KJN4jv7gv9kE3tabC0V/reNIvqm+hxeouel3PNHBiNspB3S0v3DPn1tCQUpR8IQUrG5LXo5NytQBm
	Jvw/rQ0vEvGJ+KRuAylWNc2OsP+G13U6NHTL2K+jfIxXTryhCZAeF5t6KDRTTKrEsIJYcNRikOW9y
	LIf0lsdcda/ZUdrkFnQ3MUFe8hUpHrtk7EAAb8V7s3Rl/4Qlw+rV4cf8ITvJW1u3jvo6b8c7oZ/5P
	iN7hIibw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCws-0033Af-Bc; Thu, 09 Feb 2023 19:51:14 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCwi-00338G-Qt
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 19:51:06 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-52bdbd30328so39486757b3.8
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 11:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sQirvFkXJNys2L/QVLtaaVUPThdd0nYg4wfN1XkQF9k=;
        b=TJcF2CUbuaWP2iDAiOYLqAAkSYwbwKGvbvBVFGLWm6YOtCZlzrSZhhje+1MAJUgGKt
         DM3TUSgtiWWdKAnGIaiCAb5mmxEcfXcpS6hN7y8xEYoP0LVPqANMBoRFUYn/G/SBmMV6
         NvEiIfMhuuIBXKQ8AsfgRyPgMJ3MEbqbTwkHj612+QFEc7UmlWegiziMU6NJT3jPq47+
         Omm9MVnqFvUklKa0811m5IL8doDzl+mcBamcfd8bu+DSiwzTHPn9SVZq1p2xIzlINFHt
         w8/4mc//+jMZ2ADKn4RsxqcWG8s7Ul/bB3B99UMK33KRuGNvcBUQu614BQYcsQcgmy88
         EkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQirvFkXJNys2L/QVLtaaVUPThdd0nYg4wfN1XkQF9k=;
        b=IIc42PO/Ky14pulf1NjnVMdfB8JHgt2Kyb4gsDpb/2GObIg+gexENspty+fX26y+Gc
         ofDGCK9jS0WQaxVbZ73E9qy7ORfZyXc/q9vqNYfIDgVSd6/5js4yIJU7sDEe6VnmeHFU
         3rb5fB0dF3j0PrqdnP9iOs0pnpL0LZAjPocbG5FWiWtUYy6lIEHZB1BfWFesdyGZk1Wk
         5fJphg7e5PT7rJksEHVSQjbu34YIm9eN06oOs5qbnMPbMMBx5DEKR84CS7xqALCCeq8I
         GWYBKdXTlF+346kdH9RbrFZAWA25pCbw2sM+5AkftDunwcZi0Xo43B4MMA/LFuAwZNfI
         bQwQ==
X-Gm-Message-State: AO0yUKWklKUEryScdUyGgivPL83qwsn1FrgL1TEhiwrCULKkSe8k0gx0
	kqKA0o1iFXFqFZaFYrTgoyNGMTD86MvjKmu4aEv9
X-Google-Smtp-Source: AK7set/tuNoRXCYBdZYRG8v3DyGqWC26c5R3O53w8gFYK+KKegGlSCWqmDNDCSgAtMiDiDZsg4p551wirLwuT+nG8V0=
X-Received: by 2002:a0d:d5ce:0:b0:506:6e0b:7441 with SMTP id
 x197-20020a0dd5ce000000b005066e0b7441mr1279691ywd.208.1675972261271; Thu, 09
 Feb 2023 11:51:01 -0800 (PST)
MIME-Version: 1.0
References: <20230208094813.20874-1-walter.chang@mediatek.com> <fdcea75c-1ddf-c4f4-5d46-f32a6619b66d@linaro.org>
In-Reply-To: <fdcea75c-1ddf-c4f4-5d46-f32a6619b66d@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Thu, 9 Feb 2023 11:50:49 -0800
Message-ID: <CANDhNCp6esdor4kDDTDowkKRfRN9QW8Au7uJMhsxyw0eAG4i8A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Support timer drivers as loadable modules
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: walter.chang@mediatek.com, Thomas Gleixner <tglx@linutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_115104_877126_C36243D2 
X-CRM114-Status: GOOD (  16.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 9, 2023 at 7:36 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>
> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
> > From: Walter Chang <walter.chang@mediatek.com>
> >
> > This patch exports functions in kernel so that timer drivers,
> > such as timer-mediatek.c can become loadable modules in GKI.
>
> What for ?

In general, it's the same reason why modules exist: We want to be able
to support a wide array of devices with a single kernel, but we don't
want all devices to pay the memory cost of code that will never be
used there. So being able to support loading device-specific bits like
clocksources (along with other device specific logic) helps.
Obviously it still has to make sense, and others have raised concerns
of stability issues if the hardware support is needed before we can
get to module loading, but I think if this allows drivers (such as
timer-mediatek) to be loadable safely, I see it as beneficial.

(And as others pointed out:  this patch series is incomplete as it
doesn't modularize the timer-mediatek driver, which would be a prereq
to supporting it upstream)

thanks
-john

