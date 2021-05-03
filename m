Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:07:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9444A61244
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9444A61244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wy9UVTpEYX3/XVky1NkelcaluG1IUUTyLEbJbpFMeyk=; b=ASd0mPw6qs+03TpyfJYJzkSp7
	lBYtXobP6Y8nxawGfg1ywoS/m3FepyFWTh9qZU/MgxFbikkiSIzUX8cZLVHdSS7EhVQ5tuy0k09/7
	PzxfwEu4DCsiiixrvc1cZaw8s6RDH8ub8yXO4mR4guGVO0vxzPEoxowVUaB2pdFBPuLHrTbY2OYqz
	Q0T3wIcwF6A1StxYSGw3IVl7jYAEoC2fKNXhc2Usk5uRUoTfoGMlXIGtwzjPlVHjtxdw/8zLXRsXr
	sI9GYZdb2ZhQ53r3EGmclTnLLqJNRtIhHr1goKfG68vM9n325cch219JFqdvmwjzzWSxET2gZGdsH
	F2AneQqNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldQnM-00DCJ7-C6; Mon, 03 May 2021 05:07:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQn5-00DCFA-57
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 05:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=siZxirsKcvAyDsxwYv2Y0WOcvC8VgXLaF+KpmP1I61A=; b=2fjHdJCAIfZxot3mjOSmvfiwwU
 MO4V93M0g/MR4nF0H+ZC4o8XYn8RNYvtRCvoGMgyotbT+sY7jVGEjkjbjM+RQbGKdYObKM2ON0y/O
 xdl1gzSlbWDFKSuUmFbx/ePNvtXsRKlr27Nt5vAppekm6W87FO2yDKoh/6dc7CCA58zgPEl3xsr/A
 UnKFEBCetFqnvMlT4tOOqJnL7KLIVC2poohGIBIy/MC8a1jNnrhAJIqOHX6wmtDf+5HFRXIZQExS9
 YdDory+/xkWQles0XA60QkgX09pX5rFO6f4pJVuXxx8HAI7ZR2Rs3lkq9oEg8h9PYha860wrb9KrF
 +Rau1ebA==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQn2-002pdN-M2
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 05:06:41 +0000
Received: by mail-io1-xd31.google.com with SMTP id b9so3148415iod.13
 for <linux-mediatek@lists.infradead.org>; Sun, 02 May 2021 22:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=siZxirsKcvAyDsxwYv2Y0WOcvC8VgXLaF+KpmP1I61A=;
 b=mgS0glfnCT8eoMAEyZGezk85iJY7xyPQvKSfM5A9XtRTcW3dgMjOGbMHKPIE5fkok0
 p1WK5h3vXYXscSt46dYI3bmRSNiP0coNcJlGlZtzv74usrebeO0DsXBHxQpuAYXsjWX2
 81WuziISp7m7FqtuFssOmD0+g0Ih617T5D+Wk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=siZxirsKcvAyDsxwYv2Y0WOcvC8VgXLaF+KpmP1I61A=;
 b=iIE7xLFGfqkWekwj9DJ2pNTwkjRFpkxt2TYd6/uifOtGmTTmFIOJ97ShOdbsIfRmFZ
 W9kn8TnM4J6n8Iek8Qzj8JQrYGlT2kGJLigQjQ1BNRoZuv/8fFod0pSQHXlYqFHB9xpt
 Ix+G6NqwlMn9t377H3bqX2f25c8UgjcInbBaiBXw6w4w+rIQbFbjucv0bzfFifvyk2Mk
 8/cItADg/6qEgU6mOy1tjWECdnbzacOhsOl/pGjqXrNVnM3VzLWtEby7Wslu7ynCXzvt
 IEbTGU7Y8iPxkPpdgw/rSk0OAB82fFphBKynxpGMVmqUTyPl+pgWXXDY0vZ+CdBDccrW
 YtsQ==
X-Gm-Message-State: AOAM531dMQmdJ/xhuB+Xr0WQEswDmsUOSz9pdAoHruV00hcAv+OAlouU
 EUMP11KxdfWDR4yMhdv/XxNruBk669uXYFpDMgDOoQ==
X-Google-Smtp-Source: ABdhPJzn7Y0sAseQkQfOM+fsmzHK9fRfrpX2TeHpHY9qrHf8bXHvuPgZryeTezCNykMdNGD+4wYQGXMrCwf6UBCLsoc=
X-Received: by 2002:a05:6638:f11:: with SMTP id
 h17mr5692188jas.102.1620018399221; 
 Sun, 02 May 2021 22:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210423065327.1596075-1-hsinyi@chromium.org>
 <846d2a7a-d9c2-7d9e-9d7e-843ff604be44@collabora.com>
In-Reply-To: <846d2a7a-d9c2-7d9e-9d7e-843ff604be44@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 3 May 2021 13:06:13 +0800
Message-ID: <CAJMQK-iUzarwbvY3R-ezZWmZaDK58JzhEtzG+uyuZAJbsKmE1g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: add mediatek,gce-events in mutex
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_220640_733763_77B2BF98 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Apr 23, 2021 at 9:00 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for your patch.
>
> On 23/4/21 8:53, Hsin-Yi Wang wrote:
> > mediatek,gce-events is read by mutex node.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Although I know this property is used and needed I didn't find documentation
> about it. It would be really nice document in the bindings this mediatek property.
>
> In any case this patch LGTM, so
>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>

I added the bindings in v2, thanks.

> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index c5e822b6b77a..cf22d71161e5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
> >                       reg = <0 0x14016000 0 0x1000>;
> >                       interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
> >                       power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> > +                     mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> > +                                           <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
> >               };
> >
> >               larb0: larb@14017000 {
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
