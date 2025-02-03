Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABFFC02192
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2025 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MiG8ILt8Yn9LtSo8zrEP73wfD//i7MORC/NBtgshl4=; b=lkOD6NJQJu31iNOgN06N8YfbWm
	cXuySbop+FKdmgWMfJw/KCUUnk7ar34i2r+07dvEI66OHhBYQZOeVhElSPn+Z8gr2FruUXs6tWh24
	HWYHs4V5ITWbGQ2UzHG7FRphXSgJ66xKF7ej7pnIdLuoz0PojnIHZ0Papd8nyp3FhD5KJAPcRJKmo
	VHd72FXZOB9LB8I3IEw36draTHAG0eGD1AdhXhbFCoJZ9H3zVrHuW+2wqVOTl8W8wf8C9ZMr/Me//
	QFvj7ycDNduIv8WFnslavxyv/m9FPZjCZg1qMyXvtNKKDdd/aIHs5N2/wBwU8oRYIhtDxpY6xNc1L
	67g4LLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tex43-0000000Fbms-3WRn;
	Mon, 03 Feb 2025 14:04:39 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tex40-0000000Fblj-3aTF
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Feb 2025 14:04:38 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6efc58fae20so27749927b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Feb 2025 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738591475; x=1739196275; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3MiG8ILt8Yn9LtSo8zrEP73wfD//i7MORC/NBtgshl4=;
        b=lyGfB+WyMK2vW/ovghLKUfZfr4lbxsNEBJyPYqq0eUXvsqDr9NXx/3OVG9bFTNnT5P
         JvyyUpfNWk6u8V/nMYboFw3itg3VsxLP7WNtZKHqhMQFHbQ6+GN/ClQgwwDV66HgPnhA
         Geaz6IqPzqcIwb7UGSYwH9VkltgdChnLi/j8O2tN4+KKRo0PIsYn1LMJapSAKcvYQcvQ
         Kd6gtX9OPr17FnnR1C4Y2zQpY7EeK1IZBsAcVuFui/+G6fRSC0hChIrv9gqNUfQT3FaA
         Xx7ae0MPs68PHzobDPnzHkbwM2JhfoOcQW2H/oB6Q6iyrwLSqEPxQCiibgRi1EbRi10X
         kKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591475; x=1739196275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MiG8ILt8Yn9LtSo8zrEP73wfD//i7MORC/NBtgshl4=;
        b=u3aEQR4PP2yBAWrow3lAvq+xyiwV52mGZv2Bj4Dy2WCTQblVx04xz+CKTCP+Gu90Nf
         2fIW7OMsai8FU5xnHCa5dh3JKM/uLMN0/XUeDsG7ETmyQpgvREKXDwyobu6b720wplW9
         0i92AuJwVSsW8Aus+XqLRD7pcBb/S5PSqwRZggrd0IwixZIOFwlZaiEvOb6SYFexzT2y
         aKFOU3t0Ok28n26pxQAkdc9PLhU7oKBznNzGG/peqhlbVxbUVtY3SZUp3Ze/blS9ZwlV
         i4KwTpxddGmQW6yKBE1dFtstvK3BhORw4umNpausCxGbXS7hHtwUAPeDpETAkEG2dI73
         2VTA==
X-Forwarded-Encrypted: i=1; AJvYcCVd5Wzekqg9fXS4uFq5IE3LpX3h+oaflaVq5b8yPFw5YYH784NoVtgCDwjfGWuEq2gB0Oo/CvunPAww9Hwurg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk9qXtAdRE7CjE4x+WP3t1R35z2TJFmcAf+g9mrWK19eebFX51
	4YVvQLQzWi1DJcEWFIx6nWK1njjgjbwFmaZ/hBW53LhDy6ai4MY8iZYjmcyyoOr3FQQiSq0kyf5
	Srj1fRYRz7oTEnNjD0oRLF1TKz0TAiugrh7q/Qg==
X-Gm-Gg: ASbGncvUAlMXkaV+j6+j2YgR7vHFVXnDKbR2glvoDGUuNe3AgJxpEaRu30EeneuWQl+
	xC1BlKMB9v5RFxaSPBiPARLvMgs9ck3GpHDH6rxQvahfRVSblIpeLRhwQsr4oYxqdBMOGOur/MA
	==
X-Google-Smtp-Source: AGHT+IHLs3FLituH22CBJTCC44v20E2zGZEme1CuUalIEcbSHa4S1LzyVXjnSZYtsdh38rN7Sycwz9vIj9EtGuifSjM=
X-Received: by 2002:a05:690c:994:b0:6f0:237e:fc67 with SMTP id
 00721157ae682-6f7a83fcefamr125534307b3.23.1738591475324; Mon, 03 Feb 2025
 06:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20250123092644.7359-1-andy-ld.lu@mediatek.com>
In-Reply-To: <20250123092644.7359-1-andy-ld.lu@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 3 Feb 2025 15:03:59 +0100
X-Gm-Features: AWEUYZnk_P6e6WT5mTt4ApkOyTMWhna0dJzCdBChCmPPxEjQ9bm-vcA95IzI1VE
Message-ID: <CAPDyKFpXGoM+iYyMBtrnctPX_cJQv=tN52NunBRcfJecQzGy5A@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: mtk-sd: Fix register settings for hs400(es) mode
To: Andy-ld Lu <andy-ld.lu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_060436_891414_0F525E5A 
X-CRM114-Status: GOOD (  24.65  )
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

