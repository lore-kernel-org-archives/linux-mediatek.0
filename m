Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C57FC83000
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 12:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299322072A
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 12:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAhrNRBd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BQ9HwHWa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 299322072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGwRFkkcSKXr1dybq+Zj2A2El1dMS+fXaF4jgoswVys=; b=LAhrNRBdTloal9
	WYSuyrXinLDzXo5l/NzwF/GzosRw3tRcaoKuf7xr1Pw7kv+I9P/qv1JcAlpdfCwM8EqBMyDYzbsgl
	oaibi300ytuflBT+R62TH5c9CqXTzmUBusADL3eEr0X9PovH7vI7ajCtgwzU4K96TQ1On741wUSn7
	IWxtvlvCTuS8HrYPCry1IUw4eK8UKXyGoh8eMa1w09GtqBYA5+M9m88liSNOTvB97pEFMf+HhO4rG
	OFLGP4LRjLcFAGvXbAAu5RgZbhs678dde19EoXBrGPrJnffzLaMQfRErsH8cKF6Os0vE5IG4a7I6a
	l35aLO9gQSMF40Xdqc/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTPN3-000403-If; Tue, 28 Apr 2020 12:29:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTPMt-0003qN-R0; Tue, 28 Apr 2020 12:29:45 +0000
X-UUID: 358b2e3429084e688c347b59f59eba32-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x82FlLAEXLzeRSBYPB5msRYu1TSUP46MR6Ng6NKD4bQ=; 
 b=BQ9HwHWaqAbYJZuEfgm6yf+6PYVc3qEbxlpdWNnil9yV1ghDnx/fKbFmvoViLddfi75e1yE9x1i4SCL83m5pGMi77fxufghyb/ohwSMgqzzgVFIAheyM8Waxs+QOmp+18Ago4lsOyA9rPdkHWIKTMF3256wmUNlhsb2EqAfJp00=;
X-UUID: 358b2e3429084e688c347b59f59eba32-20200428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 712341618; Tue, 28 Apr 2020 04:29:33 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 05:29:37 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Apr 2020 20:29:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Apr 2020 20:29:32 +0800
Message-ID: <1588076927.730.2.camel@mhfsdcap03>
Subject: Re: [PATCH v5 3/5] mmc: mediatek: refine msdc timeout api
From: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Date: Tue, 28 Apr 2020 20:28:47 +0800
In-Reply-To: <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-4-git-send-email-chun-hung.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E01AAD61AB5BB27155A77063CBEA1604E31F717DA3D8618061EF502A15332D7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_052943_881836_EB9919F1 
X-CRM114-Status: GOOD (  15.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kate
 Stewart <kstewart@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 wsd_upstream@mediatek.com, linux-mmc@vger.kernel.org, Linus
 Walleij <linus.walleij@linaro.org>, Al
 Cooper <alcooperx@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Allison Randal <allison@lohutok.net>, kernel-team@android.com,
 Pan Bian <bianpan2016@163.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, mirq-linux@rere.qmqm.pl,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Thomas
 Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-28 at 07:56 +0800, Chun-Hung Wu wrote:
> Extract msdc timeout api common part to have
> better code architecture and avoid redundent
please correct the word "redundant" in next version
> code.
> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Acked-by: Yong Mao <yong.mao@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 7726dcf..a2328fb 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -699,21 +699,21 @@ static void msdc_unprepare_data(struct msdc_host *host, struct mmc_request *mrq)
>  	}
>  }
>  
> -/* clock control primitives */
> -static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
> +static u64 msdc_timeout_cal(struct msdc_host *host, u64 ns, u64 clks)
>  {
> -	u32 timeout, clk_ns;
> +	u64 timeout, clk_ns;
>  	u32 mode = 0;
>  
> -	host->timeout_ns = ns;
> -	host->timeout_clks = clks;
>  	if (host->mmc->actual_clock == 0) {
>  		timeout = 0;
>  	} else {
> -		clk_ns  = 1000000000UL / host->mmc->actual_clock;
> -		timeout = (ns + clk_ns - 1) / clk_ns + clks;
> +		clk_ns  = 1000000000ULL;
> +		do_div(clk_ns, host->mmc->actual_clock);
> +		timeout = ns + clk_ns - 1;
> +		do_div(timeout, clk_ns);
> +		timeout += clks;
>  		/* in 1048576 sclk cycle unit */
> -		timeout = (timeout + (0x1 << 20) - 1) >> 20;
> +		timeout = DIV_ROUND_UP(timeout, (0x1 << 20));
>  		if (host->dev_comp->clk_div_bits == 8)
>  			sdr_get_field(host->base + MSDC_CFG,
>  				      MSDC_CFG_CKMOD, &mode);
> @@ -723,9 +723,21 @@ static void msdc_set_timeout(struct msdc_host *host, u32 ns, u32 clks)
>  		/*DDR mode will double the clk cycles for data timeout */
>  		timeout = mode >= 2 ? timeout * 2 : timeout;
>  		timeout = timeout > 1 ? timeout - 1 : 0;
> -		timeout = timeout > 255 ? 255 : timeout;
>  	}
> -	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC, timeout);
> +	return timeout;
> +}
> +
> +/* clock control primitives */
> +static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
> +{
> +	u64 timeout;
> +
> +	host->timeout_ns = ns;
> +	host->timeout_clks = clks;
> +
> +	timeout = msdc_timeout_cal(host, ns, clks);
> +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_DTOC,
> +		      (u32)(timeout > 255 ? 255 : timeout));
>  }
>  
>  static void msdc_gate_clock(struct msdc_host *host)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
