Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3378C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPi9tcmJfeohjNGJEh6RkZTBelsG/DTHoW4nnvpDfmY=; b=KgXMWGR/Ne1RoDyRLR3/vnV4Du
	cLur3QPKpKCCLfRoSouVRyWNubAJdKykM+ksD18DbUAdkksJs5IwBg8aB4AZZY8yJVPoMws0S/g8K
	1Lj0NQRRCbrHxY20nsNHKA9DQoeIKQqFncAlwBaYNPDew3GtqKcRxFSioz++G274CGIfRGNSIG5vf
	ALm1mvLBgcHBsJetOwIVfi08aiDojMkjwxtVoHeSFEir3+y6TbLgS+wGjXt4tKa04+dHGQjjAiKy+
	ACYVXW96sbZeX0GsKaHlz3l3usz877Kr7Cg0bRMfrnjx/BFcf3046BQE45F3/Nk7CRfrQaauIJSlM
	3RnQ0QMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HPP-00GQhP-GP; Tue, 11 Jan 2022 13:41:55 +0000
Received: from relay01.th.seeweb.it ([2001:4b7a:2000:18::162])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HPL-00GQf8-7q
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 13:41:53 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id C09EF20143;
 Tue, 11 Jan 2022 14:41:41 +0100 (CET)
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <99ae1a61-7d12-f723-efb7-b26abb3811ef@somainline.org>
Date: Tue, 11 Jan 2022 14:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-8-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054151_633021_F1C5AE97 
X-CRM114-Status: GOOD (  34.22  )
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
> Some of the MediaTek chips that utilize the Paris pinctrl driver library
> support a lower drive strength (<= 1mA) than the standard drive strength
> settings (2~16 mA) on certain pins. This was previously supported by the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
> 
> The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
> and can be readily described by the existing "drive-strength-microamp",
> which then gets parsed by the generic pinconf library into the parameter
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
> if/break statements. Not sure if it should be done before or after this
> patch though.

Hello Chen-Yu,

this commit is so nice that:
- My heart says that it's fine as it is, but
- My brain says that it makes a lot more sense if you push the cleanup
changes to reverse that logic before pushing this commit, as to reduce the
count of changed lines (hence, to reduce some noise)...

...so please, can you rebase this commit over the cleanups?

Thanks,
- Angelo

> 
> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 84 ++++++++++++++++++++++++
>   1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 678c8aa33012..5a94903ae372 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
>   	"func12", "func13", "func14", "func15",
>   };
>   
> +/*
> + * This section supports converting to/from custom MTK_PIN_CONFIG_DRV_ADV
> + * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
> + *
> + * The custom value encodes three hardware bits as follows:
> + *
> + *   |           Bits           |
> + *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
> + *   ------------------------------------------------
> + *   |    x   |    x   |    0   | disabled, use standard drive strength
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
>   static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>   					  struct pinctrl_gpio_range *range,
>   					  unsigned int pin)
> @@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   
>   		break;
>   	case PIN_CONFIG_DRIVE_STRENGTH:
> +		if (hw->soc->adv_drive_get) {
> +			err = hw->soc->adv_drive_get(hw, desc, &ret);
> +			if (!err) {
> +				err = mtk_drv_adv_to_uA(ret);
> +				if (err > 0) {
> +					/* PIN_CONFIG_DRIVE_STRENGTH_UA used */
> +					err = -EINVAL;
> +					break;
> +				}
> +			}
> +		}
> +
>   		if (hw->soc->drive_get)
>   			err = hw->soc->drive_get(hw, desc, &ret);
>   		else
>   			err = -ENOTSUPP;
>   		break;
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
>   	case MTK_PIN_CONFIG_TDSEL:
>   	case MTK_PIN_CONFIG_RDSEL:
>   		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> @@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   		else
>   			err = -ENOTSUPP;
>   		break;
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
>   	case MTK_PIN_CONFIG_TDSEL:
>   	case MTK_PIN_CONFIG_RDSEL:
>   		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
