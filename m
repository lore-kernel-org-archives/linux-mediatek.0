From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v1 5/6] mt76: fix some checkpatch warnings
Date: Wed, 24 Jul 2019 04:03:46 -0700
Message-ID: <54692f19e845a74650c1d24cbe7b79c5dad7b061.camel@perches.com>
References: <cover.1563944758.git.ryder.lee@mediatek.com>
         <0afa87cc70b34ee17d6c2247dfc8dac92c36852f.1563944758.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0afa87cc70b34ee17d6c2247dfc8dac92c36852f.1563944758.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-24 at 16:58 +0800, Ryder Lee wrote:
> This fixes the following checkpatch warnings:
[]
> diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
[]
> @@ -74,15 +75,14 @@ mt76_rx_aggr_check_release(struct mt76_rx_tid *tid, struct sk_buff_head *frames)
>  	for (idx = (tid->head + 1) % tid->size;
>  	     idx != start && nframes;
>  	     idx = (idx + 1) % tid->size) {
> -
>  		skb = tid->reorder_buf[idx];
>  		if (!skb)
>  			continue;
>  
>  		nframes--;
> -		status = (struct mt76_rx_status *) skb->cb;
> +		status = (struct mt76_rx_status *)skb->cb;
>  		if (!time_after(jiffies, status->reorder_time +
> -					 REORDER_TIMEOUT))
> +				REORDER_TIMEOUT))

trivia/bikeshedding:  perhaps better slightly differently:

 		if (!time_after(jiffies,
				status->reorder_time + REORDER_TIMEOUT))
