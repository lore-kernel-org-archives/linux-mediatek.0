Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2166C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:04:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B3D961151
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 09:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B3D961151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qUjGNMdBqnGU6w1mHejpiJQqv8J5slQSNC6Ts5ME5hM=; b=lecb3yWINWJi4tcy9Ct9WsJZu
	ypSgrPNt2nN8JPiyeIuL/YQ17lzTzxM3nlhkRo0Y6MBxCYjrmVX+LInw0pMA/ZgmQI7r3b2Wwx2GI
	p+PVgjJRdvZpZH+CEWFmi/dhfRBDr3LXx8TizFWGIPAUDlg+xYg4UnucPENQP3mLgvkz38M0mCweK
	HPm3LPTLVPBd1JvXLfG3c73yxdwGVgQxmAqr2DcYz2rbDBt1xPspI72WHYE8+HmIoc8UGbHV/27ij
	qbZ6vghPoIPfNbFtIUuHGH2c9p5hfo9p5xr7iNMjnqMP6WjGtgtjLeG/yXCgGY0BVTh3U9kms8WCE
	lNnFA7wjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPos-009Vzq-OF; Mon, 19 Apr 2021 09:03:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPoo-009VzK-Sg; Mon, 19 Apr 2021 09:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YToQwZXN38nw8LU8icFLB58IB4Z2bfPdJB1gmWWtNj8=; b=0JDWmvZG4NqAgLpIjlN08s5Hst
 KBAZvnrLeKgQea59DdqdLfeKdWae/Ut60pP7B/+3HOA7Ni9YEWkn4/CAjaLy6to3Qy4mBg4jmzIJC
 q5MOGMMkIebMEmFtp5h5m4YBDu3Y7enITH6lNdiN/48/ZFl0xKTwAznm84iUDSZiCA0nklQljgYul
 HtrcKgY9jBnJoolgKvVzRnNVl6ccAUfFUJbbd45ZM2CBFme/PRhNo+XkTj9xQl4znjrIy0ceWf1NY
 S4M9u2vE7jvyNi9f25SOeOajxqGb8pL1JbEWqJ0QN6o6QsTo1CIFCFUACKZCO2KL7s2P9+Pljml2s
 4NL1JVIg==;
Received: from mail-vs1-f46.google.com ([209.85.217.46])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPoi-00BDOT-63; Mon, 19 Apr 2021 09:03:45 +0000
Received: by mail-vs1-f46.google.com with SMTP id i9so2313184vsb.13;
 Mon, 19 Apr 2021 02:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YToQwZXN38nw8LU8icFLB58IB4Z2bfPdJB1gmWWtNj8=;
 b=eL1ufYCDL0+9AZQR5sJMAKYTxr8mN/GSUWxDUBr7glPYXLrJMCbgtsWbeqH+U5yRVT
 ScnHIuV8WDNs00ax+GrUnsSKVj5qJOCLfI1fKTVm/t02Z7KHrrbxQFe5FZ6wU1Vrl1QK
 1zqJOV6Qcym66RaKydw69d6x0Fe3a+B3qYpAzAPGOGsegrQwKYieHtFdvO+BW9voBQH+
 vteMEnRIlCkLByHswifiNhg+hz/+33ehI1a50a7kJukoW0XtGI9EbTAWWknHmsrFzTsh
 VsIyBYopzW/8idNXOkUg3JemByiBB01KKHhul/idHrUqOoiBqHKLkv1sNDPqrgUNW22R
 Dprg==
X-Gm-Message-State: AOAM531dsCuaGsTNw6jTM/Xhy4dKbmtrGDXVSjQ5nbQJyrmr3PEK11xD
 Qc7R3iu8MPJ0SAGbJt9lwo7OHxqcGWew0gC5XOs=
X-Google-Smtp-Source: ABdhPJxHtnj/DXie9H0wxpzVZlSTyniokdUb/gsNNsMkANVtAtzr2mFBhczBYEoBurfSWsjRkBkPBhRAOOMrjVGBWsw=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr13821818vsc.40.1618823016409; 
 Mon, 19 Apr 2021 02:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
