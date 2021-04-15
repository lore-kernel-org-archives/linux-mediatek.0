Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528EFC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 00:29:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D3E60E09
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 00:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D3E60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBmlolzs4/ajHCxnnj3C37k4z1E0GionuS98b6+xpfc=; b=oO3iWFWqcE0jCbEbtP2wimYai
	uPs5P6tjJymddEbn6WaeaGuLOKg9Gj14VRWPeIiDjYFiI2ezLARZEZq8FTOaLNx2TRPq0cM0nBrFC
	77iAeQ2n/s8mahSp83TVGzSzP2Y3KHJlUCLASBM/gAoi8mrhXS8D6Kj6vd98lD8xru7Un1dlAnKzY
	38vFueThGTb1NbDfYDJ3Aykxi7ZdwqdDIzrgCiRMWygW9QJf22aFogyqM2tydbyBYYUKAECwlN1yc
	d+BcIHUbcwjtbso4SIa/pSjfjxZ3HCJqf+t0pf77NkmquIopnzfLQ2f4qq2XfcF4UW9ydKjPVLQ9J
	ESp8Q143g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWpsq-00EHd0-01; Thu, 15 Apr 2021 00:29:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWpsm-00EHbr-F5
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 00:29:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=g04jG3pOIj2iU1jOgXSkod+vrxVk7PMG3fu/GdxV/3E=; b=J7A3R7C4qy404YwE3sJduD4VPS
 zwZEeENvFDC7/EMgRMZBhRp3OmsIWMwklMBeXvusakMARwF5dk7Dv3MPia7mAmpp4TKyQzXOZOc+T
 kmzaVKDrwLaEqBKi5OLzN6gVcbKer9xAggpfX+AMBlKxOcHRBtMtmO4tK9AOLSFZ6ibCh+k6AcANb
 0EgPFwoW2jUuLTntK2WLPiyDFU2ANEjjTYoYFedrMjskwAveUinU7W6Q3r5YDnw5/VXDV0fAotIM8
 AzUIG0JuW7jXDHe9Hljie3S5VVH2CnkbB3hovLbXpR/xHSMzS/0pNj6U8TwlsAsm2zWQNeRUV+V/R
 n2+0h1Vw==;
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWpsj-008BWd-I3
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 00:29:19 +0000
Received: by mail-vs1-xe32.google.com with SMTP id g20so11305500vst.2
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 17:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g04jG3pOIj2iU1jOgXSkod+vrxVk7PMG3fu/GdxV/3E=;
 b=m7jLXuNdoQqiW1vhiOqx9JZldWpfCr2tM6T6SUNB/6B+E7G++lDX+DrUffqv586k0Z
 i6uyw2JqH8WPHi09om/i4AGhyhIaRYVUG0cODXDhKml3wIYftB3dhmlaACu6qAcSnLXW
 0s/J2o6TO0/Y97ZJj/PHsmg2SaxEHceaX9snY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g04jG3pOIj2iU1jOgXSkod+vrxVk7PMG3fu/GdxV/3E=;
 b=sEoyGrbFFJqVSGpGhnWoPyaWJ2X3U1Rs5xJcGsuGSYGNfta3sFdisu6rEJkiEHhXWP
 1pc5gWvBERqSqXN7SpBFJ7K2NQJVfr9f8s4Qh/23gMUphgzTTGFkO9r5IMfmbbv08zaV
 DKFhqZBDYTKd2xzWwjxH5UQwXlatlImgVRT2wgdP3gqhNcsbEZz8rPu1wKmaJj2GwN80
 2mZ8R8MJwr0wG/IwkMpir6/z8P+OJaK3ID9nEvlQSbJSbKjI8kw8m7hnNOMizKMV8s4Y
 OtQtGHnUnggd7uS50EgTMJ343UboOAlLVv3jrXRQFwGUevvcnWYgD6wtYBTz8fNhIY5W
 X2/A==
X-Gm-Message-State: AOAM530wVsMBJFnOBgdjgm83ERC8hb3R7ALFtWIw6zyCBBCy233pXieT
 pprfJLDD4GZQWVK5Tsu3YdTG/AmcgO4ryGPfactTlA==
X-Google-Smtp-Source: ABdhPJzvCV/ME7C6NM9bUs6Rkckfe59d8ZUDgrA4dEVtONgDRMxGQqivtrRlmYdfzK0oz7KCD0CasL7u7oR5GN/oErs=
X-Received: by 2002:a67:fb4f:: with SMTP id e15mr499968vsr.21.1618446555817;
 Wed, 14 Apr 2021 17:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
 <20210414144643.17435-3-matthias.bgg@kernel.org>
In-Reply-To: <20210414144643.17435-3-matthias.bgg@kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 15 Apr 2021 08:29:04 +0800
Message-ID: <CANMq1KAxZ+QiRR7LgR22pvhs4us=ne_VtSM-S_byCC0N__6BZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: mt8183-kukui: fix dtbs_check warnings
To: matthias.bgg@kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_172917_640752_89DE2C27 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, Apr 14, 2021 at 10:46 PM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> The dsi children don't have any reg property,

Confused, see below.

> so we don't need address and
> size cells. This makes dtbs_check happy.
>
> CC: Hsin-Yi Wang <hsinyi@chromium.org>
> CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> CC: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..f4dca6a33168 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -251,8 +251,7 @@ &cpu7 {
>
>  &dsi0 {
>         status = "okay";
> -       #address-cells = <1>;
> -       #size-cells = <0>;
> +
>         panel: panel@0 {
>                 /* compatible will be set in board dts */
>                 reg = <0>;

^^ isn't that... a reg property?

> --
> 2.30.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
