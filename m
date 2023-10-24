Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8370EC00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lr0fZE5whQdrFV4eAi6FdmCNxpQ+X4q7C3SQAfAKz58=; b=SuohVc7DduTD7vhYTtWZudkS5N
	z9IKXNb/CRZLWOY4XpZAG29ZynolSXoIqTiNlZp0iep15yqYRcoUSRTbfKjzKjKQ9tAx62yR/0l1Z
	Dxki+tCZye+eB0ON9TV5fyc5SEd542W6Vqcu0wV/bRJfVcnujM4Bapac7XEX2hRBb99VNKfioXSxf
	ZNSKKeOA3RQyeOsVyDiG+xsV+A8SK1xMVs6Boaa0T9F5IGjBEWwSeXxOpgOsA/eygUwDgylcLkTUT
	YsC7wMsDks6/L8+s2DPwy4V7aasCTCImSSFiuJA+xR48syYiaqinevEMvAhJI9p8LCUjDP8YC3FlJ
	O9EMKBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDaR-009Hzs-0q;
	Tue, 24 Oct 2023 09:20:31 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDaN-009HyF-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:20:28 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507c50b7c36so5901642e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698139223; x=1698744023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lr0fZE5whQdrFV4eAi6FdmCNxpQ+X4q7C3SQAfAKz58=;
        b=Lsei7dRBdhvhoHSYmcLp4Y8aasxaP4082GBClVnqawezvvtvrW7GcHw+7no9lkugLV
         /4VOA34bKvkKOj/kkR2iLkfAnRXhUT7599zjzA1mZGOoYWwLDhlEmqEFaZF/o0Un1ivI
         VgEI/e91lMfH1EmQabRSDP1m8Fxk5mA7Swnm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698139223; x=1698744023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lr0fZE5whQdrFV4eAi6FdmCNxpQ+X4q7C3SQAfAKz58=;
        b=Vqz2gbHt1Zi0uswE6iHU7hhBGQvmIRI9qkfGqhv2H5zWTVoXoEjZFkzFgbLsNCEXW3
         yDMKqwxyTWVYICwnURwITyT4GsTJIqv4JLVXodv/N43x16QzoMLRzRi8dpvT/tyVP8zx
         safNx0mBlW/S7QNFfcnr913YIBoyK6cT9IGLFHUXY2QkDsjeW52Znwj21GSNlxOxT48o
         0HaRnZH7My79XCH58tcbHOgOfkdLxRCPDhORcJo+ajDzg8PpavlEwnWxDYxPgc2ZlJBI
         qk+prROLv5LPydQu2x13KcvuydrpeImKhZx2UHz43oIFeiwIsbFsFJcf2LzKDxJ0ibKx
         G2Zg==
X-Gm-Message-State: AOJu0YyP+xTpZi4rV/Go/htpi8A0gjCY3VX7lRWo+NN9hoR1YPHk30PI
	JBmGyRDC2YrKmBOb1wYvBDGg5GKarqEMF+LO4umXwg==
X-Google-Smtp-Source: AGHT+IFTV/kMgT6B5ttsp9pPqwDV0yzNxuvadJ1z0YSqmADystKSt3gJ1x4Zf3Z0DIC+EwhjiAYsW2oerWQNqAW0S2k=
X-Received: by 2002:a19:5011:0:b0:507:9a08:61d7 with SMTP id
 e17-20020a195011000000b005079a0861d7mr7752247lfb.34.1698139223027; Tue, 24
 Oct 2023 02:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
 <283d18028590d57025e5654d18b8b5b7.sboyd@kernel.org> <CAGXv+5EpBLnXVdxnk9wBZi5F7U5wdJRfYH7fgg4Lkr1HJXm+WA@mail.gmail.com>
 <9c1e10b56db315e03daa3df5918cde844297c680.camel@mediatek.com>
In-Reply-To: <9c1e10b56db315e03daa3df5918cde844297c680.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Oct 2023 17:20:11 +0800
Message-ID: <CAGXv+5HQ2sVx=F3my2jOGMw3j3pU2aarEg+Dj1XgNzwio98ezA@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
To: =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>
Cc: "sboyd@kernel.org" <sboyd@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, 
	=?UTF-8?B?Q2h1bi1KaWUgQ2hlbiAo6Zmz5rWa5qGAKQ==?= <Chun-Jie.Chen@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?B?TWlsZXMgQ2hlbiAo6Zmz5rCR5qi6KQ==?= <Miles.Chen@mediatek.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_022027_619648_89754543 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, Oct 24, 2023 at 3:47=E2=80=AFPM Yu-chang Lee (=E6=9D=8E=E7=A6=B9=E7=
=92=8B)
<Yu-chang.Lee@mediatek.com> wrote:
>
> On Tue, 2023-10-24 at 10:58 +0800, Chen-Yu Tsai wrote:
> > On Tue, Oct 24, 2023 at 10:52=E2=80=AFAM Stephen Boyd <sboyd@kernel.org=
>
> > wrote:
> > >
> > > Quoting Chen-Yu Tsai (2023-10-19 22:06:35)
> > > > On Thu, Oct 19, 2023 at 8:49=E2=80=AFPM AngeloGioacchino Del Regno
> > > > <angelogioacchino.delregno@collabora.com> wrote:
> > > > >
> > > > > Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as
> > > > > those
> > > > > are effectively parented to infra_ao_i2c{4-6} and not to the
> > > > > I2C_AP.
> > > > > This permits the correct (and full) enablement and disablement
> > > > > of the
> > > > > I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree
> > > > > of
> > > > > those.
> > > > >
> > > > > As an example, when requesting to enable
> > > > > imp_iic_wrap_ap_clock_i2c4:
> > > > >
> > > > > Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
> > > > > After:  infra_ao_i2c_ap -> infra_ao_i2c4 ->
> > > > > imp_iic_wrap_ap_clock_i2c4
> > > > >
> > > > > Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper
> > > > > clock support")
> > > > > Signed-off-by: AngeloGioacchino Del Regno <
> > > > > angelogioacchino.delregno@collabora.com>
> > > >
> > > > I'm curious about what led to discovering this error?
> > > >
> > >
> > > Is that an acked-by?
> >
> > MediaTek engineers are saying the original code already matches the
> > documentation provided by their hardware engineers. I'm trying to get
> > them to respond on the mailing list.
> >
> > ChenYu
> >
> After checking with I2C clock hardware designer there is no
> infra_ao_i2c{4-6} clock gate in between. And the clock document at hand
> aslo shows the same result. Generallly speaking, we would like to keep
> sw setting align with the hardware design document. I would recommand
> not to change this part of code, but enable infra_ao_i2c{4-6} prior to
> the usage of imp_iic_wrap_ap_clock_i2c clock.

Are infra_ao_i2c{4-6} actually used by the hardware? If so, for what purpos=
e?
If it is actually needed by the hardware and it is not in the existing path=
,
then it needs to be described in the device tree and handled by the driver.

ChenYu