In-Reply-To: <YH0O907dfGY9jQRZ@atmark-techno.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 11:03:24 +0200
Message-ID: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>, gregkh@linuxfoundation.org,
 rafael@kernel.org, 
 horia.geanta@nxp.com, aymen.sghaier@nxp.com, herbert@gondor.apana.org.au, 
 davem@davemloft.net, tony@atomide.com, geert+renesas@glider.be, 
 mturquette@baylibre.com, sboyd@kernel.org, vkoul@kernel.org, 
 peter.ujfalusi@gmail.com, a.hajda@samsung.com, narmstrong@baylibre.com, 
 robert.foss@linaro.org, airlied@linux.ie, daniel@ffwll.ch, 
 khilman@baylibre.com, tomba@kernel.org, jyri.sarha@iki.fi, joro@8bytes.org, 
 will@kernel.org, mchehab@kernel.org, ulf.hansson@linaro.org, 
 adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org, 
 linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com, 
 ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com, 
 j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz, 
 stern@rowland.harvard.edu, wim@linux-watchdog.org, linux@roeck-us.net, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, 
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-staging@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_020340_237625_07D52D16 
X-CRM114-Status: GOOD (  47.92  )
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

Hi Dominique,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 7:03 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:22PM +0800:
> > From: Alice Guo <alice.guo@nxp.com>
> > Update all the code that use soc_device_match
>
> A single patch might be difficult to accept for all components, a each
> maintainer will probably want to have a say on their subsystem?
>
> I would suggest to split these for a non-RFC version; a this will really
> need to be case-by-case handling.
>
> > because add support for soc_device_match returning -EPROBE_DEFER.
>
> (English does not parse here for me)
>
> I've only commented a couple of places in the code itself, but this
> doesn't seem to add much support for errors, just sweep the problem
> under the rug.
>
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index 5fae60f8c135..00c59aa217c1 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
> >       }
> >
> >       match = soc_device_match(sysc_soc_feat_match);
> > -     if (!match)
> > +     if (!match || IS_ERR(match))
> >               return 0;
>
> This function handles errors, I would recommend returning the error as
> is if soc_device_match returned one so the probe can be retried later.

Depends...

> > --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
> >
> >  static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match;
> >       const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> >       u32 cpg_mode;
> >       int error;
> > @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >               return -EINVAL;
> >       }
> >
> > -     if (soc_device_match(r8a7795es1)) {
> > +     match = soc_device_match(r8a7795es1);
> > +     if (!IS_ERR(match) && match) {
>
> Same, return the error.
> Assuming an error means no match will just lead to hard to debug
> problems because the driver potentially assumed the wrong device when
> it's just not ready yet.

When running on R-Car H3, there will always be a match device, as
the SoC device is registered early.

>
> >               cpg_core_nullify_range(r8a7795_core_clks,
> >                                      ARRAY_SIZE(r8a7795_core_clks),
> >                                      R8A7795_CLK_S0D2, R8A7795_CLK_S0D12);
> > [...]
> > diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> > index eaaec0a55cc6..13a06b613379 100644
> > --- a/drivers/iommu/ipmmu-vmsa.c
> > +++ b/drivers/iommu/ipmmu-vmsa.c
> > @@ -757,17 +757,20 @@ static const char * const devices_allowlist[] = {
> >
> >  static bool ipmmu_device_is_allowed(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match1, *match2;
> >       unsigned int i;
> >
> >       /*
> >        * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
> >        * For Other SoCs, this returns true anyway.
> >        */
> > -     if (!soc_device_match(soc_needs_opt_in))
> > +     match1 = soc_device_match(soc_needs_opt_in);
> > +     if (!IS_ERR(match1) && !match1)
>
> I'm not sure what you intended to do, but !match1 already means there is
> no error so the original code is identical.
>
> In this case ipmmu_device_is_allowed does not allow errors so this is
> one of the "difficult" drivers that require slightly more thinking.
> It is only called in ipmmu_of_xlate which does return errors properly,
> so in this case the most straightforward approach would be to make
> ipmmu_device_is_allowed return an int and forward errors as well.
>
> ...
> This is going to need quite some more work to be acceptable, in my
> opinion, but I think it should be possible.

In general, this is very hard to do, IMHO. Some drivers may be used on
multiple platforms, some of them registering an SoC device, some of
them not registering an SoC device.  So there is no way to know the
difference between "SoC device not registered, intentionally", and
"SoC device not yet registered".

soc_device_match() should only be used as a last resort, to identify
systems that cannot be identified otherwise.  Typically this is used for
quirks, which should only be enabled on a very specific subset of
systems.  IMHO such systems should make sure soc_device_match()
is available early, by registering their SoC device early.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
