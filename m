Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3B4C83004
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 04:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE062206A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 04:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lW5hqCva";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WD0Vdo9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE062206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/7oW+4Ma6sTE9Rrzb6skq8BFNy9c3T8dO2ADkZ7vbY=; b=lW5hqCvaBwFmSE
	SzIzwdnPxRrXmpmz5dzzURIuTQj6CvshL93WxyUhbfJG9l69iughpyy59ylIyh0IxJ9SUcybuzRgG
	ZDUIJLSm8l1IgpRgoE4mPk6IfsS6ve3OeBvz047oYRAHEddWLSFOv+Q5RFi1mkCxs+sJuCwlqysb2
	YkDuQmPsnWEeGZuopjJ9mE1OYWy/CCmNaLxpbbZDKbfJlyF0m7m85O9jbdUHvKQ8CjnKwrVwFdJML
	Srw2KW5LOyFirw4C6WMaxMt/DN5+cNZki8vTXBHAoJDbBzby6mK9YvH7bu0f2DFuHaXm4DOg6HR6F
	8qFmUpo1fmI6/7F2LwMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTI5d-000764-Cc; Tue, 28 Apr 2020 04:43:25 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTI5a-00075A-Op
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 04:43:24 +0000
Received: by mail-pg1-x543.google.com with SMTP id o185so9732187pgo.3
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2020 21:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6MzIVWZpSVCHDb5pf6WQNcJ/ckZ7Y5e/ESVb+fFzIZA=;
 b=WD0Vdo9P4/N4GSEpKAhopNTQVyTrPiPKK3hWvrtsiHMzebOMrruO2aJX9wZe95BGHj
 XGk8c62wFBqDPwNbo61yYZGaWDExozBcGqaTvzvhgue/6PH25ZdF3jIcE9D0iv7XULGu
 hc0qeug7S/R/21XHC27bLSFzxUVEnjHArDV38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6MzIVWZpSVCHDb5pf6WQNcJ/ckZ7Y5e/ESVb+fFzIZA=;
 b=XZr33xn6HwTmjAlm6z99YcoySRRnGg+vxwBzq3MggMr+Lk4OmQ7Ce5CoDYoBI1vrf2
 ent5xX+8AB+H4LVoIDyVBxeyTc8Unj4wKeg5PZyDHSM/kNz27h9lC0jkktfC+ALRSrI0
 7OO0F5PaJb6EdN1tEuCRtwkViWT2qgs9fzF766Lh2MSve39m0Papg3+TYQhYFHBjtsb3
 SIx6GJtBwSSKketRlDA72smEGmGxg0KCp7HwKpen+hgYl8mrhY2836T/VBEbzfGpT4NJ
 vp5f7snYgnFvIGXunJLcEb3LjkGYBdVV9ofgC/hcuCT6CzdlvXbobRqMxOlm4wZoBWox
 boZw==
X-Gm-Message-State: AGi0PuaoiP9pDXcyNVdoyev+M+4NYOk5e62ZJMiOC9zNLMwZ8JSJzWPs
 3mOib3JZGcXI+9OworBDPN9SYJTa27A=
X-Google-Smtp-Source: APiQypL4EkM44dlZrn20/UJPGNwqG/txDipbUq+m/3SlZoPmGk8wmsNBJP8QagorXnVhoVAWpw2dhw==
X-Received: by 2002:a63:7c1b:: with SMTP id x27mr26545146pgc.76.1588049000089; 
 Mon, 27 Apr 2020 21:43:20 -0700 (PDT)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com.
 [209.85.210.175])
 by smtp.gmail.com with ESMTPSA id d74sm13882052pfd.70.2020.04.27.21.43.18
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 21:43:19 -0700 (PDT)
Received: by mail-pf1-f175.google.com with SMTP id y25so10090384pfn.5
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2020 21:43:18 -0700 (PDT)
X-Received: by 2002:a67:f9d0:: with SMTP id c16mr19912596vsq.53.1588048997072; 
 Mon, 27 Apr 2020 21:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org>
 <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
 <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
In-Reply-To: <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Tue, 28 Apr 2020 14:42:50 +1000
X-Gmail-Original-Message-ID: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
Message-ID: <CAKz_xw0nQL2t1a-ofosLVb72JwSAGXCea5wOuddstOMrULNygg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Julius Werner <jwerner@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_214322_821991_1C487DA2 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 24, 2020 at 8:17 AM Julius Werner <jwerner@chromium.org> wrote:
>
> > +       err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
> > +                                  &smc_func_id);
> > +       if (err < 0)
> > +               return err;
> > +       watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);
>
> Your device tree binding says there's a default and this is optional.
> I think you need to change the code so that that's actually true.

I think I have misunderstood the device tree json-schema spec.
My intention was for the device tree to fill in a default value in the dtb for
arm,smc-id if it was omitted in the dts. But now I see that does not seem to
happen, I cannot really find any documentation of `default`, so I will just put
a documentation string in instead and force the default in the driver.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
