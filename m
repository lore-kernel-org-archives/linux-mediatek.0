Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE59DC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZzFh0DGI6faTDCSdoqpOD+6kPwpn3aWEBoHCyIRzCQ=; b=qnyF6kAZYxUIyMhESo49+lmtdo
	8KKdLUmDEqUcULXvt1oiZyKSrvI6so7q7IltGatb+NAjpSvmywys+yjGvV93u3ldng/xkN1tLNEUA
	mtZkMSYJhW33vf5vNJvZU5GsASVDNUTM4B0EnjPnVDuttLJYKinGkKuzhT3M6XCukKHTvb7oElOjA
	kPOTgrJcW15qPmgYeEAEm+6j+/XSI5eiMchgAdsH2D89sAt5gCKcRT22ETBDxnh0APoNZscBPPbQD
	reGXcuLXiIvd20pTFtPPbl88a0kAg9l/OD6feAL7YA/KoWCgyvWQrGNfsaoucQqYJKg6aoULI2Bbu
	cXNrE0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SX3-000v8g-1a;
	Tue, 06 Jun 2023 08:59:13 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SX0-000v7d-1T;
	Tue, 06 Jun 2023 08:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686041950; x=1717577950;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=limbG5hl1dQq2+wq2ALBEtyvWKHjn7Ti97S5CXBnQc8=;
  b=TKjql79a2aotARTMyP2uvr2Y+3T/dZbic8B4UHF8FTV2pEjudZE5u69V
   J3yeGikURW9fV6DuvbSln28w4Vm7umvLArkfbPLDzAWjwN9DXOwRvOiRN
   jYfBlmOfkJo5xd/TDRa+K5MVYWO+086SmWNJtZ8zinDmoFXvhAs0btiRN
   fEpwz+zwZMSyQJIree2rgyPZ/scgphU/pzJWpyKEsCwJ5dDuM8pSn2Uuh
   XXh00xpYG5+CMop1mDjlQAfk5DETJMastB5faOCLPOM+D64juHs26ltuy
   vh61qbQI6LtBRZ1keAR+IjAmax7Rmfjd1Amalx8tBpKcQWOGG1atrEl2v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359063505"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="359063505"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="853328684"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; 
   d="scan'208";a="853328684"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.56.224])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 01:59:02 -0700
Message-ID: <c47301df-a408-767a-a1ba-ec848a3cc588@intel.com>
Date: Tue, 6 Jun 2023 11:58:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v4] mmc: mtk-sd: reduce CIT for better performance
Content-Language: en-US
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230605121442.23622-1-wenbin.mei@mediatek.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230605121442.23622-1-wenbin.mei@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_015910_560140_66E6601D 
X-CRM114-Status: GOOD (  25.03  )
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

On 5/06/23 15:14, Wenbin Mei wrote:
> CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
> SEND_QUEUE_STATUS(CMD13) polling.
> Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
> frequency to get the actual time.
> The default value 0x1000 that corresponds to 150us for MediaTek SoCs, let's
> decrease it to 0x40 that corresponds to 2.35us, which can improve the
> performance of some eMMC devices.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>  drivers/mmc/host/cqhci.h  |  1 +
>  drivers/mmc/host/mtk-sd.c | 45 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
> index ba9387ed90eb..292b89ebd978 100644
> --- a/drivers/mmc/host/cqhci.h
> +++ b/drivers/mmc/host/cqhci.h
> @@ -23,6 +23,7 @@
>  /* capabilities */
>  #define CQHCI_CAP			0x04
>  #define CQHCI_CAP_CS			0x10000000 /* Crypto Support */
> +#define CQHCI_CAP_ITCFMUL(x)		(((x) & GENMASK(15, 12)) >> 12)

Let's not open code FIELD_GET, perhaps

#define CQHCI_CAP_ITCFMUL		GENMASK(15, 12)

#define CQHCI_ITCFMUL(x)		FIELD_GET(CQHCI_CAP_ITCFMUL,(x))

>  
>  /* configuration */
>  #define CQHCI_CFG			0x08
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..9f540973caff 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -473,6 +473,7 @@ struct msdc_host {
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
>  	struct cqhci_host *cq_host;
> +	u32 cq_ssc1_time;
>  };
>  
>  static const struct mtk_mmc_compatible mt2701_compat = {
> @@ -2450,9 +2451,48 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
>  	}
>  }
>  
> +static void msdc_cqe_cit_cal(struct msdc_host *host, u64 timer_ns)
> +{
> +	struct mmc_host *mmc = mmc_from_priv(host);
> +	struct cqhci_host *cq_host = mmc->cqe_private;
> +	u8 itcfmul;
> +	u64 hclk_freq;
> +	u64 value;
> +
> +	/* Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
> +	 * frequency to get the actual time for CIT.
> +	 */
> +	hclk_freq = clk_get_rate(host->h_clk);
> +	itcfmul = CQHCI_CAP_ITCFMUL(cqhci_readl(cq_host, CQHCI_CAP));
> +	switch (itcfmul) {
> +	case 0x0:
> +		do_div(hclk_freq, 1000);
> +		break;
> +	case 0x1:
> +		do_div(hclk_freq, 100);
> +		break;
> +	case 0x2:
> +		do_div(hclk_freq, 10);
> +		break;
> +	case 0x3:
> +		break;
> +	case 0x4:
> +		hclk_freq = hclk_freq * 10;
> +		break;
> +	default:
> +		host->cq_ssc1_time = 0x40;
> +		return;
> +	}
> +
> +	value = hclk_freq * timer_ns;
> +	do_div(value, 1000000000);
> +	host->cq_ssc1_time = value;
> +}
> +
>  static void msdc_cqe_enable(struct mmc_host *mmc)
>  {
>  	struct msdc_host *host = mmc_priv(mmc);
> +	struct cqhci_host *cq_host = mmc->cqe_private;
>  
>  	/* enable cmdq irq */
>  	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
> @@ -2462,6 +2502,9 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>  	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
>  	/* default read data timeout 1s */
>  	msdc_set_timeout(host, 1000000000ULL, 0);
> +
> +	/* Set the send status command idle timer */
> +	cqhci_writel(cq_host, host->cq_ssc1_time, CQHCI_SSC1);

What about Send Status Command Block Counter (CBC) bits 19:16 ?

>  }
>  
>  static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> @@ -2803,6 +2846,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  		/* cqhci 16bit length */
>  		/* 0 size, means 65536 so we don't have to -1 here */
>  		mmc->max_seg_size = 64 * 1024;
> +		/* Reduce CIT to 0x40 that corresponds to 2.35us */
> +		msdc_cqe_cit_cal(host, 2350);
>  	}
>  
>  	ret = devm_request_irq(&pdev->dev, host->irq, msdc_irq,


