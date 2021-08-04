Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9B8C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 23:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A473E610A8
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 23:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A473E610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Vi128JLS+sm7y7oAUY8/8BmJibaVuUQw9tcbQUuIe4=; b=mRnTbLQr2ZAxhv
	ObtLMZ0SJQKdAFJPquTQcbeo6ZgxHcLOv1g5GKzExJLRIultKshKSoWoRNr0Qd2dM68EWr8IVwUao
	lHgbaBSPzSZ0s1JMUGHK61CcDOQIeKJcFbl6YH+c4QeUK7xlGqNDb+a5qI9+umD1mU+dDM5HXxPlM
	GqvY1KgI5Hg0T+I365+eOkfKtWdjFTxr2LKE10NBAUkxm9muQLbJ6JPLVKLTZJVyNBN9OuxCCDJxn
	ulAlks8/OYAS/jp0t3d8zLLCBjs309UNf4udF95W89KdDRRCWXhUOikXW50e547RDMc271xdEzCAr
	ewkbIj4+Txzycw+LOKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBPtv-007dqi-Va; Wed, 04 Aug 2021 23:02:16 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBPtt-007dpo-8m
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 23:02:14 +0000
Received: by mail-lj1-x22a.google.com with SMTP id x7so4422922ljn.10
 for <linux-mediatek@lists.infradead.org>; Wed, 04 Aug 2021 16:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SWwfAxfR7c4JrRsq35ex9D7DmgW1MFN8V1BR9OdGE3s=;
 b=Keuv9rmwBrPD0mImQNgZzTd90sUsS01XNQNiwlt6tUctK265kK/0g+VQw++Z0LJ8qV
 GA4DWAfZNHOkzruKioaUUOXybY/N3gQn6kkN3XLaOSBakIKXZndZXC2tiRDeFktVD7Nj
 U0Lm5nC5tMADC75PQ/9NHb8NooglHWqHmvM+OHuDYnUSML3W4AbM0TTOy2LNgvhKuSei
 lf/5OI2gFbsAb20Sh2cs5P7osRk0xkL/MEsxQKRh+GvSwbLa/5U+6VT+VQd2vAdi3xPY
 H4PSSHtVkLqf95+zWzC9dGeT086BV7ACrUGMssBe6ycVsdo1gmnobhnCi4EAlC7j/Kgp
 D28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SWwfAxfR7c4JrRsq35ex9D7DmgW1MFN8V1BR9OdGE3s=;
 b=JimZ9LetlKef/E5J7vGAdmwkkxAJvmSZP0JZ1STk+SPEkipYudOBdPSIBpXj7+nL6N
 DQM4DOqlcIz/uL/O+L7F6zim/SluPm5s4h3+zSawB45a89GuJMdnR857ixjdGU7VzUud
 99aDjMyhVZ+YYlZXXZIe1+bwJQAnsVDRLPE1YLN4nzZs/Pc6spKd6CAc1Dlqp/GudXnY
 zrA99NSca3cP5O1MvDCTxBwpx0FXiWawT0jiLx0RKSI+DetSiLtuKSl5INmz2N+n/Ob/
 66W7QRKnO/dxrnJklGr0yBTR5htnyR1UnJ5OM2ug8IT0ALymQw6Nz0LoDecgFma3HMMg
 cO5Q==
X-Gm-Message-State: AOAM533F/UMO4qCqTWwlg0TNmtlWN5PoNokMEYCYaTDyuHI0nUdKOEsb
 zp/CuRxrkefxwbOuCkfjFypxky7ItffclEe8fMwyNw==
X-Google-Smtp-Source: ABdhPJz61O47mzHH9624bGfk/bfpBA1SJ3dnMpXd9CQG2hHPT+eKzKSoE6RiH7zQjaw6hJgUxRPNoePE54zpybhVLJI=
X-Received: by 2002:a2e:7c04:: with SMTP id x4mr1038597ljc.273.1628118129818; 
 Wed, 04 Aug 2021 16:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
In-Reply-To: <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Aug 2021 01:01:58 +0200
Message-ID: <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "zhiyong.tao" <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_160213_390460_0490A389 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:

> > The rsel actual bias resistance of each setting is different in
> > different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> > common for all different IC.
>
> I see. I personally prefer having things clearly described. I can
> understand this might be an extra burden to support different chips
> with different parameters, though this should be fairly straightforward
> with lookup tables tied to the compatible strings.
>
> Let's see if Rob and Linus have anything to add.

Not much. We have "soft pushed" for this to be described as generic
as possible, using SI units (ohms). But we also allow vendor-specific
numbers in this attribute. Especially when reverse engineering SoCs
that the contributor don't really have specs on (example M1 Mac).

The intent with the SI units is especially for people like you folks working
with Chromium to be able to use different SoCs and not feel lost
to a forest of different ways of doing things and associated
mistakes because vendors have hopelessly idiomatic pin configs.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
