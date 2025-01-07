Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81094E77197
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 05:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=; b=sZV4hYh2u6GMMm
	Ar7ePMQGBjxgyrbhRQXoJFSBs4JIdqpd1/XnrwxSyHFD7euEvDbpyvVd5yc+1w/+8ly7mOqbuTNWG
	2SiqfOgrZTd3jBcMABSswwts9E6aFdYYAIsax1couVDfCQtDJrUMatD/0k6IM2i5q4PbKtyUKORNv
	ishSaKeZN2ZQ0eRSMHxr9NQU8PATun1gsaeAL5twChrL5XtSKUfKULjS6kEfAj19Z057HmA+25Spl
	aVhabKqc0rx8/s1bu55z3Rnh8h7Ai//P5FZs7ZpdnHNjVo9gJ8TFgu41z5mrwv+DhLHqe4TX8+/kQ
	bSbQy2rLhM1sMvyCeUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1kW-00000003VuN-1FEM;
	Tue, 07 Jan 2025 05:03:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1kQ-00000003VtQ-2Epj
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 05:03:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso15022491e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2025 21:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736226200; x=1736831000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=fupKwAO8MBW+fSe6dK9BHLuiKkwK1RsB8rct+5KF//G4sdKlHhCG0QZdFmdNOOA5GA
         /WyDB3p1QzePPDES0Casxc2XhTPIeoEbT3P70MMbEjr3s0LcHgIzoPSoJfTJTaEUeIXH
         IgNUAPuaLXTR2ZxQLFrzitSoTg8skV8wL0YIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736226200; x=1736831000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l96aDxgtPyGtmhQmKxg5Ir9C+VzTtQ4ciP6aZGSnXTA=;
        b=q/oA2BbhVmdaaiyeVox2MDO6SWEzjxA5DQQd4NnOzDEHQIXeHizbbyucGFs4s+wRkS
         Svdl+qui8XzIa+++HrOaXsLU3LeZfLrEKTMWDmlB2oRJuuEI1KR7JFfX+F+S1ti3Hayt
         +Ns76Vc2nBNXtZazlhrxKAHZxuGgkAq0wiGNFHrYxi/w24E9MaCg8qlKxCBMxfMk30R3
         ca2aloixGnf1fqJvBf4SC3G2W4uybmDWMxRpg0ANLaEBlw0Rbbcj5a92qs0Pj6kUlc3/
         CkCJgu0wTbkFa1OQ1fHkCgI8QGEYTfmVHBdxXF3D0CPFfC2aUqnJQo5z+3O8Dd8q6txy
         P8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp1TSYTXzKnhwfPXxL5fj/+jJEIeiM6rerAJgCTBAYRFRoFk3FSS64bGhZ6vqFPebt7oEO2k+Mw9U6I0N3TQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdMskK6VWVT0DApPTOd9CeX5Mts3K1JcOSG/Y/poLqGnbdCni4
	DJHSqrJU9eA6ykJTydlAOr2uX5J1Fhq+s1cNr6hGwsOHUJIc0t7rGjjTGKAGklrPuN4gw6i4r1k
	AlV0Zfv+bbfJopiAzK77doZoD47SMQDX2HyWy
X-Gm-Gg: ASbGncs9ZS4CRgUJIl3bhee22j16ugXwwpHOZm8umKrrENiOUpQIdqXgCV/wRLBfRnA
	LGLDTktmzDneubp6Uds59ILY1KtnSy4lCUgOCthm62D3HsOEI6iyc6pP4T62gv6+F
X-Google-Smtp-Source: AGHT+IFuVqIzLmO0Yramox//ee4/O3h23KsvSyQuha2+kpZxvOtrGLzpdtD8WFdSLs2fPfAPih1M9PDh71qbUvNQtpc=
X-Received: by 2002:ac2:4c50:0:b0:542:28dc:a2b3 with SMTP id
 2adb3069b0e04-54229530148mr21627152e87.22.1736226199865; Mon, 06 Jan 2025
 21:03:19 -0800 (PST)
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
 <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com> <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
In-Reply-To: <f60f4242-9e4e-4846-b1f0-949daf68f6f5@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jan 2025 13:03:08 +0800
X-Gm-Features: AbW1kva84os3VCZ6M58WLraDevj5vJ7ZZRyOV-JzVdUbyuXDzp4hplu0A48ga_8
Message-ID: <CAGXv+5E5L5nNCT54O+LW6DdaWifLuA46pXcRNpSw1okGUp+JFQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_210322_589118_F6A88D17 
X-CRM114-Status: GOOD (  29.43  )
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Trevor Wu <trevor.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2025 at 1:33=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Thu, Dec 26, 2024 at 04:30:17PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiri=
ng
> > > a dmic codec to be present for the driver to probe, as not every
> > > MT8188-based platform might need a dmic codec. The codec can be assig=
ned
> > > to the dai link through the dai-link property in Devicetree on the
> > > platforms where it is needed.
> >
> > A followup question about this. The DMICs on the Chromebooks are attach=
ed
> > to the PMIC codec's input side, which then converts the signals to stan=
dard
> > I2S and passes them out to the SoC through its AIF1. So the original co=
de
> > was somewhat incorrect, though it works.
> >
> > How should we describe such a connection, given that the MediaTek sound
> > bindings aren't a full graph?
>
> What you're describing is that the hardware topology looks like this:
>
> --------------------      --------------------
> |    SoC           |      |   MT6359 PMIC    |
> |        UL_SRC BE | <--- | AIF1   AIN0_DMIC | <-- DMic
> --------------------      --------------------

Correct.

> But that the dailink definition in the machine driver had the DMic codec
> connected directly to the UL_SRC BE instead, alongside the connection to =
the
> PMIC, unlike the topology above.
>
> My understanding is that the dmic codec was added simply to allow the usa=
ge of
> the wakeup-delays. From [1] it appears that DAI connections between two c=
odecs
> are possible, though rare. So the PMIC -> DMic connection description mig=
ht be
> possible in that way, although I'm not sure it brings any benefits beside=
s
> closer resembling the hardware topology.

I suspect we would want to keep the wakeup delays though. AFAICT they aren'=
t
the same number across the board (no pun intended), but actually differ
between devices, perhaps due to differences in the actual DMIC used.

If we don't want the full description, maybe we add the wakeup delay to
the PMIC codec then?

AFAICT [1] is basically hardcoding in the dmic-codec in a different way,
so basically reverting your original patch.

ChenYu

> [1] https://www.kernel.org/doc/html/latest/sound/soc/codec-to-codec.html
>
> >
> > > No Devicetree currently relies on it so it is safe to remove without
> > > worrying about backward compatibility.
> >
> > Removing it didn't seem to cause any issues for the Chromebooks that
> > do actually have DMICs. I suspect the only difference would be that
> > the wakeup-delays no longer apply correctly.
>
> That's my guess too.
>
> Thanks,
> N=C3=ADcolas

