Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8CAC4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=; b=Agm/RF0lxTYblo2yKIFvzDzUB3
	4cQLjxXKHTsV15J6ndzQ8/+W35MV4vlufrUfQyUN6s9Oz7bULt924OW9ckDk7heJdI9kA2bdptPMW
	WBpzgzuIPTZJvmsrprrlNDcsn81+RX1Ow9AY8wxVZszcd61KSgb5LA/9X3N6HRB2I+PKMNc3EKYua
	u8KNZssVfn7Lq7lNvjQ4ZjMAgC5STOEURlbdmkK0kO82X0wm00Ijj01HXmM5WsGrZ//OXd4KXsimY
	T99Mhmqno+WTouMApaTEqDzr2Htr6qWmmLHM+VE/vQLagYy8rSZ50STHkYXvPyGBVtRhjM3FpxCR6
	PjIK/1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYYM-00FVVz-O0; Thu, 05 Jan 2023 22:17:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVDd-00DmSr-AB
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=; b=g9wvH+gzqzQLvXf9v5NDqr6M0X
	ixGawoNKLEew7QP9PNBx830p7eryyAeHgkvea2toQLbVR8DrQ/F48YtYZdCH/DH9Ayc+aiBu8Ce4U
	6lG+Hu9itybH1R+q4d6QicwKcC6189Ii1876K5ni+Gt77vufhIdplPh3e+OrOy3ONb03+UDC3tjEE
	BMyHfXz2yteu4cq5vBDqpWelWtUM3pRPwbpHrMQLFf803EGo0ByxsWCFPLopIlDyN7xoEQTORVD/N
	3g7k3nt7X553DvnH3OdX7OEMDDJHeGjulUBPpstzFkTLGp6KurZByAJcAUtdNnZEBue5E9Bspvw1J
	1acChSIg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDPYD-001Ji8-2l
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 12:40:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id jn22so39179311plb.13
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 04:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=;
        b=WqOPsqXX2ewSvH7B48+QZ9gexACaAIPSTW6samQrhGDk3ReNr+z1v8Q0NBGukBAtx1
         a0oOxDFOoEU+ckgoMN8keKHg34F/H5sp1CUAo5gmiuDGQ3//P639SAyGMgd8WqrDuoD3
         vpJjb/Vi5r74Fdr7/ULMEpelUSHr1SzrCOdgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnXaK3HYfg+sF+zo9OjEmDlKFzBQ2X9tvLZNIaK2n9w=;
        b=J4DfEdGj54U5/iNGjhSVig+aBS00HXIoZkzYgrwlw7ibF/7z41Tiqg0dCeYrYmJ4Q2
         kaglFEHilsc9Tuo7DYVzodpVLBKDAyEuA+Tc8d8GUMfFMwBd6vLfVBWa/gkBEnreJxZ4
         w4rveDraJZQPjY76rrUzC0WxlOynOhE/GuHbvWkTU7kV9RElHMSTO8kBNrTLAVrHJ0OM
         QaV6g1jVVNPl8R+Zx44FUpPjbH2Q8izPCAZjC/BC8I2kTAJqxS1dbCNlcaUfnEhFIu4g
         0pIK2jLPVBEchJsK9rjZtg/VYhcEcTEMF6oeUjtJFKdT2XwdoS8xnY4rS+SuA1uKvyrq
         7rig==
X-Gm-Message-State: AFqh2kqwaAuC6a7PLzd7NIcuhcgqn+7EedpXmUAuvdJmUHXjWyPQGxjz
	IdM21H4OFgz2IOCdrsvglwiS7dxQoIKoqAt2FUc=
X-Google-Smtp-Source: AMrXdXtS27Cc/TDCxInA1VcjuqIvculHO0vwWyPbGPXsHHpmTOc3pFufMzVtRXz59V2FQy7n/u2D4w==
X-Received: by 2002:a17:902:ccd0:b0:189:6ab3:9e57 with SMTP id z16-20020a170902ccd000b001896ab39e57mr57006820ple.22.1672922457039;
        Thu, 05 Jan 2023 04:40:57 -0800 (PST)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902e9cc00b00192820d00d0sm20240451plk.120.2023.01.05.04.40.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 04:40:55 -0800 (PST)
Received: by mail-pf1-f179.google.com with SMTP id y5so179287pfe.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 04:40:55 -0800 (PST)
X-Received: by 2002:a63:1709:0:b0:48c:8cc5:1b73 with SMTP id
 x9-20020a631709000000b0048c8cc51b73mr3002833pgl.520.1672922455058; Thu, 05
 Jan 2023 04:40:55 -0800 (PST)
MIME-Version: 1.0
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
 <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
In-Reply-To: <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jan 2023 13:40:43 +0100
X-Gmail-Original-Message-ID: <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
Message-ID: <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_124054_007134_6BBAB0D4 
X-CRM114-Status: GOOD (  17.32  )
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
Cc: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Thorsten

I replied on my phone, so the mail came out in html and the list did
not pick it up, then Frank also answered in html.

I believe we are good with this:
https://lore.kernel.org/all/Y7WOlkuLaLt1DdY+@sirena.org.uk/

Thanks for headsup anyway

Regards!

On Thu, 5 Jan 2023 at 13:21, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [CCing the regression mailing list, as it should be in the loop:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 27.12.22 11:28, Frank Wunderlich wrote:
> > Hi,
> >
> > the following commit breaks SPIM-NOR on mt7986:
> >
> > c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
>
> Ricardo, do you have this report on your radar? Just wondering, as it
> was posted a week ago and didn't even get a single reply afaics. This of
> course can happen at this time of the year, but I thought a quick status
> inquiry wouldn't hurt.
>
> >> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
> >> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
> >>
> >> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
> >> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
> >> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> >
> > after reverting the commit, no trace happens and nor is recognized on my board
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
> #regzbot poke



-- 
Ricardo Ribalda

