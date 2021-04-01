Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A00C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:37:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF7DC6108B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF7DC6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPiRkLpuxL3ddccDU+aV2M1Es5jkiryeL6Dsc9+nA+Q=; b=Nbjvo6qjkZASD6l+RYBOsPMQr
	QbCya2mRpWQrl3HOh5aY/E3vMgZqJICsZVCJfmM7vWA9qlxmJoKUCEVeYq8QYaWr1XKbNXrAqZKss
	I223Z5HD1yjWtp6OH0ezGgdXHq4pIdeNqygVQVKKEVNEzFhdkx9LbCDBhmn5sm0tdZtm0F2+qvxKI
	o/W961+PW1DjptQP/g0oNZBudgcW+MN3IoBxcziRHVb7E6bE5jaPJw6J4hUIDFNh72GjgF0Q7Gqm9
	/HS9yNac5UUttVOGdJUnIbVQZ5zAt6mr3Tdx0mUdaxTdGASiBYYpKjxgi9M9Z9uy2Esiu7KI094mE
	z2Y+7zXRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRtlC-00950C-MX; Thu, 01 Apr 2021 09:37:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtl4-0094yJ-KW; Thu, 01 Apr 2021 09:37:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id d191so721428wmd.2;
 Thu, 01 Apr 2021 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EPDBHbZ+mRKnrNaC/N5QN7AETckdIEnqwj/xW1Ps1Tg=;
 b=iIZwAC0xaoLSg43i0qM+Y5c6Z/QBj2LKVofvJakegSgsIciFNRoD0HzdGaNuqwE2Ds
 /lAI/K+FiXXA27ogs2Sfg08fs3ni5cohNZKjvP/gLf1GHtX1Pt5kYSekWI8v1tq7h42N
 VmCcI6EoARm9U19tt7VyjJc+UFbX8yNEs4W1DxUNLVxgig2MKS2MaqvyJAK7DAyS2Z5z
 /5l2DSOcBE4iq7WwWxpjBfATBIX2a687CoCCFvr/r1HHwo90hJsgwkTDHzptKYz0DVjJ
 TMVCg+AmdTmzd0PX8lJ2KOBAaAIBQh0qm8yGpHf33is3OaVeszGzINQsFhSSD4A3QRbT
 youw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EPDBHbZ+mRKnrNaC/N5QN7AETckdIEnqwj/xW1Ps1Tg=;
 b=lu7Y5iYjFrPnRGuv20LIe3F48Cq8A8IJYAY0/yUX2u/HYM29k4cpuz1Jj7SDgD1xOE
 7qg6Xa03vKI8vdgh0Hud+N2ZXfxnV07x9/niCDMpreg6nahERo0THDj8UZrBGkZYA44y
 o6RsIpni39IFl5iKdPnbfd3egPdwyGTjlmMnBSbzZuBb3hQPFtaQFutPt1TZ/0Jlj3kN
 Ax4UXYhM3OQhE9yWlDIBFOZQoFRPRM7mQm9Qs2cWGpMCZzvah+dxaz+/TGZDi54+HBkR
 0k+vOVR43Zx8DA1fpGhA0cNi8NSyqUheCUgilkCi51JfytC/7Vm3IHKjZqdvbGPPK6FD
 GFgw==
X-Gm-Message-State: AOAM532WH2RLc1Ht8xUQd15DL3LAHNkKZxxKW8ufDcG431xMCIVr+7UV
 VuJFU6kZ/pYhNuSxa/nbSovnjR+3Ggl9FQ==
X-Google-Smtp-Source: ABdhPJyw8+/O191pr0frxMG+TtW/fRlG9FZ9qoESROa0hMKBJP2vTiOfLlNIC/V+vgMJHI2qnQFpDQ==
X-Received: by 2002:a7b:c0c3:: with SMTP id s3mr7080484wmh.11.1617269817973;
 Thu, 01 Apr 2021 02:36:57 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l4sm5927565wmh.8.2021.04.01.02.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:36:57 -0700 (PDT)
Subject: Re: [PATCH 1/4] soc: mediatek: pm-domains: Add a meaningful power
 domain name
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>, drinkcat@chromium.org,
 hsinyi@chromium.org, weiyi.lu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210225175000.824661-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <f61e32cb-0dbe-2e12-2d77-3778953ee1d7@gmail.com>
Date: Thu, 1 Apr 2021 11:36:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210225175000.824661-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_103658_940971_A21E9528 
X-CRM114-Status: GOOD (  23.02  )
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



