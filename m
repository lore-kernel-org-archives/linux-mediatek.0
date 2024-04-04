Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09552CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 10:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0Ykm2W1S1p85sujFPKLol+N6IEGAfeW2v8P+jKKQlQ=; b=EOTx9sB+vPlYK+oz1dcE0iWMPX
	/1IdyDW9I6VXt7EWu7C9GfH8s1R7sE0xjzBzvoaIeYGnNxRI565p952hOS+bsLJlB7pN0qoo7wxat
	/OQ0pPlwgz6ZYFY6ftGnVdWcMdUM4zGjO8EcYVkTBXID4fo/Ne5I4GjfCR+fbuwjYd/Jd6iwkjj+s
	ZKeiIPr9CKGtJ7SQVXr1o/zQb3H3V21td4f0Aq1PdjxH2elt23QDc/2OCsr5qrgghi7NGpW1+FB3Q
	L8fm7cgj1clOEHSxceTfLk+GNDu48VQqqQ9jsEWYCxgPukWIb6U6+oG2gFu/NK7ZzI5sMIQGnkZbc
	U1hl/5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKcv-00000002EMo-1zeC;
	Thu, 04 Apr 2024 10:47:25 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKcp-00000002EFx-17lN
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 10:47:22 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dc74435c428so865784276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 03:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712227631; x=1712832431; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L0Ykm2W1S1p85sujFPKLol+N6IEGAfeW2v8P+jKKQlQ=;
        b=giQ/8iehcgC8kuTo51VYmuwHLcjFu9yOB+AGYp2KNvLAEcbJRtbPLIxGCB5CUomMrQ
         vmCclR7o/pnnFG85vsSzVyUSVEc4WV5j+VmQ7RzdVk4AhBDvXmuSlaZmSvjsO3gE8L/p
         0ob9678UjZYRYwxIfhCgLhsl4PsvkQa2gCAv+RgMHiymDojvgvgXNRVNGeOqF/B5obqM
         Zp32gXEUk8uaeafpZJENWv03QSQ4qPfY/Nyxsx6p/tiWRJyIdOqwhJuRKolN3G/mR4z2
         fD/om7oeIrWCIjRmSpV/dC0VWh8oXMGCLR/GRMkGUTRWNfWYtxJIe5fSdtAC2tM04mvq
         AARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712227631; x=1712832431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0Ykm2W1S1p85sujFPKLol+N6IEGAfeW2v8P+jKKQlQ=;
        b=SoxV1rlwXqIqVfthkv7WU68S2oL9u4+jcqYsX+KaMyC20a3wdLt4bz3PQmNESwLMyX
         enJYO8FOiuaXkK7vR/ct6nk9bhxu+pEKh7t6HsIQ6QTzzUJETK9Pzf3U0f6dVQLWRtkz
         dCAJe/OJdSsllL8JTle8Nsnpyvq2PsEev12lJ+MqSKYNVX2B9NKR2opipqfPvwmOnjtg
         NouRmnVzsHF1pErhOTMqT1HTByWNFG0tbm6jl3ZnU5SsCKhHV71hwp7DwXpS0khRqwdH
         vmCuHkdVSHeWv8Wva89x6fTFhlRmHUDxkYcVnqitNawM7MyfPOfsn1thCzTwfos7+r1a
         ePAw==
X-Forwarded-Encrypted: i=1; AJvYcCUqYn1hogF6gn9PErurmD+aZOTFsTjUZubi3CF9V2nVdg86e5cYcBklgUFSfG29GZhXyflZq5ZraEsrGD3CNdqLI56jdbqaM7GDTN1aZEzsoQ83
X-Gm-Message-State: AOJu0Ywx83h8Co3/azbyTihS3nUoiZ6rugryAE5w1478FCfGKLPODFuV
	PcUStygElCCBj7mHC/D+wVdsByuYuzwLSnKvJepr6cSrslVofhg92MV7S3DDcA6Q3H08A4ue95E
	gZ/NOfrCDI7Vaj9Aj80yFboiMwXUR5/2xqDGybzTdLjbA42Z3
