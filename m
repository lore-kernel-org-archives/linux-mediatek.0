Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB47C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLEwZG+K5If1XG31L81o0B8wj/oAKIdjUErA7QakB/Y=; b=YXspreyWHEjsxLh65D7pmbidtS
	iBRgI3Ok6n/cN0Vlh2Dvk1WRMs+64eUKos5JbV08a9BVHf7/KzEdHCfd7hX6EMkuJR9cY3Jc70ajL
	zzjFwUnTXxSMIJHWVZiequxuZnMtTOCKAew/bNWIGuyzu6XTmpc2Zg8v9mf+brdIuOuEKlfQcELxf
	5AccEvo2HnycwyB6ihWWahHvM0La9eNkw7qCAFKUwrKJaMf5lJqwVtaxscBnW+ABpaSHPO1haZUj8
	rGckohh9ayXL2NRQy3w8o25gHKLLM2j6NOHgc0CqRw46sbq8fElHT2rbah60I+1rSz0hHmrH7bWM9
	PVk8SPFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbySg-009F5v-ME; Tue, 14 Mar 2023 06:48:42 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbySQ-009EzY-00
	for linux-mediatek@lists.infradead.org; Tue, 14 Mar 2023 06:48:29 +0000
Received: by mail-io1-xd2c.google.com with SMTP id v10so6002562iox.8
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Mar 2023 23:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678776503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VLEwZG+K5If1XG31L81o0B8wj/oAKIdjUErA7QakB/Y=;
        b=SsS5gi6jc4SKTBaMtIUxlxwJ9fHmgIvDZdQUp4rgJjJ9YF9sCetp08MsS80solmwYR
         7j9sXVksjByPcl3HUQ3BUAgpIShQmg0PuFVlPEjSONufvTOatwv4FeDv5eZPnuv5veQI
         0xIVY5J2SobjWPlPrysORvKNKEypfO+J8obNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678776503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VLEwZG+K5If1XG31L81o0B8wj/oAKIdjUErA7QakB/Y=;
        b=BlH0EIWfZG3YKz94S4FBFqBIL1VAZ9/A9iVhJzTDzrsBXkiXBW9eS+UtUNToq3NdLb
         LL+5Zi1ehLIZnnukYziRwH7jrkfYib3C7aZ8y95BClT7jlTEm1M6fCIgP9lbjkmFVY+j
         kXWErWedDIanBm5k4PEL/EI+0ZAmvpAg+5RzXyrSdHtTJzFJIEbUxQc6vaIj/a7qF5ak
         91RhG9UDVykrDPas6FBjkrCkMbI9kUjgGiYVWDKJCQkYwFhG1IB6PnBazBDynANacnMe
         9Hrxv7qIgsYOuiHbD0KsHM0uIjUcjIRHrntLptcNZEg0KCF5tJvQXI0r4ZoQQIsnPf5W
         Xb8A==
X-Gm-Message-State: AO0yUKWew6IIQVd4MODVmOlmY/Hj4x69cCXyxm9LHlK9xJ+RY3PFWvF4
	X/jjKq6vq0N93h0TZ7gjm9WxwqLO4m3Ziojrpe+LrA==
X-Google-Smtp-Source: AK7set/nrtwAWWXklgEcYSS7gTcgiOAry6UysyFd30DNrr9roLVmAoH48HSI9olsf2mB8oed7L7Bg1XJFQCxDvKesy8=
X-Received: by 2002:a05:6602:115:b0:745:6788:149f with SMTP id
 s21-20020a056602011500b007456788149fmr16670096iot.0.1678776503657; Mon, 13
 Mar 2023 23:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com> <6c52bcda08b62593c541d52e269d3982.sboyd@kernel.org>
In-Reply-To: <6c52bcda08b62593c541d52e269d3982.sboyd@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Mar 2023 14:48:12 +0800
Message-ID: <CAGXv+5E+SsN085WHzdLGzdWGMwpWLNhgyR5NvobOf75sPG0cRA@mail.gmail.com>
Subject: Re: [PATCH v6 00/54] MediaTek clocks: full module build and cleanups
To: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com, 
	matthias.bgg@gmail.com, johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_234826_045593_196D63EE 
X-CRM114-Status: GOOD (  21.46  )
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

On Tue, Mar 14, 2023 at 7:22=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting AngeloGioacchino Del Regno (2023-03-06 06:04:49)
> >
> > This huge series adds more cleanups on top, reducing size and adding mo=
re
> > commonization for clock drivers probe/remove, which also includes a new
> > common probe mechanism for multimedia clock drivers that are usually
> > probed by mtk-mmsys instead of a dt clock node: thanks to this, it was
> > finally possible to convert almost all clock drivers to the common prob=
e
> > mechanism, which *finally again* makes us able to build all these drive=
rs
> > as modules!
> >
> > Since this looked like being *the* way forward, I went on converting so=
me
> > more drivers away from OF_CLK_DECLARE_DRIVER to full platform_driver(s)=
,
> > allowing for more (actually, almost all!) drivers to be built as module=
s.
> >
> > While at it, I also added some more consistency in macros usage by
> > removing all of the duplicated full macro declaration for MediaTek gate
> > clocks and replacing all of those with using the GATE_MTK macro instead=
,
> > producing a nice reduction in amount of lines per file but, more
> > importantly, improving readability and eventual future batch changes.
> >
> > This amount of commonization will also, in my opinion, greatly improve
> > the review process for new clock drivers, as they will be mostly just a
> > list of clocks and won't contain much new code, as it's all going to be
> > handled in the common places, which also reduces chances to see new clo=
ck
> > driver related bugs emerging on one SoC or the other.
> >
> > Since I don't own devices with all of the supported MediaTek SoCs, I
> > could not test some of the conversions on real hardware... but I am
> > confident that this will work as the drivers are *very* similar on a
> > per-generation basis.
> >
> > This series was build-tested for all (both module and built-in build)
> > and was manually tested on MT6795, MT8173, MT8192, MT8195.
> >
>
> Applied the whole series to clk-next.

Hadn't gotten around to retesting this. FWIW,

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8183, MT8186, MT8192, MT8195

