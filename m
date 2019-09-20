From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 4/4] mt76: mt7615: sync with mt7603 rate control changes
Date: Fri, 20 Sep 2019 18:44:31 -0500
Message-ID: <ee49c064-1ea6-8262-7672-b91d1a9a037e@embeddedor.com>
References: <20190704155324.56693-1-nbd@nbd.name>
 <20190704155324.56693-4-nbd@nbd.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704155324.56693-4-nbd@nbd.name>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, Networking <netdev@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

On 7/4/19 10:53, Felix Fietkau wrote:
[..]
> +	for (i = 0, idx = first_idx; count && idx <= last_idx; idx++) {
> +		struct ieee80211_tx_rate *cur_rate;
> +		int cur_count;
>  
> -		info->status.rates[i].count = cur_count;
> -		final_idx = i;
> +		cur_rate = &rs->rates[idx / 2];
> +		cur_count = min_t(int, MT7615_RATE_RETRY, count);
>  		count -= cur_count;
> +
> +		if (idx && (cur_rate->idx != info->status.rates[i].idx ||
> +			    cur_rate->flags != info->status.rates[i].flags)) {
> +			i++;
> +			if (i == ARRAY_SIZE(info->status.rates))

Is this actually possible  ^^^^^^^ ?? in case it is, see my comments below...

> +				break;
> +
> +			info->status.rates[i] = *cur_rate;
> +			info->status.rates[i].count = 0;
> +		}
> +
> +		info->status.rates[i].count += cur_count;
>  	}
>  
>  out:
> -	final_rate_flags = info->status.rates[final_idx].flags;
> +	final_rate_flags = info->status.rates[i].flags;

There is an out-of-bounds access here........^^^ and see below...

>  
>  	switch (FIELD_GET(MT_TX_RATE_MODE, final_rate)) {
>  	case MT_PHY_TYPE_CCK:
> @@ -713,8 +778,8 @@ static bool mt7615_fill_txs(struct mt7615_dev *dev, struct mt7615_sta *sta,
>  		return false;
>  	}
>  
> -	info->status.rates[final_idx].idx = final_rate;
> -	info->status.rates[final_idx].flags = final_rate_flags;
> +	info->status.rates[i].idx = final_rate;
> +	info->status.rates[i].flags = final_rate_flags;

here too ............... ^^^^

>  
>  	return true;
>  }

--
Gustavo
