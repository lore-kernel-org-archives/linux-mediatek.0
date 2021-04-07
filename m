Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E1DEC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 07:32:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6F56139B
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 07:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6F56139B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Pqqp5fG6J7OuvqTu2j1OONbwxv1e1zxYjMERzb/vcQ=; b=PBZ8Q1SU2HcowwZ3T3D0R0AJC
	QXEh5A4AtE3cBhdEOd3oexDVWakAQh0zVepdrR5QVFTwnFXf31t76RryMlX69kg7YyGRmFPJQBuzj
	ElsNfPy5WIZNb90WjbO5ZXc8nfYfWjeW15rZUrQEcnYH2uD9y7ZIuTtI15T5uThxaSBUijoH9E7Ht
	YELPVwFEVwR4V9Lz9ZDIR+b4OAZFXOdIEY6GbSu9iV9+cUQWDytf1n0fxB/a+y76D/c/E9eVJN3Uc
	B0BYMEojTUGcm0NJ361h2PFY4zcvfLS/C/u+54qqga4TGg94XH38f0ZcTOCVztM6e+7d1c2HCTOJp
	qlcscck7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU2fX-004MYQ-1e; Wed, 07 Apr 2021 07:32:07 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU2er-004ML0-Si
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 07:31:31 +0000
Received: by mail-io1-xd36.google.com with SMTP id x16so18363277iob.1
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Apr 2021 00:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vo0QZz25bVs/2wmsHRn68V68W2L/UX3nLq5t9B4qTO4=;
 b=CJAEOD5aeMlKoM1hzsZ82mfcFqX0wXQLRiDLPpVwA8eL6sw1FhbiTSZeDa5ZQTGHG7
 LQkMYNnxW++y+rUKTMoFljoeCAt+uadx9x1TFj7rxa4HNYWdAmPMCF/HrZHmYwStkzTQ
 YwAAALsXptK9Yhkho8mWNf8m17qt2IDCX001A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vo0QZz25bVs/2wmsHRn68V68W2L/UX3nLq5t9B4qTO4=;
 b=iSfAzi8/0+c+dD8T1i4yEb3Z+lZ+sRGXPPXIOALwu+w38PLXnmVBDOCKjJSBTDzLoE
 Z3c2D6L8fC+TrgaqKqhtuLBfaOQP68hXnQiSmN+I2zui89XinSkV3WIkhDvwDXD1iqz0
 cU6Fy8eoxzroMIjjxY++W31plI3AsztDIOmSzNwVtvzWZTqPmmMNn61ysktywKVERAvD
 NJ1pizBSMgbJLOvPF+liTPkNKDr4z1g4klYVw+lF1HYHVbSzkDjJhUY5UxTiANgIIluJ
 l9qS13wJHgdAKU72KbJziuP5gNr93BTPq7F0/Gv5Yowr0KszG499tQt5oFTDMdd3QJM+
 DlaA==
X-Gm-Message-State: AOAM530jpUO92rxVBVWfIEGjItHxdiyNnZcztJgYoD6SHJ1wtpa/7cbn
 kBN4mb1oMAWQ2ue6gODzRKcahAMM7FT481DyjJvvVg==
X-Google-Smtp-Source: ABdhPJz+T5nPKW6gbNnL+LY7rqVL5oNR3VGj+Ica36EvSu5VCzeBQypy3KADhZS8Ye27TvIjvcdTakDpI+xV315kTKY=
X-Received: by 2002:a05:6638:43:: with SMTP id
 a3mr2064309jap.102.1617780682970; 
 Wed, 07 Apr 2021 00:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210308043607.957156-1-hsinyi@chromium.org>
 <20210308043607.957156-3-hsinyi@chromium.org>
 <20210308171644.GE4656@sirena.org.uk>
 <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
In-Reply-To: <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 7 Apr 2021 15:30:57 +0800
Message-ID: <CAJMQK-jqrBdfROr_XZakQb4v+jB31hvLejcSBZjPo=TYqKar1w@mail.gmail.com>
Subject: Re: [PATCH v16 2/2] i2c: core: support bus regulator controlling in
 adapter
To: Mark Brown <broonie@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_083126_494349_774D255E 
X-CRM114-Status: GOOD (  21.40  )
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

On Tue, Mar 9, 2021 at 9:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Mar 9, 2021 at 1:17 AM Mark Brown <broonie@kernel.org> wrote:
> >
> > On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:
> >
> > > +     adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> > > +     if (IS_ERR(adap->bus_regulator)) {
> > > +             res = PTR_ERR(adap->bus_regulator);
> > > +             goto out_reg;
> > > +     }
> >
> > Idiomatically supplies should be named as they are by the chip datasheet
> > rather than just a generic name like this, and I'm guessing that systems
> > that have supplies like this will often already have something
> > requesting the supply (eg, it's quite common for consumer drivers to do
> > this) under that name.  I can see this being a useful thing to factor
> > out into the core but it seems like it'd be better to have it enabled by
> > having the controllers (or devices) pass a supply name (or possibly
> > requested regulator) to the core rather than by just hard coding a name
> > in the core so bindings look as expected.
> >
>
> I'll move the regulator request into device instead of core in the
> next version. Thanks.
>
Hi Mark,

v17 is sent here:
https://patchwork.kernel.org/project/linux-mediatek/cover/20210309133131.1585838-1-hsinyi@chromium.org/

Thanks.

> > I do also wonder if it's better to put the feature on the clients rather
> > than the controller, I don't think it makes much difference though.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
