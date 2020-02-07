Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A51C35247
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 03:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7A0721D7D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 03:07:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JM2m+GLP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oPPLUfN/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7A0721D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rw8ooeTaciQ1AHufkgP6V64X9OPaEHV8c6ijItrRzr0=; b=JM2m+GLP6hgQpT
	MhQhZFcKWkNwlCX5b17SO4trvPT0oJZglP2vuoHKtBIlwhJmu7OuHkS9lmUqivaC2ZwuORJWXWaps
	P+BXv6zFfO+gxTQr+4vc++vwBKp0NeqFYz+XnrYlGppvPG7AH63EE2VktEFS/Ge0On/4HWJhRQ5ig
	DHJzR6PFpD5rfZCKWeGeQoMaaHZ3wkmsy/8QfUuyqOn/C/xDdVItl1ma0KOC7ZXFhyuo1XbXuAeqH
	9L+Kio7U6tBPxRCZmi/NeIDaKjucfRiMhqJeLvLURQhakWLpbG6epjWcFe3u5+ltqFuA+KAy41v1A
	6uOjPlefbhsWapIImB8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iztyo-0004fE-9F; Fri, 07 Feb 2020 03:06:54 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iztyT-0004Gg-DX
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 03:06:34 +0000
Received: by mail-qk1-x742.google.com with SMTP id a23so896865qka.1
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 19:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3TxFkwUBzoZxEqhHCb5Dpa2HZc5hJhUkqC/KNrkDQc=;
 b=oPPLUfN/w8TsNQT5FmZWFRbcL2X+OQPCnFdi3CoAh86Vc1akO5DDdEuhA4jXAT8Tgy
 +D48c/EPGWfn/tkt+76tePp/JgvcAiokBGkYgxFjqw/N5OST8Z+xEkNgfLWT5N+Mpp7E
 8jzLtZ/IP75iaFWsIKlT18p0KVqhZqOaK+zxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3TxFkwUBzoZxEqhHCb5Dpa2HZc5hJhUkqC/KNrkDQc=;
 b=IHPHWH8b8Vo8qNk2LrUkMf9PR+kM08xrNU4fh+pgs6bzUQDuTMK671Yn6wcq1/cp38
 JRGinxjRBRvhp8zucnCvuE/iWxUJt1x9CW/HEHCKz6lWsYwaDdlICy06qDWLPXbok6cQ
 o0AfJYAEddOQv2BD3AeWOJjB7gqVeB9QGQjLbIr0ByAGPDIEhZj6ttAJajLpA+nYSyU8
 iWzBzDBTmuRwEmyfLjbDHu2dLLdCEGIsK1t+aVaDmIeHTxhl3+qPkTTsJab5Wos1w6yV
 c3oumwCkDspLhMMIUyD5kW4VpDov3UHOzP2Kq+epYEHZMPyYqxwEr2WMzfOXHDUUGeoc
 N+AQ==
X-Gm-Message-State: APjAAAWChCvTB1A1yO1fX0BEx27CRhBmVs+QNdpXLgYa+trkd+wwu+Uo
 5oYbl8+jVh0/uxkroztKhnQj9gmpOAO1MzZwZ0DqBQ==
X-Google-Smtp-Source: APXvYqyylJuMDkKA7gnAsAhliXtut7vEzHdVLf8fTNkkiclmjbUpYD2oxeEcbD7bCMDcK99RCxtzazSCPbnSooRDfo8=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr5455012qkg.457.1581044792080; 
 Thu, 06 Feb 2020 19:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20200114071602.47627-1-drinkcat@chromium.org>
 <20200114071602.47627-6-drinkcat@chromium.org>
 <8b300f30-aa6d-89ee-77e3-271e3fa013f8@arm.com>
In-Reply-To: <8b300f30-aa6d-89ee-77e3-271e3fa013f8@arm.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 7 Feb 2020 11:06:21 +0800
Message-ID: <CANMq1KDEdbiHWzfZhvfpKG4cNOnp_x3bMO5rOaCuLzNJ5W4zEA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add support for multiple power
 domains
To: Steven Price <steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_190633_492078_C695A5CF 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 20, 2020 at 10:53 PM Steven Price <steven.price@arm.com> wrote:
>
> On 14/01/2020 07:16, Nicolas Boichat wrote:
> [snip]
> >
> > +     err = panfrost_pm_domain_init(pfdev);
> > +     if (err) {
> > +             dev_err(pfdev->dev, "pm_domain init failed %d\n", err);
>
> No need for this print - panfrost_pm_domain_init() will output a (more
> appropriate) error message on failure.

Dropped.

> > +             goto err_out2;
> > +     }
> > +
> [snip]
> > @@ -196,6 +274,7 @@ void panfrost_device_fini(struct panfrost_device *pfdev)
> >       panfrost_mmu_fini(pfdev);
> >       panfrost_gpu_fini(pfdev);
> >       panfrost_reset_fini(pfdev);
> > +     panfrost_pm_domain_fini(pfdev);
>
> NIT: The reverse of the construction order would be to do this before
> panfrost_reset_fini().

Oh right, fixed.

Thanks.

> [snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
