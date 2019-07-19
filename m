From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] mt76: mt7615: add 4 WMM sets support
Date: Fri, 19 Jul 2019 15:27:14 +0800
Message-ID: <1563521234.8090.4.camel@mtkswgap22>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
 <1dc3cbc32729be40d0e1f2ef831377f2cddf3df3.1563518381.git.ryder.lee@mediatek.com>
 <CA+zupgwyz2hdVRmnGr+4vzeEfvTfxYkLmu6jD_jFNjrPAdbvCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CA+zupgwyz2hdVRmnGr+4vzeEfvTfxYkLmu6jD_jFNjrPAdbvCQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Roy Luo <royluo-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YF Luo <yf.luo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yiwei Chung <yiwei.chung-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-07-19 at 15:05 +0800, Roy Luo wrote:
> 
> 
> 
> On Fri, Jul 19, 2019 at 2:55 PM Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> wrote:
> 
>         MT7615 hardware supoorts 4 WMM sets, so this patch adds them
>         accordingly.
>         Also remove incorrect queue mapping in .conf_tx
>         
>         Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
>         ---
>          drivers/net/wireless/mediatek/mt76/mt7615/mac.c  |  5 +++--
>          drivers/net/wireless/mediatek/mt76/mt7615/main.c | 16
>         ++++++----------
>          .../net/wireless/mediatek/mt76/mt7615/mt7615.h   |  1 +
>          3 files changed, 10 insertions(+), 12 deletions(-)
>         
>         diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
>         b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
>         index 8f9a2bb68ded..d85b3904f33a 100644
>         --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
>         +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
>         @@ -314,7 +314,7 @@ int mt7615_mac_write_txwi(struct
>         mt7615_dev *dev, __le32 *txwi,
>                 struct ieee80211_hdr *hdr = (struct ieee80211_hdr
>         *)skb->data;
>                 struct ieee80211_vif *vif = info->control.vif;
>                 int tx_count = 8;
>         -       u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0;
>         +       u8 fc_type, fc_stype, p_fmt, q_idx, omac_idx = 0,
>         wmm_idx = 0;
>                 __le16 fc = hdr->frame_control;
>                 u16 seqno = 0;
>                 u32 val;
>         @@ -323,6 +323,7 @@ int mt7615_mac_write_txwi(struct
>         mt7615_dev *dev, __le32 *txwi,
>                         struct mt7615_vif *mvif = (struct mt7615_vif
>         *)vif->drv_priv;
>         
>                         omac_idx = mvif->omac_idx;
>         +               wmm_idx = mvif->wmm_idx;
>                 }
>         
>                 if (sta) {
>         @@ -335,7 +336,7 @@ int mt7615_mac_write_txwi(struct
>         mt7615_dev *dev, __le32 *txwi,
>                 fc_stype = (le16_to_cpu(fc) & IEEE80211_FCTL_STYPE) >>
>         4;
>         
>                 if (ieee80211_is_data(fc) ||
>         ieee80211_is_bufferable_mmpdu(fc)) {
>         -               q_idx = skb_get_queue_mapping(skb);
>         +               q_idx = skb_get_queue_mapping(skb) + wmm_idx *
>         MT7615_MAX_WMM_SETS;
>                         p_fmt = MT_TX_TYPE_CT;
>                 } else if (ieee80211_is_beacon(fc)) {
>                         q_idx = MT_LMAC_BCN0;
>         diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
>         b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
>         index 2c702b31d55f..ea48dcdb65c0 100644
>         --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
>         +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
>         @@ -85,9 +85,9 @@ static int mt7615_add_interface(struct
>         ieee80211_hw *hw,
>                 }
>                 mvif->omac_idx = idx;
>         
>         -       /* TODO: DBDC support. Use band 0 and wmm 0 for now */
>         +       /* TODO: DBDC support. Use band 0 for now */
>                 mvif->band_idx = 0;
>         -       mvif->wmm_idx = 0;
>         +       mvif->wmm_idx = mvif->idx % MT7615_MAX_WMM_SETS;
>         
> 
> 
> IIUC, vifs with the same wmm_idx will share the same WMM HW, thus the
> same WMM parameter.
> Shouldn't we assign wmm_idx based on that?

I think that's what I did here. vif0 <-> wmm0, vif1 <->wmm1 ...

> 
> 
