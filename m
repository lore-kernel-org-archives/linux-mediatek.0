Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9870CC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:58:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1153D20855
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IWCekOJr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HHQ0KEJW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1153D20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+J8ElgQcI0R9vtYFw3Kuh8Rtl1R9lM2e+OKFSkBIMKM=; b=IWCekOJr2iEJI/hieIwgsTws9
	pd+HiPfehDRfLaWX9Bu96kYSmo4eO9NrnmwqkrV7TJLaqCcqDWKmnOo1YboDjwQVDcxXLsszxzUnA
	/Uva4SRkduoKET61LGTouhbn3n8lfm+V+pU527vqMTPVVeiTZCPpu8JrBqGKtC1l34bc2AVtk3LhL
	IVASQPytXChXEn3ak0rG6bzOBwGN8lQom4kBS5xh/j1/AieDid5wo/5Sd0TfmZeDzifK9r2EFsNzI
	P3XpP9aTgOYAvnkxc+pYNU6ljXzkfH25wD3vMQMQ+i7Dmv2Ra9X53J36tdYKi9jz906KdjFlB6caJ
	OOJ1CNldw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHTH-0006CS-R7; Thu, 10 Sep 2020 07:58:19 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHTC-0006Al-6o
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 07:58:15 +0000
Received: by mail-il1-x143.google.com with SMTP id b17so4853698ilh.4
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tai8qFjVTbhhMUuPlONXFVjFgWeR4r6/lSqQDCLq2Ok=;
 b=HHQ0KEJWk1ralebxe9GR2V01kcrVKprxD80d3zhG0zDJlDbWa9ZKlHRw5Ek9+YgTFE
 g4rJm2dV+c95CN7Fc7NsqQh6fzmVSt1VL9/9QhLdmRBciKqnWJMIfwDXYUBZMkwHcVI6
 qzq8M89gNp9EI0BZB84MzWbdZmibXau0F4SCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tai8qFjVTbhhMUuPlONXFVjFgWeR4r6/lSqQDCLq2Ok=;
 b=EPLgVeH4bIztQp/8LUY56kyH/UNC6D3DrYrfQn/bTy0eE3spKcyFKOf3U8xM3+EDlP
 mfunq3TdD4HlA1a3X45WanTRTdRcrpOUz9ba8xL1z1f9d8sFjGA7CkH09upjn4S9BZKP
 L8ZeYh+KblOe4gWx/s/8ZheRXjrT/nN8qxPsE5kita7FmNG/vElOWnIgheRJtI0JRsFW
 Fov13wvuMuJaaMV9oblyzIWu+IQEPu10JVlZGtMwaIwr9uDd3Y4dve1aAualH4IRqLOS
 AvkYEB6IKgG9o/FGQnv1OqF2pGHF30CuHV3P6cS4+Vnpy8oyLTN69ntbk+0pgdCIH3D4
 cE8A==
X-Gm-Message-State: AOAM531tvBOd6PNXvgXzIZo/D9NMueHV2BZQjaSdb17d/qTa2rbSkt0v
 St7xbG41lOeoYLpbbX/SgwqIOGY/dp43zdn3Af5t7Q==
X-Google-Smtp-Source: ABdhPJyPFdwKoALShiSo00RiIsvWpaoDC6tNAVzVFRh5HuKKh0MkaY3m7URBqCj+sI1i+vLSoqqISiWX5+cWI3mCkyw=
X-Received: by 2002:a92:906:: with SMTP id y6mr7173891ilg.106.1599724692310;
 Thu, 10 Sep 2020 00:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200910054635.3337487-1-hsinyi@chromium.org>
 <ba77586c-7902-9ce4-0f4f-ad1743596d85@collabora.com>
In-Reply-To: <ba77586c-7902-9ce4-0f4f-ad1743596d85@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 10 Sep 2020 15:57:46 +0800
Message-ID: <CAJMQK-j_Syejw1Bc53fN8OuRYppns7g_=EQW+PUDkQDhnwxvSw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: elm: Set uart0 to mmio32 iotype
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_035814_290003_CBAD9376 
X-CRM114-Status: GOOD (  16.79  )
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

On Thu, Sep 10, 2020 at 3:20 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Hsin-Yi,
>
> On 10/9/20 7:46, Hsin-Yi Wang wrote:
> > Set uart0 iotype to mmio32 to make earlycon work with stdout-path.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > index a5a12b2599a4a..d54e62f72c65d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> > @@ -1160,6 +1160,8 @@ &thermal {
> >  };
> >
> >  &uart0 {
> > +     reg-io-width = <4>;
> > +     reg-shift = <2>;
>
> I am wondering if these properties are common enough to go to mt8173.dtsi
> instead of here.
>
Since stdout-path is set on elm.dtsi (using uart0), so I add this
attribute here.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
