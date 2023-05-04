Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8409FC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=; b=PfotS0iTvJO+o2jks+gmjk8DeW
	wiDIX/u190qPerbdJWhtj+3qdCsE0PBI6e81w8/+/g0ALoGqwyGtfydbd5ip5gsx4aTZrMaHje61c
	vLuVegis9UUpFyXqISaij4vGtz/GQ1X3dOrTrrlWYa76ysJA0aRQQBINcyryd3wJf1uiqORpKMWy2
	oUvBAXLtacp36uIHrP8PGD4rnq7MxAT8eaZIH8bDLx5JiwempZW8lPZLZervlLqdLzUphHbh18xhs
	4+vPrO8tSIZ9SziaWBmloWB7dn3W+f1jRQFSOtvZHPtUq1z1AlmT7IzJq5/kU5Tbr54VJ2AiVdyEr
	hbgiOh7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puhSZ-009DN5-10;
	Thu, 04 May 2023 22:29:59 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puhSW-009DLS-1l
	for linux-mediatek@lists.infradead.org;
	Thu, 04 May 2023 22:29:57 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3ef33f12995so5161301cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683239392; x=1685831392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=;
        b=brmWvifc4vUjDlUYpOIJEa3hZAXArDfIWwAUAH9aKbp/ycmT192F6ss608WxBUwFRs
         iJP+zzhQmiXtzk+1feOO8N/qEinyPpPvouyQ+Sop5fvG9x+T5Sp6VMxGEC8/ZXHHq6UG
         nfBvGv4npF5tjh+nYJHcAc7tB/TZi30ozurtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683239392; x=1685831392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4uBgz0yZBTHWQuliVmtKoGkSIHeFOTfO6AJGNbOg9A=;
        b=G2ERdZBp72y99GDsR0IsIsPJVxRdIcZQf+ux7kP9aRsO88TxXiGnBB8tkTHLGN/ZOE
         oedy1ZgoItwQM67uHfJOIjbDLtZOCyk62GkNjrLrlCcyyBQ/UVQqH6Ft5IEqy8NhhbMn
         8ausUR0o2jNpR1VHg906NBIFfXwExKVA8+rm26x29nagFHyYkbtmoj7vwFQ/T2v4XQ7U
         OPiDfldsO+Dd6F/WZQWQwIvm20GJ3S5KKa89pFTs1IF4/HdIa7ovayol6XtMEjrJd1Wd
         hQCDDEjoc4amggs2ifs3DFfGT1lCBWL9uGMS4dIV37utOSdb+Pk7q/imLo0fjzLgmGB3
         aMdg==
X-Gm-Message-State: AC+VfDx3S/H4BS1nG+PquYUwD9NlacygjdG+YEZMPgYKIiDbwXwTK2ok
	7aiqRd6TgVhgZtxPsQbS2HNud84snIfPqbu5nw0=
X-Google-Smtp-Source: ACHHUZ4zpDqvJCTWDUkqfUvNQW/XJ8RPio1Kw64x1iLpiyy738v7YbHOHhe+r+r7Ic6W+Q/hroEbYw==
X-Received: by 2002:a05:622a:492:b0:3ef:3541:4362 with SMTP id p18-20020a05622a049200b003ef35414362mr8683967qtx.4.1683239392668;
        Thu, 04 May 2023 15:29:52 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id p26-20020a05620a133a00b0074e1ee30478sm138309qkj.37.2023.05.04.15.29.51
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 15:29:52 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f0a2f8216fso888831cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:29:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1487:b0:3f3:75c2:7466 with SMTP id
 t7-20020a05622a148700b003f375c27466mr43810qtx.8.1683239371523; Thu, 04 May
 2023 15:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <ZFErmshcrcikrSU1@alley>
In-Reply-To: <ZFErmshcrcikrSU1@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:29:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UVFR5YvJ8QrZ8YYPpwzYeymuy_JhcmZknbwUXg9njoGA@mail.gmail.com>
Message-ID: <CAD=FV=UVFR5YvJ8QrZ8YYPpwzYeymuy_JhcmZknbwUXg9njoGA@mail.gmail.com>
Subject: Re: shared code: was: Re: [PATCH v3] hardlockup: detect hard lockups
 using secondary (buddy) CPUs
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Sumit Garg <sumit.garg@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Ian Rogers <irogers@google.com>, 
	ravi.v.shankar@intel.com, Marc Zyngier <maz@kernel.org>, linux-perf-users@vger.kernel.org, 
	Stephane Eranian <eranian@google.com>, kgdb-bugreport@lists.sourceforge.net, 
	ito-yuichi@fujitsu.com, linux-arm-kernel@lists.infradead.org, 
	Stephen Boyd <swboyd@chromium.org>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ricardo.neri@intel.com, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Chen-Yu Tsai <wens@csie.org>, 
	Andi Kleen <ak@linux.intel.com>, Colin Cross <ccross@android.com>, 
	Matthias Kaehlcke <mka@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Tzung-Bi Shih <tzungbi@chromium.org>, Alexander Potapenko <glider@google.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Juergen Gross <jgross@suse.com>, 
	Kees Cook <keescook@chromium.org>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Liam Howlett <liam.howlett@oracle.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>, Zhen Lei <thunder.leizhen@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_152956_598606_44EF105A 
X-CRM114-Status: GOOD (  21.57  )
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

Hi,

On Tue, May 2, 2023 at 8:26=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> > +int __weak watchdog_nmi_enable(unsigned int cpu) { return 0; }
> > +void __weak watchdog_nmi_disable(unsigned int cpu) { return; }
>
> Honestly, the mix of softlockup and hardlockup code was a hard to
> follow even before this patch. And it is going to be worse.
>
> Anyway, the buddy watchdog is not using NMI at all. It should not
> get enable using a function called *_nmi_enabled().

Thanks for your review! I'm not going to individually reply to all
your comments below, but I've sent out a v4 [1] where I think I've
done a semi-decent job of making this a little cleaner (not perfect,
but hopefully a step in the right direction). Please take a look.

[1] https://lore.kernel.org/r/20230504221349.1535669-1-dianders@chromium.or=
g


> Also some comments are not longer valid, for example:
>
> static void watchdog_enable(unsigned int cpu)
> {
> [...]
>         /* Enable the perf event */
>         if (watchdog_enabled & NMI_WATCHDOG_ENABLED)
>                 watchdog_nmi_enable(cpu);

Ugh, after I sent the new version I just realized that I missed
updating the above comment. :( If I need to send a v5 I can update it
then, or if v4 lands I can send a follow-on patch to update that
comment. My eyes are glazed over enough from trying to organize a
17-patch series, so I somewhat imagine it's not the only comment I
missed...

-Doug

