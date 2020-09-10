Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F22DC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:45:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9AA206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sBjLT5sS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7wdL6CN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9AA206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvEDDOhG3A/u3wPWMklxowqzxQyfB6BVt5eZtLnbMR4=; b=sBjLT5sS75W0Z2FmvYBREl6dw
	Hshk+GuLlnoEri7YobUgZLbWwliunCSdvz26NuG3O9x3Ga4R/4Od6amJditktRio2F8/CUEIKlDZe
	khuytbAEibDRxZ7NOXUuLiBz+i4xONBKJAjF1+BFecIZfvU1PGZ97/q/GgBeVQXfvp6B5iehiC497
	goJdU4thySbDtZIEbjBBYZNIp6QzqbbyZOx2DDw6rXi8bDvRFualHdmQGuU0EhrjFp76jjkmhg7/G
	ZetiwldmDiY3GDPuKj4gmMoiyzjHcJ9R5rpVdT2PXldNvjsYr7Aisj/OXpCXgAgh4QCUoykneul1Q
	yGcwddEzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGICb-0000mC-Md; Thu, 10 Sep 2020 08:45:09 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGICZ-0000lE-HX
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 08:45:08 +0000
Received: by mail-io1-xd44.google.com with SMTP id b6so6191295iof.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 01:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vc9DogxoLgngfubJ0u33iUTXXgPBqlfWnxisJuHVigk=;
 b=M7wdL6CNysKj2I2uFNxFP98crOR6oki0Kv9eRzGJ/PUHBswh1K2Yef8UbV955S99ID
 CtqGAsbh6F1xTWPhc6/mzKjL8BLWEH41oqA7SEHhpbQr9ftZ+z7DZWEIjmkFp1Ft+YVc
 k8p/nOP2BaHgcfiFrb0kKX0UeiprgHQqBSDwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vc9DogxoLgngfubJ0u33iUTXXgPBqlfWnxisJuHVigk=;
 b=S2D/ZzVV22xI8HfddibshTafbPF3FMYajvtdIVqPpAjOgxrJQADPbo6/pIUnqFvQ3m
 e+Hi1eO3tSK0xAbxNCLDEPGnI/60bFskf5HhT/s2wXPPuhD2JlZv+4P2hq0dPNqgf4kX
 Py2xq3c88J5MWmVZe9EiMpP6g3RCft2niJi5ra1kZOixgOG14BDhg8qoXG4q1TEpZT65
 Vo7kh6mpWKhiEe6xpLfamllF4ML2QSaeriU4sWxkQHSlpQdfhci576PRBOrXtVSjQQGt
 lV70Sf3S/A/mDpWDH50g9y74FtBueZNglsruiAk+XL4pB5CAm9FD6plhQHNSLZu03sv6
 OxoA==
X-Gm-Message-State: AOAM533fPS9v+9jORUMh1EiLhUKJBzznAcoQnOCrcu0U9Iyo1ra7piL2
 mEdSsVcpJKoY3OIKHIdHdY9hklU/SC9/0Vcv/1Z64g==
X-Google-Smtp-Source: ABdhPJz/GqbhJlGBoiOlJ5GNckLlLrZXvPr+cXRexeJo/NhSRwi3XrdA0NDkw8Xgcs52YM7DxFPmui+9bnlO4Y0Zf7w=
X-Received: by 2002:a5e:930d:: with SMTP id k13mr6689385iom.40.1599727505770; 
 Thu, 10 Sep 2020 01:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910054635.3337487-1-hsinyi@chromium.org>
 <ba77586c-7902-9ce4-0f4f-ad1743596d85@collabora.com>
 <CAJMQK-j_Syejw1Bc53fN8OuRYppns7g_=EQW+PUDkQDhnwxvSw@mail.gmail.com>
 <944325c1-818e-934c-907d-7ff0493446b4@collabora.com>
In-Reply-To: <944325c1-818e-934c-907d-7ff0493446b4@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 10 Sep 2020 16:44:39 +0800
Message-ID: <CAJMQK-gVO53a1SnsjsJPu-ZR-NoNb4TGXrOpb-naD71pmjExCw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: elm: Set uart0 to mmio32 iotype
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_044507_586190_7B4E1620 
X-CRM114-Status: GOOD (  21.53  )
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
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Sep 10, 2020 at 4:16 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Hsin-Yi,
>
> On 10/9/20 9:57, Hsin-Yi Wang wrote:
> > On Thu, Sep 10, 2020 at 3:20 PM Enric Balletbo i Serra
> > <enric.balletbo@collabora.com> wrote:
> >>
> >> Hi Hsin-Yi,
> >>
> >> On 10/9/20 7:46, Hsin-Yi Wang wrote:
> >>> Set uart0 iotype to mmio32 to make earlycon work with stdout-path.
> >>>
> >>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> >>> ---
> >>>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> index a5a12b2599a4a..d54e62f72c65d 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> >>> @@ -1160,6 +1160,8 @@ &thermal {
> >>>  };
> >>>
> >>>  &uart0 {
> >>> +     reg-io-width = <4>;
> >>> +     reg-shift = <2>;
> >>
> >> I am wondering if these properties are common enough to go to mt8173.dtsi
> >> instead of here.
> >>
> > Since stdout-path is set on elm.dtsi (using uart0), so I add this
> > attribute here.
> >
>
> Why needs to be defined in the same place that stdout-path is set?
>
> My guess is that reg-io-width and reg-shift are SoC specific, as they define how
> the IO access to the register is done. In fact, I think that these properties
> should be added in all the uarts, not only the one that has defined the stdout-path.
>
Okay, I'll apply them to all uart. Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
