Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6934CCE7AB0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 03:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frs1KSFCSS0JpElWdth4hB4NSBy03nJOWJU9+47Nzc4=; b=SJixtx61oRyRieWK9lEkLWpCWl
	x3DxyZCKzet3jG4YEVRZb0dyuQ1V0+o4FY519KdnJUIMZ86y+tWqu6qRrOPMUW+1dvMm82a238Rrx
	3wdY8R2p4IsKvPIWs3sh+lQVpHNDty1REpchoKLzovtY5YsbKFhGthc8LZyvb9jh4UC4EOVCWLdEM
	enwqj4wqXSZaecnLl5ou6G/IdFMSi8bc1PQPFAcB4isosff/AyPgkB27hKOBglELPiYKRg8kpY5q9
	ve20HMq760xSPZK8ke/3FthNEnF0VmC6Ws6WFJfZOoRwnPXQcxQZaSsomJ75VFwq2tcH6A9I2vDfP
	aEUuXOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snV1x-00000000MR1-45pK;
	Mon, 09 Sep 2024 03:25:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snV0v-00000000MJc-3b5f
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 03:24:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53658f30749so2815477e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725852268; x=1726457068; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frs1KSFCSS0JpElWdth4hB4NSBy03nJOWJU9+47Nzc4=;
        b=Cs9Sn2PSCxWMW321KlLFdjbP2CVsOKdEQY1nbT8ylx0jL0HQ4G7xX/wS+czvFTMzv/
         RoCrtXe7vQOWF3gllo0QAbCGAGKv6M7eWQ2MVE4YsGxiQ4Q9/ePqRfZUPkI44WyIhyd7
         dId3twIh8EUJYdoP1NUCrMkVlY084HebfXlUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725852268; x=1726457068;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frs1KSFCSS0JpElWdth4hB4NSBy03nJOWJU9+47Nzc4=;
        b=Mpik+6S2JcF6Jsrtn2E32YFJA2/YPxyhjU0kPuRMDG6U9QeMXPgCovmlZlqdrlawwl
         cEH6h3g5o3d97sVbJEeng3w5BZXjLm2SJZQJB71/A8XIFl6LDLyPjaVrClPcRb/yl9On
         6Cm31N8Ksl36jUmOcTlMnHEZ/wMkBiCzQylePNzd/raDyqPlWx8jgTMlgp2SG16xv9rN
         GPuJcgwdmTCqga8XhljmJGJ8BTuFS5ddUKv7jqe7nQOnpwPcpWc1PBLdvU31Y95gRCRx
         Jrptor2ivaFA2o/L3mTCwFejigEnmaOilCebpoxxbhX0DWIFl5wqbIjatin7oX7lXxu9
         NAHg==
X-Forwarded-Encrypted: i=1; AJvYcCXCmL2izoTmnB2Mu6c7VW3EeN9WEJCbpHqC/OJS2ZYl04vhm6wTSphae1HOO3SocHH//7g2GkOPUMYG6VZWMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBH/isLn91akhSljj1NyqWuifZ7Yghs0/4jXs5o5+pzxcaRSw
	oVi0PW+PoUhGSx1MnJVG7lrNW6BuTi1LDzzrENFDvTbXAMi+n2kMarYlOhJZKE0qps9s3RQ9Bx4
	fd/hOMyzSWAnjEXAu71+NSabBhk64aXTY3F6r
X-Google-Smtp-Source: AGHT+IGGXKgPLETTHLUWOOhnE7DlxTOB7pQ5xz6dQdhouSMW1QPkyBdJaUNfm4Ni6IhLXaV+O7X1PD7KISZ/W6Rojug=
X-Received: by 2002:a05:6512:ea6:b0:536:5551:b73f with SMTP id
 2adb3069b0e04-536587b547emr5811005e87.31.1725852268014; Sun, 08 Sep 2024
 20:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240904090016.2841572-1-wenst@chromium.org> <ZtyGJhm-0GEEFfYf@shikoro>
In-Reply-To: <ZtyGJhm-0GEEFfYf@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Sep 2024 11:24:17 +0800
Message-ID: <CAGXv+5F8rTLdYGjkxyJqUxs=W_L9gGgpHRZZ250swbvDR=zJMQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] platform/chrome: Introduce DT hardware prober
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_202429_937916_C1EC99C1 
X-CRM114-Status: GOOD (  26.86  )
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

On Sun, Sep 8, 2024 at 12:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> this series gets quite some review from people I trust. This is awesome.
> So, I will keep to some high level questions:
>
> > undiscoverable devices" [2] series, but follows the scheme suggested by
> > Rob, marking all second source component device nodes as "fail-needs-pr=
obe",
> > and having a hardware prober driver enable the one of them.
>
> Where is this "fail-needs-probe" documented? I neither see it here nor
> in the dt-schema repo.

You are correct that it has not been documented yet. I will send a patch
to the dt-schema repo.

> > The other case, selecting a display panel to use based on the SKU ID
> > from the firmware, hit a bit of an issue with fixing the OF graph.
> > It has been left out since v3.
>
> Does it make sense then to add touchscreens only? Will the panels be
> worked on once this is upstream? Or what is the way forward?

The devices this patch series targets all use eDP panels, which are
more or less directly probe-able.

The panels mentioned for the second phase are MIPI panels, which require
specific power and command sequences and thus are not probe-able. This
will be worked on once this part is done. For the panels it is entirely
handled in the chrome platform device tree prober. See the following
patch for an earlier version of it:

    https://lore.kernel.org/all/20231109100606.1245545-6-wenst@chromium.org=
/

> > Wolfram, would you be able to handle the late PR? Assuming you get a
> > chance to look at the patches that is.
>
> Yes, I can do this, but...
>
> >  drivers/i2c/Makefile                          |   7 +-
> >  drivers/i2c/i2c-core-of-prober.c              | 437 ++++++++++++++++++
>
> ... this is quite some code. Would you be willing to maintain it (i.e.
> please add a MAINTAINERS entry then). Kudos for not touching other parts
> of the I2C core!

Sure!

> All the best,
>
>    Wolfram

Thanks. There are still some comments to address, in particular making
the prober more of a pluggable framework and exposing more code as
helpers.


ChenYu

