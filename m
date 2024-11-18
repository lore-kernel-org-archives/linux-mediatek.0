Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661BED10F57
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 05:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y/5O/DaG+qseUM4co6lv9seYRVyO4Z+4HtVpQlw/vA=; b=DLolOHF3TcaXKe+E7TY+AqdZXz
	PQgUFQDjNUoDAsI1QT7i49bWiffAnW/Jc7bTNuUZO0L64oODFsDgUD/9KXlkvdDc2DrwoqL2SRIq4
	jJcXbsAnQJtwCHNofde0GliJl7z9u4uyhDyE2Z5g1q9A1v9KsbAFKS3y+9BJD961ZiyCU+2jHucF3
	41c3ToCrm4VQkcUVr3FOBFf1IdELav+1yn/ym2EPNQKNbKj7uiD0QKOg4bdwM07f7/g64t67wWqCN
	Q3mwnVAPEtwtxNawZjr6iNA2wZRDgXq6rAuHRoJjsUbyl0k0R6lgGmI/SGRm8yayeb3e4I+dEbzkz
	zN5MYlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuHt-00000008Oba-05hI;
	Mon, 18 Nov 2024 05:27:01 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuHq-00000008Oah-3vSU
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 05:27:00 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-50d2c02875cso1465637e0c.2
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Nov 2024 21:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731907617; x=1732512417; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y/5O/DaG+qseUM4co6lv9seYRVyO4Z+4HtVpQlw/vA=;
        b=Omj7QEYVDWrWxw5zpa8O982FfAiIWKKBtSUezEfPVBiWQW9LKzABCN/+BfHQGM3Rf3
         Xm7Xo4jYNnAYdluO6MycQVMosvWqXDjnhSfkOG+xxukIzyFh3F02fzlsf+cjE10oyO0G
         YInykxJPeLz36UnHXgQZIcnZOWSlniV/D6eCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731907617; x=1732512417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Y/5O/DaG+qseUM4co6lv9seYRVyO4Z+4HtVpQlw/vA=;
        b=lNOpT2K4rTGLIvzLNhN+WKNDNWB81HyVRNhU0fQF0pBEiiebVXgLxOO16T/ybq2QBX
         yWrEvjHa4DdeCpbwSUN2Jv5FLtA2wSyy6Tio9Lml6+GQJ9G0RpXni/Xizld7cd83R0Yz
         f6jU3Mf8LyxBf1BTq3RyVTcdGIiv/W+HHtXTdaXdtc3rcIQgdUmwLvVyR32kX30BlKXH
         1IiFd623OXLYThQnND1v0TmxKNJ2lwO5AH+ctZCMcUAR6+e+205ztNkEvCiArIzUtuYV
         qihCSXiVwyVMC7DfK4g5WGjHiy30wFqO5VHXd6H6DZ2QogmuvBEqH/hk0LFVKrTE9ys1
         1zrw==
X-Forwarded-Encrypted: i=1; AJvYcCVh1TSeYGC2Ro/r2p7mnKBGkG2Un4iKrfrs/4eZqFelNjDpS8U684MiRme5isxAL9PJjDSWC1xFQSIH4W52jA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Z+aToN9l3kyLuRhvDf3D0j+gpUcs9eDWFKz3PvEM8mvQu98B
	ur619kyVWrk9rRwaUCv3dSL8n239AS58Q7h/pq+sZOcGdy/f7Vjv4zG5FFE5dlU9uHHc6BbR8Ns
	=
