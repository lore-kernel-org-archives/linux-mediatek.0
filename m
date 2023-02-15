Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E1FC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 14:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp3AI81ua6rNhYY8rUOeio8jVjSEVHNhT38mlqCh0WQ=; b=AhbsQihmOLODCBiMxSD3wXKq64
	a6RO7NPoFKn9JmZi0oeMgQVibgsDbE24Bx761WrALhE51S+U+wSfxQb5T49Nq3GpeZTJbH2pSr1nL
	0CNGhtHsHiwsMb2a87i44V34MDxhan59BgVtbMy6QFWPn9Pd32uiDSx9mVn3CK7YaxaCu8fYRWYkE
	wJcCnIPB4JvjwmKZe57LKREwAz3hAtyAOUDaQ5jy7ha0EOkErYboqABQv+Jc/f6kkDtk685PpSq2p
	9J7u+PlSVBKk5g+Vo98bDn7ss+Sm8fEGq8I9zkCKHf4QvcjbmEVDBXvKK/Nyjr1g1A7TO76zzkrE1
	O6ocLZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIqX-006DgJ-MY; Wed, 15 Feb 2023 14:33:21 +0000
Received: from relay08.th.seeweb.it ([2001:4b7a:2000:18::169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSIqR-006DeS-Ln
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 14:33:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4F99A3FAF5;
	Wed, 15 Feb 2023 15:33:05 +0100 (CET)
Message-ID: <b12bf08c-f8b8-d561-f85a-475ec5677710@somainline.org>
Date: Wed, 15 Feb 2023 15:33:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
Content-Language: en-US
To: Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20230209110659.25447-1-shayne.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
In-Reply-To: <20230209110659.25447-1-shayne.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_063315_917774_FC2B0AAC 
X-CRM114-Status: GOOD (  14.66  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/02/23 12:06, Shayne Chen ha scritto:
> The value of last_rate in ieee80211_sta_rx_stats is degraded from u32 to
> u16 after being assigned to rate variable, which causes information loss
> in STA_STATS_FIELD_TYPE and later bitfields.
> 
> Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>

In struct ieee80211_sta_rx_stats, `last_rate` is u32, hence this local `rate`
must be u32, or information loss may happen. Agreed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   net/mac80211/sta_info.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
> index 27c737fe7fb8..bd532d3f925d 100644
> --- a/net/mac80211/sta_info.c
> +++ b/net/mac80211/sta_info.c
> @@ -2418,7 +2418,7 @@ static void sta_stats_decode_rate(struct ieee80211_local *local, u32 rate,
>   
>   static int sta_set_rate_info_rx(struct sta_info *sta, struct rate_info *rinfo)
>   {
> -	u16 rate = READ_ONCE(sta_get_last_rx_stats(sta)->last_rate);
> +	u32 rate = READ_ONCE(sta_get_last_rx_stats(sta)->last_rate);
>   
>   	if (rate == STA_STATS_RATE_INVALID)
>   		return -EINVAL;
> 


