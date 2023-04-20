Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F35C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM07e3e7GdDJiXtezpLLzAV0JeHZZG0Sq2EBQ1a/EB8=; b=obyJc6ktdBmWFOOTNKHfCeqZ54
	LpknzB0Z+Xsy0ngPi2jSaS9BvigSG675HVEeqmq5QuRwraacy23T2MAwY850f5R0SfsWL99WcBykD
	kSR+HhzPE49Tdf+Mb5Brbjt8o0CV8F9kY/l8XGnOCZrbTslCGg8x8ZrNfLaXMFDGuqy/O2Z3C80bH
	1Mk+fEUQY+WYTxmE9r3/wwGMw9CSe0HTPa1VO2Ga2rYfjH7GsvZFbKR+9syI1CWMCI2ey2NSMxu+0
	MI1Zqz2zffTzpe3dYHmWF1AaZVQTPVXsCOIR+5ngljR652IVyDqJFIyxrq9wv8YPWalRiGYfJRniY
	Ban1WdwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppP15-007JQt-1f;
	Thu, 20 Apr 2023 07:47:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppP11-007JPS-2Z;
	Thu, 20 Apr 2023 07:47:41 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79CDB660311B;
	Thu, 20 Apr 2023 08:47:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681976856;
	bh=hPK316bstXNH8p7DHglZxidzS9fL7HRmhwrYeluTQRs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nWirLOMqNNjiBKaIlQu8K/5JxwriH+zMIAj/4STn4R0oq4L3+k/NyjUaRatSg3jtB
	 4yrYu63RHD/sl1OYywd3nXn/ft6cQSQnM1vFAdLGmIl1yvQiqCnLlxahNpDIoNPeyi
	 tpxNdSBVvct1VgwgzeMtPp4Z79ftiqozj4n/CBnx3I3bEjfIYlptMLzYSRupBrqIKB
	 ufNjBCscrcqV6M4MQge6WHOxGi3CbAHg2Ip1LT2iZy+zURk7C2qS4GGwAoCVjItkNu
	 nFi08P2F1YimlsNZQ+2aaC1zlngKDnmIcWlW616VscHNYjPFIycU07FYgJyQhScqW7
	 6+TVr9CXT6f2g==
Message-ID: <b0819ff8-8fba-4464-9a62-be56d4bfa4cd@collabora.com>
Date: Thu, 20 Apr 2023 09:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] pwm: mediatek: Add support for MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pwm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>
References: <cover.1681932165.git.daniel@makrotopia.org>
 <e22d8e66558f094b544aa208c722a7f88fd0bde1.1681932165.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e22d8e66558f094b544aa208c722a7f88fd0bde1.1681932165.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_004739_980298_3EA325B1 
X-CRM114-Status: GOOD (  22.29  )
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

Il 19/04/23 21:25, Daniel Golle ha scritto:
> The PWM unit on MT7981 uses different register offsets than previous
> MediaTek PWM units. Add support for these new offsets and add support
> for PWM on MT7981 which has 3 PWM channels, one of them is typically
> used for a temperature controlled fan.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   drivers/pwm/pwm-mediatek.c | 54 ++++++++++++++++++++++++++++++++------
>   1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 5b5eeaff35da6..2bfb5bedf570b 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -34,10 +34,14 @@
>   
>   #define PWM_CLK_DIV_MAX		7
>   
> +#define REG_V1			1
> +#define REG_V2			2
> +
>   struct pwm_mediatek_of_data {
>   	unsigned int num_pwms;
>   	bool pwm45_fixup;
>   	bool has_ck_26m_sel;
> +	u8 reg_ver;

You're overcomplicating this one... checking for a register version and then
deciding at every pwm_mediatek_writel() call what to use...

It's way simpler than that!
Pass a pointer to the register array in pwm_mediatek_of_data and then...

>   };
>   
>   /**
> @@ -59,10 +63,14 @@ struct pwm_mediatek_chip {
>   	const struct pwm_mediatek_of_data *soc;
>   };
>   
> -static const unsigned int pwm_mediatek_reg_offset[] = {
> +static const unsigned int mtk_pwm_reg_offset_v1[] = {
>   	0x0010, 0x0050, 0x0090, 0x00d0, 0x0110, 0x0150, 0x0190, 0x0220
>   };
>   
> +static const unsigned int mtk_pwm_reg_offset_v2[] = {
> +	0x0080, 0x00c0, 0x0100, 0x0140, 0x0180, 0x1c0, 0x200, 0x0240
> +};
> +
>   static inline struct pwm_mediatek_chip *
>   to_pwm_mediatek_chip(struct pwm_chip *chip)
>   {
> @@ -111,7 +119,19 @@ static inline void pwm_mediatek_writel(struct pwm_mediatek_chip *chip,
>   				       unsigned int num, unsigned int offset,
>   				       u32 value)
>   {
> -	writel(value, chip->regs + pwm_mediatek_reg_offset[num] + offset);

...this simply becomes:

writel(value, chip->regs + chip->reg_offset[num] + offset);

> +	u32 pwm_offset;
> +
> +	switch (chip->soc->reg_ver) {
> +	case REG_V2:
> +		pwm_offset = mtk_pwm_reg_offset_v2[num];
> +		break;
> +
> +	case REG_V1:
> +	default:
> +		pwm_offset = mtk_pwm_reg_offset_v1[num];
> +	}
> +
> +	writel(value, chip->regs + pwm_offset + offset);
>   }
>   
>   static int pwm_mediatek_config(struct pwm_chip *chip, struct pwm_device *pwm,
> @@ -285,60 +305,77 @@ static const struct pwm_mediatek_of_data mt2712_pwm_data = {
>   	.num_pwms = 8,
>   	.pwm45_fixup = false,
>   	.has_ck_26m_sel = false,
> +	.reg_ver = REG_V1,

...so instead of assigning that, you'd be assigning

	.reg_offset = mtk_pwm_reg_offset_v1;

Better, right? :-)

Cheers,
Angelo




