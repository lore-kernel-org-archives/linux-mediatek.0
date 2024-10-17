Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48B2D2F7FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PB5WhQujeElFpl56LXFf3cDTX5MtznAh+J+4T0I+trg=; b=W9kqV5v6Bb1holSLflqMzNYCE8
	ttFpWJgvZhpM2fy3NFgG1A6eojlThWr7UuhsFptHEvRcZMh0zrwBoOWFggWiRcSi8oPmjPQlv69MV
	RH5eLWp8tAdnHKZlBEoZkWmE7Alj6M3bPezvIXnGl+Z9z0AxO9kFJ1msLROkar/iFOJz7KFlq5clz
	mWsKNd8XEdjTzGxnfmDs047zNSflh9hOJVi7fuQI5hHCckuFHSQE0KjnJ7aUboxChOKM21G4ZI5Wq
	lqbmys5nelM3ifqdwCToL8bgT1stAQibH+uCRm8F5xW/Z9w/zv/PLQO+g2gzESHpnhKfPM7IgQqhe
	X6aQyJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Lhn-0000000E9A0-0CZS;
	Thu, 17 Oct 2024 08:17:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Lfa-0000000E7yL-1dHt;
	Thu, 17 Oct 2024 08:15:46 +0000
X-UUID: fc1e0d008c5f11ef82ff63e91e7eb18c-20241017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=PB5WhQujeElFpl56LXFf3cDTX5MtznAh+J+4T0I+trg=;
	b=TMEq17bF1nBaefJOAFQXpHGpHQlT/ttuFUD1zuqdA7N9VjSyXm2u3+IArrmLmwSD843jncwcRetX/K8vYQZ0qUxuKp5lhrtbOSlgXpHU1QBDcQ1jCanKKyrprce1tbtnOsKDWNc6QNXJnyG3B2i+v3+2GOrmzz1A1CGsuZYy2MY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:6e75d7fd-6590-4f98-a892-47d1256d2fdb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:67be6465-444a-4b47-a99a-591ade3b04b2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 1,FCT|NGT
X-CID-BAS: 1,FCT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: fc1e0d008c5f11ef82ff63e91e7eb18c-20241017
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1269398809; Thu, 17 Oct 2024 01:15:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Oct 2024 16:15:32 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Thu, 17 Oct 2024 16:15:32 +0800
Message-ID: <433295fe-8d34-af8b-f6bf-be1953b6e479@mediatek.com>
Date: Thu, 17 Oct 2024 16:15:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] pinctrl: mediatek: paris: Revert "Rework support for
 PIN_CONFIG_{INPUT,OUTPUT}_ENABLE"
Content-Language: en-US
To: Bo Ye <bo.ye@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <Jades.shih@mediatek.com>,
	<ivan.tseng@mediatek.com>
CC: Yongdong Zhang <yongdong.zhang@mediatek.com>, Xiujuan Tan
	<xiujuan.tan@mediatek.com>, Browse Zhang <browse.zhang@mediatek.com>, Light
 Hsieh <light.hsieh@mediatek.com>, Evan Cao <ot_evan.cao@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241017075522.178337-1-bo.ye@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241017075522.178337-1-bo.ye@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_011542_571721_EFB092B0 
X-CRM114-Status: GOOD (  23.40  )
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



On 10/17/24 15:55, Bo Ye wrote:
> [This reverts commit c5d3b64c568a344e998830e0e94a7c04e372f89b.]
> 
> For MTK HW,
> 1. to enable GPIO input direction: set DIR=0, IES=1
> 2. to enable GPIO output direction: set DIR=1, and set DO=1 to output high, set DO=0 to out low
> 
> The PIN_CONFIG_INPUT/PIN_CONFIG_OUTPUT/PIN_CONFIG_INPUT_ENABLE/PIN_CONFIG_OUTPUT_ENABLE shall
> be implemented according to view of its purpose - set GPIO direction and output value (for
> output only) according to specific HW design.
> 
> However, the reverted patch implement according to author's own explanation of IES without
> understanding of MTK's HW. Such patch does not correctly set DIR/IES bit to control GPIO
> direction on MTK's HW.
> 
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Signed-off-by: Evan Cao <ot_evan.cao@mediatek.com>
> Signed-off-by: Bo Ye <bo.ye@mediatek.com>

The "Fixes:" tag is missing. Please add it.

Besides, please update "MAINTAINERS" file with the correct owner.

The Linux kernel is open source and anyone modify it.
If the patch appears reasonable and has been tested, it usually
will be accepted as long as there are no opposing review opinions.


> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 38 +++++++++++++++++-------
>   1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 87e958d827bf..a8af62e6f8ca 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -165,21 +165,20 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_SR, &ret);
>   		break;
>   	case PIN_CONFIG_INPUT_ENABLE:
> -		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_IES, &ret);
> -		if (!ret)
> -			err = -EINVAL;
> -		break;
> -	case PIN_CONFIG_OUTPUT:
> +	case PIN_CONFIG_OUTPUT_ENABLE:
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
>   		if (err)
>   			break;
> +		/*     CONFIG     Current direction return value
> +		 * -------------  ----------------- ----------------------
> +		 * OUTPUT_ENABLE       output       1 (= HW value)
> +		 *                     input        0 (= HW value)
> +		 * INPUT_ENABLE        output       0 (= reverse HW value)
> +		 *                     input        1 (= reverse HW value)
> +		 */
> +		if (param == PIN_CONFIG_INPUT_ENABLE)
> +			ret = !ret;
>   
> -		if (!ret) {
> -			err = -EINVAL;
> -			break;
> -		}
> -
> -		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DO, &ret);
>   		break;
>   	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
>   		err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DIR, &ret);
> @@ -284,9 +283,26 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
>   			break;
>   		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
>   		break;
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_SMT,
> +				       MTK_DISABLE);
> +		/* Keep set direction to consider the case that a GPIO pin
> +		 *  does not have SMT control
> +		 */
> +		if (err != -ENOTSUPP)
> +			break;
> +
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +				       MTK_OUTPUT);
> +		break;
>   	case PIN_CONFIG_INPUT_ENABLE:
>   		/* regard all non-zero value as enable */
>   		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
> +		if (err)
> +			break;
> +
> +		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DIR,
> +				       MTK_INPUT);
>   		break;
>   	case PIN_CONFIG_SLEW_RATE:
>   		/* regard all non-zero value as enable */

Best regards,
Macpaul Lin

