Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60F7C5475B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 17:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKU4mrJnAoN9YC5bfeNC7qKPDdKIRepXayBmHbEmm5Y=; b=4l9PvbJoWkq+hEqVjNt12hEpVI
	/OwJCmQVZC1C5symZCoQW9HlEq/tuDZnuAn/Ai337PlQ5WCtjLmQ3d8BrsQlJoVArhLomywIVP1D4
	xHhN3pJkmGwsEzNVdHHqdZfRIyUDKSY9spjCnSoO0miVdaOF74Fn6xQX3c1Ss/DnipLocrdMd1P9v
	+9amtacVDc/tx0DdbBK87275Sykxh0XL+7mUyUc8nbe5wUzAgjNF1AXlIalpjaa+qsNlG3krK9ydD
	FhaNn9RaI1pIdyMXZ9rBbawbUyl2YoyD470KQYd4UD883j9EZb8H2lUDplaSXu8RNMz7B4TEPbilR
	WRDVPyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjBV-00000002So3-0Iah;
	Mon, 11 Mar 2024 17:11:33 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjjBO-00000002Sk2-3opq;
	Mon, 11 Mar 2024 17:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710177085;
	bh=5AOlmp0WhMZQanJVzfmUCGnKbq90HEOIbEhrlt/ju1k=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=dl1NqHij7NxipguTGBERLEIq1bqfVRVP4iq3wioNLnoRj8g82MYWcih38MC1YerDb
	 YhPWoqoawOeG7J4ySudJmbQ64zMgmzEPziktv0To8I/s5RD4sK3x+XDx0nkmsIB2eC
	 htiJP4vxClYA8IPklK1mq1etU6mBcnrMIBPNFpzDeio9bKEFjNTc5++dxjOEy9Yawi
	 V97kUv+MyIoZND+Z8lyElxyXZeUndm0a/JY8Q3XVaIfzAcc3p95pz6amt0zErJssIV
	 wswXPg+bMzbbuhGFVTrPNABshzD/Y01VLthmaXySK9zYeolaTh1DypNY3jBQ7OS/ku
	 gIUIVVy+Qh8kA==
Received: from [10.193.1.1] (broslavsky.collaboradmins.com [68.183.210.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 45F1B378200D;
	Mon, 11 Mar 2024 17:11:19 +0000 (UTC)
Message-ID: <ab6b08c5-86a2-47e3-8683-28cdbe5be7cf@collabora.com>
Date: Mon, 11 Mar 2024 22:11:51 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>, kernel@collabora.com,
 kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: connac: check for null before dereferencing
Content-Language: en-US
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240301144406.2808307-1-usama.anjum@collabora.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20240301144406.2808307-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_101127_255337_E2068091 
X-CRM114-Status: GOOD (  14.13  )
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

Soft reminder

On 3/1/24 7:44 PM, Muhammad Usama Anjum wrote:
> The wcid can be NULL. It should be checked for validity before
> dereferencing it to avoid crash.
> 
> Fixes: 098428c400ff ("wifi: mt76: connac: set correct muar_idx for mt799x chipsets")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> index af0c2b2aacb00..7af60eebe517a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
> @@ -283,7 +283,7 @@ __mt76_connac_mcu_alloc_sta_req(struct mt76_dev *dev, struct mt76_vif *mvif,
>  	};
>  	struct sk_buff *skb;
>  
> -	if (is_mt799x(dev) && !wcid->sta)
> +	if (is_mt799x(dev) && wcid && !wcid->sta)
>  		hdr.muar_idx = 0xe;
>  
>  	mt76_connac_mcu_get_wlan_idx(dev, wcid, &hdr.wlan_idx_lo,

-- 
BR,
Muhammad Usama Anjum

