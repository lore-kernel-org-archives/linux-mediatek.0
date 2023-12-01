Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC20C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lzED5lkZWH1Yj8mNlpd4hICLD6BhCk4HRIgTOfLI/rg=; b=pR6Q0K9ReI+WbHMeK8xWM/SbgY
	tz7OCdGw8BFoBdKFbjnpl3yO9kWGYTixavWBt1lrg84jFZ2nddtctsMq4w8YbrDYiZ0PuJGoA6Jyd
	+hTc5N3Z4WsE0YKZ+GXeGWGNkfKutOdbF9GhCr6o+7ORktLfFdDCffD/M/heKcAj3dDkrphS2MuXX
	bz+OoOvVHPp2G5E1dp/zL2qBHwYH90M+vZ/tWaMCslTsyIBddF3Grz5mYM7uc0FK2vLyjPHAA2x8Y
	6wOQ4c7+no99XW1GEhzv9dKy5IlbJrnSEg6oxKb0OLRhAA5QMfB8Os7uwO+pyoezzWYLr3IJpGtch
	EsnAB0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zPf-00D2pR-2c;
	Fri, 01 Dec 2023 09:02:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zPc-00D2ml-0c;
	Fri, 01 Dec 2023 09:02:18 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4EDF86607345;
	Fri,  1 Dec 2023 09:02:08 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701421329;
	bh=v3TKNhkObv/XTs6yCL7Y5rVi3TK/5jW37OhK7QsoYVA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=coBtj8fgmcT8xc5CRpI4YtoFx4rRznFIIzUlh5q3upyGvJDmL4/r+5s1XVKHkR4M3
	 snqu8XICNT7Yv/003pIzINB8+gQ4RQpuGH5Rw07Ky78Sq1AUjYkFe/kJWehoBg4Z4G
	 3kUSOb7SZFvco59EKorP1M3c5hFBPW5RrgAC7UYs6lVgZKBRwKDY8Z4ZMrVA8IcsmI
	 Aqmmmm+rXMFwAI2Y7t2Da8OB/3sbqa0wne9Qf2vZA2Qy8MeQIY0/p1BVl3/S5RAoHU
	 THVeqJNGnC0p79bxurikBf03XgqoZ3sqra82UTpq2kUzRpJ/+sK/nFP3VXMPnCx4+y
	 6CAQr+ECNCamw==
Message-ID: <27313484-10a9-4a2f-93b1-9b5ce04ad9c6@collabora.com>
Date: Fri, 1 Dec 2023 10:02:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mmc: mediatek: extend number of tuning steps
To: Axe Yang <axe.yang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231130061513.1296-1-axe.yang@mediatek.com>
 <20231130061513.1296-3-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231130061513.1296-3-axe.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_010216_485381_DDF3D475 
X-CRM114-Status: GOOD (  36.67  )
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

