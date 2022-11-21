Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD250C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 17:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIkBDnpyQ9y+KENz/sF2OAKsHCgd0+PXn4cIVvqeI/Y=; b=QBOkjJmhTLgE1n0t5ktBtYtLEM
	J1cF82PiqDOWJUTLpQUn59CNxR68ySEqi8HP3ens8B4fYUQzaefX0cJeskgLLRgMWe0umDrmlGhBr
	IVFu+njEuolQ9/EaXub4qzAEXnb/oe8ue+hKJIPgX7jxNUV94SbRmcbeskazDoBfEPiHai7JSI3am
	6xjbblDWrv/7NNxz7YQzKxVKn3o3xOGFgW6XqTjlVQrnYpUNkGXSy3vNR+ZiwSNoFc1USgcsfEajm
	74RBgQfgvX+aVfeYYB2OYX7NJY1n2oYBtrGqI3JrnKx4DcgKHv3oxeh4ZPH/rpSnunxpXf4tupSGO
	XnViSGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAji-00GOHh-Pa; Mon, 21 Nov 2022 17:37:38 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxAjC-00GNyy-F2; Mon, 21 Nov 2022 17:37:07 +0000
Received: by mail-wm1-x32a.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so10767912wmi.1;
        Mon, 21 Nov 2022 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIkBDnpyQ9y+KENz/sF2OAKsHCgd0+PXn4cIVvqeI/Y=;
        b=VCpAh7o0ylWUU++fJ4G9+saO7sZFZ0Ajy63SzjLnmf4vPNGe91vpnn1UMQHK9et8vB
         fSJncCdRPEvACeg0C9lIiXaSyzyoq7sdN4dtZ7NU+FVlWeFfwzj4uBD4FQDrtP3/BbAu
         pwipIG3M9+5+QUAAquwE6at8ajjQMcAomR1c7cp8h0279NGdj9fSjvz5Hzeii7ZuKSc6
         +Y8XbnAvJa3uDrXKtQDR1EcA8Ve2JS2jMdn1gm/4Pg6TfwYUKsgKmCbFruYk/KlMfg/h
         tBlSqoCzIdDfjHH7Ps2GBlQFE9ZePQ6kjQBHU5k/O/TrCrIgg9dh7Wr4XOjjoYYv3PL0
         XBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QIkBDnpyQ9y+KENz/sF2OAKsHCgd0+PXn4cIVvqeI/Y=;
        b=fkXeDbtPj4ByycfHLo7onvcUU2Vmv2B6EyBItmhwk2SD0tOKgm+Z7J460y8TsIU0Pb
         qAr8mHzFo8I3tHeCtb66w3X5EyY2JY0HECEtwehvFFHKUWUpvsvdVkh4YoqjKj5NWRZK
         Mt1jdOa5hMf4HJCYeSolAZrWAdVouBoR24tHVuI60cgRAgJg+kunz2Qh9Kw4HHCtihox
         FpPZrhbNIEpRH1L0m335LsMBgpzqJBrrN1wvx6Ud+FQzy43TFBNyGItU+7WSCR/Po5no
         LfhtPyEZJmJcaubR0xR+8PukhQTa2OZlZpnPeMdBgRKplhxr7aqxPArxnHH+NSrcrxQd
         Ilfw==
X-Gm-Message-State: ANoB5pmDBmMaX6Z4RnyzxonpMtYgXuwiXvNez8CmW1QRXj2v8xz2shye
	V6YKWsTfMLjoygtwjDEC0m3/qpXgyOU=
X-Google-Smtp-Source: AA0mqf6cwsRs6JuwwWCtN0EdQGOktANhXKV6y1lFHVyruST9YnKJd5+WPjzw72vQ72wWVsSF2XEaGg==
X-Received: by 2002:a05:600c:4f10:b0:3b4:ff86:25af with SMTP id l16-20020a05600c4f1000b003b4ff8625afmr4544172wmq.68.1669052219455;
        Mon, 21 Nov 2022 09:36:59 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r13-20020a056000014d00b0024165454262sm11821208wrx.11.2022.11.21.09.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 09:36:58 -0800 (PST)
Message-ID: <2ae616be-bec8-3a5e-60a1-75b5397d0566@gmail.com>
Date: Mon, 21 Nov 2022 18:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/3] phy: phy-mtk-hdmi: Add generic phy configure
 callback
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jitao shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stuart.lee@mediatek.com, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220919-v4-0-bdc21e1307e9@baylibre.com>
 <20220919-v4-2-bdc21e1307e9@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220919-v4-2-bdc21e1307e9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_093706_574805_08C8B041 
X-CRM114-Status: GOOD (  17.27  )
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



On 21/11/2022 15:19, Guillaume Ranquet wrote:
> Some phys, such as mt8195, needs to have a configure callback defined.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
>   drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
>   2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index b16d437d6721..32f713301768 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -8,10 +8,12 @@
>   
>   static int mtk_hdmi_phy_power_on(struct phy *phy);
>   static int mtk_hdmi_phy_power_off(struct phy *phy);
> +static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
>   
>   static const struct phy_ops mtk_hdmi_phy_dev_ops = {
>   	.power_on = mtk_hdmi_phy_power_on,
>   	.power_off = mtk_hdmi_phy_power_off,
> +	.configure = mtk_hdmi_phy_configure,
>   	.owner = THIS_MODULE,
>   };
>   
> @@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
>   	return 0;
>   }
>   
> +static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	if (hdmi_phy->conf->hdmi_phy_configure)
> +		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
> +
> +	return 0;
> +}
> +
>   static const struct phy_ops *
>   mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
>   {
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
> index c7fa65cff989..f5aac9d352d8 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.h
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
> @@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
>   	const struct clk_ops *hdmi_phy_clk_ops;
>   	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
>   	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
> +	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
>   };
>   
>   struct mtk_hdmi_phy {
> 