On 25/02/2021 18:49, Enric Balletbo i Serra wrote:
> Add the power domains names to the power domain struct so we
> have meaningful name for every power domain. This also removes the
> following debugfs error message.
> 
>   [    2.242068] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   [    2.249949] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   [    2.257784] debugfs: Directory 'power-domain' with parent 'pm_genpd' already present!
>   ...
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Whole series applied to v5.12-next/soc

Thanks a lot!
Matthias

> ---
> 
>  drivers/soc/mediatek/mt8173-pm-domains.h | 10 ++++++++++
>  drivers/soc/mediatek/mtk-pm-domains.c    |  6 +++++-
>  drivers/soc/mediatek/mtk-pm-domains.h    |  2 ++
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
> index 3e8ee5dabb43..654c717e5467 100644
> --- a/drivers/soc/mediatek/mt8173-pm-domains.h
> +++ b/drivers/soc/mediatek/mt8173-pm-domains.h
> @@ -12,24 +12,28 @@
>  
>  static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  	[MT8173_POWER_DOMAIN_VDEC] = {
> +		.name = "vdec",
>  		.sta_mask = PWR_STATUS_VDEC,
>  		.ctl_offs = SPM_VDE_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(12, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_VENC] = {
> +		.name = "venc",
>  		.sta_mask = PWR_STATUS_VENC,
>  		.ctl_offs = SPM_VEN_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(15, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_ISP] = {
> +		.name = "isp",
>  		.sta_mask = PWR_STATUS_ISP,
>  		.ctl_offs = SPM_ISP_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(13, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_MM] = {
> +		.name = "mm",
>  		.sta_mask = PWR_STATUS_DISP,
>  		.ctl_offs = SPM_DIS_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
> @@ -40,18 +44,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		},
>  	},
>  	[MT8173_POWER_DOMAIN_VENC_LT] = {
> +		.name = "venc_lt",
>  		.sta_mask = PWR_STATUS_VENC_LT,
>  		.ctl_offs = SPM_VEN2_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(15, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_AUDIO] = {
> +		.name = "audio",
>  		.sta_mask = PWR_STATUS_AUDIO,
>  		.ctl_offs = SPM_AUDIO_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(15, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_USB] = {
> +		.name = "usb",
>  		.sta_mask = PWR_STATUS_USB,
>  		.ctl_offs = SPM_USB_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
> @@ -59,18 +66,21 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
>  		.caps = MTK_SCPD_ACTIVE_WAKEUP,
>  	},
>  	[MT8173_POWER_DOMAIN_MFG_ASYNC] = {
> +		.name = "mfg_async",
>  		.sta_mask = PWR_STATUS_MFG_ASYNC,
>  		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = 0,
>  	},
>  	[MT8173_POWER_DOMAIN_MFG_2D] = {
> +		.name = "mfg_2d",
>  		.sta_mask = PWR_STATUS_MFG_2D,
>  		.ctl_offs = SPM_MFG_2D_PWR_CON,
>  		.sram_pdn_bits = GENMASK(11, 8),
>  		.sram_pdn_ack_bits = GENMASK(13, 12),
>  	},
>  	[MT8173_POWER_DOMAIN_MFG] = {
> +		.name = "mfg",
>  		.sta_mask = PWR_STATUS_MFG,
>  		.ctl_offs = SPM_MFG_PWR_CON,
>  		.sram_pdn_bits = GENMASK(13, 8),
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index b7f697666bdd..694d6ea6de1d 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -438,7 +438,11 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  		goto err_unprepare_subsys_clocks;
>  	}
>  
> -	pd->genpd.name = node->name;
> +	if (!pd->data->name)
> +		pd->genpd.name = node->name;
> +	else
> +		pd->genpd.name = pd->data->name;
> +
>  	pd->genpd.power_off = scpsys_power_off;
>  	pd->genpd.power_on = scpsys_power_on;
>  
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 141dc76054e6..21a4e113bbec 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -76,6 +76,7 @@ struct scpsys_bus_prot_data {
>  
>  /**
>   * struct scpsys_domain_data - scp domain data for power on/off flow
> + * @name: The name of the power domain.
>   * @sta_mask: The mask for power on/off status bit.
>   * @ctl_offs: The offset for main power control register.
>   * @sram_pdn_bits: The mask for sram power control bits.
> @@ -85,6 +86,7 @@ struct scpsys_bus_prot_data {
>   * @bp_smi: bus protection for smi subsystem
>   */
>  struct scpsys_domain_data {
> +	const char *name;
>  	u32 sta_mask;
>  	int ctl_offs;
>  	u32 sram_pdn_bits;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