X-Google-Smtp-Source: AGHT+IGG/IaBO8ogqSvT/uBdrCWmyP9bcyw/P+Y5z7YHYilsMASpT/5wCFIh20urDhkLhYY3Xo4Kyg==
X-Received: by 2002:a05:6122:3d12:b0:50d:6d53:fedf with SMTP id 71dfb90a1353d-5147863e751mr10322732e0c.8.1731907617066;
        Sun, 17 Nov 2024 21:26:57 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51479c2dd56sm689928e0c.42.2024.11.17.21.26.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Nov 2024 21:26:56 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-513d1a9552cso1646676e0c.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Nov 2024 21:26:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUTEKg21mjGoD8nxeoUcxi+DKZI4TjMxiXRg7/Q/54qQVe6P3f5f/7tPZNKo8tuQuo3kV2DaI7g5XDmvtMdHw==@lists.infradead.org
X-Received: by 2002:a05:6122:3d12:b0:50d:6d53:fedf with SMTP id
 71dfb90a1353d-5147863e751mr10322690e0c.8.1731907615744; Sun, 17 Nov 2024
 21:26:55 -0800 (PST)
MIME-Version: 1.0
References: <20241105093222.4055774-1-fshao@chromium.org> <20241105093222.4055774-3-fshao@chromium.org>
 <b66dbf9e-b35b-482c-9eb7-112ef1f398d6@collabora.com> <CAC=S1ngozo11g1vF2jnHjTLcNmP8tOMsQhK+LR0QWqoeXwSJjg@mail.gmail.com>
 <59f4bcc1-c752-4f2f-8e55-349cc2432b8a@collabora.com> <CAC=S1nhhfwHU5K5ZyUhZBhvz38LOZGLnGN-Rc1ZAup_VTfkpvA@mail.gmail.com>
 <CAC=S1nj5PVJ=zwZiBLoOCHzsspaRw9ddAH_dXfPayD=LyW5wNA@mail.gmail.com> <545b6db8-c7d7-4a28-a040-12088f9002df@collabora.com>
In-Reply-To: <545b6db8-c7d7-4a28-a040-12088f9002df@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 18 Nov 2024 13:26:19 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhX88aaQ6dusab1qM2_noaSjTMdhJ9t5o4L_Nri9dWPVw@mail.gmail.com>
Message-ID: <CAC=S1nhX88aaQ6dusab1qM2_noaSjTMdhJ9t5o4L_Nri9dWPVw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Introduce MT8188 Geralt
 platform based Ciri
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_212659_011172_2A1F17C1 
X-CRM114-Status: GOOD (  46.30  )
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

