Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4A8C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:47:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDE9B64F85
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDE9B64F85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AUiBSLoJIdhAdex2Ww4zBz9BH3j8t5zSW1xh1ACk0hc=; b=qTAGzYP4QPPyT+uFaBMa7FLVV
	wyO99ahnWGFXUxzSj79S1LrRsdBhLOTQWVcI4XsH23uvjBQij/x/8LQ8L2U6e3f4XsVhcNskI9aEz
	3IP/EObYzQ9ZqY/mG1SwR2DfCCILLlmMKpAqUgolTe+NuJzRvJsJm97ux48Wmv9MUy9a4ns/4+6i5
	T5uLaj/CEJi5AqsyFo6dnhSQZcFKuGO1qjWWbwsU9jjtwRxvr21sxikLsvQ3viKg+NZFpcy11qvvy
	LRiLSIxiIg59xdYVJPbHDV0Ndos6Eqgw6t5WzKbQmLJnpowyDDbbKx8vCrw562f/7MJ7teFifwOAF
	T/gpOGeyg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJchd-004k4a-AR; Tue, 09 Mar 2021 13:47:13 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJcVs-004fjp-Ju
 for linux-mediatek@lists.infradead.org; Tue, 09 Mar 2021 13:35:08 +0000
Received: by mail-io1-xd31.google.com with SMTP id z13so13888528iox.8
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Mar 2021 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ck/z2PY7/UU/12vnfcPHwdLBuV3dty8tKqz5xSr6NUI=;
 b=FvbITe/rw5UXY8n2Lh+pG4r07ytXqmmOcTREfFBp01LINATnkkXntHCLudSH5T3Zya
 IFCjDgAKS0cB6X36Q1MFdu8Tsv48vx3CatnzrI1690gOoba3wSEeRzbt169NnaLo9JaF
 +NRC/RrkZGprF2QN8v2JzGhUSQVdo6skIS5R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ck/z2PY7/UU/12vnfcPHwdLBuV3dty8tKqz5xSr6NUI=;
 b=NlXHrqo2FZZsfYApIW5tUb/GGqWq1uqYOjuxuYSXKUZ9NqaYk6kP+cXVH8c4i2PZUG
 4StdskTXpikSyyimrq1a4lZVlXRGS2tNRZO80ZMWUbZxI3IuC0+RhN8SYNFI1O5LJ9rX
 N5GK3+Uviv2da93IV/y36G9zeMjykhaCbLiJaToIpp5FoqltScNk47tDrF44O9qfBvx/
 9IMeKeKaKDBbI+Ga5skrSjCRjL4uOE5sGLT4Zma85N6hmgpOZ9y7+izNp4SNH+xU116R
 u2Dnqnlw8WMllMfYnaZ+mafOBcqUTwG1O8tElJ2wNEd8G7PXJ+gp3Bf7D/xKKjFeEjvS
 rTfg==
X-Gm-Message-State: AOAM531OOtPFNLr5LV2jJED71XpbPZWF5N+2ogltqPlpwS8FqOMH5agh
 aCd/VmSBOIueV+dSnC7sws27IEUZvukVkHljeXDVpQ==
X-Google-Smtp-Source: ABdhPJwoQjXmYHuZH34QTV1eLRGy43Jol14I26e2wLS/nTH/45wMweeWOOE2mEMr7+tdkvvp21gXyu25ZcW8C7AYcNE=
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr23172366iom.40.1615296902992; 
 Tue, 09 Mar 2021 05:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20210308043607.957156-1-hsinyi@chromium.org>
 <20210308043607.957156-3-hsinyi@chromium.org>
 <20210308171644.GE4656@sirena.org.uk>
In-Reply-To: <20210308171644.GE4656@sirena.org.uk>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 9 Mar 2021 21:34:37 +0800
Message-ID: <CAJMQK-jZnQ1pt435Dz=xAbuU=wJcMJkSFSnTtuARTW_rGwRCFg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210309_133505_354104_B42BFA4A 
X-CRM114-Status: GOOD (  18.07  )
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

On Tue, Mar 9, 2021 at 1:17 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:
>
> > +     adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> > +     if (IS_ERR(adap->bus_regulator)) {
> > +             res = PTR_ERR(adap->bus_regulator);
> > +             goto out_reg;
> > +     }
>
> Idiomatically supplies should be named as they are by the chip datasheet
> rather than just a generic name like this, and I'm guessing that systems
> that have supplies like this will often already have something
> requesting the supply (eg, it's quite common for consumer drivers to do
> this) under that name.  I can see this being a useful thing to factor
> out into the core but it seems like it'd be better to have it enabled by
> having the controllers (or devices) pass a supply name (or possibly
> requested regulator) to the core rather than by just hard coding a name
> in the core so bindings look as expected.
>

I'll move the regulator request into device instead of core in the
next version. Thanks.

> I do also wonder if it's better to put the feature on the clients rather
> than the controller, I don't think it makes much difference though.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
