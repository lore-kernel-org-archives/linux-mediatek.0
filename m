Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5582B606A33B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 13:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YlZyjht5;
	dkim=pass (2048-bit key, unprotected) header.d=candelatech.com header.i=@candelatech.com header.a=rsa-sha256 header.s=selector-2026-11-03-0 header.b=F53wuVN9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qT0qt1sxUQ9MY1+dO7fxD7QDQy6pE6WUCB728+GqBIk=; b=YlZyjht5C28Fgp
	FBlI1FFAFQv4zj/vVk6gHTw+TbxjquS62SDJthwanbjn5I4Tiqdn1oz6gHlKGZhNiL0al3s6KCeRw
	kLJFfi2J7CVUbaWH/bq8PZk0jryMlZ5yL7SRK+Jo05xn0jMqlHfKeXStbaTGIh2N160xNcBjJshsr
	KKw25YLAkaEHmdi96xefv+cz+++H5nhxcQm+gpCRlJtMlQCWaQGdHeT9sUpClFrtAnaOzKYDY8E83
	xQ7eRbCmEwNLScQj5m3sgrSSiSvnjNU8DQykQmVFEiJlAgKsG6ZM7jyvgr4sFd78Uan4inK32JBlN
	Y3qzer/jktj2OUPxeRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZbp-0000000DO05-0BA0;
	Thu, 26 Nov 2026 13:33:57 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZbl-0000000DNyG-2SB5
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 13:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=candelatech.com;
 h=cc:cc:content-transfer-encoding:content-transfer-encoding:content-type:content-type:date:date:from:from:in-reply-to:in-reply-to:message-id:message-id:mime-version:mime-version:references:references:subject:subject:to:to;
 s=selector-2026-11-03-0; bh=qT0qt1sxUQ9MY1+dO7fxD7QDQy6pE6WUCB728+GqBIk=;
 b=F53wuVN9DrP1ycpZv1yfQxtDyPBVruRssmFtEL/yqK0fo9vUTS71I4E9bsB/sqYiH6y+4JMJfZ55/t32tF/5O+DFMpXi9ql+gjlRfhnkNPK+nNZEMEgxU/7D59CmiHSqLamQjR3mIcUtrvo2OYvyOiaBssUH7wG6rQCVImna8GdML++f6etEqOz5SEKcYU1bh0TLYk/1e3gjvmPmfy2xfb/ydtuIPcMal7FXCLmcvEI7GtBBIy+xEDmQ0EXsu1us+QZcADZJwtNAQQLuqkD+GXLJJ0gALfVHY3QbVNn3g+XEUfdpE0R6akTy+K6SPBvkitAVmWR17CNyfEYcn6ml9w==
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail.candelatech.com (mail5.candelatech.com [208.74.158.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTPS id 5DA9A10008B;
	Thu, 26 Nov 2026 13:33:50 +0000 (UTC)
Received: from [192.168.1.22] (unknown [47.7.206.18])
	by mail.candelatech.com (Postfix) with ESMTPSA id 61776603AD;
	Thu, 26 Nov 2026 05:33:48 -0800 (PST)
Message-ID: <a7776ad1-063b-46be-abb6-f4feaa22e12e@candelatech.com>
Date: Thu, 26 Nov 2026 05:33:47 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] wifi: mt76: fix possible NULL access in mt76_tx
To: Eason Lai <eason.lai@mediatek.com>, nbd@nbd.name, lorenzo@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 kun.wu@mediatek.com, deren.wu@mediatek.com, sean.wang@mediatek.com,
 quan.zhou@mediatek.com, ryder.lee@mediatek.com, leon.yen@mediatek.com,
 litien.chang@mediatek.com, jb.tsai@mediatek.com,
 Anthony Liu <anthony.liu@mediatek.com>
References: <20261126082228.3226934-1-eason.lai@mediatek.com>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <20261126082228.3226934-1-eason.lai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1795700031-d3YGf9gnIQIU
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1795700031;d3YGf9gnIQIU;<greearb@candelatech.com>;46b3bf49310361adedd6cbc482462562
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053353_649580_FCFE9618 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/26/26 12:22 AM, Eason Lai wrote:
> Add WARN_ON(!wcid) early return and drop redundant wcid NULL check

Maybe WARN_ON_ONCE is better, to decrease potential log spam in
case this problem can happen often in some cases?

Thanks,
Ben

> 
> Co-developed-by: Anthony Liu <anthony.liu@mediatek.com>
> Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
> Signed-off-by: Eason Lai <eason.lai@mediatek.com>
> ---
>   drivers/net/wireless/mediatek/mt76/tx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
> index d8036466f495..2be43d05c9af 100644
> --- a/drivers/net/wireless/mediatek/mt76/tx.c
> +++ b/drivers/net/wireless/mediatek/mt76/tx.c
> @@ -377,7 +377,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
>   	struct mt76_dev *dev = phy->dev;
>   	struct sk_buff_head *head;
>   
> -	if (mt76_testmode_enabled(phy)) {
> +	if (WARN_ON(!wcid) || mt76_testmode_enabled(phy)) {
>   		ieee80211_free_txskb(phy->hw, skb);
>   		return;
>   	}
> @@ -385,7 +385,7 @@ mt76_tx(struct mt76_phy *phy, struct ieee80211_sta *sta,
>   	if (WARN_ON(skb_get_queue_mapping(skb) >= MT_TXQ_PSD))
>   		skb_set_queue_mapping(skb, MT_TXQ_BE);
>   
> -	if (wcid && !(wcid->tx_info & MT_WCID_TX_INFO_SET))
> +	if (!(wcid->tx_info & MT_WCID_TX_INFO_SET))
>   		ieee80211_get_tx_rates(info->control.vif, sta, skb,
>   				       info->control.rates, 1);
>   


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

