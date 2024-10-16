Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB92D206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 07:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=; b=cY1fiWr4nz9nr9sNjBkkz296nD
	FbP4MBHU32GqMfSnsi+PCZD+Me2hKdNuliJa+g0WegYSlZ1aoafco6O5VCbsX+kpj+zAA/mTCiVBa
	WWjZQ03eRhsrsGh+rHpfDXYmWkED+Zbw6m9aKiPsmpdsSrsi8pxZuQwKGygRspiQs56W3qE3oZOr5
	zkocciIoT+Z5IS/JWS3j3/AkAfX5C2nYf7dqoabucL17yw/DV9OfJN4BeilRdK3rzAGH2vXqAzxBk
	0HZ7rGP+O5pbpF3ZhxHRGohCB3FsGjf6PXhsE2jHxHUCG6bHJeTCD5sBwQQPU3AX71aBAMjo3lIOU
	+k5jQB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ygf-0000000Ars5-0M8y;
	Wed, 16 Oct 2024 07:43:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ydA-0000000ArDC-0b71
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 07:39:41 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2643809e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 00:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729064377; x=1729669177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=Kk906cRcf8c1pZdWamsxmPoIhONkmOpdMRyrgYb8daqxp1DUg+w9SnAVnH/Oi2AKae
         VXA/DBo8WWc2rpgpmRdlo+y+KPqw0sJViQUsIC7YeGCBLW8Q57RdHsqKbJsfgrgfS1f/
         hmDUFcUR2M20SQs0JFDrE5UIjzvJ7z2YcQsKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729064377; x=1729669177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPoNwCAoKsusx7fJ/VmaMrRDN4bS6yShBbiSyUB5tqo=;
        b=HaMtLzzIRZrUJWAYumjAOaDaUHoQQf2CH0MSBEw+6t2G21c7vj/rlpy6bNcj2lOuCK
         Eux0fynY7nrjdH6F42sHQCMZDg8ZEw59L4ym1EsIwqrDPkReLF7wg5fTWMHz1WKAkG04
         YNoljZEXzqNwtOssRf8nGhV7b+LSptFU1Os7yyJp8aJ1IDnhADGBuYmdBXNF5HF+hdlN
         FLg1jZMHXoY1kpKphvjO+I472AQOIswocmuG4Gne6WmcdzhRyNvfb0eVQj0LZZlm1119
         tzpYx7u64Euh3lKnxYAB0MQJQMRPoQkcYs64Z0bY2JMniQZEM40L1LV2zvg41DiTTsxu
         vbag==
X-Forwarded-Encrypted: i=1; AJvYcCV440wBDefILeheiEILDeYjPF+Xh+NLRWnLwUrJfldt2iVM2kH09x8YWJfGqGak2bOaicgCyj+KIIXsO3dhxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzsvHMaSHjXV8aQbb1BwhR2+BXW7z45Tmo7YRRtXbz6DAPunVx
	4LRVNx4XRRGngHUOt72CZhBR9OnCwSSnmLsCJ/9v+Cv+geHyY6Lwq0hskvfIVe3qpSDs2+zv5vN
	MimD4sIa+yjAYdsgdeUCxANd06GX5laoFtTe9
X-Google-Smtp-Source: AGHT+IFZ47ariW2Rra8wgmSaA6DC+PU8PnYnhILwMybMfHSnCE3ukSpG6GGGC1OiiQsMnz8LTDjTAbXe4DKeoahrz7s=
X-Received: by 2002:a05:6512:68f:b0:539:e317:b05f with SMTP id
 2adb3069b0e04-53a03f31724mr1842549e87.28.1729064377360; Wed, 16 Oct 2024
 00:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241008073430.3992087-1-wenst@chromium.org> <20241008073430.3992087-6-wenst@chromium.org>
 <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
In-Reply-To: <CAD=FV=Vs2bekyqBN_Lro_u32Dg9WM-bjDZr_tx-KyYH_toabVg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Oct 2024 15:39:24 +0800
Message-ID: <CAGXv+5G4OpGK77D7Jo6dtPj_R9=6Uy9GjuQ0O8su0Z--ejboRw@mail.gmail.com>
Subject: Re: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_003940_274689_B2F78807 
X-CRM114-Status: GOOD (  11.39  )
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

On Wed, Oct 16, 2024 at 2:00=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Oct 8, 2024 at 12:35=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > +/**
> > + * i2c_of_probe_simple_cleanup - Clean up and release resources for I2=
C OF prober simple helpers
> > + * @dev: Pointer to the &struct device of the caller, only used for de=
v_printk() messages
> > + * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
> > + *
> > + * * If a regulator supply was found, disable that regulator and relea=
se it.
>
> nit: was the double "*" starting the line above intentional?

Yes. That's kernel-doc syntax.

> Other than the nit, this looks good to me:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

