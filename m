Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D487ECF5366
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=; b=BluzYd+0VHCpvTZLYUUzAs4kUa
	Wi6HDtUaCB5hFvEEZ5AHO+QfRsEz8EcVGcCWbcupfi0eUhAU9ni7P4vOJ0yVEv6POAaLPcd/wXgBy
	iBp1lzou4X/4xjLVnf9gvEXunRAvZ7MbGvpRFlmLWl68qGeJ7mwj0Ln2kePI3vj4+a+waVdGuXz4j
	q5u3pwC6+W5c8Ah5zvBReLaWglY10wFH/jIz9T/1G9fPS0aPlhl0jz3gZ/0MUtrLYzMfc8YC5uYSn
	kTMsuEk6fnHQctnCeiK0GZdaSPC/k57uPrTGOIo7x9afNb+bZ6PWP2axiirJ3GQCLbu4BTyc2xDdP
	IXEzTMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3aLa-0000000EIXk-2TCB;
	Wed, 23 Oct 2024 12:20:18 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3a5W-0000000EFxx-1EJz
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 12:03:44 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5eb9ee4f14cso1916414eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729685020; x=1730289820; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=;
        b=bygVeN7WNZZ08GAriUK/ZYR87uItySawACnbL5ZOrAVfj446CdWa/QtLsljMhV64Ry
         NKLhFYjzb2mf7a0YoSs0LtAcGtHKueNb+XhQwQG1CBf5+UAs5z1l+qRmQdPzsPmzD70L
         wiPgwYs6mGAirsUmEcWUO2g9rxBzKvxNCybYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729685020; x=1730289820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8ff/XPdu25+KctImXnG4HbCg/aVpT0E7wYLlC7DsHg=;
        b=EIOJ0hPs1ej5HR7aYWDjwSGYECc9xKNf66bHdTMQ5qPIjR7Tk1VCLmn4/iWwyHzztF
         ytT2gkSmMw2S6Pi9caivqwmySATgK4yG4stB07J5NTsUuTVcxOhILbTQdOIgBd5cMqBD
         +WsPHJPRUzl8Ajc6Ua5rj7lUAo7fS1fDKppi+jJk0+kaf0PWf0lQSqcZ7tZXAU5lhrP3
         v+SVL6Ighn6C50YdqLfOrsdoVBgALrFs1ejyHh1rpcxPOAqrggzjVhYmP/NCIWobxkR1
         e9B8fgr4vH0rZM3F6irUQKkQ/6+DD2B8DKk6egon0lqRC3Zl8AVLOjHcd7b6abzWx07u
         Ddcw==
X-Forwarded-Encrypted: i=1; AJvYcCUfyO7lxOY0C6HD9hu147wQzsq0IpDtehKAU/agNOIldD7JjkEWHVLaKhPeUaIBIv38RBSRTrk0CVTrEdLjmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YynYJlT88Va/SRpeDr8hm0up8+OT5iEkxKoUW3CWJccXeBH0wv9
	knkASLS+Ykehg3kOCHyI7rDz1vUug056cDeO8sc0c3nCaoY7BIpxKdd2rbwlzl64OurAOi8a5FE
	=
X-Google-Smtp-Source: AGHT+IHEXyn8uL7vGnnhgkxSZvyReThOhLHW7CtTIot7SudB0J4guh4+3N/TKL1J8JJNprs1MSykPg==
X-Received: by 2002:a05:6808:192a:b0:3e5:f894:b29b with SMTP id 5614622812f47-3e62459c611mr2314956b6e.31.1729685020556;
        Wed, 23 Oct 2024 05:03:40 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com. [209.85.167.180])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e6263b9b92sm221106b6e.45.2024.10.23.05.03.39
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 05:03:40 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3e6089a1d39so1769488b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 05:03:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBoQWstjQofC828E63M9wWyDy5nbH61RTw7hPpOrhtvafdELfo23kvLKIocobsuzIJasgTEiU/DG8IzdweQw==@lists.infradead.org
X-Received: by 2002:a05:6808:3190:b0:3e6:256a:31cb with SMTP id
 5614622812f47-3e6256a3200mr2294647b6e.7.1729685018925; Wed, 23 Oct 2024
 05:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241023102059.512352-1-fshao@chromium.org> <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