Il 30/11/23 07:15, Axe Yang ha scritto:
> Previously, during the MSDC calibration process, a full clock cycle
> actually not be covered, which in some cases didn't yield the best
> results and could cause CRC errors. This problem is particularly
> evident when MSDC is used as an SDIO host. In fact, MSDC support
> tuning up to a maximum of 64 steps, but by default, the step number
> is 32. By increase the tuning step, we are more likely to cover more
> parts of a clock cycle, and get better calibration result.
> 
> To illustrate, when tuning 32 steps, if the obtained window has a hole
> near the middle, like this: 0xffc07ff (hex), then the selected delay
> will be the 6 (counting from right to left).
> 
> (32 <- 1)
> 1111 1111 1100 0000 0000 0111 11(1)1 1111
> 
> However, if we tune 64 steps, the window obtained may look like this:
> 0xfffffffffffc07ff. The final selected delay will be 44, which is
> safer as it is further away from the hole:
> 
> (64 <- 1)
> 1111 ... (1)111 1111 1111 1111 1111 1100 0000 0000 0111 1111 1111
> 
> In this case, delay 6 selected through 32 steps tuning is obviously
> not optimal, and this delay is closer to the hole, using it would
> easily cause CRC problems.
> 
> You will need to configure property "mediatek,tuning-step" in MSDC
> dts node to 64 to extend the steps.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 155 ++++++++++++++++++++++++++------------
>   1 file changed, 107 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 97f7c3d4be6e..4cd306b3b295 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -252,12 +252,16 @@
>   
>   #define MSDC_PAD_TUNE_DATWRDLY	  GENMASK(4, 0)		/* RW */
>   #define MSDC_PAD_TUNE_DATRRDLY	  GENMASK(12, 8)	/* RW */
> +#define MSDC_PAD_TUNE_DATRRDLY2	  GENMASK(12, 8)	/* RW */
>   #define MSDC_PAD_TUNE_CMDRDLY	  GENMASK(20, 16)	/* RW */
> +#define MSDC_PAD_TUNE_CMDRDLY2	  GENMASK(20, 16)	/* RW */
>   #define MSDC_PAD_TUNE_CMDRRDLY	  GENMASK(26, 22)	/* RW */
>   #define MSDC_PAD_TUNE_CLKTDLY	  GENMASK(31, 27)	/* RW */
>   #define MSDC_PAD_TUNE_RXDLYSEL	  BIT(15)   /* RW */
>   #define MSDC_PAD_TUNE_RD_SEL	  BIT(13)   /* RW */
>   #define MSDC_PAD_TUNE_CMD_SEL	  BIT(21)   /* RW */
> +#define MSDC_PAD_TUNE_RD2_SEL	  BIT(13)   /* RW */
> +#define MSDC_PAD_TUNE_CMD2_SEL	  BIT(21)   /* RW */
>   
>   #define PAD_DS_TUNE_DLY_SEL       BIT(0)	  /* RW */
>   #define PAD_DS_TUNE_DLY1	  GENMASK(6, 2)   /* RW */
> @@ -325,7 +329,8 @@
>   
>   #define DEFAULT_DEBOUNCE	(8)	/* 8 cycles CD debounce */
>   
> -#define PAD_DELAY_MAX	32 /* PAD delay cells */
> +#define PAD_DELAY_HALF	32 /* PAD delay cells */
> +#define PAD_DELAY_FULL	64
>   /*--------------------------------------------------------------------------*/
>   /* Descriptor Structure                                                     */
>   /*--------------------------------------------------------------------------*/
> @@ -461,6 +466,7 @@ struct msdc_host {
>   	u32 hs400_ds_dly3;
>   	u32 hs200_cmd_int_delay; /* cmd internal delay for HS200/SDR104 */
>   	u32 hs400_cmd_int_delay; /* cmd internal delay for HS400 */
> +	u32 tuning_step;
>   	bool hs400_cmd_resp_sel_rising;
>   				 /* cmd response sample selection for HS400 */
>   	bool hs400_mode;	/* current eMMC will run at hs400 mode */
> @@ -1615,7 +1621,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
>   	}
>   
>   	if (cmd_err || dat_err) {
> -		dev_err(host->dev, "cmd_err = %d, dat_err =%d, intsts = 0x%x",
> +		dev_err(host->dev, "cmd_err = %d, dat_err = %d, intsts = 0x%x",
>   			cmd_err, dat_err, intsts);
>   	}
>   
> @@ -1780,10 +1786,20 @@ static void msdc_init_hw(struct msdc_host *host)
>   				     DATA_K_VALUE_SEL);
>   			sdr_set_bits(host->top_base + EMMC_TOP_CMD,
>   				     PAD_CMD_RD_RXDLY_SEL);
> +			if (host->tuning_step > PAD_DELAY_HALF) {
> +				sdr_set_bits(host->top_base + EMMC_TOP_CONTROL,
> +					     PAD_DAT_RD_RXDLY2_SEL);
> +				sdr_set_bits(host->top_base + EMMC_TOP_CMD,
> +					     PAD_CMD_RD_RXDLY2_SEL);
> +			}
>   		} else {
>   			sdr_set_bits(host->base + tune_reg,
>   				     MSDC_PAD_TUNE_RD_SEL |
>   				     MSDC_PAD_TUNE_CMD_SEL);
> +			if (host->tuning_step > PAD_DELAY_HALF)
> +				sdr_set_bits(host->base + tune_reg + 4,

`tune_reg + 4` is a different register, please define it.

Also, I can't find this in MT8192, MT8195 - as those bits seem to be undefined,
so, which SoCs are actually compatible with this change?


> +					     MSDC_PAD_TUNE_RD2_SEL |
> +					     MSDC_PAD_TUNE_CMD2_SEL);
>   		}
>   	} else {
>   		/* choose clock tune */
> @@ -1925,24 +1941,24 @@ static void msdc_ops_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>   		msdc_set_mclk(host, ios->timing, ios->clock);
>   }
>   
> -static u32 test_delay_bit(u32 delay, u32 bit)
> +static u64 test_delay_bit(u64 delay, u32 bit)
>   {
> -	bit %= PAD_DELAY_MAX;
> -	return delay & BIT(bit);
> +	bit %= PAD_DELAY_FULL;
> +	return delay & BIT_ULL(bit);
>   }
>   
> -static int get_delay_len(u32 delay, u32 start_bit)
> +static int get_delay_len(u64 delay, u32 start_bit)
>   {
>   	int i;
>   
> -	for (i = 0; i < (PAD_DELAY_MAX - start_bit); i++) {
> +	for (i = 0; i < (PAD_DELAY_FULL - start_bit); i++) {
>   		if (test_delay_bit(delay, start_bit + i) == 0)
>   			return i;
>   	}
> -	return PAD_DELAY_MAX - start_bit;
> +	return PAD_DELAY_FULL - start_bit;
>   }
>   
> -static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
> +static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u64 delay)
>   {
>   	int start = 0, len = 0;
>   	int start_final = 0, len_final = 0;
> @@ -1950,28 +1966,28 @@ static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
>   	struct msdc_delay_phase delay_phase = { 0, };
>   
>   	if (delay == 0) {
> -		dev_err(host->dev, "phase error: [map:%x]\n", delay);
> +		dev_err(host->dev, "phase error: [map:%016llx]\n", delay);
>   		delay_phase.final_phase = final_phase;
>   		return delay_phase;
>   	}
>   
> -	while (start < PAD_DELAY_MAX) {
> +	while (start < PAD_DELAY_FULL) {
>   		len = get_delay_len(delay, start);
>   		if (len_final < len) {
>   			start_final = start;
>   			len_final = len;
>   		}
>   		start += len ? len : 1;
> -		if (len >= 12 && start_final < 4)
> +		if (!upper_32_bits(delay) && len >= 12 && start_final < 4)
>   			break;
>   	}
>   
>   	/* The rule is that to find the smallest delay cell */
>   	if (start_final == 0)
> -		final_phase = (start_final + len_final / 3) % PAD_DELAY_MAX;
> +		final_phase = (start_final + len_final / 3) % PAD_DELAY_FULL;
>   	else
> -		final_phase = (start_final + len_final / 2) % PAD_DELAY_MAX;
> -	dev_dbg(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
> +		final_phase = (start_final + len_final / 2) % PAD_DELAY_FULL;
> +	dev_dbg(host->dev, "phase: [map:%016llx] [maxlen:%d] [final:%d]\n",
>   		delay, len_final, final_phase);
>   
>   	delay_phase.maxlen = len_final;
> @@ -1984,30 +2000,68 @@ static inline void msdc_set_cmd_delay(struct msdc_host *host, u32 value)
>   {
>   	u32 tune_reg = host->dev_comp->pad_tune_reg;
>   
> -	if (host->top_base)
> -		sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY,
> -			      value);
> -	else
> -		sdr_set_field(host->base + tune_reg, MSDC_PAD_TUNE_CMDRDLY,
> -			      value);
> +	if (host->top_base) {
> +		if (value < PAD_DELAY_HALF) {
> +			sdr_set_field(host->top_base + EMMC_TOP_CMD, PAD_CMD_RXDLY,
> +				      value);

This goes up to 92 columns, and it's fine, so fits in one line and it's more
readable like that.

I know that's not your fault, but since you're actually touching those lines
it's a good occasion to also do that (not only here) :-)

Cheers,
Angelo

