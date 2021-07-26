Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96DEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BCBB60F37
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BCBB60F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYzrzj4lg0iWpz6m0JkW8h46PwoPhcaesm8VRxTU2/k=; b=yFGYyFFOgOxgkK
	RJ8aDIsYi2tWMI3cydeEh+GyooZttp2gkc45pi2k3zne//AUOHwkAQM+FMYFDnL+sEVE9D1w55ml9
	QlI5yU8MJi5STjztCnIYgt9dm+SWpYhy51X9PBeEGALFewpsYgNCqnzw3Ri+do9TE1PHf+yLhuJhp
	gwQrR9s5qt1cODjDCLpl1uh+h01iHH913242wDiXGRkArBV/zY9Al0HTFFn4+eN7ZbPDVfev8faYU
	55KBB605WD8arp8rUCFdhgXKHe/gY2xYbsI1/SqbuRqxhJAlDnksmmw9gUOdyswmaNzelyby/QyKS
	3wwwOG1LGgwWVSfuL+jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xfb-00AgxV-E7; Mon, 26 Jul 2021 10:17:11 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xer-00Agge-QP
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:16:27 +0000
Received: by mail-io1-xd2a.google.com with SMTP id y9so11109053iox.2
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pKm9EcDme8pJHFOXtEbqZSQVHJJ+TbQM1VPZ24DBvwA=;
 b=X+IoIMuJH2ZijTePJyIs6T3oSX69YS0Rj+602X5tzCjx1R7H5deruUXBy88v3d7stV
 sb1n7pGVe21QI9HvlAGYNsQ7Eyg3+ET0x6wnD2ErXuHKI5mWGP7NWYiDZLLNL18AQBTu
 a4w0ONGnjsYzXIt+fiFQIThJpIJbBpxgjYNxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pKm9EcDme8pJHFOXtEbqZSQVHJJ+TbQM1VPZ24DBvwA=;
 b=eQ4SFNcs6ASeXeVL2OUC8xDRHEOJOAuubxg+RLEwz5DHcizRF2cC37/Z6V6BJ7ojys
 hpmCww8LaNW4YXYwH0MbSfPOuR3cO7CKJKaJ6n03O12b9JYFGBEsRFvOVDUcdS2ehfyq
 JmAD5G7HWhHpoSVOWYbarNO+xtHXddecBCuSBGWz9eh8dKf/zRvSa2AYbTNrTQbLKD1i
 5GhFQbjFP2mRyFfpQO2g/LAyIevs/fBRtWyAd/xrI98/pUVx4C5IOLDKfeKNoIyAmltf
 8swSXN9GTWDDR+5H4g1GUjQ03ACs4zT0cn0qDfOLia7D5aEbwhXqCmpyjj15cbPUPuiV
 GWyg==
X-Gm-Message-State: AOAM532eGk3FeYu1WO0Hz1fuDj7aUFaGhNauWoCbNQ13e38f5BXZkaR1
 xUwzt3qskiUcJwWypt95cgleah5Fgw5Txo1rZYshrQ==
X-Google-Smtp-Source: ABdhPJyhs6/VJlK39tRjkVThyIrMjZQOguga/L0sVp4xovp5RErc5dbjNDeDpRT7Q/vE8sdHiDz2tR0mQ4+gi3ZYr1E=
X-Received: by 2002:a02:6946:: with SMTP id e67mr15605786jac.4.1627294584585; 
 Mon, 26 Jul 2021 03:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210726050831.1917982-1-hsinyi@chromium.org>
 <CAFqH_53zJp7ejwXn3qqiVPnoTy6W3WonvvDxsZDCjmaQA57h6A@mail.gmail.com>
In-Reply-To: <CAFqH_53zJp7ejwXn3qqiVPnoTy6W3WonvvDxsZDCjmaQA57h6A@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Jul 2021 18:15:58 +0800
Message-ID: <CAJMQK-jkUCVgRXL5dcDUd6vpEojEG6heuAXgvbYwikz_sPjnHQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Eizan Miyamoto <eizan@chromium.org>, devicetree <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_031625_928215_FD9FBE23 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Jul 26, 2021 at 5:32 PM Enric Balletbo Serra
<eballetbo@gmail.com> wrote:
>
> Hi Hsin-Yi,
>
> Thank you for the patch.
>
> Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 26 de jul.
> 2021 a les 7:08:
> >
> > Use aliases to mmc nodes so the partition name for eMMC and SD card will
> > be consistent across boots.
> >
>
> This definitely helps with my "troubles" flashing the kernel to the
> correct place" so
>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
> Btw, I think that a similar patch should be send for Elm, could you
> take care of it?
>
It's sent here:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210726101451.2118076-1-hsinyi@chromium.org/

Thanks!

> Thanks,
>   Enric
>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index ae549d55a94fc..ed499e17b6570 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -13,6 +13,8 @@
> >  / {
> >         aliases {
> >                 serial0 = &uart0;
> > +                mmc0 = &mmc0;
> > +                mmc1 = &mmc1;
> >         };
> >
> >         chosen {
> > --
> > 2.32.0.432.gabb21c7263-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
