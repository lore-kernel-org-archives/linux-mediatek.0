Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336F4C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:58:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD682207BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSEghk4H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NRilLnYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD682207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WDJ8c6Ad0AJFu/IzNPzxj3E0roQydVjfPhSibtEfvbo=; b=dSEghk4H0mSVydysmWTYQHxsb
	wEO41Dik94SfNftpYP2muNHmZBGLZS/njBsbHwPooyTkOxgtn0SJKT/ncZmZuNZnTekCZen73TQ6U
	bo63wXiXmckJkN7okdITg2fsuExEtfK4sOia0AeJLDQmDH5Kn1d0Ydz2dGjspidEKKhbpTysLggPK
	vmup2iDBvngBP/WZNWNiFbjOnkuOxSyP6kxU5FYsgDuK9g2mDN2zvboDbxqSLxNnuo1RaOyd+orBY
	Hy0gXC5HuzfGulIbRuE6ZnaHY+jgo7erfZ+TWv3vS8yy3H2LcJdE63/VTwDO2OolN0qPjNgReMqfD
	HHTWT57xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXDJo-00084U-Ty; Tue, 27 Oct 2020 00:58:32 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXDJm-00082P-1h
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 00:58:31 +0000
Received: by mail-ua1-x941.google.com with SMTP id f20so3486324uap.2
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2020 17:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3Dgok4l5W01MscgrMjsNMzh9a1zLXNZz5FzIwHMh5c=;
 b=NRilLnYpmuEX0BFu+m+kUP57pTYsg4kVFKKUQGl6g4Eldwv6rUcUnm+VFUgljy1Afm
 Yi9wSQKO2SdK9OEnr/vvGTwXpY5KMDKonTT8Jl7IE5bMM0jbjXjlD/Z2nCFgGuhq1dZY
 /X/tMpcQ62F2daXNyDP7ZhoxQe0f2eFGy8t/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3Dgok4l5W01MscgrMjsNMzh9a1zLXNZz5FzIwHMh5c=;
 b=bSTXoacNt9BA1gPW7OKuU56WTqLYwv1SzI9JeLvroo35dyZDD9Efv+oiUHDCSh3Bz9
 FjGz9FRaVqWYhLrQUBJMUAYm1ez+1xqjFTpjYHfHMONL31RjL1Vx4/OOR9R7uko0dHWn
 hPU4n65MJLGdRMAThwJm8WsAOz5i6REnTR+XB7x731TT0FO2v24jFvJ5p7tDnvc/ZJxx
 s8AnKG48+ZJw9sOJ8iEyyUHHel0p/sOq87xPBsRoIPXmEefV6BF5a7Yhuud5MtX8GZX+
 G40blhC5R6y0BAekOpSw06chJ35cc6ffyTxHJMBgXw3APU8h7zAQusczVTMqS21f9ngM
 /F7Q==
X-Gm-Message-State: AOAM533HtI+HFBIQo8gNDptSry9sqT0iA++BSCVTZ4USZ4jfJQYfScxD
 XRTJXVvy5+8KM4KETWa16z9KR5kmLX4DA0k9fBx+Pw==
X-Google-Smtp-Source: ABdhPJz0LeHyzLgm/WyLe2NkYH2xM1sa3TF/3IA53PalCOXMGjrJpM1nmilBHXpKcbyaXjYyrfj0uJRVWlfmMAmaAcw=
X-Received: by 2002:ab0:7351:: with SMTP id k17mr13803047uap.88.1603760308466; 
 Mon, 26 Oct 2020 17:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-5-enric.balletbo@collabora.com>
