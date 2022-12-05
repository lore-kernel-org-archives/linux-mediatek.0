Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D59C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 14:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqkBn9mLRtJjcnUFLzlVYAa4x6ObFLh/9tHISK5m6Q0=; b=IGM844i4F0AjE+nLBvAmHbjhh8
	O+g7zAoCpKseakhF148GCm+/wbHNV5pyg+hG7Z1DwQXLgC7eJDLh4x/jD1S6Ady4Lxi/reNhdJhTA
	IU0yoGSqv9UbCZBM1UPl6VCkdmp1l/4MVKvtuY5W2/qi1HJXfhmBFK0RaihgP7fk3aXW2QTGS9XFC
	1/fZ3tcP8eqBAvSh/WEgycXDZEdk9eHQby2s+f43ytRhKJIopaUMOESGd88+iZY81KawmfWLkOcLx
	i2WJ5vV8ioyA328Fbpz6kZogGezB/UZHTPzZeaWXRrfWmUFcfH3x/wSmynsWObm35hIiB3LfeOI/u
	c3zSe+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CSy-0044oa-Rj; Mon, 05 Dec 2022 14:29:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CSv-0044nH-Ud
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 14:29:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2377B66015ED;
	Mon,  5 Dec 2022 14:29:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250544;
	bh=ys8fhiXpp9xvHYpKrIJjEmW2LSYWaxJot+FfCB/4JBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W5yslql8CovbY2VpT4REdf9LAbzb1fPe07wid9NhrEc/2QaWSSPPRHveTjyI97Sbp
	 HWa5MJUYQROM2HltWz1UVqbITxZAcFuFTrEILseEeU5rjGwtzyiAtL0Iwlt1JVCYvC
	 iYVIO6CwNQDomCqPCIsStEOtac/mDXh3HNuWjjP23Yp4s7zQP4vQLtYRLW8XrxIXbR
	 BJkJAHeNBzJogQlSbj9lQFyY7mY6GErBOWQUrz35xVcpZQiysa1JFav3wJDK80Ih4a
	 rp64vG7mtHyEVXs3oeY9bTn1xOI0A/10t5M/pFbSR6AHdQvmk5glsiTaePv1OqMBnx
	 3asPdLkVxpu/w==
Message-ID: <efca1639-9dcd-4d72-7c43-4b7bf20db8c4@collabora.com>
Date: Mon, 5 Dec 2022 15:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] wifi: mt76: mt7915: split mcu chan_mib array up
Content-Language: en-US
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 linux-wireless@vger.kernel.org
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-mediatek@lists.infradead.org
References: <51130dcbc200962672540cb726dd9841c5ad7fe9.1670049959.git.ryder.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <51130dcbc200962672540cb726dd9841c5ad7fe9.1670049959.git.ryder.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062906_165937_CA659852 
X-CRM114-Status: GOOD (  12.75  )
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

Il 03/12/22 08:37, Ryder Lee ha scritto:
> The current flow confuses coverity check that leads to false reporting,
> so split the offs[] into two pieces according to chipset revision to
> silence coverity tool.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 50 ++++++++++---------
>   1 file changed, 27 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> index b2652de082ba..ca315af3905b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
> @@ -2974,38 +2974,42 @@ int mt7915_mcu_apply_tx_dpd(struct mt7915_phy *phy)
>   
>   int mt7915_mcu_get_chan_mib_info(struct mt7915_phy *phy, bool chan_switch)
>   {
> -	/* strict order */
> -	static const u32 offs[] = {
> -		MIB_NON_WIFI_TIME,
> -		MIB_TX_TIME,
> -		MIB_RX_TIME,
> -		MIB_OBSS_AIRTIME,
> -		MIB_TXOP_INIT_COUNT,
> -		/* v2 */
> -		MIB_NON_WIFI_TIME_V2,
> -		MIB_TX_TIME_V2,
> -		MIB_RX_TIME_V2,
> -		MIB_OBSS_AIRTIME_V2
> -	};
>   	struct mt76_channel_state *state = phy->mt76->chan_state;
>   	struct mt76_channel_state *state_ts = &phy->state_ts;
>   	struct mt7915_dev *dev = phy->dev;
>   	struct mt7915_mcu_mib *res, req[5];
>   	struct sk_buff *skb;
> -	int i, ret, start = 0, ofs = 20;
> +	static const u32 *offs;
> +	int i, ret, len, offs_cc;
>   	u64 cc_tx;
>   

A more readable option would be

	/* strict order */
	static const u32 chip_offs_v1[] = {
		MIB_NON_WIFI_TIME,
		MIB_TX_TIME,
		MIB_RX_TIME,
		MIB_OBSS_AIRTIME,
		MIB_TXOP_INIT_COUNT,
	};

	static const u32 chip_offs_v2[] = {
		MIB_NON_WIFI_TIME_V2,
		MIB_TX_TIME_V2,
		MIB_RX_TIME_V2,
		MIB_OBSS_AIRTIME_V2
	};

	if (is_mt7915(&dev->mt76)) {
		len = ARRAY_SIZE(chip_offs_v1);
		offs = chip_offs_v1;
		offs_cc = 20;
	} else {
		len = ARRAY_SIZE(chip_offs_v2);
		offs = chip_offs_v2;
		offs_cc = 20;
	}

Regards,
Angelo



