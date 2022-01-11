Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4689C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIwBJAwV51MuC76SgFrmbZRHiETWvvLjWqhH1fgfL9M=; b=dlGLL3nD8vpPIEG8g2dTsBe6Cs
	WSSKcq7rgkB5mBRk6M2ej1cXQQTLUn3C1y65rUBySATiOplPXW/5NqD7XZRPe1mxcjghrkrmHw903
	ClqrINpk3SU94reC60RvO423yu+q9X9WRsmGYtzcflYDLijpITa6x5mcmbm20wi2/U83olSidiPf+
	Tty9nHyDS8tAy7O7qGyYe6FGxJB5+xbC1tKTrYglq94Orp2UWLKCSYUM+y6Av8IHLA7/Rv1N3sMUa
	aSF6T7XPYwcDrRrqXN/MsgFlvUVLvOZK5nahtVfdhK1c5RjiUOOPkTEUXfr56qF8NO7fALGMDCjIg
	Wv9fbJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HPj-00GQoK-HR; Tue, 11 Jan 2022 13:42:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPR-00GQhW-7m; Tue, 11 Jan 2022 13:41:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B33CB1F41335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908515;
 bh=XWzCJsaH6wHTXJqGMpj21M7J1fiTCwiWPz1Rvurv6F0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=i63l37cdQxVHCycznoQLNqikVpR+XWURwD9UxexkQHuN5615sQmYug73Vj/l5IGvH
 ijC/fM9UARd3rdmuNeDZHp8clUFmoOP1AiSykJW6X7iNgID+N1MnaW2VpAXDRF7sIC
 x0OGlTAu8EHyM5SCUQglTJ+AJN7PFYsztLudLzwNbpRRPAQzTz27b1YPs1iQcq7aHf
 Vrfs9VD8aemndlNgvUC9r8upngqYOjpeSvNlcxuVFGPPuu09++d/TVm1XiFASpizud
 rHnx9KMKSiVCX5G1etKLPY+gF5HSPqYVM6Hao5vgZLykpTj6hIkboonZUgMA0DYHVD
 jpWarfJdQRtTw==
Subject: Re: [PATCH 6/7] pinctrl: mediatek: paris: Skip custom extra pin
 config dump for vrtual GPIOs
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <a8251721-9df2-8bea-11fd-87806d70f444@collabora.com>
Date: Tue, 11 Jan 2022 14:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-7-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054157_496884_1C3D9403 
X-CRM114-Status: GOOD (  18.04  )
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
> Virtual GPIOs do not have any hardware state associated with them. Any
> attempt to read back hardware state for these pins result in error
> codes.
> 
> Skip dumping extra pin config information for these virtual GPIOs.
> 
> Fixes: 184d8e13f9b1 ("pinctrl: mediatek: Add support for pin configuration dump via debugfs.")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Can you please fix the typo in the commit title? "vrtual"->"virtual"

After the typo fix:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thank you!

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 1bacabfbc183..678c8aa33012 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -585,6 +585,9 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
>   	if (gpio >= hw->soc->npins)
>   		return -EINVAL;
>   
> +	if (mtk_is_virt_gpio(hw, gpio))
> +		return -EINVAL;
> +
>   	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>   	pinmux = mtk_pctrl_get_pinmux(hw, gpio);
>   	if (pinmux >= hw->soc->nfuncs)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
