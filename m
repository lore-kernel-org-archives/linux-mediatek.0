Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CD7C04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86mq8F1NCwfxU6EI/7RwootNWgiMDi7Crog69YfqCw4=; b=B7dOqsoU+rCHxjmKLHbcUqmzJc
	rDSaXS69wLCMxZ0TzN6A8PEeBFChQ8xkTgmqC2/Y78jucbcXiKsHGEhKYAFu3C/8GqmKOqZvjEcD4
	7qGLhVGg4xwij32fBiYKa6VsI8U1zZPtB5QdNNatS/3RUUFeHlMEcef5c8eR2tpOQPryzi4GI7mzs
	0SjW77bRVE3W5/WW8dmtUwQp616eXb36C1MXmDl9LQAAYm+LKUoAhaNKfWz19aDKdIpJBbbfJ+ESv
	CXO6hbe8H+AK0WCS/HLw65uE+9sDvH86NT8Os3NuxG4GwTu9nuIvB2n7b4N1P+f6jfgUFCqA5h+6x
	tmCN46ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odosF-001oXo-38; Thu, 29 Sep 2022 08:26:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odorh-001oLD-86; Thu, 29 Sep 2022 08:25:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 955A86601EB5;
	Thu, 29 Sep 2022 09:25:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439952;
	bh=3A84Wc+eg1AMQCBr54TYwsN/qp6rBrOdcI/Bnlj9wfE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kXiNgHz1yy3n7U6IHiM76d2/ZGgtGz4AhHPR0I0KcgQSFX0thGdBfn83o4WrTNMei
	 apz9Kl8blrh6FnN/tNA20gKFQSFfcYMOTFVsijZFkr0CCVgPX+AuJd8jrtgf6FFCbe
	 JVzdZMsxSqIbi4D6OOmh9TMa+ldDjqoeACwwokQO61xK/d6CLwfmG/xWvIjzFtpFNt
	 ku1o1/6Wf3NHtER29OZmypjPHGDwzeREgpuH4SQNRmFEniCtfyCplu/vWWN5ntibP4
	 kY34mSru+GUPn1jBlXaUKF4xejMoDapQ+jKAtzsI1GU8MQeijYtdKcvN8OYvZShnLs
	 VUIuAZuzt8lcQ==
Message-ID: <3c4612cb-31bd-2bc2-6a91-313771869f8f@collabora.com>
Date: Thu, 29 Sep 2022 10:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/8] soc: mediatek: mtk-svs: improve readability of
 platform_probe
Content-Language: en-US
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-3-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-3-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012553_471292_9E47211C 
X-CRM114-Status: GOOD (  15.05  )
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

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> If a compatible misses a match data entry, then something is wrong in
> the development phase, we don't need to check for that at runtime.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> 
>   drivers/soc/mediatek/mtk-svs.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index fd0f636e8644..52bb4f8bbe6d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2332,10 +2332,6 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   	int ret;
>   
>   	svsp_data = of_device_get_match_data(&pdev->dev);

Changing that to device_get_match_data() (so, dropping of_) would be a plus
to this cleanup, perhaps...

In any case:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> -	if (!svsp_data) {
> -		dev_err(&pdev->dev, "no svs platform data?\n");
> -		return ERR_PTR(-EPERM);
> -	}
>   
>   	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
>   	if (!svsp)


