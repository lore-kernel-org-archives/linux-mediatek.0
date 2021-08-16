Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83BCC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:11:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AD3561A0B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 06:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AD3561A0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVqloLLUe9xHSGzwzhyaqNeUN21V7KfBdqFMep4dgvU=; b=2euHfQTP5+mjhG
	Y18lAkdLQaKfRn0H06lFf0BU89hxzE1YU8fc80yvXj1plmaMMtM4ZwawkliBvBe2QndA2EL0yIvCE
	Oo1YTNGWdXkU9FyCrgWEpEPphS1YIR5g+/0jph9Bm0oH8RfarV7jSUhQHndMCxINBgjfRtVjYJR6p
	blFCTEgavkOvTn+kruTnEDT65Qls9x70ZFNmWKJluSrz4sY7g+t+ydZA95XOd1zKl5+jkvzSiQlwg
	OQqPNtvxhARa6rqJGsaXi3RpzYxHTsAz0vGCKEbOi52o9wHYtJTXDGERjzazywZa/j/LMrPYlDj/T
	unBRsLu8mt6FHwKg6lyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFVpj-00GBVG-Ug; Mon, 16 Aug 2021 06:10:51 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFVpT-00GBTX-Q2
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 06:10:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id x27so32220682lfu.5
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Aug 2021 23:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZIA1/692VBv2p6oFgSgryVc2gxTHeAovVGogmAyKfIc=;
 b=D72ANqNKHfUVGUjt4dGJqbs5zUodFvXPlhCFgxNKSYQ+hXq1g9iCytZ/VomBsu6uTx
 lhNIazv/Udq00L/SdtMXM8xT71Q5VYo/JlDOY3Vd0+rudrc+AM7zadq1YiFRMwFKbQyg
 ZYpFB26u8d1UXIihVOKeSh21Pt5m+ThWI6TLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZIA1/692VBv2p6oFgSgryVc2gxTHeAovVGogmAyKfIc=;
 b=lbVWTfWQMt1T0hSemiIJdBgT8elgZoDVRR1vFEgrijVYUv5lHs80z/o/kOZcR5fOZq
 X5YSSGA04TuUiX/Yry683tkt4wMMAA747XZQuRNJdxGiut4iwPUa+cHk3FLo+Kk1KRrC
 SfwY3V8y0++Plr31sZT6J1gUJdXuJzi4wLjzjZmN/uZ8TPwp4gWcHa4rZGpLEFj//6qt
 +06eXobuRhdN92mj6XNFziQPNHpvSuG1YFqMOJriQRwDQiMhfl/TgQn87Kq34QGXSOe/
 /aUjfi3bPaxMuwNo2XFdI3/iIUJ/JoEmvTCR2xfIXuDXQ39jKB+NLAOQZmPQ+PprGgwz
 3FWg==
X-Gm-Message-State: AOAM531j58HMaABN9jBVPCwnZ1K7E/U5aXoNj/kUGBTuUWkKau1u+Z/e
 TyPc5mWARpJrczDpBoVKkTl+D+Rh0I2Dp2A/6ClxHQ==
X-Google-Smtp-Source: ABdhPJzL8RjYaN0Sc1fcCpLDR9FiunPsd8uQLbFv3KiwtAMW+zcy+iGqjGSk2EMG6PngQB7RQdv++oYkdI7XcR81ioM=
X-Received: by 2002:ac2:490b:: with SMTP id n11mr10612445lfi.656.1629094232622; 
 Sun, 15 Aug 2021 23:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
In-Reply-To: <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 16 Aug 2021 14:10:21 +0800
Message-ID: <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "zhiyong.tao" <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_231035_892401_056E392D 
X-CRM114-Status: GOOD (  19.58  )
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

On Thu, Aug 5, 2021 at 7:02 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Jul 29, 2021 at 11:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > On Thu, Jul 29, 2021 at 4:23 PM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> > > The rsel actual bias resistance of each setting is different in
> > > different IC. we think that the define "MTK_PULL_SET_RSEL_000" is more
> > > common for all different IC.
> >
> > I see. I personally prefer having things clearly described. I can
> > understand this might be an extra burden to support different chips
> > with different parameters, though this should be fairly straightforward
> > with lookup tables tied to the compatible strings.
> >
> > Let's see if Rob and Linus have anything to add.
>
> Not much. We have "soft pushed" for this to be described as generic
> as possible, using SI units (ohms). But we also allow vendor-specific
> numbers in this attribute. Especially when reverse engineering SoCs
> that the contributor don't really have specs on (example M1 Mac).
>
> The intent with the SI units is especially for people like you folks working
> with Chromium to be able to use different SoCs and not feel lost
> to a forest of different ways of doing things and associated
> mistakes because vendors have hopelessly idiomatic pin configs.

I'll take that as "use SI units whenever possible and reasonable".

Thanks.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
