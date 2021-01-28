Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5527C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 09:11:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4736664DDE
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 09:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4736664DDE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xUIx0MvfqRK53oEIilBIopNtzI3SJHzK6aziBXcUchg=; b=vPCyX+TGPvu8mWP4yptlD/EPl
	5ednXijwjYsKOIleQkCONhCOQkjyDlgXG0wFZACRqTJUifA+NT6zcRXn5YdXEDq1lELNICbsNAptF
	rmAylDR03V6dYaxNPFGZs5JHZWEd+4ZZBPfaj4Btz5Ixy3K4M9edpxZbLttAt10+tkv7v57XCR1jH
	aLu3cE1i97KGeLy0t7ejljleGtyW8aNtJcn9PVFms4s89Sk95aPtENKgCB7FWol1iPs4DvVkRxWX7
	6E5sY5shr9gBItF9KUhT8ugpvw9uc8lum4JMciMB2qRSx9Fo8xdc8Wt1cn4Tc95o8kWfX6bI4jzyO
	Vd85i541Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l53Ko-0007zK-Ko; Thu, 28 Jan 2021 09:11:26 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l53Km-0007xv-Ee; Thu, 28 Jan 2021 09:11:25 +0000
Received: by mail-ot1-x32a.google.com with SMTP id f6so4507851ots.9;
 Thu, 28 Jan 2021 01:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpH8ufxoi7Wf0OvvYg4DlAzvPrwoTT0dl+FXt2N9bdw=;
 b=ZG3D9l1mrE8u11+4t1oKrakZ8yoNRc3iqYfBA5JFX711kPox/GdilHmoQd34vIz5q7
 nW/1iTSXzQzCf4rWRapemQKLf4bA3RswLUmLKCWQg40dRNG7ozxOCgYdIn33SS2SnqOF
 1lTlgz9Hf5oOYTlzqYoItp+GObYybgOWDw27u8orGRbM5SmX1+IbZt0sny2HDGxYlvgr
 R6Nk+sFAWjyoL0YTv4yfbn1Wsm/JG2gDMahzUjPX40k1CcUuZpKK8nkFAn+X74fJnyiN
 nPmElhgFBvCCLEy1E6S3C23NUM4xZxeh3NcnHdRxUWoI1/tg0FaY95iiYGIXAeCXND+H
 5mxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpH8ufxoi7Wf0OvvYg4DlAzvPrwoTT0dl+FXt2N9bdw=;
 b=GkgBTIEi3/AXG4sS4UM5bFAfLpBNq4EKRzM38HioucEGDsNMQi0zMM8UIHRBHsGsZe
 mm0EJBl2tg0fQsmk5vFBoBwS+xRzLppmcCVLY1cHo3ooPHkMo5ZaD1X/Dsl6c6P4qhXL
 VIIlKqznNBfTgqbMwkIfn7yGdqIlphNKPB6hQlwXS1yKyUr3tzLftiZOTThFa7OWKewW
 znD3M703FmAsbgqUYExmaUcSbzN2sQL4hY83g8NcuAxBT5dvwsxtFLxf5j1hINIELWQc
 gMMtCkexTf6rlEUsHreXzzpdqEHAwd9Acry161TvW1YITRB14S/xFMNqLdhyDPoljTAW
 PJRA==
X-Gm-Message-State: AOAM531ucaPhsBJkmQXwbyx/zIuafGOwVK5HkiOwZPnXm6zOzz53TjXW
 fs1VgomeEbdKKlshIeXbLw5EDGC1BzZiwiyemIM=
X-Google-Smtp-Source: ABdhPJwmVwbpJuVCu7aP1ss+R20SLHhCSoSintnWm2cqEvOWeAq3xFHQVy5TXM8vV1E/vhrdcmfiXUh2L7R41WY/m08=
X-Received: by 2002:a05:6830:230b:: with SMTP id
 u11mr10952979ote.184.1611825081403; 
 Thu, 28 Jan 2021 01:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-3-hsinyi@chromium.org>
In-Reply-To: <20210128072802.830971-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 28 Jan 2021 10:11:09 +0100
Message-ID: <CAFqH_53kVHh2Phyd=xoM7A3g0qz2HACAJHYcgX24eRTo_YE5Cg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] arm64: dts: mt8183: refine gamma compatible name
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_041124_563277_36867E45 
X-CRM114-Status: GOOD (  18.87  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for your patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 28 de gen.
2021 a les 8:28:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> mt8183 gamma is different with mt8173
> remove mt8173 compatible name for mt8183 gamma
>

Should this patch contain?

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 6c84ccb709af6..9c0073cfad452 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
>                 };
>
>                 gamma0: gamma@14011000 {
> -                       compatible = "mediatek,mt8183-disp-gamma",
> -                                    "mediatek,mt8173-disp-gamma";
> +                       compatible = "mediatek,mt8183-disp-gamma";
>                         reg = <0 0x14011000 0 0x1000>;
>                         interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> --
> 2.30.0.280.ga3ce27912f-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
