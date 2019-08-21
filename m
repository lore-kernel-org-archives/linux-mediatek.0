From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] mt76: fix some checkpatch warnings
Date: Wed, 21 Aug 2019 04:59:16 -0700
Message-ID: <5613f082389460cb8de4251c08038c914683bd49.camel@perches.com>
References: <4ff1174b111ab61e147510ffbcde706d1a00600d.1566356513.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4ff1174b111ab61e147510ffbcde706d1a00600d.1566356513.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-08-21 at 11:11 +0800, Ryder Lee wrote:
> This fixes the following checkpatch warnings:
> CHECK: Alignment should match open parenthesis
> CHECK: No space is necessary after a cast
> 
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
> Changes since v2: remove false positive checkpatch warnings.

What were those?

> diff --git a/drivers/net/wireless/mediatek/mt76/dma.c b/drivers/net/wireless/mediatek/mt76/dma.c
[]
> @@ -587,8 +589,8 @@ mt76_check_sta(struct mt76_dev *dev, struct sk_buff *skb)
>  	}
>  
>  	if (ieee80211_has_morefrags(hdr->frame_control) ||
> -		!(ieee80211_is_mgmt(hdr->frame_control) ||
> -		  ieee80211_is_data(hdr->frame_control)))
> +	    !(ieee80211_is_mgmt(hdr->frame_control) ||
> +	    ieee80211_is_data(hdr->frame_control)))

Poor alignment here.

This should be:

	if (ieee80211_has_morefrags(hdr->frame_control) ||
	    !(ieee80211_is_mgmt(hdr->frame_control) ||
	      ieee80211_is_data(hdr->frame_control)))