On Thu, Nov 14, 2024 at 6:09=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 11/11/24 08:10, Fei Shao ha scritto:
> > On Fri, Nov 8, 2024 at 12:11=E2=80=AFPM Fei Shao <fshao@chromium.org> w=
rote:
> >>
> >> On Thu, Nov 7, 2024 at 6:37=E2=80=AFPM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>>
> >>> Il 07/11/24 07:58, Fei Shao ha scritto:
> >>>> On Wed, Nov 6, 2024 at 9:19=E2=80=AFPM AngeloGioacchino Del Regno
> >>>> <angelogioacchino.delregno@collabora.com> wrote:
> >>>>>
> >>>>> Il 05/11/24 10:30, Fei Shao ha scritto:
> >>>>>> Introduce MT8188-based Chromebook Ciri, also known commercially as
> >>>>>> Lenovo Chromebook Duet (11", 9).
> >>>>>>
> >>>>>> Ciri is a detachable device based on the Geralt design, where Gera=
lt is
> >>>>>> the codename for the MT8188 platform. Ciri offers 8 SKUs to accomm=
odate
> >>>>>> different combinations of second-source components, including:
> >>>>>> - audio codecs (RT5682S and ES8326)
> >>>>>> - speaker amps (TAS2563 and MAX98390)
> >>>>>> - MIPI-DSI panels (BOE nv110wum-l60 and IVO t109nw41)
> >>>>>>
> >>>>>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>>>>> ---
> > [...]
> >>>>>> +&pmic {
> >>>>>> +     interrupts-extended =3D <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>> +};
> >>>>>> +
> >>>>>> +&scp {
> >>>>>
> >>>>> Is this SCP-dual or SCP?
> >>>>> I see SCP, but I also see a SCP-Dual memory region... what's going =
on here?
> >>>>>
> >>>>> Of course, the SCP-Dual won't work if you don't override the compat=
ible string...
> >>>>
> >>>> To clarify, the second SCP core is used for MIPI camera in downstrea=
m,
> >>>> and I deliberately only describe the first SCP core here since the M=
TK
> >>>> camera ISP driver isn't in upstream at the moment.
> >>>> I had a fixup patch for removing the scp-dual reserved memory region=
,
> >>>> but likely it was missing during the rebase... let me check again if
> >>>> it can be removed, just in case there's firmware protecting the regi=
on
> >>>> and the kernel shouldn't access it.
> >>>>
> >>>
> >>> Hmm... but the second SCP core can still be brought up, even if the M=
IPI Camera
> >>> driver is not upstreamed yet, right?
> >>
> >> Well, that's true... and it should pave the way for validating the
> >> driver with the upstreamed DT whenever that becomes available.
> >>
> >>>
> >>> That shouldn't cause lockups and/or other kinds of bad behavior, and =
should
> >>> bring up a core and just never use it, without any particular issues.
> >>>
> >>> If we can enable the secondary core, let's just go for it.. as that w=
ill help
> >>> specifying the exact memory layout of this board (and failing to do t=
hat may
> >>> create some other issues, that's why I'm proposing to enable that eve=
n if it
> >>> is not really used in this case).
> >>>
> >>> What do you think? :-)
> >>>
> >>
> >> Sure, that sounds good to me, too.
> >> I started only with the essential DT bits to ensure the device can
> >> boot, which it does, so I guess it's time to bring that back. I'll
> >> incorporate that in v3.
> >> I plan to fix up the single SCP core node to SCP-dual directly, so
> >> please let me know if you prefer seeing that as an individual patch on
> >> top (either option works for me).
> >>
> >
> > In fact, I noticed that it seems to require modifying mt8188.dtsi (and
> > potentially mt8390-genio-700-evk.dts) to support the second SCP core,
> > but I want to avoid doing so in this series if possible to keep this
> > as a pure new .dts introduction (if that makes sense).
> >
> > I can think of 3 options here:
> > 1. I resend this series *with* the single SCP core enabled in
> > -geralt.dtsi. And then I send a follow-up series to introduce the
> > second SCP core and update the affected .dts{,i}.
> > 2. I resend this series *without* any SCP cores in -geralt.dtsi. And
> > then I send a follow-up series to introduce both of the SCP cores at
> > once, and update the affected .dts{,i}.
> > 3. I delete the parent (mt8188) scp declaration and re-describe the
> > dual-core SCP structure in -geralt.dtsi. This avoids touching
> > mt8188.dtsi and mt8390-genio-700-evk but leaves the dual-core SCP
> > stuff exclusively to geralt/ciri. I don't know if MT8390 wants to
> > utilize the second SCP core or not.
> >
> > I guess (3) is less likely what we want down the line, but that's just
> > for reference. Any preference/suggestion?
> >
>
> I want to verify with MediaTek whether the Genio 700 EVK can make use of =
the
> dual-core SCP first, as it is highly possible that it indeed can and, if =
that
> is the case, counting that any product development would be anyway based =
on
> the EVK.... we will probably never see single-core SCP in MT8188 devicetr=
ees
> ever again.
>
> Please send the Geralt/Ciri devicetrees without SCP support for now, so t=
hat
> we can get the vast majority of the code upstream - which anyway is likel=
y
> 95% of what you have right now... then I will either notify you for how t=
o
> proceed with the SCP (especially if I come to a conclusion before you sen=
d
> the new series), or I will just send the SCP DT series on my own.

Noted. This is currently on the back burner as I have other tasks at
hand, but I'll get back to it ASAP (hopefully later this week).

Thanks,
Fei

>
> Cheers,
> Angelo
>