In-Reply-To: <20201026175526.2915399-5-enric.balletbo@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 27 Oct 2020 08:58:17 +0800
Message-ID: <CANMq1KA=xVSAu6eYS8cUgdPK6kETvKSCndHrCqcngfd9o=abQQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] soc: mediatek: pm-domains: Add bus protection
 protocol
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_205830_134648_A549549F 
X-CRM114-Status: GOOD (  21.63  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 1:55 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> From: Matthias Brugger <mbrugger@suse.com>
>
> Bus protection will need to update more then one register
> in infracfg. Add support for several operations.
>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  drivers/soc/mediatek/mt8173-pm-domains.h |  4 +--
>  drivers/soc/mediatek/mtk-pm-domains.c    | 36 +++++++++++++++++-------
>  drivers/soc/mediatek/mtk-pm-domains.h    |  4 ++-
>  3 files changed, 31 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index a2a624bbd8b8..341cc287c8ce 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -34,7 +34,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 .ctl_offs = SPM_DIS_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(12, 12),
> -               .bp_infracfg = {
> +               .bp_infracfg[0] = {
>                         .bus_prot_reg_update = true,
>                         .bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MM_M0 |
>                                 MT8173_TOP_AXI_PROT_EN_MM_M1,
> @@ -76,7 +76,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>                 .ctl_offs = SPM_MFG_PWR_CON,
>                 .sram_pdn_bits = GENMASK(13, 8),
>                 .sram_pdn_ack_bits = GENMASK(21, 16),
> -               .bp_infracfg = {
> +               .bp_infracfg[0] = {
>                         .bus_prot_reg_update = true,
>                         .bus_prot_mask = MT8173_TOP_AXI_PROT_EN_MFG_S |
>                                 MT8173_TOP_AXI_PROT_EN_MFG_M0 |
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 16503d6db6a8..2121e05cb9a4 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -89,24 +89,40 @@ static int scpsys_sram_disable(struct scpsys_domain *pd)
>
>  static int scpsys_bus_protect_enable(struct scpsys_domain *pd)
>  {
> -       const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
> +       const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
> +       int i, ret;
>
> -       if (!bp_data->bus_prot_mask)
> -               return 0;
> +       for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> +               if (!bpd[i].bus_prot_mask)
> +                       break;
>
> -       return mtk_infracfg_set_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
> -                                              bp_data->bus_prot_reg_update);
> +               ret = mtk_infracfg_set_bus_protection(pd->infracfg,
> +                                                     bpd[i].bus_prot_mask,
> +                                                     bpd[i].bus_prot_reg_update);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
>  }
>
>  static int scpsys_bus_protect_disable(struct scpsys_domain *pd)
>  {
> -       const struct scpsys_bus_prot_data *bp_data = &pd->data->bp_infracfg;
> +       const struct scpsys_bus_prot_data *bpd = pd->data->bp_infracfg;
> +       int i, ret;
>
> -       if (!bp_data->bus_prot_mask)
> -               return 0;
> +       for (i = 0; i < SPM_MAX_BUS_PROT_DATA; i++) {
> +               if (!bpd[i].bus_prot_mask)
> +                       return 0;
>
> -       return mtk_infracfg_clear_bus_protection(pd->infracfg, bp_data->bus_prot_mask,
> -                                                bp_data->bus_prot_reg_update);
> +               ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
> +                                                       bpd[i].bus_prot_mask,
> +                                                       bpd[i].bus_prot_reg_update);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
>  }
>
>  static int scpsys_power_on(struct generic_pm_domain *genpd)
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 7c8efcb3cef2..e428fe23a7e3 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -32,6 +32,8 @@
>  #define PWR_STATUS_AUDIO               BIT(24)
>  #define PWR_STATUS_USB                 BIT(25)
>
> +#define SPM_MAX_BUS_PROT_DATA          3
> +
>  struct scpsys_bus_prot_data {
>         u32 bus_prot_mask;
>         bool bus_prot_reg_update;
> @@ -52,7 +54,7 @@ struct scpsys_domain_data {
>         u32 sram_pdn_bits;
>         u32 sram_pdn_ack_bits;
>         u8 caps;
> -       const struct scpsys_bus_prot_data bp_infracfg;
> +       const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
>  };
>
>  struct scpsys_soc_data {
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
