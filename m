From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v2 1/2] mt76: mt7615: enable support for mesh
Date: Sun, 2 Jun 2019 22:36:41 +0800
Message-ID: <1559486201.2086.4.camel@mtkswgap22>
References: <e459fbc79154da9e0e6e098d2c49a9b17e842f47.1559301203.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e459fbc79154da9e0e6e098d2c49a9b17e842f47.1559301203.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.Chen@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-05-31 at 22:09 +0800, Ryder Lee wrote:
> Enable NL80211_IFTYPE_MESH_POINT and update its path.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> Changes since v2 - remove unused definitions
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 6 ++++++
>  drivers/net/wireless/mediatek/mt76/mt7615/main.c | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 5 ++++-
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.h  | 6 ------
>  4 files changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> index 59f604f3161f..f860af6a42da 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -133,6 +133,9 @@ static const struct ieee80211_iface_limit if_limits[] = {
>  	{
>  		.max = MT7615_MAX_INTERFACES,
>  		.types = BIT(NL80211_IFTYPE_AP) |
> +#ifdef CONFIG_MAC80211_MESH
> +			 BIT(NL80211_IFTYPE_MESH_POINT) |
> +#endif
>  			 BIT(NL80211_IFTYPE_STATION)
>  	}
>  };
> @@ -195,6 +198,9 @@ int mt7615_register_device(struct mt7615_dev *dev)
>  	dev->mt76.antenna_mask = 0xf;
>  
>  	wiphy->interface_modes = BIT(NL80211_IFTYPE_STATION) |
> +#ifdef CONFIG_MAC80211_MESH
> +				 BIT(NL80211_IFTYPE_MESH_POINT) |
> +#endif
>  				 BIT(NL80211_IFTYPE_AP);
>  
>  	ret = mt76_register_device(&dev->mt76, true, mt7615_rates,
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> index b0bb7cc12385..585e67fa2728 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -37,6 +37,7 @@ static int get_omac_idx(enum nl80211_iftype type, u32 mask)
>  
>  	switch (type) {
>  	case NL80211_IFTYPE_AP:
> +	case NL80211_IFTYPE_MESH_POINT:
>  		/* ap use hw bssid 0 and ext bssid */
>  		if (~mask & BIT(HW_BSSID_0))
>  			return HW_BSSID_0;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> index 43f70195244c..8b8db526cb16 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -754,6 +754,7 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
>  
>  	switch (vif->type) {
>  	case NL80211_IFTYPE_AP:
> +	case NL80211_IFTYPE_MESH_POINT:
>  		tx_wlan_idx = mvif->sta.wcid.idx;
>  		conn_type = CONNECTION_INFRA_AP;
>  		break;
> @@ -968,7 +969,8 @@ int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
>  		.rx_wtbl = {
>  			.tag = cpu_to_le16(WTBL_RX),
>  			.len = cpu_to_le16(sizeof(struct wtbl_rx)),
> -			.rca1 = vif->type != NL80211_IFTYPE_AP,
> +			.rca1 = vif->type != (NL80211_IFTYPE_AP ||
> +					      NL80211_IFTYPE_MESH_POINT),

Oops, this expression is wrong. I will fix it in v3.
Sorry for the inconvenience.

Ryder
