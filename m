Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D1CAC587
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3WqjLaPnduDHj5UJYMsDbWVpySuoMamzFSeGXQebeg=; b=uULMbvzoTgYnw5lHXPYlHUTOPU
	jCsWh4IbsIgJ3VoGOZTss394hRbt7cRlUVTKOFa0sksospgEsTJrl3qdqiGCpQ/+ODvJakNHK89Ot
	onakLMior9cFNyF4u6GUHpCVHSqU0MaMTWM5evrE6LkJTxWZL9OzVmz3Xpm3EhDfJHbjSJoSmMbr2
	8ukWGLflJlDNNWqYfozEfkmSGN4w4n+kDEK20Dxk4MKBuEF47cqCnKhl8wi7dBXeS7erbiDQzypWP
	0aAHE/5+TSN5tcSKwKS9BUjtRJA5RTiWgL8jnRU+Rp+e4MxEbeO4fyo/+a/5HsD89h6YANpXGWu8x
	0G2lgCPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv1C-000000068qO-39DZ;
	Tue, 09 Sep 2025 09:52:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtH0-00000005OZK-1oNr;
	Tue, 09 Sep 2025 08:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404816;
	bh=oCLEvvVWTE44t3aDmRT7ZhIFJug4E7QdqqWFMsbwgXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SC5DxzuB36zfuF0hEiz3OhRCrqpP0wmu3sK9sAFfUcEYCc3enPHy5uzCpayPzsahX
	 luKZrCwgKkPO2OIRlPpv985qyqGnM7o9WplsuAv9P9tzrGoaBmEtkJ3U/IWFEbgNOc
	 3soqSytqBwAbuZEEmCdS5BZAbR+ZDCZlrdqOfP5jam0YXop0NPSF8N+dxPvYuzJunW
	 1gnimL7jrpMY55dWa+j4noaPqrYgzyCusZY2NZiByZ+qUuvdD9nzWp9Ie+RMs9GnID
	 o6QKTnBdcQTPtCntZUN7WmkjHv8jruvk2SEZ3kXVNjKh9WRRJdpIwIPjA/pkU33T/d
	 ZeDvUeefzgvuQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65F3A17E0C96;
	Tue,  9 Sep 2025 10:00:16 +0200 (CEST)
Message-ID: <493794af-a1e8-4a4e-a253-2b6b703df53b@collabora.com>
Date: Tue, 9 Sep 2025 10:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] pinctrl: mediatek: Add debounce times for MT6878
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-3-3fb78c8ab4e8@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_010018_671276_88B443A3 
X-CRM114-Status: GOOD (  14.74  )
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

Il 08/09/25 21:17, Igor Belwon ha scritto:
> MT6878 uses different debounce times than other SoCs. Add them to the
> EINT driver.

The only reason why I can't give you a R-b for this is that you forgot to add
your S-o-b...

Cheers,
Angelo

> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 5 +++++
>   drivers/pinctrl/mediatek/mtk-eint.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 9f175c73613f84b47c0160947f32da7aca7d5a18..c8c5097c11c4d14eb41bdd7f9cb93b4a5756d2b2 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -66,6 +66,11 @@ const unsigned int debounce_time_mt6795[] = {
>   };
>   EXPORT_SYMBOL_GPL(debounce_time_mt6795);
>   
> +const unsigned int debounce_time_mt6878[] = {
> +	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
> +};
> +EXPORT_SYMBOL_GPL(debounce_time_mt6878);
> +
>   static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
>   					 unsigned int eint_num,
>   					 unsigned int offset)
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index fc31a4c0c77bf28b106943e9292d0dcc425c4922..3cdd6f6310cd0da5aa74623c5f1dbe8f8495d689 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -52,6 +52,7 @@ struct mtk_eint_pin {
>   extern const unsigned int debounce_time_mt2701[];
>   extern const unsigned int debounce_time_mt6765[];
>   extern const unsigned int debounce_time_mt6795[];
> +extern const unsigned int debounce_time_mt6878[];
>   
>   struct mtk_eint;
>   
> 


