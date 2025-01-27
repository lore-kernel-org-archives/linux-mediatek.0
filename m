Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB08C0218C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jan 2025 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=; b=AybrZqZZSodrLdy1qTtI4fKS4y
	eOKM7pI/GnwYRahufnpqt1aeupZwQhSPdWSQNKey+gfoPvFKTos1HLZi004pXqCbrEo/fce4E1G0r
	xX+ZLHV2ZqX76+jL+5M2nf+29jwjlUr9u96F+5WfbapM29Fm+5401/W5W0hKGVvcuZyZaGXVyHt9L
	8sftx9MbCdQPrQMtcOFAP85PU6TczRCz2rnmjPLl5lPkdfD5gnMR0Zl3gc3TqH7UJKflIk7+kBy7K
	DlGsqCMH2tyxTaVg2pUHSaMK7IErPRtmjBBumn07gfCUxn7LOjeqRSLea3RrqGFsg25LKshNiAUDi
	Bkcqh3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQrp-00000002ZwY-21wo;
	Mon, 27 Jan 2025 15:17:37 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcQqT-00000002Zec-3URD
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jan 2025 15:16:15 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e398484b60bso6702650276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jan 2025 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737990972; x=1738595772; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=;
        b=LO/r0+63ZMl+ex3ZsFUVzafXuUKJvWU1PtPdTeEJ1mvWlRqMdnh8S8HM7ZrULG9uqF
         1xYUGaZTdsiF4fk6aWhO4vGby+2krZSiHsw/qZsqTt1rAH58utt5joQaLt7mGjVHJgci
         sguQeccMDhGQ963XHJ4+M7lRCtprJbNiCmywSVC6m63x3UnqnekqS87VUR3Bw0BCLmeN
         Bno9OFshc5S1oGpaDhoH2q7XfFiD8iv8Bj9FLGWpgQPi3e/rGYrgBTqbPrTn6/17s+ui
         40ATiJzq83aXkKbK9JbV2GpYaLMBTuLhrw4Z2JTO5My27tYvJWTWgZtb5eOhmnUdQ6bM
         5bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737990972; x=1738595772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3fdf68cKnEaIGamBbArQHWaVBKPqUrbMqE+m1JNXYk=;
        b=ccdEZ0bSSC/ymdMAVzNtm7l4pfMy2RifXQdzZiyKKWfE2g7PhCuL6fgQemvdKPi5eC
         +1xfOKdM2kAy8Q+RzIgvp2gueCeLobGOiYx/8A0QV7NvCGaH3Xh+HU5TeIhfLbQ063Kk
         Y+2Us3KiylY20BUxyHdtd4m5rAy4IwpJatr3QaISsHJSlyscud2t/tjB1hNQJD1SuYmB
         4D70m3wxJYWomO29bAZmXZNcICQ8KIp92StFA1lg6fAtCYXEoTZEtLWyklHM7ngjhEen
         fTATucMcUi7s1064oG8UyAPVoIxGzsCcOBaJtbbX6AREovz3BI8rJqy/UZEY7Lq93mJS
         Yp1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTzbZr1fNPW9SriSjO/vHA3B6BdjY3t28yPoaFtv+B+Mkh4G6STGV2nca/RU+FrIx9wKsE2JOTbJ+S96jF3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHOs/uSbHdvraha5pryv5+B0yRLB8vIUbejFVkECBHUMVjtydz
	RTlIm5fsh7R0A1ZPF4IEAS7vAfCY3luZ4cuNOXeWlVPlkOAmbNZwpTuC89GCHrf8nFryGkytCJx
	XRI/ivn1+Vi34oYyw+m02FHdoHKWvS3rCbqvBSw==
X-Gm-Gg: ASbGncv/QnS6Y91WBt5NIJqO3xP1f6GQKpsK1EmZLslcyavdEVM75k+3HdGlS6g590w
	RmfQ8z5c3zfU3DKwxs9uH9cXMTsyCbJnmSm/kaas4FOZltD534fbCP6llb2AnpwI=
X-Google-Smtp-Source: AGHT+IE7Vja9677she6CObvFAbVBiI5Ys+p+eByoUyFiITh4qV3MJatrF8vKcAYHzhv31KbUMJyT51BBZJ0PLRNDtTM=
X-Received: by 2002:a05:6902:150c:b0:e57:88a0:3ca with SMTP id
 3f1490d57ef6-e57b1344ac2mr27218044276.40.1737990972298; Mon, 27 Jan 2025
 07:16:12 -0800 (PST)
MIME-Version: 1.0
References: <20250120184728.18325-1-ansuelsmth@gmail.com> <20250120184728.18325-2-ansuelsmth@gmail.com>
 <20250121-zippy-umber-fossa-abbfb0@krzk-bin> <679770d8.7b0a0220.b6f23.38b4@mx.google.com>
In-Reply-To: <679770d8.7b0a0220.b6f23.38b4@mx.google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Jan 2025 16:15:36 +0100
X-Gm-Features: AWEUYZnk9Xh1b_Hveu4tndN_oObnjQYSeVJzcpRRCX5DJCyFhAmHsJWAlWuduBA
Message-ID: <CAPDyKFoEDbSfQA3xPCUPsJCOdiDVdAjB1Fno=S7yrqJXSqnfXA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for AN7581 MMC Host
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	upstream@airoha.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_071613_878573_52730309 
X-CRM114-Status: GOOD (  19.18  )
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

On Mon, 27 Jan 2025 at 12:41, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Tue, Jan 21, 2025 at 08:59:19AM +0100, Krzysztof Kozlowski wrote:
> > On Mon, Jan 20, 2025 at 07:47:02PM +0100, Christian Marangi wrote:
> > > -                   pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > > +                   /* Skip setting uhs pins if not supported */
> > > +                   if (host->pins_uhs)
> > > +                           pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > >             } else {
> > >                     dev_pm_clear_wake_irq(host->dev);
> > >             }
> > > @@ -2816,9 +2835,12 @@ static int msdc_of_clock_parse(struct platform_device *pdev,
> > >     if (IS_ERR(host->src_clk))
> > >             return PTR_ERR(host->src_clk);
> > >
> > > -   host->h_clk = devm_clk_get(&pdev->dev, "hclk");
> > > -   if (IS_ERR(host->h_clk))
> > > -           return PTR_ERR(host->h_clk);
> > > +   /* AN7581 SoC doesn't have hclk */
> > > +   if (!device_is_compatible(&pdev->dev, "airoha,an7581-mmc")) {
> >
> > Please avoid coding compatible in multiple places. Not only because
> > above check is slow comparing to check on integer, but it just scales
> > poorly and leads to less readable further code. Use driver data with
> > model name or flags/quirks bitmask.
> >
>
> I implemented this in a more compatible way so we don't need an
> additional compatible anymore. Soo this series is not needed anymore.
>
> Should I flag these as not applicable anywhere in the patchwork systems?

No need to, just send new versions.

Kind regards
Uffe

