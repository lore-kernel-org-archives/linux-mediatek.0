Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48595C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMy4E/ztvPyPIu2vFaZUutGsl9gWHvzFeEWtkrfXhHg=; b=kkDy64rzPfcqlQ0JtCn2sz3vh0
	erzLpxMGoX6BgFiba8hZDScnAqkEuTwxxxQqHMmfwzN+CMjQmqx4DZc9kAvX4wXaw42jsiF8fE6Lg
	zYpDYtZ525KAaLEZ2C9Y1t/DzIUFvRuqObDxmNLEFVOKp0Ev9l7Pac7V/n0T2gs8Wg7fWoPxvNrXY
	8G5RLS4nJCEniUJ63fXP0LmdjQ7lobSJzZjxc2Njkm6rV3PA5dZbAXFro07YwQw1mketFPUAe5dFj
	8vYGQI5LmD9MQR9sHUueYZIqjHSz3UwaRw94ICJVC2ok3uA7Bvw8rH4UW0ew8N+uJk6CE99JF9DBc
	aHNBrOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRmV-004VsJ-Fq; Mon, 01 Aug 2022 09:32:11 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRmS-004Vop-3c
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 09:32:09 +0000
Received: by mail-ej1-x629.google.com with SMTP id kb8so4677021ejc.4
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 02:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JMy4E/ztvPyPIu2vFaZUutGsl9gWHvzFeEWtkrfXhHg=;
        b=KKaQB9R7YLuhLCPfTDSlB6M/w4RrAhDZ2rcdgkcsDMHqvyX3kU6X3L9d1TnagMbbIV
         ZM6xBUZDE3dh34XnGVuV2Op4V0/BWPL0DUUOrFs7hczKCkQqXlziqk9a9RDt80oMwv8S
         gwu0sM6/wCsL/LPNRVp3yN0LpLd1JPnvfxJDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JMy4E/ztvPyPIu2vFaZUutGsl9gWHvzFeEWtkrfXhHg=;
        b=Oyph1GXt5Ww46IX4oNjxULikcsk5cWAPA/FYs+tGNP3/sfG0fmk+j16iA+5O+RHZ+m
         SnJ7bMWSudWFNMv9CrepGytx1OkcVc5boAvSlFkCB7G88psr3gq1tRxOLNZv02900eY3
         AW1x7s6qJe1y2sj8GSw0w+w2sHJaFD9cc9AeMIpksODV0xn2MaJpfRm68qwaGewN0qdh
         zcNsYEUHunHOtYfWNWn6N2HxOONz/UVkdgrgr3kRw80mLYyVJiEYT+SpBfOLpyKoKKqC
         95cxtNTNBJ2ORs0pyDI2PA2+uPwKdVlIist4SyPH/hDDig639Xts9MSnVo/vmdra4/du
         3QBQ==
X-Gm-Message-State: ACgBeo04mpM1nQJsVoou6YwfMLGnKfcrH++7ISUQwadCKk5mtebfcdTQ
	ju+4fyLD0Fk2iIZMETp/ibjxF1qHPKEI+xu0AhpnBA==
X-Google-Smtp-Source: AA6agR6K7PNaBZMXrL5ffNGGYhxQCNyw8wdKgDHTFzPYoCNydGawG8GjwGXlsjSkYiU1D/UICwVQXLdlijnebaXEKvs=
X-Received: by 2002:a17:907:7b8e:b0:730:7295:fdfd with SMTP id
 ne14-20020a1709077b8e00b007307295fdfdmr4363438ejc.152.1659346324534; Mon, 01
 Aug 2022 02:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220726062057.320342-1-wenst@chromium.org> <91613700-3335-7499-1b48-3d88edd9da36@collabora.com>
 <fc64285e-30c7-44b1-e264-839944105185@roeck-us.net>
