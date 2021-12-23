Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D432C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DotcXTGPoC70XweZnbflMpiXQYOlUObLcAN1bpRbsr4=; b=jqRTAeWa3kdNEg
	+rmn/j/Gy9m2XX+M2emTnmsWiKAyezWUJJ2FnHludeZL5tDXMUsFsV6149yIVrDjkJMPBEaVuxgFh
	ld7j6Bmdcl89sMhoHAfMcqVS0MDIvEEbIad1FfqnuId5D72ERcNpI/VpFlfjDDdj0euhONUX1oLwY
	4hCoqhmYehqOd4Gsw9KC0oV2+Wm502EymcRW0fc1gSjQEs11r+qbS+waaOn2fnWosYM2ZkS5IIrlY
	1Mehzk5seXoWxGeMTViV6AWKMHQV4TAgtPz3BYBx4heFeUnOTo2RwSJtjLkJyWDTN3KFkinnj6c8k
	RHfqoM7tC/fmrzmJOYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0L5v-00CSqx-AE; Thu, 23 Dec 2021 10:13:07 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0L5s-00CSq8-MY
 for linux-mediatek@lists.infradead.org; Thu, 23 Dec 2021 10:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ruc8+BH/rRhQUbW0InbtepiuS0NDPfc+6sJRs3wHkIA=; b=h+PfwBuCnl9ztSGj3Jn80RkJ3q
 8Z9grzxSBeWmmfKz/7xeNWF2QbZwRF2me5Ic8aHHzU0UvXOcgULJXoPJSBNreQX9bQqMhKqUJl80G
 FWO4jxDssHGSRlIlT2qdEEiJ/eoAsgTZrCq0eJc/jjeV72qBgPvLN3VUpFTRjYmahrsA=;
Received: from p54ae97a7.dip0.t-ipconnect.de ([84.174.151.167] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1n0L5n-0007Ol-3q; Thu, 23 Dec 2021 11:12:59 +0100
Message-ID: <2b376af1-28e8-ea3e-ddb2-c300cc52a40f@nbd.name>
Date: Thu, 23 Dec 2021 11:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH] mt76: mt7915: fix warning: variable 'flags' set but not
 used
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20211223065843.94919-1-bo.jiao@mediatek.com>
Content-Language: en-US
In-Reply-To: <20211223065843.94919-1-bo.jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_021304_937030_C4FA3B57 
X-CRM114-Status: GOOD (  13.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-12-23 07:58, Bo Jiao wrote:
> From: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> fix warning: variable 'flags' set but not used
> 
> Fixes: 0aa6b534b5e1 ("mt76: mt7915: update rx rate reporting for mt7916")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> index ee4535a..f6d6321 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -469,7 +469,7 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
>   			__le32 *rxv)
>   {
>   	u32 v0, v2;
> -	u8 flags, stbc, gi, bw, dcm, mode, nss;
> +	u8 stbc, gi, bw, dcm, mode, nss;
>   	int i, idx;
>   	bool cck = false;
>   
> @@ -505,20 +505,12 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
>   		status->encoding = RX_ENC_HT;
>   		if (i > 31)
>   			return -EINVAL;
> -
> -		flags = RATE_INFO_FLAGS_MCS;
> -		if (gi)
> -			flags |= RATE_INFO_FLAGS_SHORT_GI;
>   		break;
>   	case MT_PHY_TYPE_VHT:
>   		status->nss = nss;
>   		status->encoding = RX_ENC_VHT;
>   		if (i > 9)
>   			return -EINVAL;
> -
> -		flags = RATE_INFO_FLAGS_VHT_MCS;
> -		if (gi)
> -			flags |= RATE_INFO_FLAGS_SHORT_GI;
>   		break;
>   	case MT_PHY_TYPE_HE_MU:
>   	case MT_PHY_TYPE_HE_SU:
The short GI value should still be reported. I'm folding this change 
into the commit:

--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -503,12 +503,16 @@ mt7915_mac_fill_rx_rate(struct mt7915_dev *dev,
   	case MT_PHY_TYPE_HT_GF:
   	case MT_PHY_TYPE_HT:
   		status->encoding = RX_ENC_HT;
+		if (gi)
+			status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
   		if (i > 31)
   			return -EINVAL;
   		break;
   	case MT_PHY_TYPE_VHT:
   		status->nss = nss;
   		status->encoding = RX_ENC_VHT;
+		if (gi)
+			status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
   		if (i > 9)
   			return -EINVAL;
   		break;



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
