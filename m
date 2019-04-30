From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v2] mt76: mt7615: add TX/RX antenna pattern capabilities
Date: Tue, 30 Apr 2019 11:24:55 +0200
Message-ID: <c3f6e202-8c2f-a103-a104-e0d1cde8147b@nbd.name>
References: <4f7160cb9f52335ce15fccac087fec25e7650884.1556255852.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4f7160cb9f52335ce15fccac087fec25e7650884.1556255852.git.ryder.lee@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 2019-04-26 07:23, Ryder Lee wrote:
> Announce antenna pattern cap to adapt PHY and baseband settings.
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> Changes since v2:
> - Add a prefix mt76 in the title.
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/init.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> index 3ab3ff553ef2..122f7a565540 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
> @@ -190,6 +190,8 @@ int mt7615_register_device(struct mt7615_dev *dev)
>  			IEEE80211_VHT_CAP_SHORT_GI_160 |
>  			IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454 |
>  			IEEE80211_VHT_CAP_MAX_A_MPDU_LENGTH_EXPONENT_MASK |
> +			IEEE80211_VHT_CAP_RX_ANTENNA_PATTERN |
> +			IEEE80211_VHT_CAP_TX_ANTENNA_PATTERN |
If I read the standard correctly, these flags indicate that the rx/tx
antenna pattern does NOT change during association.
Doesn't that mean that we should set it in mac80211.c instead, so that
it also applies to MT76x2?

Thanks,

- Felix
