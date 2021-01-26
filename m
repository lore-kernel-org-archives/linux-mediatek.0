Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E63AC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:03:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BD2922E03
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BD2922E03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Hi6aTw08J27IbU+kNq1bQKRQJZZ/vjYyh0k1M55/k0=; b=VJRuQv2G2WXVsyS5FCCeZJZ/s
	2eTQxfaR+iqi75kJ7lfRFdu55nM+DJNUQYJPpMEB2Eta48PiRy21LUHrDp/1rB4xu6SKNAtQjaozB
	23mFDf3S8T0gBHtUPpxRBknGdfdqQCLg86Z+awckfxy2ZpnPG7GKZv5g6dmG9MSsx08dFlXRfi0V9
	6xGBSCmqtf+wHeccm57tZkeJBRF1Qn3rRVZl57N/m8WCV0De2JU+mX5S+DPYXxcD78MhpvHLawVPW
	RVLLnx0y/bB4uXGAf7UJy7NGaaEKoKXrNDCBgdCy4dz28eS4hk0hIZV6AxiuwguTqmOq1AD1CgJLD
	ayA8tN4gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4ClT-00071R-Sz; Tue, 26 Jan 2021 01:03:28 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4ClR-00070a-EO
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 01:03:26 +0000
Received: by mail-ua1-x936.google.com with SMTP id u27so5069459uaa.13
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 17:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vqg6bv6YX+UaRhVsv9trHQtX0ur2NbtvGMYILmAZAUM=;
 b=P1l4NPK1mg6P+cMqArKZZ6FOU2bUnkug0c0wiDxi8esJ1qNqlZ3Av8QbDtH3XtmBcH
 WWj2fRqK6jXXpp1LfZvMsxakWaQD2KL3193fxXG1tya7r5Ks1Cf+/sLSkxLCxuMGGHLw
 ZtmMx8T9UA0Fr/mvIqw0o3Yn6tUyNGjH4LTfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vqg6bv6YX+UaRhVsv9trHQtX0ur2NbtvGMYILmAZAUM=;
 b=Y8cHJsxBE0Cg2tj7Paepz/FHN2OSWP6MvWapcmGsE6dR8MHZi/ZvMB1NmDJEx+2091
 nDm5kXEEBn0XDY/bZ1jsfeLLu3L+doGKrB9SsF2uc5lGtyXBCiNwj89WUif3Ge1yPCir
 ulYzSQ0+UQ5rbIuiZVNlFPDpgo8C7NdvRsUzMD/HQCRKeXzyQDJdTARUoouxWiyReQuI
 o68ZRTvXazWCETsAH9V7aTdteqnKd1Qdnv4HYE46sLO0g+7srnlIIqoLRdWKuh6cP2wX
 /EFGbkvkA+OY/8m5ukkGLA0qu3HqiQZQmeOUMyHYJjAnYu0yJMkc+0x0oohYsbEID8yH
 t1Wg==
X-Gm-Message-State: AOAM532AeV87h/d4I1aipDLkG8tQXnYrhqB1m20maJP6/Op/iVTMd7W8
 mMVqT/9J/EhHFuzwh7cGfQ4dras5oqGqs7ZdnLAOag==
X-Google-Smtp-Source: ABdhPJypAk1MRy9xAVulpTwXcpPdyH5UZC9neTdCesmTbQDgAfb7Ug9ZhO6Fi+/A0gtEIjD8oDzmrbw8YTyBtpr/oRs=
X-Received: by 2002:ab0:3043:: with SMTP id x3mr2487551ual.88.1611623002329;
 Mon, 25 Jan 2021 17:03:22 -0800 (PST)
MIME-Version: 1.0
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
 <20210125192658.GA806742@robh.at.kernel.org>
In-Reply-To: <20210125192658.GA806742@robh.at.kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 26 Jan 2021 09:03:10 +0800
Message-ID: <CANMq1KCdCurhB0S_a4qRtNbOUWMZa9=ObZkz0VSGLgCnfV-k9Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] arm64: dts: mt8183: Add node for the Mali GPU
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_200325_568559_3AF8EDE2 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 lkml <linux-kernel@vger.kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 3:27 AM Rob Herring <robh@kernel.org> wrote:
>
[...]
> > +&gpu {
> > +     supply-names = "mali", "sram";
>
> Not a documented property, nor should it be.
>
> Did you run this against dtbs_check with your schema changes?

I did not, for some reasons I hit a strange issue (kernel build system
wouldn't pick up dt-* tools from ~/.local/bin... solved with a bunch
of symlinks to ~/bin). Gave up too quickly ,-(

Anyway, v11 coming with clean make dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml.

>
> > +     mali-supply = <&mt6358_vgpu_reg>;
> > +     sram-supply = <&mt6358_vsram_gpu_reg>;
> > +};
> > +
> >  &i2c0 {
> >       pinctrl-names = "default";
> >       pinctrl-0 = <&i2c_pins_0>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