X-Google-Smtp-Source: AGHT+IG8QfWI6GVdC6qLbyKBp8gOwWy/t5BNQ+Yfrm5Mn9ZdgBynu+9KPMQrhUmNrccslE7argS+hG9yXel1mv9D6SM=
X-Received: by 2002:a25:9111:0:b0:dc7:4f61:5723 with SMTP id
 v17-20020a259111000000b00dc74f615723mr1910942ybl.39.1712227631181; Thu, 04
 Apr 2024 03:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240329044142.3095193-1-fshao@chromium.org>
In-Reply-To: <20240329044142.3095193-1-fshao@chromium.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 4 Apr 2024 12:46:35 +0200
Message-ID: <CAPDyKFqr2wPHGScSAdwocjOF8jUTJnti+j5sWMYW5kg5x5OmyQ@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: mediatek: Add MT8188 buck isolation setting
To: Fei Shao <fshao@chromium.org>
Cc: Johnson Wang <johnson.wang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_034720_225084_86A1B774 
X-CRM114-Status: GOOD (  17.23  )
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

On Fri, 29 Mar 2024 at 05:43, Fei Shao <fshao@chromium.org> wrote:
>
> From: Johnson Wang <johnson.wang@mediatek.com>
>
> From: Johnson Wang <johnson.wang@mediatek.com>
>
> Add buck isolation setting to ADSP_AO, CAM_VCORE and IMG_VCORE power
> domains in MT8188 for proper buck isolation control in power domain
> on/off.
>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes in v2:
> [1] was reviewed but didn't get accepted at the time.
> This rebases [1] on next-20240327 with revised commit message.
>
> [1]: https://lore.kernel.org/all/20230315114505.25144-1-johnson.wang@mediatek.com/
>
>  drivers/pmdomain/mediatek/mt8188-pm-domains.h | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mt8188-pm-domains.h b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
> index 06834ab6597c..007235be9efe 100644
> --- a/drivers/pmdomain/mediatek/mt8188-pm-domains.h
> +++ b/drivers/pmdomain/mediatek/mt8188-pm-domains.h
> @@ -175,6 +175,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                 .ctl_offs = 0x35C,
>                 .pwr_sta_offs = 0x16C,
>                 .pwr_sta2nd_offs = 0x170,
> +               .ext_buck_iso_offs = 0x3EC,
> +               .ext_buck_iso_mask = BIT(10),
>                 .bp_cfg = {
>                         BUS_PROT_WR(INFRA,
>                                     MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP1,
> @@ -187,7 +189,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                                     MT8188_TOP_AXI_PROT_EN_2_CLR,
>                                     MT8188_TOP_AXI_PROT_EN_2_STA),
>                 },
> -               .caps = MTK_SCPD_ALWAYS_ON,
> +               .caps = MTK_SCPD_ALWAYS_ON | MTK_SCPD_EXT_BUCK_ISO,
>         },
>         [MT8188_POWER_DOMAIN_ADSP_INFRA] = {
>                 .name = "adsp_infra",
> @@ -524,6 +526,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                 .ctl_offs = 0x3A4,
>                 .pwr_sta_offs = 0x16C,
>                 .pwr_sta2nd_offs = 0x170,
> +               .ext_buck_iso_offs = 0x3EC,
> +               .ext_buck_iso_mask = BIT(12),
>                 .bp_cfg = {
>                         BUS_PROT_WR(INFRA,
>                                     MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP1,
> @@ -541,7 +545,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                                     MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
>                                     MT8188_TOP_AXI_PROT_EN_MM_2_STA),
>                 },
> -               .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
> +                       MTK_SCPD_EXT_BUCK_ISO,
>         },
>         [MT8188_POWER_DOMAIN_IMG_MAIN] = {
>                 .name = "img_main",
> @@ -591,6 +596,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                 .ctl_offs = 0x3A0,
>                 .pwr_sta_offs = 0x16C,
>                 .pwr_sta2nd_offs = 0x170,
> +               .ext_buck_iso_offs = 0x3EC,
> +               .ext_buck_iso_mask = BIT(11),
>                 .bp_cfg = {
>                         BUS_PROT_WR(INFRA,
>                                     MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP1,
> @@ -618,7 +625,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
>                                     MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
>                                     MT8188_TOP_AXI_PROT_EN_MM_2_STA),
>                 },
> -               .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
> +               .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY |
> +                       MTK_SCPD_EXT_BUCK_ISO,
>         },
>         [MT8188_POWER_DOMAIN_CAM_MAIN] = {
>                 .name = "cam_main",
> --
> 2.44.0.478.gd926399ef9-goog
>

