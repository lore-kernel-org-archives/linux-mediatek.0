From: Sebastian Gottschall <s.gottschall-9LViYcISHtuk6R/r8kmGfQ@public.gmane.org>
Subject: Re: [PATCH] mt76: mt7615: add support for per-chain signal strength
 reporting
Date: Sun, 9 Jun 2019 16:44:09 +0200
Message-ID: <d6cfd2e9-4b2b-36ac-6cae-a34f74204801@newmedia-net.de>
References: <3912a2863e858f3623ced61737836e42c7b19149.1560071167.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3912a2863e858f3623ced61737836e42c7b19149.1560071167.git.ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Chih-Min Chen <chih-min.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

according to my findings

MT_RXV4_RCPI1 is part of rx descriptor 4 and not 3
so it must be rxdg4 = rxd[4] etc.
however rxdg3 contains MT_RXV3_IB_RSSIRX which can be used for signal calculation.
i already wrote a similar code for this driver which i sended to felix a long time ago.

my variant looks like
                 status->signal = (FIELD_GET(MT_RXV3_IB_RSSIRX, rxdg3) - 220) / 2;
                 status->chain_signal[0] = (FIELD_GET(MT_RXV4_RCPI0, rxdg4) - 220) / 2;
                 status->chain_signal[1] = (FIELD_GET(MT_RXV4_RCPI1, rxdg4) - 220) / 2;
                 status->chain_signal[2] = (FIELD_GET(MT_RXV4_RCPI2, rxdg4) - 220) / 2;
                 status->chain_signal[3] = (FIELD_GET(MT_RXV4_RCPI3, rxdg4) - 220) / 2;


Am 09.06.2019 um 11:09 schrieb Ryder Lee:
> Fill in RX status->chain_signal to avoid empty value.
>
> Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   .../net/wireless/mediatek/mt76/mt7615/mac.c   | 30 ++++++++++++++++++-
>   .../net/wireless/mediatek/mt76/mt7615/mac.h   |  5 ++++
>   2 files changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> index b60d42b5923d..9ee83ea11b8c
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -13,6 +13,11 @@
>   #include "../dma.h"
>   #include "mac.h"
>   
> +static inline s8 to_rssi(u32 field, u32 rxv)
> +{
> +	return (FIELD_GET(field, rxv) - 220) / 2;
> +}
> +
>   static struct mt76_wcid *mt7615_rx_get_wcid(struct mt7615_dev *dev,
>   					    u8 idx, bool unicast)
>   {
> @@ -120,6 +125,7 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
>   	if (rxd0 & MT_RXD0_NORMAL_GROUP_3) {
>   		u32 rxdg0 = le32_to_cpu(rxd[0]);
>   		u32 rxdg1 = le32_to_cpu(rxd[1]);
> +		u32 rxdg3 = le32_to_cpu(rxd[3]);
>   		u8 stbc = FIELD_GET(MT_RXV1_HT_STBC, rxdg0);
>   		bool cck = false;
>   
> @@ -169,7 +175,29 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
>   
>   		status->enc_flags |= RX_ENC_FLAG_STBC_MASK * stbc;
>   
> -		/* TODO: RSSI */
> +		status->chains = dev->mt76.antenna_mask;
> +		status->chain_signal[0] = to_rssi(MT_RXV4_RCPI0, rxdg3);
> +		status->signal = status->chain_signal[0];
> +
> +		switch (status->chains) {
> +		case 0x3:
> +			status->chain_signal[1] = to_rssi(MT_RXV4_RCPI1, rxdg3);
> +			status->signal = max(status->signal,
> +					     status->chain_signal[1]);
> +			break;
> +		case 0x7:
> +			status->chain_signal[2] = to_rssi(MT_RXV4_RCPI2, rxdg3);
> +			status->signal = max(status->signal,
> +					     status->chain_signal[2]);
> +			break;
> +		case 0xf:
> +			status->chain_signal[3] = to_rssi(MT_RXV4_RCPI3, rxdg3);
> +			status->signal = max(status->signal,
> +					     status->chain_signal[3]);
> +			break;
> +		default:
> +			break;
> +		}
>   		rxd += 6;
>   		if ((u8 *)rxd - skb->data >= skb->len)
>   			return -EINVAL;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> index 18ad4b8a3807..b00ce8db58e9
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.h
> @@ -98,6 +98,11 @@ enum rx_pkt_type {
>   #define MT_RXV2_GROUP_ID		GENMASK(26, 21)
>   #define MT_RXV2_LENGTH			GENMASK(20, 0)
>   
> +#define MT_RXV4_RCPI3			GENMASK(31, 24)
> +#define MT_RXV4_RCPI2			GENMASK(23, 16)
> +#define MT_RXV4_RCPI1			GENMASK(15, 8)
> +#define MT_RXV4_RCPI0			GENMASK(7, 0)
> +
>   enum tx_header_format {
>   	MT_HDR_FORMAT_802_3,
>   	MT_HDR_FORMAT_CMD,
