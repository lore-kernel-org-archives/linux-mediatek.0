From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: [PATCH] mt76: fix endianness sparse warnings
Date: Fri, 26 Apr 2019 09:46:33 +0200
Message-ID: <20190426074632.GA3568@redhat.com>
References: <865a5eb36f295fc81e3dcbe95929dcfce4956897.1556203212.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <865a5eb36f295fc81e3dcbe95929dcfce4956897.1556203212.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>, Roy Luo <royluo@google.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Apr 25, 2019 at 10:42:01PM +0800, Ryder Lee wrote:
> Fix many warnings with incorrect endian assumptions.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7603/mac.c |  2 +-
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
> index 2f2961ee0a92..af5769d05e6f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
> @@ -627,7 +627,7 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
>  	status->aggr = unicast &&
>  		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
>  	status->tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
> -	status->seqno = IEEE80211_SEQ_TO_SN(hdr->seq_ctrl);
> +	status->seqno = IEEE80211_SEQ_TO_SN(__le16_to_cpu(hdr->seq_ctrl));
>  
>  	return 0;
>  }
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> index 1bf3e7b5f6a7..4b934b0f5a39 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -235,7 +235,7 @@ int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
>  	status->aggr = unicast &&
>  		       !ieee80211_is_qos_nullfunc(hdr->frame_control);
>  	status->tid = *ieee80211_get_qos_ctl(hdr) & IEEE80211_QOS_CTL_TID_MASK;
> -	status->seqno = IEEE80211_SEQ_TO_SN(hdr->seq_ctrl);
> +	status->seqno = IEEE80211_SEQ_TO_SN(__le16_to_cpu(hdr->seq_ctrl));

Is there any reason to use underscored version instead of standard le16_to_cpu() ?

Stanislaw