In-Reply-To: <9b12aaec-504c-4e3a-a606-240341d8e0d3@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 23 Oct 2024 20:03:01 +0800
X-Gmail-Original-Message-ID: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
Message-ID: <CAC=S1niSXkCTLXeCv-0sQh4AQmv6eKm8OH_3yH=TeDoMVz72OA@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mediatek-regulator-coupler: Fix comment
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_050342_388230_9355FC53 
X-CRM114-Status: GOOD (  26.93  )
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

On Wed, Oct 23, 2024 at 6:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 23/10/24 12:19, Fei Shao ha scritto:
> > Fix two minor issues in the comments.
> >
> > 1. We balance VSRAM voltage based on the target VGPU voltage, so the
> >     comment likely refers to VGPU.
>
> Function `mediatek_regulator_balance_voltage()` refers, as stated in the =
comment
> located at the top of its signature, to "GPU<->SRAM" voltages relationshi=
ps.
>
> So, we're taking into consideration only two regulators:
>                    VGPU and VSRAM
>
> The first comment says:
> "If we're asked to set a voltage (implicit: to VGPU) less than VSRAM min_=
uV[...]"
>
> ...so, I think that you've misunderstood what the comment says :-)

Let me make sure we're on the same page - VGPU never goes higher than
VSRAM (VGPU <=3D VSRAM), is that correct?

[ min VGPU, max VGPU ] ... spread ... [    min VSRAM  ,  max VSRAM    ]
 (min_uV)  (max_uV)                         (vsram_min_uV) (vsram_max_uV)

The longer comment is
"If we're asked to set a voltage less than VSRAM min_uV, set the
minimum allowed voltage on VSRAM, ..."
So VSRAM is the subject here I think? Because we "set voltage *on*
VSRAM" based on its own minimum allowed voltage? We never set either
VGPU min/max voltage to vsram_min_uV?
And it's attached to the line that decides vsram_target_min_uV, with
the maximum of (1) vsram_min_uV (i.e. minimum allowed VSRAM voltage)
or (2) min_uV + max_spread (min VGPU + spread)

That makes me believe VGPU is the correct candidate.
We manually configure VSRAM first (push the ceiling to higher), and
let the regulator core update VGPU afterwards.

In fact, IIUC, there should be other concerns here... it should be
"vsram_target_min_uV =3D max(vsram_min_uV, **max_uV** +
**min_spread**)", due to the same fact that VGPU <=3D VSRAM.

For max_uV, it's not causing any issues because min_uV =3D=3D max_uV since
there's only one consumer... I can update the code in v2 if you agree
with this.

For min_spread part, the reason is that VSRAM should be somewhat ahead
of VGPU, but not way too far, i.e. VGPU + min_spread <=3D VSRAM <=3D VGPU
+ max_spread.
This is required on MT8183 and MT8186 - the spread should be at
between 0.1V to 0.25V (VGPU + 0.1V <=3D VSRAM <=3D VGPU + 0.25V).
The problem is that we don't have a "regulator-coupled-min-spread"
property, so we use the -max-spread property for minimum spread... and
without considering the real maximum spread.
But this is probably not that terrible also, currently
vsram_target_max_uV never goes too far from VGPU.

>
> > 2. .attach_regulator() returns 0 on success and 1 if the regulator is
> >     not suitable. The context suggests a successful return value (0).
>
> The comment is on top of a "refuse" or "error" case - one that wants to r=
eturn 1
> and not zero.
>
> Besides, it clearly states:
> "The regulator core will keep walking through the list of couplers when a=
ny
>   .attach_regulator() callback returns 1"
>
> ...which is definitely true.

... I'm sorry, I guess I really need a dinner break - my brain
translated "when" as "until" so I read it the opposite way.
You and the original comment are both correct.

And I hope my first point still makes sense and it's not my brain
being lacking energy again...

Regards,
Fei



>
> drivers/regulator/core.c
> function `regulator_find_coupler()`:
>
>         list_for_each_entry_reverse(coupler, &regulator_coupler_list, lis=
t) {
>                 err =3D coupler->attach_regulator(coupler, rdev);
>                 [.....]
>                 if (err < 0)
>                         return ERR_PTR(err);
>
>                 if (err =3D=3D 1)
>                         continue;
>
>                 break;
>         }
>
> Is that clear now?
>
> Cheers,
> Angelo

