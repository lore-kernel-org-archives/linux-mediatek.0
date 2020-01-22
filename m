Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DE3C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 06:59:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B8EC2465B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 06:59:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ak6/1Du4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j/XE19HH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B8EC2465B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4ou54Yyb0+vswuM1k4zlgAEJACEibA4t16wvcQ/1gc=; b=Ak6/1Du4Y2Gvs6
	JYEum6QdizltQ5f+eTZSXE3ZmgLhs3Loqz7SpxMJ3ZmyKnN89+zTSVr3pjh11TO3WeTpRDiBkhC2J
	nfxJiUHRH6nUPtwEgoS6h11kMJ8rNFLtVL8aYZioOTFGaidaiGPnNZcTt+c8QMqsijnJfD0Lhc6xy
	jUIv8LNjRRvCOJrKfq7ZpId4wMB6Hk6PtZQCFsydoLCMLIypa37uEv4n1LE6yXBVLJpRDjmeVusHW
	JmYLdnc13lNkJs3O4IKOKqjbNml7FRK4U3UPxx6QVLpFgObXW7aRQUgrEZ0+pGn53jNxIHpQRkhlQ
	Aysb8ddPUXpiX1PGoZng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu9yq-0000hZ-8t; Wed, 22 Jan 2020 06:59:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu9yo-0000gs-1L
 for linux-mediatek@lists.infradead.org; Wed, 22 Jan 2020 06:59:11 +0000
X-UUID: ffc60b3b0b414f2f8ebca9d57ef6a2e2-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GRsQHG2UW7ExUwyCqlnHyUQGZcc4c4EbdkXqtuntFu0=; 
 b=j/XE19HH/WzVafIO0jDYbcs6zVqCmYlgb7sIA4++fidRE1qCTbKSz/terwGyztHAY+FT/02WYNiyzlsGVVrGBQ0mk+5GLWTKd40CaW2vQWW2zLpgRimj7LC9vdScipXvPkfcRwIc4OgQvI6uRoxH9R3f9BCuIrUNAXk8fTVGB/E=;
X-UUID: ffc60b3b0b414f2f8ebca9d57ef6a2e2-20200121
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 345495251; Tue, 21 Jan 2020 22:59:08 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 23:00:07 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 22 Jan 2020 14:57:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 22 Jan 2020 14:57:40 +0800
Message-ID: <1579676338.8913.0.camel@mtkswgap22>
Subject: Re: [PATCH v8 1/6] pinctrl: mediatek: Check gpio pin number and use
 binary search in mtk_hw_pin_field_lookup()
From: Light Hsieh <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Date: Wed, 22 Jan 2020 14:58:58 +0800
In-Reply-To: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
References: <1579675994-7001-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 87851F59C06D535B4951196599F47F7CB695762265F0885F010414EFD75320E52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_225910_213103_F5553E8E 
X-CRM114-Status: GOOD (  18.05  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Sean,

	V8 uploaded according to your review comment on V7.
	Please take time to review. Thanks.

Light


On Wed, 2020-01-22 at 14:53 +0800, light.hsieh@mediatek.com wrote:
> From: Light Hsieh <light.hsieh@mediatek.com>
> 
> 1. Check if gpio pin number is in valid range to prevent from get invalid
>    pointer 'desc' in the following code:
> 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
> 
> 2. Improve  mtk_hw_pin_field_lookup()
> 2.1 Modify mtk_hw_pin_field_lookup() to use binary search for accelerating
>      search.
> 2.2 Correct message after the following check fail:
>     if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
> 		rc = &hw->soc->reg_cal[field];
>     The original message is:
>     	"Not support field %d for pin %d (%s)\n"
>     However, the check is on soc chip level, not on pin level yet.
>     So the message is corrected as:
>     	"Not support field %d for this soc\n"
> 
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 27 ++++++++++++++++++------
>  drivers/pinctrl/mediatek/pinctrl-paris.c         | 25 ++++++++++++++++++++++
>  2 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 20e1c89..d63e05e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -68,32 +68,44 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
>  {
>  	const struct mtk_pin_field_calc *c, *e;
>  	const struct mtk_pin_reg_calc *rc;
> +	int start = 0, end, check;
> +	bool found = false;
>  	u32 bits;
>  
>  	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
>  		rc = &hw->soc->reg_cal[field];
>  	} else {
>  		dev_dbg(hw->dev,
> -			"Not support field %d for pin %d (%s)\n",
> -			field, desc->number, desc->name);
> +			"Not support field %d for this soc\n", field);
>  		return -ENOTSUPP;
>  	}
>  
> +	end = rc->nranges - 1;
>  	c = rc->range;
>  	e = c + rc->nranges;
>  
> -	while (c < e) {
> -		if (desc->number >= c->s_pin && desc->number <= c->e_pin)
> +	while (start <= end) {
> +		check = (start + end) >> 1;
> +		if (desc->number >= rc->range[check].s_pin
> +		 && desc->number <= rc->range[check].e_pin) {
> +			found = true;
> +			break;
> +		} else if (start == end)
>  			break;
> -		c++;
> +		else if (desc->number < rc->range[check].s_pin)
> +			end = check - 1;
> +		else
> +			start = check + 1;
>  	}
>  
> -	if (c >= e) {
> +	if (!found) {
>  		dev_dbg(hw->dev, "Not support field %d for pin = %d (%s)\n",
>  			field, desc->number, desc->name);
>  		return -ENOTSUPP;
>  	}
>  
> +	c = rc->range + check;
> +
>  	if (c->i_base > hw->nbase - 1) {
>  		dev_err(hw->dev,
>  			"Invalid base for field %d for pin = %d (%s)\n",
> @@ -182,6 +194,9 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>  	if (err)
>  		return err;
>  
> +	if (value < 0 || value > pf.mask)
> +		return -EINVAL;
> +
>  	if (!pf.next)
>  		mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
>  			(value & pf.mask) << pf.bitpos);
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 923264d..3e13ae7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -81,6 +81,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>  	int val, val2, err, reg, ret = 1;
>  	const struct mtk_pin_desc *desc;
>  
> +	if (pin >= hw->soc->npins)
> +		return -EINVAL;
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>  
>  	switch (param) {
> @@ -206,6 +208,10 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  	int err = 0;
>  	u32 reg;
>  
> +	if (pin >= hw->soc->npins) {
> +		err = -EINVAL;
> +		goto err;
> +	}
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>  
>  	switch ((u32)param) {
> @@ -693,6 +699,9 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  	const struct mtk_pin_desc *desc;
>  	int value, err;
>  
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &value);
> @@ -708,6 +717,9 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
>  	const struct mtk_pin_desc *desc;
>  	int value, err;
>  
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DI, &value);
> @@ -722,6 +734,9 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
>  	const struct mtk_pin_desc *desc;
>  
> +	if (gpio > hw->soc->npins)
> +		return;
> +
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
>  
>  	mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DO, !!value);
> @@ -729,12 +744,22 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>  
>  static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
>  {
> +	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	return pinctrl_gpio_direction_input(chip->base + gpio);
>  }
>  
>  static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>  				     int value)
>  {
> +	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
> +
> +	if (gpio > hw->soc->npins)
> +		return -EINVAL;
> +
>  	mtk_gpio_set(chip, gpio, value);
>  
>  	return pinctrl_gpio_direction_output(chip->base + gpio);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