On Thu, 23 Jan 2025 at 10:26, Andy-ld Lu <andy-ld.lu@mediatek.com> wrote:
>
> For hs400(es) mode, the 'hs400-ds-delay' is typically configured in the
> dts. However, some projects may only define 'mediatek,hs400-ds-dly3',
> which can lead to initialization failures in hs400es mode. CMD13 reported
> response crc error in the mmc_switch_status() just after switching to
> hs400es mode.
>
> [    1.914038][   T82] mmc0: mmc_select_hs400es failed, error -84
> [    1.914954][   T82] mmc0: error -84 whilst initialising MMC card
>
> Currently, the hs400_ds_dly3 value is set within the tuning function. This
> means that the PAD_DS_DLY3 field is not configured before tuning process,
> which is the reason for the above-mentioned CMD13 response crc error.
>
> Move the PAD_DS_DLY3 field configuration into msdc_prepare_hs400_tuning(),
> and add a value check of hs400_ds_delay to prevent overwriting by zero when
> the 'hs400-ds-delay' is not set in the dts. In addition, since hs400(es)
> only tune the PAD_DS_DLY1, the PAD_DS_DLY2_SEL bit should be cleared to
> bypass it.
>
> Fixes: c4ac38c6539b ("mmc: mtk-sd: Add HS400 online tuning support")
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Applied for fixes and by adding a stable-tags, thanks!

Kind regards
Uffe


> ---
> Changes in v2:
> - Change commit title from 'optimize' to 'Fix'
> - Add a Fixes tag
> - Change spaces back to tabs
>
> ---
>  drivers/mmc/host/mtk-sd.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4b6e91372526..345ea91629e0 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -273,6 +273,7 @@
>  #define MSDC_PAD_TUNE_CMD2_SEL   BIT(21)   /* RW */
>
>  #define PAD_DS_TUNE_DLY_SEL       BIT(0)         /* RW */
> +#define PAD_DS_TUNE_DLY2_SEL      BIT(1)         /* RW */
>  #define PAD_DS_TUNE_DLY1         GENMASK(6, 2)   /* RW */
>  #define PAD_DS_TUNE_DLY2         GENMASK(11, 7)  /* RW */
>  #define PAD_DS_TUNE_DLY3         GENMASK(16, 12) /* RW */
> @@ -318,6 +319,7 @@
>
>  /* EMMC50_PAD_DS_TUNE mask */
>  #define PAD_DS_DLY_SEL         BIT(16) /* RW */
> +#define PAD_DS_DLY2_SEL                BIT(15) /* RW */
>  #define PAD_DS_DLY1            GENMASK(14, 10) /* RW */
>  #define PAD_DS_DLY3            GENMASK(4, 0)   /* RW */
>
> @@ -2504,13 +2506,23 @@ static int msdc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  static int msdc_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct msdc_host *host = mmc_priv(mmc);
> +
>         host->hs400_mode = true;
>
> -       if (host->top_base)
> -               writel(host->hs400_ds_delay,
> -                      host->top_base + EMMC50_PAD_DS_TUNE);
> -       else
> -               writel(host->hs400_ds_delay, host->base + PAD_DS_TUNE);
> +       if (host->top_base) {
> +               if (host->hs400_ds_dly3)
> +                       sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
> +                                     PAD_DS_DLY3, host->hs400_ds_dly3);
> +               if (host->hs400_ds_delay)
> +                       writel(host->hs400_ds_delay,
> +                              host->top_base + EMMC50_PAD_DS_TUNE);
> +       } else {
> +               if (host->hs400_ds_dly3)
> +                       sdr_set_field(host->base + PAD_DS_TUNE,
> +                                     PAD_DS_TUNE_DLY3, host->hs400_ds_dly3);
> +               if (host->hs400_ds_delay)
> +                       writel(host->hs400_ds_delay, host->base + PAD_DS_TUNE);
> +       }
>         /* hs400 mode must set it to 0 */
>         sdr_clr_bits(host->base + MSDC_PATCH_BIT2, MSDC_PATCH_BIT2_CFGCRCSTS);
>         /* to improve read performance, set outstanding to 2 */
> @@ -2530,14 +2542,11 @@ static int msdc_execute_hs400_tuning(struct mmc_host *mmc, struct mmc_card *card
>         if (host->top_base) {
>                 sdr_set_bits(host->top_base + EMMC50_PAD_DS_TUNE,
>                              PAD_DS_DLY_SEL);
> -               if (host->hs400_ds_dly3)
> -                       sdr_set_field(host->top_base + EMMC50_PAD_DS_TUNE,
> -                                     PAD_DS_DLY3, host->hs400_ds_dly3);
> +               sdr_clr_bits(host->top_base + EMMC50_PAD_DS_TUNE,
> +                            PAD_DS_DLY2_SEL);
>         } else {
>                 sdr_set_bits(host->base + PAD_DS_TUNE, PAD_DS_TUNE_DLY_SEL);
> -               if (host->hs400_ds_dly3)
> -                       sdr_set_field(host->base + PAD_DS_TUNE,
> -                                     PAD_DS_TUNE_DLY3, host->hs400_ds_dly3);
> +               sdr_clr_bits(host->base + PAD_DS_TUNE, PAD_DS_TUNE_DLY2_SEL);
>         }
>
>         host->hs400_tuning = true;
> --
> 2.46.0
>

