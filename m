Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E55CA0FF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=; b=XCB94qG6olP1GqvfTViGfJWXg2
	CQPswL7he+CnCFxGUnpcZDnbtrNl4PRrQ7NlamMJlgWIf6t4CjlVzmzBvYLKYeRuN75fHeEOy/m9R
	FDJxY2rMb8znfkNCgsjDdY6SmnqU2wXfVFNCCySs3Glq7fAoL/RZqGS+fgVu5cxVVI3a1BgmeJL+r
	n2uf5RrJwgI92XtmJI/xfI5o979GWUsmazhoBWKh8ZW+993Lc0/c+Fr5Y3u20jhK9BXHome3cDTOi
	s1S9bkdvrbkKkhS3WdHgZt3c6/CInSVarDRN5JihQsj+QcJzeM31nPI7XECV+n8ncYdYT8bqBMjRj
	wr0XFDyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWM-00000002oDl-2A5v;
	Thu, 28 Aug 2025 18:38:50 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urceX-00000001jgI-35Re
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 13:26:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f4345cfd3so984142e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756387616; x=1756992416; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=;
        b=oQLXP55PsERRzZM7y+WCPdYjsSdJq1+D6vNbQY017i5XeH6qIbYqtdtjse2+yLTs3j
         xs0wvCKV9fCHZGih5v+vcW0qrtiKFJucnlUV7+hLrkNm6axUo4dxNKYTPNfBcVovjLI5
         cGt2dODkEYfuucxS7LbgxEYVtMcOmU84L+cLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387616; x=1756992416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTOF6xiQv0qzQRLjdqMkKKYD5QGR1e1uQsj6mloKX+U=;
        b=j0VhqFMjAMEhpJplZZJdGUcs1B3r54Ux0gCk3z22sMY2XufyrsjEOK15HQdfe9GYPu
         NA1EA465tgBz0XzvhcSfFci/q1bVrNqvJqjWSuS14XEQOo9l/fYWV/hhQpeNKdiwyljX
         aqYVIi3J3hxMPRFcpmVeDKtj/h+9x6nRL8QS5bHmu/JbS5KNIt502wB7Jr0+mDWUu7UN
         v+wZp5eYVzvHziAbdkZyvzNKLNhFdG+x1p+ulM261Lf/cLmDSA9xM3KiVjNMYJQfydc4
         q/TFOiq/aoixFjeTk/zymRtfB5TcCH2a908ZrvmV2nxmmlgKKbBUMjyMWEQgJy0TWn6q
         AaZA==
X-Forwarded-Encrypted: i=1; AJvYcCWdj1pAyQHbfNLZxmEHtjVf8tKHkOUSrtAIzrwugln+oGf8r5yj1Q1WQ4gOvs+sF9VB6yF9QW4dVuHgBzM9Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeIkxvZ28d0aUf2iu7t+jAgZVa7HZfOTBTbY6WlkKcu9JRDGHo
	JECWjqKGropFDYl9mzYtF1BdaWKnxtBtOgyu3eXTx1DokbVjTmuvPtlp/xmVGwcz/Ss1itxcT4n
	h12amll+8sve6xUc8IzzIm3Zy32qouz1XYF+x/UIW
X-Gm-Gg: ASbGnctM/QPeI3j3ExmViMCuokypehCszFIdsDJM7M5RVVAQ2v7WThQllnthZprT1l7
	3aiyBoaDltXxmofd5k9otVeh4GeKmmCz50A0wqHAyPjhBF+nRTnX81lhIKyloIomRSQmtJvc4jd
	hmlUvPV6BI+ZIFSOVjVlRs0Yj9RDuO1Y22Zb+O1jC9JUy4g61cACdaNuYEL067J6X+1aPHXWRdl
	SlLz9TVAeOJRmVXgbIRAzBvRQZa4ZFQdYg3oQ==
X-Google-Smtp-Source: AGHT+IGKaP7lckMwAVsqZkce2iGR63rMwp/YwXpHrLXd8d9BSHElcYzrrAlXcYiXDcwUU0dCjGA+bOrjwY+YJkMmFn0=
X-Received: by 2002:a05:6512:3b97:b0:55f:4c92:f4c8 with SMTP id
 2adb3069b0e04-55f4f4c6b92mr2765248e87.8.1756387615553; Thu, 28 Aug 2025
 06:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com> <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7> <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7> <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7> <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
 <20250416080517.feansrkpycsynk6t@vireshk-i7>
In-Reply-To: <20250416080517.feansrkpycsynk6t@vireshk-i7>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Aug 2025 15:26:44 +0200
X-Gm-Features: Ac12FXxYNpnEAlBmbtFHr64VxND_7eVbeCYS5BHUQbSiC1qF3AAnoY211E0MhhA
Message-ID: <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race condition
To: Viresh Kumar <viresh.kumar@linaro.org>, 
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>, 
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "cw00.choi@samsung.com" <cw00.choi@samsung.com>
Cc: =?UTF-8?B?Q2h1bi1KZW4gVHNlbmcgKOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_062657_796002_8D9B9223 
X-CRM114-Status: GOOD (  21.82  )
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

On Wed, Apr 16, 2025 at 4:07=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 14-04-25, 08:42, Chun-Jen Tseng (=E6=9B=BE=E4=BF=8A=E4=BB=81) wrote:
> > Hi Viresh,
> >
> > The CCI level choose by Max_Level(LCPU & BCPU frequency) in devfreq
> > driver.
> > without global lock, It may choose wrong CCI level and cause system
> > stall.
> >
> > I hope this flow is serial setting like, BCPU / LCPU set frequency ->
> > set CCI level -> BCPU / LCPU set frequency -> set CCI level -> ......
> >
> > without global lock, it could be LCPU / BCPU set frequency -> set CCI
> > level(during this time, it may change BCPU / LCPU frequency and cause
> > system stall.
> >
> > I also can only do global lock on ccifreq_support SoC.
>
> As explained earlier, I don't think there is a race here. May be I am
> wrong. And so I need a clear code path example from you, which proves
> that there is a race here.

Maybe a different set of eyes will help. I talked to Chun-Jen offline,
and I'll try to explain what I understand.

First of all, the issue lies not in cpufreq, but in the CCI devfreq,
and how the passive devfreq governor is linked to cpufreq.

The CCI hardware unit on the MT8186 is sensitive to frequency changes.
If the performance level of the CCI unit is much lower than either
of the CPU clusters, it  will hard hang the whole system. So the CCI
devfreq must always take into account the performance level of both
clusters, or in other words the settings of both cpufreq policies.

Since the cpufreq policies only serialize with themselves, it is possible
for one policy to change and trigger a devfreq update, and when the
CCI devfreq driver is doing its calculations, the other policy changes
and causes a big deviation from the assumed performance levels, leaving the
CCI into a non-matching performance level and causing a system hang.

So I think we need to handle CPUFREQ_PRECHANGE events for the frequency
increase direction, as well as enlarging the devfreq mutex to cover
the CPU frequency tracking bits in the passive governor.

I hope that makes sense.


Thanks
ChenYu

