Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB40C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:31:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE3764D74
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 03:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE3764D74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AJ3Cco6uArj0hCdh3619ab+RYu9r1qGbd1Fwb7ehQqk=; b=pzZqBndeFqAMixvlQc03yEbnc
	dITdvstQBDAEA5zkMpohei5m9uqOVtP4pTxIX6D/dKiZBHnzTpszmHyCVkbN+G8LymetRQp+Owt7x
	F/BmVuU96JbmY+JjcrAc+XWe3PEi5B+Iaktu0y2iNPelOlHTCHkEi6ELSvbpoe4KNkSbh+PRwaGW8
	b8ZJAEdXOGy0T0KTvl1rjMOxCqMNsHma6TXmNrbWHjf9JnS1xQML3IuPZFwo46axgBnpy9zOxcAj8
	Dd+txMVDKgivlWAaZXPfvblyG2ufd/jCGg2f4Rdc92scAQLQLm03lH/50+gx5suivYkxPlHMmMB8h
	zFCEjHyjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGvke-0008CG-Qf; Tue, 02 Mar 2021 03:31:12 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGvkY-000894-IA
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 03:31:07 +0000
Received: by mail-io1-xd2a.google.com with SMTP id i8so20249985iog.7
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Mar 2021 19:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BBOxEfv6278yvseUKPxhXaovmz5fmbYaJegMD+mzGcc=;
 b=NVi1PAqo8H18cNR4mvatM4ZWDOArYfp818zLm+r4YpiXSt3pM4Dz1uIntWaLQmOFo3
 iDv9m16+fcvXUFf6J37hmwavL4scyxTBTBs4sexJb7nRoTDhRQRgdxMzi2LeyA4XRq3D
 lG9tWK88l6HDPF5o5627veKfK7x3jwuWnOCp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BBOxEfv6278yvseUKPxhXaovmz5fmbYaJegMD+mzGcc=;
 b=nVwFyniT8cKO1dMbf+kNrCYjcoOEdewj6AYLjrfNAMwLWUTBazsntcuHzgF35iRf3g
 NpOYFUBDrk3PF4UZVBSAk2vSX+Qk0gtSx8S4/NH5tHbZ2gSfWIUmqjpwyueYksOZx28Y
 687YlKh3bE8i5/56r4DMmPJSDOQRFs55DDEJxw5YaLGoxFa8zrFMhf18SXwAzEigmGEY
 x14oHHaquwgDrIIGtbEuiQufHRAaOSodYhR9991JE4QcOrjd26UHTcPcrF+FAKOgE4uP
 rAE3/8vttzZjMaBktMafRgGsAgHrBnJ0VlYpocYOSVzSXPQc74+tDjER08LbKF9ZlmnP
 8jOQ==
X-Gm-Message-State: AOAM530DrUeGLNJRSSeSRohpSRPLGWTqiuv+/hCEt51tvyoKJqnXudz5
 Lgmm3ehp3cjU2wQG2fyaAy8iahTX2qCJvgMyHJw9NFiPmCUy6A==
X-Google-Smtp-Source: ABdhPJzTK9I8n6u6kduFOGVuL/KvBOB/tB/VdAiM8b2HzM/XScC3ekjFe4AceZrrWZ35aljPWFT3RHxsxmUA4HLtBdE=
X-Received: by 2002:a6b:7319:: with SMTP id e25mr15613358ioh.0.1614655864631; 
 Mon, 01 Mar 2021 19:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
 <20210225175000.824661-4-enric.balletbo@collabora.com>
In-Reply-To: <20210225175000.824661-4-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 2 Mar 2021 11:30:38 +0800
Message-ID: <CAJMQK-gT0+OC_KgBMzRzcPAZFHdNWyhzG2v2q9fX9-hc2-8oGQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] soc: mediatek: pm-domains: Add a power domain names
 for mt8167
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_223106_651487_C1AE87D3 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 26, 2021 at 1:50 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Add the power domains names for the mt8167 SoC.
>
> Fixes: 207f13b419a6 ("soc: mediatek: pm-domains: Add support for mt8167")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
>  drivers/soc/mediatek/mt8167-pm-domains.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
> index ad0b8dfa0527..15559ddf26e4 100644
> --- a/drivers/soc/mediatek/mt8167-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8167-pm-domains.h
> @@ -15,6 +15,7 @@
>
>  static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
>         [MT8167_POWER_DOMAIN_MM] = {
> +               .name = "mm",
>                 .sta_mask = PWR_STATUS_DISP,
>                 .ctl_offs = SPM_DIS_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
> @@ -26,6 +27,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
>                 .caps = MTK_SCPD_ACTIVE_WAKEUP,
>         },
>         [MT8167_POWER_DOMAIN_VDEC] = {
> +               .name = "vdec",
>                 .sta_mask = PWR_STATUS_VDEC,
>                 .ctl_offs = SPM_VDE_PWR_CON,
>                 .sram_pdn_bits = GENMASK(8, 8),
> @@ -33,6 +35,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
>                 .caps = MTK_SCPD_ACTIVE_WAKEUP,
>         },
>         [MT8167_POWER_DOMAIN_ISP] = {
> +               .name = "isp",
>                 .sta_mask = PWR_STATUS_ISP,
>                 .ctl_offs = SPM_ISP_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
> @@ -40,6 +43,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
>                 .caps = MTK_SCPD_ACTIVE_WAKEUP,
>         },
>         [MT8167_POWER_DOMAIN_MFG_ASYNC] = {
> +               .name = "mfg_async",
>                 .sta_mask = MT8167_PWR_STATUS_MFG_ASYNC,
>                 .ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>                 .sram_pdn_bits = 0,
> @@ -50,18 +54,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
>                 },
>         },
>         [MT8167_POWER_DOMAIN_MFG_2D] = {
> +               .name = "mfg_2d",
>                 .sta_mask = MT8167_PWR_STATUS_MFG_2D,
>                 .ctl_offs = SPM_MFG_2D_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(15, 12),
>         },
>         [MT8167_POWER_DOMAIN_MFG] = {
> +               .name = "mfg",
>                 .sta_mask = PWR_STATUS_MFG,
>                 .ctl_offs = SPM_MFG_PWR_CON,
>                 .sram_pdn_bits = GENMASK(11, 8),
>                 .sram_pdn_ack_bits = GENMASK(15, 12),
>         },
>         [MT8167_POWER_DOMAIN_CONN] = {
> +               .name = "conn",
>                 .sta_mask = PWR_STATUS_CONN,
>                 .ctl_offs = SPM_CONN_PWR_CON,
>                 .sram_pdn_bits = GENMASK(8, 8),
> --
> 2.30.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
