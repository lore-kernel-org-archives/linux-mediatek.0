From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH v1 5/6] mt76: fix some checkpatch warnings
Date: Tue, 20 Aug 2019 14:29:51 +0200
Message-ID: <29c75c5f-6e75-3de4-4e4a-a66f72844733@nbd.name>
References: <cover.1563944758.git.ryder.lee@mediatek.com>
 <0afa87cc70b34ee17d6c2247dfc8dac92c36852f.1563944758.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0afa87cc70b34ee17d6c2247dfc8dac92c36852f.1563944758.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-07-24 10:58, Ryder Lee wrote:
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -537,25 +537,25 @@ struct mt76_rx_status {
>  	s8 chain_signal[IEEE80211_MAX_CHAINS];
>  };
>  
> -#define __mt76_rr(dev, ...)	(dev)->bus->rr((dev), __VA_ARGS__)
> -#define __mt76_wr(dev, ...)	(dev)->bus->wr((dev), __VA_ARGS__)
> -#define __mt76_rmw(dev, ...)	(dev)->bus->rmw((dev), __VA_ARGS__)
> -#define __mt76_wr_copy(dev, ...)	(dev)->bus->copy((dev), __VA_ARGS__)
> +#define __mt76_rr(dev, ...)	((dev)->bus->rr((dev), __VA_ARGS__))
> +#define __mt76_wr(dev, ...)	((dev)->bus->wr((dev), __VA_ARGS__))
> +#define __mt76_rmw(dev, ...)	((dev)->bus->rmw((dev), __VA_ARGS__))
> +#define __mt76_wr_copy(dev, ...)	((dev)->bus->copy((dev), __VA_ARGS__))
>  
>  #define __mt76_set(dev, offset, val)	__mt76_rmw(dev, offset, 0, val)
>  #define __mt76_clear(dev, offset, val)	__mt76_rmw(dev, offset, val, 0)
>  
> -#define mt76_rr(dev, ...)	(dev)->mt76.bus->rr(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_wr(dev, ...)	(dev)->mt76.bus->wr(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_rmw(dev, ...)	(dev)->mt76.bus->rmw(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_wr_copy(dev, ...)	(dev)->mt76.bus->copy(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_wr_rp(dev, ...)	(dev)->mt76.bus->wr_rp(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_rd_rp(dev, ...)	(dev)->mt76.bus->rd_rp(&((dev)->mt76), __VA_ARGS__)
> +#define mt76_rr(dev, ...)	((dev)->mt76.bus->rr(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_wr(dev, ...)	((dev)->mt76.bus->wr(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_rmw(dev, ...)	((dev)->mt76.bus->rmw(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_wr_copy(dev, ...)	((dev)->mt76.bus->copy(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_wr_rp(dev, ...)	((dev)->mt76.bus->wr_rp(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_rd_rp(dev, ...)	((dev)->mt76.bus->rd_rp(&((dev)->mt76), __VA_ARGS__))
>  
> -#define mt76_mcu_send_msg(dev, ...)	(dev)->mt76.mcu_ops->mcu_send_msg(&((dev)->mt76), __VA_ARGS__)
> -#define __mt76_mcu_send_msg(dev, ...)	(dev)->mcu_ops->mcu_send_msg((dev), __VA_ARGS__)
> -#define mt76_mcu_restart(dev, ...)	(dev)->mt76.mcu_ops->mcu_restart(&((dev)->mt76))
> -#define __mt76_mcu_restart(dev, ...)	(dev)->mcu_ops->mcu_restart((dev))
> +#define mt76_mcu_send_msg(dev, ...)	((dev)->mt76.mcu_ops->mcu_send_msg(&((dev)->mt76), __VA_ARGS__))
> +#define __mt76_mcu_send_msg(dev, ...)	((dev)->mcu_ops->mcu_send_msg((dev), __VA_ARGS__))
> +#define mt76_mcu_restart(dev, ...)	((dev)->mt76.mcu_ops->mcu_restart(&((dev)->mt76)))
> +#define __mt76_mcu_restart(dev, ...)	((dev)->mcu_ops->mcu_restart((dev)))
>  
>  #define mt76_set(dev, offset, val)	mt76_rmw(dev, offset, 0, val)
>  #define mt76_clear(dev, offset, val)	mt76_rmw(dev, offset, val, 0)
> @@ -569,7 +569,7 @@ struct mt76_rx_status {
>  #define __mt76_rmw_field(_dev, _reg, _field, _val)	\
>  	__mt76_rmw(_dev, _reg, _field, FIELD_PREP(_field, _val))
>  
> -#define mt76_hw(dev) (dev)->mt76.hw
> +#define mt76_hw(dev) ((dev)->mt76.hw)
>  
>  bool __mt76_poll(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
>  		 int timeout);
> @@ -596,13 +596,13 @@ static inline u16 mt76_rev(struct mt76_dev *dev)
>  #define mt76xx_chip(dev) mt76_chip(&((dev)->mt76))
>  #define mt76xx_rev(dev) mt76_rev(&((dev)->mt76))
>  
> -#define mt76_init_queues(dev)		(dev)->mt76.queue_ops->init(&((dev)->mt76))
> -#define mt76_queue_alloc(dev, ...)	(dev)->mt76.queue_ops->alloc(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_tx_queue_skb_raw(dev, ...)	(dev)->mt76.queue_ops->tx_queue_skb_raw(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_tx_queue_skb(dev, ...)	(dev)->mt76.queue_ops->tx_queue_skb(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_queue_rx_reset(dev, ...)	(dev)->mt76.queue_ops->rx_reset(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_queue_tx_cleanup(dev, ...)	(dev)->mt76.queue_ops->tx_cleanup(&((dev)->mt76), __VA_ARGS__)
> -#define mt76_queue_kick(dev, ...)	(dev)->mt76.queue_ops->kick(&((dev)->mt76), __VA_ARGS__)
> +#define mt76_init_queues(dev)		((dev)->mt76.queue_ops->init(&((dev)->mt76)))
> +#define mt76_queue_alloc(dev, ...)	((dev)->mt76.queue_ops->alloc(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_tx_queue_skb_raw(dev, ...)	((dev)->mt76.queue_ops->tx_queue_skb_raw(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_tx_queue_skb(dev, ...)	((dev)->mt76.queue_ops->tx_queue_skb(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_queue_rx_reset(dev, ...)	((dev)->mt76.queue_ops->rx_reset(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_queue_tx_cleanup(dev, ...)	((dev)->mt76.queue_ops->tx_cleanup(&((dev)->mt76), __VA_ARGS__))
> +#define mt76_queue_kick(dev, ...)	((dev)->mt76.queue_ops->kick(&((dev)->mt76), __VA_ARGS__))
>  
>  static inline struct mt76_channel_state *
>  mt76_channel_state(struct mt76_dev *dev, struct ieee80211_channel *c)

I don't think these changes are making the code any better. The
corresponding checkpatch warnings might be a false positive.

- Felix
