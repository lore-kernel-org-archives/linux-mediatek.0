Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB96C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 03:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8P1ppYgOEU34C9zZZ4rimiqeI5u9z36XXammzx0MdBg=; b=MsOMyOUFa/pOvW
	B8CYsyETqSEWC9HityGhhSnJIfTWqsUILbtf7C2oQkSFFFuMvRa4OjVPSc/s+5D7++pOsEnCWrhjO
	hnv6DoRVhHbX/Yz318apTaMRsjklX2a7S4UnUzkco2AdiCeITFWoFIWxDsDXWL8Onjnp3DSW93Ysu
	aaDmAmhLJvR5KXFOaNMt62Cc0kgMhZZWFfy+cOnBa3sPlbjbLu4TxuiY/5L1LFMH/PdtcpjxE3X/h
	wYpA0TaknnvW2bmDRs1ltpU1VJMlSLvdm9Pn7Gc9Ml3rRpoTNuiOCaB4vfcQllDvmP+AKtC08LZ8V
	GPuD0Ibdpw3N4QIeB1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9erL-00HJbl-HY; Tue, 18 Jan 2022 03:08:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eQT-00H3GB-Pw; Tue, 18 Jan 2022 02:40:52 +0000
X-UUID: b794d6f5ee0f42b6ade9c44465c85824-20220117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Y9GSvZM5x+TIy2NFydfg35BhFJAYHi5jhhj+uG920dU=; 
 b=Vk5Mee33V9gSoUC+qH46rzcjeqxmycqugCRts6lqxb2gzrQZGmVjEXrAKGoFetjOZqPpR7OPCwbee0dh+5uqFDqZ1aW9/HpeTA/iyK1qOHlJOI6lbPpMaIhMs3AFGh4MBp1e+z936wcf4FF78pYZ9GO/nBYp/jMS88jJHyHJ5EU=;
X-UUID: b794d6f5ee0f42b6ade9c44465c85824-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1968358415; Mon, 17 Jan 2022 19:40:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 18:36:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 10:36:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 10:36:47 +0800
Message-ID: <b1d5ca006860c85edd971ea9e20880ec8ba7f842.camel@mediatek.com>
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Guodong Liu <guodong.liu@mediatek.com>, <hui.liu@mediatek.com>,
 <light.hsieh@mediatek.com>
Date: Tue, 18 Jan 2022 10:36:47 +0800
In-Reply-To: <20220111112244.1483783-8-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-8-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_184049_915014_76503919 
X-CRM114-Status: GOOD (  33.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-01-11 at 19:22 +0800, Chen-Yu Tsai wrote:
> Some of the MediaTek chips that utilize the Paris pinctrl driver
> library
> support a lower drive strength (<= 1mA) than the standard drive
> strength
> settings (2~16 mA) on certain pins. This was previously supported by
> the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
> 
> The drive strength values for this hardware are 125, 250, 500, and
> 1000 mA,
> and can be readily described by the existing "drive-strength-
> microamp",
> which then gets parsed by the generic pinconf library into the
> parameter
> PIN_CONFIG_DRIVE_STRENGTH_UA.
> 
> Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> custom parameter around for backward compatibility.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> 
> The indentation in the switch/case blocks is getting somewhat out of
> control. I also have some cleanup changes to reverse the logic of the
> if/break statements. Not sure if it should be done before or after
> this
> patch though.
> 
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 84
> ++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 678c8aa33012..5a94903ae372 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
>  	"func12", "func13", "func14", "func15",
>  };
>  
> +/*
> + * This section supports converting to/from custom
> MTK_PIN_CONFIG_DRV_ADV
> + * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
> + *
> + * The custom value encodes three hardware bits as follows:
> + *
> + *   |           Bits           |
> + *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
> + *   ------------------------------------------------
> + *   |    x   |    x   |    0   | disabled, use standard drive
> strength
> + *   -------------------------------------
> + *   |    0   |    0   |    1   |  125 uA
> + *   |    0   |    1   |    1   |  250 uA
> + *   |    1   |    0   |    1   |  500 uA
> + *   |    1   |    1   |    1   | 1000 uA
> + */
> +static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
> +
> +static int mtk_drv_adv_to_uA(int val)
> +{
> +	/* This should never happen. */
> +	if (WARN_ON_ONCE(val < 0 || val > 7))
> +		return -EINVAL;
> +
> +	/* Bit 0 simply enables this hardware part */
> +	if (!(val & BIT(0)))
> +		return -EINVAL;
> +
> +	return mtk_drv_adv_uA[(val >> 1)];
> +}
> +
> +static int mtk_drv_uA_to_adv(int val)
> +{
> +	switch (val) {
> +	case 125:
> +		return 0x1;
> +	case 250:
> +		return 0x3;
> +	case 500:
> +		return 0x5;
> +	case 1000:
> +		return 0x7;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev
> *pctldev,
>  					  struct pinctrl_gpio_range
> *range,
>  					  unsigned int pin)
> @@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev
> *pctldev,
>  
>  		break;
>  	case PIN_CONFIG_DRIVE_STRENGTH:
> +		if (hw->soc->adv_drive_get) {
> +			err = hw->soc->adv_drive_get(hw, desc, &ret);
> +			if (!err) {
> +				err = mtk_drv_adv_to_uA(ret);
> +				if (err > 0) {
> +					/* PIN_CONFIG_DRIVE_STRENGTH_UA
> used */
> +					err = -EINVAL;
> +					break;
> +				}
> +			}
> +		}
> +
Hi Chen-Yu,

PIN_CONFIG_DRIVE_STRENGTH is seems used for 2/4/6/8ma, it is not used
for 125/250/500/1000ma. why you change here?

Thanks.

>  		if (hw->soc->drive_get)
>  			err = hw->soc->drive_get(hw, desc, &ret);
>  		else
>  			err = -ENOTSUPP;
>  		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +		if (hw->soc->adv_drive_get) {
> +			err = hw->soc->adv_drive_get(hw, desc, &ret);
> +			if (err)
> +				break;
> +			err = mtk_drv_adv_to_uA(ret);
> +			if (err < 0)
> +				break;
> +
> +			ret = err;
> +			err = 0;
> +		} else {
> +			err = -ENOTSUPP;
> +		}
> +		break;

Hi Chen-Yu,
For PIN_CONFIG_DRIVE_STRENGTH_UA case, How can we use in dts node ?
Thanks.

>  	case MTK_PIN_CONFIG_TDSEL:
>  	case MTK_PIN_CONFIG_RDSEL:
>  		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> @@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev
> *pctldev, unsigned int pin,
>  		else
>  			err = -ENOTSUPP;
>  		break;
> +	case PIN_CONFIG_DRIVE_STRENGTH_UA:
> +		if (hw->soc->adv_drive_set) {
> +			err = mtk_drv_uA_to_adv(arg);
> +			if (err < 0)
> +				break;
> +			err = hw->soc->adv_drive_set(hw, desc, err);
> +		} else {
> +			err = -ENOTSUPP;
> +		}
> +		break;
>  	case MTK_PIN_CONFIG_TDSEL:
>  	case MTK_PIN_CONFIG_RDSEL:
>  		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
