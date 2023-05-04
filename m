Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32014C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 May 2023 22:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=; b=D22o7nXp6aus6goqxNd3mpIie8
	vNgQOr6RI3Eo868amZ15SfM14DWIMhL1B+4llEa3U96R/kZLMnVhZFDHkHTJqUm1weVtK1UidbWBe
	NWRYCBzH2gKKzJx4JllJQQ4ePfv6MvnuSwmUNrjmA/fSpiPD3T7dp1oBbsZ4StJNXKhdEnpM/X4Za
	5gaYt2ruUXpjCts9QCYryHj67epMiJf/AQQg1fjupKuiwrfh8haHF93xny+aR0jr35CMwV3v1rm2W
	vZC891r536ojhTpBkLxkT9yauUZ8LU87UV0sUFtoJPMx8KVQCvfWbkqIHXiYgME0Fvn82u8Z5UiOg
	DAQk3gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puhLn-009CRc-0N;
	Thu, 04 May 2023 22:22:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puhLk-009CR0-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 04 May 2023 22:22:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6434440970fso1217528b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238975; x=1685830975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=;
        b=LKKWaJRNVVCunzbaPjeF2w9g/dNVNyM8xUMu/jaVngE0m9ml64RT2QdPJB+7zfePD9
         gfU1rfdyE2KBU0lo9wb7lpZ2iDfyUbsfmnR3njaJu1rtLblkBG29vgkj7Gpb3tn3kOtl
         8uZdjL0OsmQBe8gVy+UJJJBV1weqbgpzSjPuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238975; x=1685830975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzswV8h6Pv5RbnDUfs5XaziOPH7Dg5YP+9HIzH76G84=;
        b=Rx0elheTjuo2Ps4DE5VTsVDdgPLMuEakkL07bPghhj2Ch6zJAZtrp4pUDMfAgcoxqV
         AxburbslSTSGynaL6bVGy0YF5DvQmIYrRF1Os+RbW9cRlViIoOMK4jHBktlh/xuTbfkN
         SbDD08io3+gciLzdJYoFMaTF3A+EGmA+uQONdOZEH+sXxJjtG39PMZsUg57YCjhZJkfW
         SL9Zj1PSNOROXro7yQf+udChhkrEi9FhEy+rOdROSdaSzrRxcyjTeRHs66bejijWtB6G
         OI7F/rb2LQJ1OqVPcLpjCLZIi4wXOYy6rd4Mp2KBdSIMRZb4gr+Z9H+Gv+BmMOD9Ro7p
         fB8w==
X-Gm-Message-State: AC+VfDwR4mNjClT1J/EUsaKm51DyQvmB6Tfvzt0L9zIiBBU7kM3hLcWS
	1C6X1r+BK9yRfBuUr+EvsY20W9hrR+sIvDDeq5M=
X-Google-Smtp-Source: ACHHUZ7nAB8d3ukmAXG4UUuqrmG/wKswtq2Hg1l/xCBTtphhtWF0GAHXQP3eQB6votEl5bUASz7akA==
X-Received: by 2002:a05:6a00:23d0:b0:639:9089:798e with SMTP id g16-20020a056a0023d000b006399089798emr4398079pfc.19.1683238975273;
        Thu, 04 May 2023 15:22:55 -0700 (PDT)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com. [209.85.214.169])
        by smtp.gmail.com with ESMTPSA id s26-20020a62e71a000000b0064358d032a4sm149949pfh.145.2023.05.04.15.22.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 15:22:55 -0700 (PDT)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1a950b982d4so491485ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 May 2023 15:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:144d:b0:3de:1aaa:42f5 with SMTP id
 v13-20020a05622a144d00b003de1aaa42f5mr10116qtx.15.1683238596262; Thu, 04 May
 2023 15:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230501082341.v3.1.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <ZFEqynvf5nqkzEvQ@alley>
In-Reply-To: <ZFEqynvf5nqkzEvQ@alley>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 May 2023 15:16:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1nqunM83LzSXnYiODC66tn5hjSWsUvxabf6vSO7reUQ@mail.gmail.com>
Message-ID: <CAD=FV=V1nqunM83LzSXnYiODC66tn5hjSWsUvxabf6vSO7reUQ@mail.gmail.com>
Subject: Re: cpu hotplug : was: Re: [PATCH v3] hardlockup: detect hard lockups
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
X-CRM114-CacheID: sfid-20230504_152256_399311_3FBEFA5A 
X-CRM114-Status: GOOD (  29.41  )
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

On Tue, May 2, 2023 at 8:23=E2=80=AFAM Petr Mladek <pmladek@suse.com> wrote=
:
>
> On Mon 2023-05-01 08:24:46, Douglas Anderson wrote:
> > From: Colin Cross <ccross@android.com>
> >
> > Implement a hardlockup detector that doesn't doesn't need any extra
> > arch-specific support code to detect lockups. Instead of using
> > something arch-specific we will use the buddy system, where each CPU
> > watches out for another one. Specifically, each CPU will use its
> > softlockup hrtimer to check that the next CPU is processing hrtimer
> > interrupts by verifying that a counter is increasing.
> >
> > --- /dev/null
> > +++ b/kernel/watchdog_buddy_cpu.c
> > +int watchdog_nmi_enable(unsigned int cpu)
> > +{
> > +     /*
> > +      * The new CPU will be marked online before the first hrtimer int=
errupt
> > +      * runs on it.
>
> It does not need to be the first hrtimer interrupt. The CPU might have
> been offlined/onlined repeatedly. The counter might have any value.
>
> > +      * If another CPU tests for a hardlockup on the new CPU
> > +      * before it has run its first hrtimer, it will get a false posit=
ive.
> > +      * Touch the watchdog on the new CPU to delay the first check for=
 at
> > +      * least 3 sampling periods to guarantee one hrtimer has run on t=
he new
> > +      * CPU.
> > +      */

OK, I've updated the above comment to:

/*
 * The new CPU will be marked online before the hrtimer interrupt
 * gets a chance to run on it. If another CPU tests for a
 * hardlockup on the new CPU before it has run its the hrtimer
 * interrupt, it will get a false positive. Touch the watchdog on
 * the new CPU to delay the check for at least 3 sampling periods
 * to guarantee one hrtimer has run on the new CPU.
 */

> > +     per_cpu(watchdog_touch, cpu) =3D true;
>
> We should touch also the next_cpu:
>
>         /*
>          * We are going to check the next CPU. Our watchdog_hrtimer
>          * need not be zero if the CPU has already been online earlier.
>          * Touch the watchdog on the next CPU to avoid false positive
>          * if we try to check it in less then 3 interrupts.
>          */
>         next_cpu =3D watchdog_next_cpu(cpu);
>         if (next_cpu < nr_cpu_ids)
>                 per_cpu(watchdog_touch, next_cpu) =3D true;
>
> Alternative would be to clear watchdog_hrtimer. But it would kind-of
> affect also the softlockup detector.

Looks reasonable. I've incorporated it.

