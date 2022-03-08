Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7109C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPn/tw0zzVjRMjgyHrz7W9XbcPLrzRS432bdVlyUyM8=; b=F4EohQBwred7PL
	jrzR73+UkVVNwFaWO+SF7qoRMXYTbIPNYtZ5ioJLOczmDv1AYYt8ZF4l0Fb9RPKIJ2A3YaVm6cwTY
	4xFiACVMarrqV5FMOIYJVlQROJY5IPmvZ8ejv2GYhdpEwVXGLcZRxG71z0mDlbZtT+9RqkQt3hFmX
	xIpvGPvRfdP2iwFjLyFEe0znYcjGFnQjPaH8tigai1QRhnNG649LW34D0A/67zzBm26zDqfq5Ysj1
	c4lsTxS56IsDjMNEVeGy08XSIaQYGc1GTDFCkRwpTkZ1R6vRhKMfAwNSX37puMWnIM3HgLgNEBHG9
	+CalmYBftQzi6pcwOwNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRbkh-004xPQ-Qp; Tue, 08 Mar 2022 15:27:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRbk9-004xDC-8W; Tue, 08 Mar 2022 15:27:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 151A41F42FA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646753237;
 bh=YrSAmlhNuPnA20I9mMIbUEsD2fCEnGkr+ilv13TXmk0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=aZym5RVsJPVDcroiovKdN5qUHaiQw37QTqDdx6ByCKcjne7NAEcAa855Qxs2Qy+2J
 4Erm1YYwLasG3hnrcp8f521OYbDSlkLMryuCh8uHkckeFMY6NyhlLoN2F7oIfV3hF1
 F0Uy5gnihs4lYPJcdqAKH+8CARbpTD5P9QOlevuoPwC9yeJdeYAkeCOKc7pvOvumzK
 5ikJdOToe7gKT1qIplS7M21F4FyLLpViSLYOpz0otypIGMJx72aGO3r4kMAmt/I//K
 BXY7nM2LmyWl5W2v+kl1JWgPHo+Cx0ClCTosYQ3RArpsb2+ugZ0q/WNzX/GUiHTK7G
 eh6swMwlBtAOg==
Message-ID: <1dacb30a-ee81-d6a9-d2a0-500385c57de4@collabora.com>
Date: Tue, 8 Mar 2022 16:27:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 02/11] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_*
 readback
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220308100956.2750295-1-wenst@chromium.org>
 <20220308100956.2750295-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308100956.2750295-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_072721_533198_8A61C6F5 
X-CRM114-Status: GOOD (  19.13  )
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

Il 08/03/22 11:09, Chen-Yu Tsai ha scritto:
> When reading back pin bias settings, if the pin is not in the
> corresponding bias state, the function should return -EINVAL.
> 
> Fix this in the mediatek-paris pinctrl library so that the read back
> state is not littered with bogus a "input bias disabled" combined with
> "pull up" or "pull down" states.
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index f9f9110f2107..7037560ecda9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -96,20 +96,16 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
>   			if (err)
>   				goto out;
> +			if (ret == MTK_PUPD_SET_R1R0_00)
> +				ret = MTK_DISABLE;
>   			if (param == PIN_CONFIG_BIAS_DISABLE) {
> -				if (ret == MTK_PUPD_SET_R1R0_00)
> -					ret = MTK_DISABLE;
> +				if (ret != MTK_DISABLE)
> +					err = -EINVAL;
>   			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
> -				/* When desire to get pull-up value, return
> -				 *  error if current setting is pull-down
> -				 */
> -				if (!pullup)
> +				if (!pullup || ret == MTK_DISABLE)
>   					err = -EINVAL;
>   			} else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
> -				/* When desire to get pull-down value, return
> -				 *  error if current setting is pull-up
> -				 */
> -				if (pullup)
> +				if (pullup || ret == MTK_DISABLE)
>   					err = -EINVAL;
>   			}
>   		} else {




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
