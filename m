Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386A4C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgZEp0UD9JIKHXFKlxz0fwiDdGR2QlB1FWEwO6CbLeI=; b=XFzLfMHKBXAtXCVmv5d+vbWWlA
	5RL71PTWNh9nQrcyc8GSQXo8cNVwU+NMXus89N9YmCb4wyKUaZGL3IBATQ2HYR3ii5v6x6irCdVIY
	F4f1w3uWkMJ7FVpXmr4rceXDdwd/eLNpXM1BblfCHzSAsWxL3K0CcqwUMp1+cT9dqZ5+Z22xfcXf2
	802qKqu3Tbf0BzS+B3nCbnTnxRelmwYc0fQgQmgwn5KY82l8bmoxD4UBt93ZBVaKdfeQK+bragEHG
	ftRD6Ser8x/8b5ck33u6lA/9obSifM22t9O0zlaodU0j3PNG2VNZdq0OiHXzf0rfM5c5PgoBmOdj7
	CmklRruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pav-00EriU-8Z; Wed, 07 Dec 2022 08:15:57 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2pas-00Erdg-9g
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 08:15:56 +0000
Received: from [192.168.0.203] ([151.127.53.97]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJVU0-1pMYKa1hhw-00JoZC; Wed, 07 Dec 2022 09:15:40 +0100
Message-ID: <8e8cfe60-c040-bf02-665b-a980852864aa@green-communications.fr>
Date: Wed, 7 Dec 2022 09:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/3] wifi: mt76: mt7915: rework
 mt7915_thermal_set_cur_throttle_state()
To: Howard Hsu <howard-yh.hsu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
 <20221207052500.10855-2-howard-yh.hsu@mediatek.com>
Content-Language: fr, en-US
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
In-Reply-To: <20221207052500.10855-2-howard-yh.hsu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FpWw88GeqX3jW6EjsKRsQ73rCjXuWJGpYRlKHXjjjCHzaZj9tKl
 EuBXx162xQHqn3voRUIYTkbZ+6b0nmSXBG+1St3QklfsLLYlNaoDuwPPdY6dexSqAMMj22R
 uetPcijNsuDN1dZ1iKDxDwofFu/0EpqD3RBN5bDQwDXbJFxTvXtE1t3IsQ/cG+0XLUcg+nl
 A0xitxqqXFGFrahNdRfTQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AIrAURp8oE8=:ILMB5225nDfqxkLO62IAZV
 6qiwG3ZGy/hKS6pYnW6InsejwiX1RwWUiG3UFpWdza3t5VefnXfC8VF/ffkHfqJceD5yybrIB
 jhOmSXRuY5w/SQg3CjmNcQ7zfxCJKs7k3lq5TzwIgCYTIl8+KLnS+h77dkIOdu8nI7yRAiCZa
 pRbyg+C6pKxdwLNnKvIbuHNPbySwIyihxQRvU0UI7Fr3sdg5X1jgLFZpkLcAL4H1E97hr2jGJ
 D1GuWcImU/Bcy0stSGzqisnz/TaXMYwYeh7Owj6ETjgQErNzATAlWQzzU+IlpH1OwZP/HVTkY
 Wfg3ZABJ2QRs0q8s+pIrLac5+LTstInQNJoGVLmEd7VWT1u6IvxFO9Mm1qIZwQebANnCRxKMs
 0Vi4kdJHLR8y9qiVvN0nqdc69+DSTW7y33aFRZd9RXHfP6tiFPKLkQCPxMFfFzpeqvaRR44wE
 kqM9rcoRHH0LhaZ3rDXjrAiJuu6IXUbYZy9PIBKVmnLEfMn4zkjSIf68w86uegfeodPRpNrce
 4K9HJh+LsJT+c4aMBAC+dKe+xSEkLIsE59aLIj2hLU6nYp9QU7UErNrSfhttylkA6/bxmgS0l
 4hwVVyyyI5gsA/pa/WfCCHsjSfC2JtybYWpl4CAgNNbm0EduvWv6LtMZUBxfPSH0PrUpVVqPI
 IL7iJSdyReNWQKF5m0X59CAVeAZkQ0wVBbF9h2kY1xf0xy+3508VrOouiiGF1FEUP9KqbxiZa
 qMVQsy1PIAFTTpoWgRkKMCdDpQminrit3mGzogbdFSDVaBT9wE0A40uI0U80DXpXBtjlpsk1K
 Owg1zttKDcUTEucXTogPfgRrBnt4ReiTxXyFy5H/YNR/NZW65o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_001554_676731_843D6F13 
X-CRM114-Status: GOOD (  23.00  )
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

On 07/12/2022 06:24, Howard Hsu wrote:
> This patch includes 3 changes:
> 1. The maximum throttle state can be set to 100 to fix the problem that
> thermal_protect_disable can never be triggered.

You are modifying the cooling_device part.  The cooling_device is 
explicitly configured to have a max state of MT7915_CDEV_THROTTLE_MAX 
(=99), so the thermal subsystem will probably prevent 
mt7915_thermal_set_cur_throttle_state from being called with a higher 
value.  It will also probably complain if get_cur_state starts returning 
values above MT7915_CDEV_THROTTLE_MAX.

And, as the comment below indicates, the thermal subsystem expect that a 
higher state provide more cooling.  So if 99 means "maximum cooling", 
100 cannot mean "disable cooling".

Also, last time I tried, thermal_protect_disable didn't work; It didn't 
disable anything, the previous thermal throttle kept being applied. 
Maybe a new firmware fixed this, but the kernel cannot simply expect the 
firmware to be up to date.

> 2. Throttle state do not need to be different from the previous state.
> This will make it is impossible for users to just change the
> trigger/restore temp but not the throttle state.

The throttle state is mostly set by the kernel's thermal governor and 
the user has only very little control over it.  The thermal governor 
runs every X seconds and will change the state if it thinks it is too 
low or too high.

The default step_wise governor will aggressively set it to zero if the 
system isn't overheating, for example.

> 3. Add dev_err so that it is easier to see invalid setting while looking at dmesg.
> 
> Fixes: 771cd8d4c369 ("mt76: mt7915e: Fix degraded performance after temporary overheat")
> Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
> ---
>   .../net/wireless/mediatek/mt76/mt7915/init.c   | 18 ++++++++++--------
>   1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> index c810c31fbd6e..abeecf15f1c8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
> @@ -131,14 +131,17 @@ mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
>   	u8 throttling = MT7915_THERMAL_THROTTLE_MAX - state;
>   	int ret;
>   
> -	if (state > MT7915_CDEV_THROTTLE_MAX)
> +	if (state > MT7915_THERMAL_THROTTLE_MAX) {
> +		dev_err(phy->dev->mt76.dev,
> +			"please specify a valid throttling state\n");
>   		return -EINVAL;
> +	}
>   
> -	if (phy->throttle_temp[0] > phy->throttle_temp[1])
> -		return 0;
> -
> -	if (state == phy->cdev_state)
> -		return 0;
> +	if (phy->throttle_temp[0] > phy->throttle_temp[1]) {
> +		dev_err(phy->dev->mt76.dev,
> +			"temp1_crit shall not be greater than temp1_max\n");
> +		return -EINVAL;
> +	}
>   
>   	/*
>   	 * cooling_device convention: 0 = no cooling, more = more cooling
            ^^^^^^^^^^^^^^^^^^^^^^^^^


