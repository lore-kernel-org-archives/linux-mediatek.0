Return-Path: <SRS0=wO2S=GN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD23C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 01:49:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61902085B
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 01:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61902085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=03hpFHJ5haePEfbXZyv6znH+uH/9pXemVDwuZKlIpIM=; b=URVzskoTqua6XTag63ScHsNuQ
	sWZeGrRr/nBMWkoVFO3rs7H44MPldQgMJDdjhfKnNHdRgHbILGBPpeF2xz/xENGXZYWPuMx3qDfHU
	MH3imSwyX3U5ZIfq2mAHD+698hQp/UfIRivYPSL4DjHQvi7rUORIDdFOilHoX8ofpRYSml3XoyXGL
	5kLF+/6LQxqmGnyj1GC+CdAussZNfw8JaRKm1fSp/Ly4N+Q+qMikrU5nBrIVOxRvTzaYZhQvhc9hg
	8iVGCGZi9BTQY9D6w95h7tPlnTzsSlzt2IyNzTAg7bqjDjhZR30jaxJMhDC/8LlSXrd9HLXmMNwFH
	xD2yNUmyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyPrN-0007vI-03; Sun, 10 Jan 2021 01:49:37 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyPrH-0007tT-6J
 for linux-mediatek@lists.infradead.org; Sun, 10 Jan 2021 01:49:32 +0000
Received: by mail-ua1-x935.google.com with SMTP id s23so4772485uaq.10
 for <linux-mediatek@lists.infradead.org>; Sat, 09 Jan 2021 17:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1UjVBI6DwWGEqKjlb956Wzfzp6jzPMsT75ZWabonuRA=;
 b=mJ37GlA6KDO7ZYwk4swiCGQNWElQShNlGobj/6SXwudRq5SMY8GWPXxqXJLdEurKVX
 OQQzyL7n6Kj9tysDd7Om15PlCPGA7rOGtA4oka0yHLZdDcC1Qc1UkgAP3C4DlzZpsOog
 dWWdH1rTjXYcKkiSV8QvUcdErxw7sSNpW+yOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1UjVBI6DwWGEqKjlb956Wzfzp6jzPMsT75ZWabonuRA=;
 b=NRk1sDeGJW+EH7vrlhVd2b9opou21XDI5hhyhJV67GngEFJxa+c7swuYv45YOlI0F6
 Nv0vCtSX2XiS10Plx5mp8d7hz3N+HYRCsJpjENTcsnXQMpuUdpd5PhiVkT22AYRNE+Zd
 mQLEErUn1wRta+y0aDAc9F8EUZfKRhEJoJ38WELEvJ6lw15RFESi4vdf+6naVUR3CJg6
 YbNGnE+BJWIQVnRqOVIwlzbSw+F9h2D49dtfKVGWJvw6tQ57z9sfFg8NXvS3wRn0d7Ew
 DNpVj5MCUaVhJT3ktZRME38L7j48ecQ+zhe6U48L1WztEsnfJHb2RG6OZahlvtHpSd7G
 U1PQ==
X-Gm-Message-State: AOAM5327bh/xRk67sL7uAyQG7VNMytgJRnBo+0s4EpBn2Ea5nGSlKmRJ
 hAiBBniQHG8VPRyBDDUbBTY+nmlucGgR7fki+s1fkcW7aVjxkQ==
X-Google-Smtp-Source: ABdhPJzBebHk146ZhAkD8otYtFgViiYtu+ubVds7PRUth6EO2Xh1rNYSE0WzcSgsh+QcdojwPhtJGAZrnOAzVQbKXdQ=
X-Received: by 2002:ab0:474e:: with SMTP id i14mr8074392uac.74.1610243367666; 
 Sat, 09 Jan 2021 17:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20210107104915.2888408-1-hsinyi@chromium.org>
 <20210107104915.2888408-3-hsinyi@chromium.org>
In-Reply-To: <20210107104915.2888408-3-hsinyi@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sun, 10 Jan 2021 09:49:16 +0800
Message-ID: <CANMq1KAWCbtpJWMG2nE6k1hOzA=hCWYJxzC7RXb_voEri0v2=g@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: mediatek: pm-domains: Add domain regulator supply
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_204931_308149_FDDD8EEE 
X-CRM114-Status: GOOD (  21.32  )
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
 Weiyi Lu <weiyi.lu@mediatek.com>, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 7, 2021 at 6:49 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Some power domains (eg. mfg) needs to turn on power supply before power
> on.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/soc/mediatek/mt8183-pm-domains.h |  1 +
>  drivers/soc/mediatek/mtk-pm-domains.c    | 36 +++++++++++++++++++++++-
>  drivers/soc/mediatek/mtk-pm-domains.h    |  1 +
>  3 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
> index 8d996c5d2682d..aa5230e6c12f8 100644
> --- a/drivers/soc/mediatek/mt8183-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8183-pm-domains.h
> @@ -38,6 +38,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
>                 .ctl_offs = 0x0338,
>                 .sram_pdn_bits = GENMASK(8, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
> +               .caps = MTK_SCPD_DOMAIN_SUPPLY,
>         },
>         [MT8183_POWER_DOMAIN_MFG_CORE0] = {
>                 .sta_mask = BIT(7),
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index fb70cb3b07b36..ae255aa7b1a97 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
[snip]
> @@ -275,6 +295,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  {
>         const struct scpsys_domain_data *domain_data;
>         struct scpsys_domain *pd;
> +       struct device_node *np = scpsys->dev->of_node;
>         struct property *prop;
>         const char *clk_name;
>         int i, ret, num_clks;
> @@ -307,6 +328,19 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>         pd->data = domain_data;
>         pd->scpsys = scpsys;
>
> +       if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
> +               /* Find regulator in current power domain node */
> +               scpsys->dev->of_node = node;
> +               pd->supply = devm_regulator_get(scpsys->dev, "domain");
> +               scpsys->dev->of_node = np;

This pattern is a bit strange to me. But Hsin-Yi pointed out that
there are precedents:
https://elixir.bootlin.com/linux/v5.11-rc2/source/drivers/iio/adc/rcar-gyroadc.c#L397
.

> +               if (IS_ERR(pd->supply)) {
> +                       dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
> +                                     "%pOF: failed to get power supply.\n",
> +                                     node);
> +                       return ERR_CAST(pd->supply);
> +               }
> +       }
> +
>         pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");
>         if (IS_ERR(pd->infracfg))
>                 return ERR_CAST(pd->infracfg);
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index a2f4d8f97e058..b2770b5266dba 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -7,6 +7,7 @@
>  #define MTK_SCPD_FWAIT_SRAM            BIT(1)
>  #define MTK_SCPD_SRAM_ISO              BIT(2)
>  #define MTK_SCPD_KEEP_DEFAULT_OFF      BIT(3)
> +#define MTK_SCPD_DOMAIN_SUPPLY         BIT(4)
>  #define MTK_SCPD_CAPS(_scpd, _x)       ((_scpd)->data->caps & (_x))
>
>  #define SPM_VDE_PWR_CON                        0x0210
> --
> 2.29.2.729.g45daf8777d-goog
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
