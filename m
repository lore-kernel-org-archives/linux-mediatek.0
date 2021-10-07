Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1611C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:37:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226D861263
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 226D861263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D3ANtk9kIH/DFdIkh19tq9/y3S0RFuQJGZLHRTP8nTo=; b=0kxNCDswmLkvSQ
	qmFhewKHfqJ8tVbjHZEkjBXpnJ0Jhsu6pI3/DtFi6JJGvfyxhk+oVQ09tWdTn125jHFYXonmLGuzU
	txVA7+XJGq3OrJYRF08+xtlBv9zaPV7TYwymrfIpOE1K1rktVcr6XGdn14xPDVl0+6x6oLoTbZYxY
	HicsU7ic21Sb2sE8qUBghSQ3LZVOpKvLOdwz63GQEoBA2o5fvjx3qEZmw+SXEjHFWweNCcUIDZIQC
	TrEV8GUwAeaAaAXkCH1FRfx60XUbTJyNhZpwXjEIUkxQzoaOgER1Y8pTZBKv2uvSw63FVdhNV5qs7
	boMfMtcXs60ot9a1dGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYc0Y-000tSX-1g; Thu, 07 Oct 2021 22:36:59 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYc0L-000tRM-Mc; Thu, 07 Oct 2021 22:36:47 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1mYc00-0003P2-Io; Fri, 08 Oct 2021 00:36:25 +0200
Date: Thu, 7 Oct 2021 23:36:10 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Nick Hainke <vincent@systemli.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>
Subject: Re: [RFC v1] mt76: mt7615: mt7622: fix adhoc and ibss mode
Message-ID: <YV92Wjo+3dZ49DL6@makrotopia.org>
References: <20211007212323.1223602-1-vincent@systemli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211007212323.1223602-1-vincent@systemli.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_153645_769063_0E3BA206 
X-CRM114-Status: GOOD (  21.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, Oct 07, 2021 at 11:23:23PM +0200, Nick Hainke wrote:
> Subject: [RFC v1] mt76: mt7615: mt7622: fix adhoc and ibss mode
Ad-Hoc and IBSS mode are synonyms.
What probably meant to write 'fix adhoc and mesh mode', right?

> Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").
> 
> commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
> and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
> meshpoint support.
> 
> Both used in the "get_omac_idx"-function:
> 
> 	if (~mask & BIT(HW_BSSID_0))
> 		return HW_BSSID_0;
> 
> With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
> adhoc and meshpoint mode should "prefer hw bssid slot 1-3". However,
> with that change the ibss or meshpoint mode will not send any beacon on
> the mt7622 wifi anymore. Devices were still able to exchange data but
> only if a bssid already existed. Two mt7622 devices will never be able
> to communicate.
> 
> This commits reverts the preferation of slot 1-3 for adhoc and
> meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.
> 
> Tested on Banana Pi R64.
> 
> Signed-off-by: Nick Hainke <vincent@systemli.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> index dada43d6d879..51260a669d16 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
> @@ -135,8 +135,6 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
>  	int i;
>  
>  	switch (type) {
> -	case NL80211_IFTYPE_MESH_POINT:
> -	case NL80211_IFTYPE_ADHOC:
>  	case NL80211_IFTYPE_STATION:
>  		/* prefer hw bssid slot 1-3 */
>  		i = get_free_idx(mask, HW_BSSID_1, HW_BSSID_3);
> @@ -160,6 +158,8 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
>  			return HW_BSSID_0;
>  
>  		break;
> +	case NL80211_IFTYPE_ADHOC:
> +	case NL80211_IFTYPE_MESH_POINT:
>  	case NL80211_IFTYPE_MONITOR:
>  	case NL80211_IFTYPE_AP:
>  		/* ap uses hw bssid 0 and ext bssid */
> -- 
> 2.33.0
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