In-Reply-To: <fc64285e-30c7-44b1-e264-839944105185@roeck-us.net>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 1 Aug 2022 17:31:53 +0800
Message-ID: <CAGXv+5EHYJBTvXxB-HdqVDzSNU7bqHRSBxKfonVm_p5jjYyMSQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: mtk_wdt: Move mt6589-wdt fallback compatible to
 end of list
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_023208_170476_7C2930E5 
X-CRM114-Status: GOOD (  37.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 26, 2022 at 9:25 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/26/22 01:37, AngeloGioacchino Del Regno wrote:
> > Il 26/07/22 08:20, Chen-Yu Tsai ha scritto:
> >> The watchdog facility in the MediaTek SoCs are all the same, but the
> >> hardware block also contains a reset controller, which differs in the
> >> number of resets used between different SoCs. This difference is
> >> supported with of_device_get_match_data() supplying the number of reset
> >> lines for the newer compatible strings. The original mt6589-wdt only
> >> covers the watchdog facility.
> >>
> >> of_device_is_compatible(), and by extension of_device_get_match_data(),
> >> works by going through the given list of compatible strings sequentially,
> >> and checks if any of the device node's compatible strings match.
> >>
> >> To avoid early matching on the "mediatek,mt6589-wdt" fallback compatible,
> >> which only provides watchdog functionality and no reset controller, move
> >> the fallback entry to the end of the list, so that other, more specific
> >> compatible strings have a chance at getting matched.
> >>
> >> Fixes: c254e103082b ("watchdog: mtk_wdt: mt8183: Add reset controller")
> >> Fixes: adc318a34066 ("watchdog: mt8192: add wdt support")
> >> Fixes: 8c6b5ea6ac68 ("watchdog: mediatek: mt8195: add wdt support")
> >> Fixes: 4dbabc4d9e8c ("watchdog: mediatek: mt8186: add wdt support")
> >> Fixes: 711a5b25bac9 ("watchdog: mtk_wdt: mt7986: Add toprgu reset controller support")
> >> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > Uhm, I don't think that this is an issue?
> >
> > Ordering precedence is given to the list that you specify in devicetree, that's why
> > "the second one" is a fallback, meaning: ("impossible" example below)
> >
> > compatible = "mediatek,mt8195-wdt", "mediatek,mt8183-wdt", "mediatek,mt6589-wdt";
> >
> > This gets walked as per the order in which you wrote the compatibles, so:
> > * Check match for mt8195-wdt, does not exist?
> >   * Check match for mt8183-wdt, exists!
> >   * Put everything into dev->of_node (having mediatek,mt8183-wdt only!)
> >
> > __of_device_is_compatible() gets dev->of_node and compares that to all of the
> > possible matches.
> >
> > struct device_node for this device hence does *not* contain any of the other
> > compatibles that we specified in devicetree, so it does *not* contain any of
> > "mediatek,mt8195-wdt", or "mediatek,mt6589-wdt", because we have previously
> > successfully matches 8183.
> >
> > I don't think that I've misinterpreted this flow, but if I have, let's pull
> > in devicetree people and check with them?
> >
>
> I don't see the problem either. The fallback needs to be listed last in the
> compatible property. If it isn't, having it last in struct of_device_id
> won't help either.

I was probably reading something that wasn't there in the watchdog patch
series I mentioned. I've replied over there. Please ignore this one for
now.

ChenYu

> > Cheers,
> > Angelo
> >
> >> ---
> >>
> >> This change complements the removal of the fallback compatible from the
> >> bindings and DTSI files [1].
> >>
>
> If the fallback isn't listed in the dtsi files, it won't match at all,
> no matter where it is located in struct of_device_id.
>
> Guenter
>
> >> [1] https://lore.kernel.org/linux-mediatek/20220721014845.19044-1-allen-kh.cheng@mediatek.com/
> >>
> >>   drivers/watchdog/mtk_wdt.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> >> index e97787536792..3d5a239b93ba 100644
> >> --- a/drivers/watchdog/mtk_wdt.c
> >> +++ b/drivers/watchdog/mtk_wdt.c
> >> @@ -425,12 +425,13 @@ static int mtk_wdt_resume(struct device *dev)
> >>   static const struct of_device_id mtk_wdt_dt_ids[] = {
> >>       { .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
> >> -    { .compatible = "mediatek,mt6589-wdt" },
> >>       { .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
> >>       { .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
> >>       { .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
> >>       { .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
> >>       { .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
> >> +    /* Fallback compatible string must be last entry */
> >> +    { .compatible = "mediatek,mt6589-wdt" },
> >>       { /* sentinel */ }
> >>   };
> >>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> >
> >
>

