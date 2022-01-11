Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B802C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=enU9Cg/u8gPsiME0SyrsE833BhBAKKWdWnJGMZFlL8E=; b=tlCvyFEL/GbdRl1McIu+0cY6qr
	QKallZfH0VLbpFbNL3nG3WsjzKm68SAFU9mnO1w18drt8SKbLZvKk+c8G/b2sT9o2wn1+i81aY3YK
	acLXlSj7P1GVcOEX+Si+eYgAEbg4nRugl+eN8lVvFlb+YXk77aayLyHm47A8WEqDURC0ttrMv5jZV
	LSe5qP2l3gz7QXisFVu70pWuzVfDKSemw5lxBsRvacgpzwUG7XAdIijVeu0kkOSTCLTa9v1QvM52F
	9bw19/qvKUtwO1El9WyuOiTcvtAjw9lbK3B8QloQK4McxSiQwvFoaRisdxn6RUi0QrMEwqWvL5gOt
	BRxFd23w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HQz-00GRa9-S6; Tue, 11 Jan 2022 13:43:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPy-00GQwy-HS; Tue, 11 Jan 2022 13:42:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CA5AE1F43CE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908549;
 bh=355U7/8IRwaZapVvN2SPzxYmIVxbYl9G7+lZldd4sOc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=TKbGlYPU/iD9deLlA51q+hc7mwXl9abLPgm8nSMbWSAlRvN5tzpKoTFWt55jwImNh
 GfikhoG+7FjTNtu6ynUx+N+m9HtbgNQTWUE6Uj/QcJQSoY1XN3zSwP10P3AP/Xk39O
 tB7LwXcJKERHQ4iCNAvWH716W7SyAwsaMR6cjXjSRWnirqi/WN5UtKtWyJhHn4dvL7
 Iw8VtDLs9J3vK0CDtBhidqrqOxj0KDs46R/4qFHh4O+7NbP4p8ZGHNI8ANrrfCuwgt
 5LvcUBVQGj1NFvZKKjOgumd610gNp2+M+vclKVILGp1ZVN1ptveVC1XQeiRlObmnmr
 E1W5HOG6xNJlQ==
Subject: Re: [PATCH 3/7] pinctrl: mediatek: paris: Fix "argument" argument
 type for mtk_pinconf_get()
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f6114de8-940b-558f-a231-2c960e113fc3@collabora.com>
Date: Tue, 11 Jan 2022 14:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-4-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054230_750063_0A0EEEE2 
X-CRM114-Status: GOOD (  18.52  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> For mtk_pinconf_get(), the "argument" argument is typically returned by
> pinconf_to_config_argument(), which holds the value for a given pinconf
> parameter. It certainly should not have the type of "enum pin_config_param",
> which describes the type of the pinconf parameter itself.
> 
> Change the type to u32, which matches the return type of
> pinconf_to_config_argument().
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 1ca598ea7ba7..d720624d8cd2 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -188,8 +188,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   }
>   
>   static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> -			   enum pin_config_param param,
> -			   enum pin_config_param arg)
> +			   enum pin_config_param param, u32 arg)
>   {
>   	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
>   	const struct mtk_pin_desc *desc;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
