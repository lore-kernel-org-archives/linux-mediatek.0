Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2776DC4828F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpzj3JGLQH9CZEqxcOTWlIhPFEvetyV8PxTqSLYuFr8=; b=aOZRVKUClRVSqO2rkTf87+bUki
	VroYArKz2mtfvGGXsK98Z0P2telXwMPXW/8y9/17SkPmiyFP6UoEycsCd52pdL9Gg3QcuYbsedd0k
	GY4NNwVOTj4VDFjD6x3DWvFK8x+1dgAaaelUpj5Zkgl4CypV0qMJ/6lKOoAusoxYeDKk2SFnVPOXV
	2x4omS/4L+2cYw6QD5T3qdpHS+kMu0BHzxBkQat7QiD2XT5vqTM0/bgYgFclhGZlPDhbL2zYQJHbI
	whATJtDBZz2+qZsc0WQK1sklwSA8ldWOsLS1ghRaqbxQuQyOZx2Ebls7r5LlvsRf9J86tzyheiAJY
	skhHSsJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjQ2-0000000B1Ji-2eQs;
	Wed, 07 Feb 2024 15:00:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXjPz-0000000B1Iy-0jvb;
	Wed, 07 Feb 2024 15:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707318053;
	bh=XXFDvBkeGOfbwZKGPocdQlFeqLv49I9NlaKKBdpBvqY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ox5b70PWQW1WjQ+6JuWbrICh02r2vS3PgbKIo6AknU+m1Z5Wpqdwr5BRPssr5ff+Q
	 aDnC/vkmoztrwKefMm9rM240l9btCIzLDT5Bo2xunfeNemN/2WrImCHHnMlXe3li2L
	 UvtK69YeUVcP0Pw77JSKFOEanmDPPjne/xoTVhw7k2e+koUe9qTVdB+RLFnfhYvsXH
	 Qq7TqQ0vx32nN/y0Qhj+Z7gHd/2RC5VC6TtyZZ4o6ceIZonPBvmw71I1HV0wLiPpVB
	 w7Ys3QiryqlGKrsoThwDskrrakbB4xpznlGcBs6bODS8FzpceySMfyaalFXGKRPTQF
	 umMZ/cafheGYw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0A1A3782072;
	Wed,  7 Feb 2024 15:00:52 +0000 (UTC)
Message-ID: <2b91bd5e-9e66-402e-87fe-c2894e5a1d5a@collabora.com>
Date: Wed, 7 Feb 2024 16:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] mt76: Remove redundant assignment to variable tidno
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240207131113.2450297-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240207131113.2450297-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_070055_401484_83E1B877 
X-CRM114-Status: GOOD (  14.44  )
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

Il 07/02/24 14:11, Colin Ian King ha scritto:
> The variable tidno is being assigned a value that is not being read
> and is being re-assigned a new value a few statements later.
> The assignment is redundant and can be removed.
> 
> Cleans up clang scan warning:
> drivers/net/wireless/mediatek/mt76/agg-rx.c:125:5: warning: Value stored
> to 'tidno' during its initialization is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/net/wireless/mediatek/mt76/agg-rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/agg-rx.c b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> index 10cbd9e560e7..07c386c7b4d0 100644
> --- a/drivers/net/wireless/mediatek/mt76/agg-rx.c
> +++ b/drivers/net/wireless/mediatek/mt76/agg-rx.c
> @@ -122,7 +122,7 @@ mt76_rx_aggr_check_ctl(struct sk_buff *skb, struct sk_buff_head *frames)
>   	struct ieee80211_bar *bar = mt76_skb_get_hdr(skb);
>   	struct mt76_wcid *wcid = status->wcid;
>   	struct mt76_rx_tid *tid;
> -	u8 tidno = status->qos_ctl & IEEE80211_QOS_CTL_TID_MASK;
> +	u8 tidno;
>   	u16 seqno;
>   
>   	if (!ieee80211_is_ctl(bar->frame_control))



