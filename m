Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11ECAC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 03:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmM543SraV9o9ha1YM1vALY7ObPvW/K+6GDnAjPWuvs=; b=Xx5mQVm95rpur2IhL4eAdhMzsi
	8Gpq1W17nUJ2JqtKmQweVrPPNwPTt4B3vOwqyWpwxID4XmCqjiymgnWoS47j8V1itlUgrzxMq8NcI
	6v38jLJH5tRyuOukdMRQ74kTpHepl7HW501GJyYtaooM1Kkj4epo8eycor8RT7xgov9YjwVMqW55Q
	wHdCV5Vd/v9C+P/ksXZ4sFVgoE6NUrvAlb1Vs+zBAhoigpz6jPggGP7p1MqTRTC375bVEGMdL561T
	5EMr93khCxwfDyijEGJdTAzkIpnyBjENDps9qIacqgtZgtMIA3t/aM7ktkExbEiSNFf0Ny91w+IJS
	riTs+Nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPxtL-0003OM-5c; Thu, 09 Feb 2023 03:46:35 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPxtB-0003MM-93
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 03:46:26 +0000
Received: by mail-vk1-xa35.google.com with SMTP id i38so343040vkd.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 19:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmM543SraV9o9ha1YM1vALY7ObPvW/K+6GDnAjPWuvs=;
        b=hV2Bl2quJGDMv8WcOFW78Co3V9C483w8NksmhyOC0ub+Lk+KeZbdoh2ZshULAJ+HOc
         YXXeGCFF+CsnZwq2/BL6geEnM3BBMt+vwJVBxLsV2UTPXpoH62VG0t/4rGWXk2SJ+L2l
         hlr0e07DL0cmpVez+XpFQK74vEUpr2SrGye/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmM543SraV9o9ha1YM1vALY7ObPvW/K+6GDnAjPWuvs=;
        b=RDnfcfy/qvaO/BGRq0b/Pt9VTlZQUcchtOBY2ATC1dyYw09xr9+qZlg3cMAOKaiQqr
         Sn2QZEEUJbJ6TT4YYsPET/NYe68iHaDVI/6O5mO49YKF+DL3hqbS5qnZMOYRW9nqJe4k
         1dEngk/B065dP9pAU5SOxS1nB+BZdkBlzYzL+ke104qLKYD/qrHttvKEhf8fL76pMyrt
         7bAl0GB66KsufjB1cj8YS8DQicXO0XUS1qoOfLFWJHfH0xZ2YEofxfRciUrahYDGgrBF
         QL1fQuUD7QQ4uxWBKEk+2ZNAi3FwoPBW/dsF6aOM1QMg8iz/9GGbBp4FgVJU9Ee2R/J6
         kpUg==
X-Gm-Message-State: AO0yUKWDUCUSinlL8+pd2CUAxTjQeROeXhOrqiNTFdxQIRBtoIe8IyOs
	GBwefkB3Ojb6KTu1mX0evYKVA35VTmxY4E/PBIeNJg==
X-Google-Smtp-Source: AK7set/b/VaRTgbuyYYkPbkiLSlIY6vsoR42DhsiTFk3QMVSBVx/h84c6ihtp5HHzLDmT7LzEMygWe8zgKZdOPmQ0GY=
X-Received: by 2002:a1f:a6c5:0:b0:3e1:a2f7:8b2a with SMTP id
 p188-20020a1fa6c5000000b003e1a2f78b2amr2240269vke.18.1675914383329; Wed, 08
 Feb 2023 19:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTP0cLGEQ+qkAt8nsOp5DqCOgPyAOJ66fF91SKX=hZvw@mail.gmail.com> <45f8e284-8d56-898b-0897-94c576e09c2c@collabora.com>
In-Reply-To: <45f8e284-8d56-898b-0897-94c576e09c2c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 11:46:12 +0800
Message-ID: <CAGXv+5FmmDx0Q_d17hv1gu+drfD12-vtgPoTpefExHGvdkcQyA@mail.gmail.com>
Subject: Re: [PATCH v1 35/45] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_194625_325361_6D363C6D 
X-CRM114-Status: GOOD (  22.52  )
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

On Wed, Feb 8, 2023 at 5:00 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/02/23 09:28, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> >> option: there's no reason to do that, as it is totally unnecessary to
> >> build in all or none of them.
> >>
> >> Split them out: keep boot-critical clocks as bool and allow choosing
> >> non critical clocks as tristate.
> >
> > The power domain controller references vppsys*, vdecsys*, vdosys*, wpesys,
> > imgsys and camsys. I'd argue that this makes these clock drivers
> > semi-boot-critical. Maybe mfgcfg as well when we add the GPU?
>
> You don't need to power on additional power domains if you want to load modules
> from a ramdisk! :-)

Right.

> Besides, you caught me: mtk-pm-domains will be my next target after clocks...
> I don't like how it behaves in regard to probe deferrals. Specifically,
> I dislike the fact that you either register *all domains* or *none at all*
> (unless instantiating two different driver instances and that's ugly).

I don't really like it either, but is it possible to split probe deferrals?
I mean, if you skip a couple power domains because the clocks aren't
available, how do you come back to them?

And IIRC for a clock provider that is _not_ marked as disabled in the DT,
trying to fetch a clock from it would just give -EPROBEDEFER until
the provider is registered.

ChenYu

> >
> > They should be bundled together at the very least. The power domain
> > controller not probing disables all display and multimedia capabilities.
> >
> > Also wondering if we should have "default COMMON_CLK_MT8195" ...
> >
> > I suppose the same questions apply to other SoCs.
> >
> > ChenYu
>
>

