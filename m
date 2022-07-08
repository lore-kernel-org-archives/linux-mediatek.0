Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1371C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zqaTc4cHkMh4zBwGHpJlxaEPi3zLPbL0WjYdh5YW8b0=; b=s9XX0V2giQInr6pYsLu06odCIT
	+H1K1VwCg6oH9fnu8gxRp8d+0/IE8eA5VQRAiVJxcIn4oKIU9X5agggREDQGMfHZY4mNzN5zFwDF1
	BAEaNP/g6WyuiqZUdrZUg6+cujGNRmG+UoU26fq/zVZd12mJUKTkJ1eXVQIZB5TIPzQnIOdj+Wdoh
	VRqRrqOcYtjM7lSTYsoK5ON4pzeF7zmeB+epX5mrURkuV2Fa8OWO32ZQZ7VY8sjMa2/+sAj77U0cD
	O5ifsYk97kdh0HRtqDMDKVjmWh+wsF9gnolJ71UzF4HVQJE3FRA6AS1mnGXaE/+yFKXzYzxDtN6f9
	zd8G2ZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j8r-002RUl-Pa; Fri, 08 Jul 2022 08:15:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9j7F-002QhW-Un; Fri, 08 Jul 2022 08:13:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9740266019D1;
	Fri,  8 Jul 2022 09:13:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657268012;
	bh=HhAChS+K51bNxk2DP8DUaQ+Ar93nqS3yFt69vVEpOAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gddanjJlgH7sblqg1l5mhtUMLcnLujTx9cXAHJQt/10tGHweIpsrFhN6Ejrlh/hG9
	 qtDuSgSt3Phf/lLKcMlXPPQJt58QfRq4y82tAgGWwDEF8KxT4fooZ4OkmZcE+jvKsn
	 /Awe+K6tRYxnKH09anJIqduc0qmX/r3ykRHfIXWk/5JBZFyoFdSRO5UCr4z0dRkSC/
	 J4tVZuS6m0FY7ILMjHZqvqA1XBFOd/MqGag1zyTGT1zg1SH0In1A9wZXhdT9G0WihD
	 ATyL7xODW1vGgZastds30am/aqvaUKXmndDvNNAfgbsBvUpYwdNs+vu8ZcQDfGwL52
	 J5mMHHw2WiKqg==
Message-ID: <4ee027c3-fbfb-52dd-fa38-74dcff526bf5@collabora.com>
Date: Fri, 8 Jul 2022 10:13:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RESEND v4 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8188
Content-Language: en-US
To: kewei.xu@mediatek.com, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 leilk.liu@mediatek.com, qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
 david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220708034758.22747-1-kewei.xu@mediatek.com>
 <20220708034758.22747-2-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220708034758.22747-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_011334_235125_6710B0A3 
X-CRM114-Status: GOOD (  14.15  )
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

Il 08/07/22 05:47, kewei.xu@mediatek.com ha scritto:
> From: Kewei Xu <kewei.xu@mediatek.com>
> 
> Add i2c compatible for MT8188. Compare to MT8192 i2c controller,
> The MT8188 i2c OFFSET_SLAVE_ADDR register changed from 0x04 to 0x94.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
> v4: no changes
> V3: no changes
> V2: added mt_i2c_regs_v3[] to replace slave_addr_version.
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 43 +++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 8e6985354fd5..70aff42adf5d 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -229,6 +229,35 @@ static const u16 mt_i2c_regs_v2[] = {
>   	[OFFSET_DCM_EN] = 0xf88,
>   };
>   
> +static const u16 mt_i2c_regs_v3[] = {
> +	[OFFSET_DATA_PORT] = 0x0,

> +	[OFFSET_SLAVE_ADDR] = 0x94,

Please keep this list ordered by register offset.

> +	[OFFSET_INTR_MASK] = 0x8,
> +	[OFFSET_INTR_STAT] = 0xc,
> +	[OFFSET_CONTROL] = 0x10,
> +	[OFFSET_TRANSFER_LEN] = 0x14,
> +	[OFFSET_TRANSAC_LEN] = 0x18,
> +	[OFFSET_DELAY_LEN] = 0x1c,
> +	[OFFSET_TIMING] = 0x20,
> +	[OFFSET_START] = 0x24,
> +	[OFFSET_EXT_CONF] = 0x28,
> +	[OFFSET_LTIMING] = 0x2c,
> +	[OFFSET_HS] = 0x30,
> +	[OFFSET_IO_CONFIG] = 0x34,
> +	[OFFSET_FIFO_ADDR_CLR] = 0x38,
> +	[OFFSET_SDA_TIMING] = 0x3c,
> +	[OFFSET_TRANSFER_LEN_AUX] = 0x44,
> +	[OFFSET_CLOCK_DIV] = 0x48,
> +	[OFFSET_SOFTRESET] = 0x50,
> +	[OFFSET_MULTI_DMA] = 0x8c,
> +	[OFFSET_SCL_MIS_COMP_POINT] = 0x90,

[OFFSET_SLAVE_ADDR] = 0x94   goes here,

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


