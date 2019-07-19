From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH 3/3] mt76: mt7615: add cwmin/cwmax initial values
Date: Fri, 19 Jul 2019 18:17:56 +0800
Message-ID: <1563531476.17970.2.camel@mtkswgap22>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
         <c83e14787bc86f8f8062e0aa44e03ef80c3fd38a.1563518381.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c83e14787bc86f8f8062e0aa44e03ef80c3fd38a.1563518381.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-07-19 at 14:55 +0800, Ryder Lee wrote:
> Add initial values in mt7615_mcu_set_wmm() to cleanup setup flow.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> index 5fd162be3654..154c09428b69 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
> @@ -622,10 +622,7 @@ int mt7615_mcu_set_rts_thresh(struct mt7615_dev *dev, u32 val)
>  int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
>  		       const struct ieee80211_tx_queue_params *params)
>  {
> -#define WMM_AIFS_SET	BIT(0)
> -#define WMM_CW_MIN_SET	BIT(1)
> -#define WMM_CW_MAX_SET	BIT(2)
> -#define WMM_TXOP_SET	BIT(3)
> +#define WMM_PARAM_SET	GENMASK(3, 0)
>  	struct req_data {
>  		u8 number;
>  		u8 rsv[3];
> @@ -638,19 +635,17 @@ int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
>  	} __packed req = {
>  		.number = 1,
>  		.queue = queue,
> -		.valid = WMM_AIFS_SET | WMM_TXOP_SET,
> +		.valid = WMM_PARAM_SET,
>  		.aifs = params->aifs,
> +		.cw_min = BIT(5) - 1,
> +		.cw_max = cpu_to_le16(BIT(10) - 1),
>  		.txop = cpu_to_le16(params->txop),
>  	};
>  
> -	if (params->cw_min) {
> -		req.valid |= WMM_CW_MIN_SET;
> +	if (params->cw_min)
>  		req.cw_min = params->cw_min;
> -	}
> -	if (params->cw_max) {
> -		req.valid |= WMM_CW_MAX_SET;
> +	if (params->cw_max)
>  		req.cw_max = cpu_to_le16(params->cw_max);
> -	}

I should use fls() here and will send a v2

>  	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_EDCA_UPDATE,
>  				   &req, sizeof(req), true);
