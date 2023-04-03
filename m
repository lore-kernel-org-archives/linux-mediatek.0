Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E0C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nr+uA+ZP2tbdI/0kq6sL0Hql+LVt1wSnJCPSdLceG0=; b=ZvM6Cz+kqhfTSmdIMoiV7MCBpO
	nip6LL/6tsq7gs6PZugGRqnblPHPYjwRITQ6OhYQHRNbSzdC2AUpspG87/oIu4efRAOXrXRetiZ4D
	vWPL52iK7LqjFgwtgj2Nn0svMypQi8yPtR73CgLU2AZ2kFCaUHY+cvq3TNAKzzapSars56Xi9DBWn
	rdzCJmu65GLMbtRxhbUpESRl+QRGdh0ELf5qdTWKryTE89JXV3CkfOA/WgcnJumyRDbyjr85k2YxA
	KTlx7B9YzNJqW3ALHQax6Amgl8+JwA1OaQFolvNOD4+mpxDWjGiBe7Xm6NW0g4tH1WiRJVe01hflK
	QSYp/dNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGr5-00Eptw-13;
	Mon, 03 Apr 2023 09:52:03 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGr2-00EpnZ-0d
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 09:52:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id er13so73894883edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 02:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680515512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9nr+uA+ZP2tbdI/0kq6sL0Hql+LVt1wSnJCPSdLceG0=;
        b=Cht9Y2vM9TnL6su8oK8fsrE+NlCl07kvCeH1Ss3sQEfVIz+3oASpya8J2AUWrJpxgM
         SCco5IOUvSki5XMqFCC4gafwpE/N2km04ZRJsINqM4MoK61Z0KdpyV7ITRhLu65xJutg
         BktbY7DuUBSmVmAV1DiTyvagSErGI7E1jJkNyHch88mu8hG5+LmfWFS7W0wDU6iX8Xd7
         jjoiZ2Mz9fTYaT4UfPLDTG2x0ZfE6p3iZJzIkx9/oqavMrZ21qiPc7GkYID+SHdq81lL
         jm0UAAvOfhbRjfUD/kgK0iiBMMKWc2qEJw7CNQuj2S4JYsZ6z0aZ69ArQqmr274p3o54
         lcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680515512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9nr+uA+ZP2tbdI/0kq6sL0Hql+LVt1wSnJCPSdLceG0=;
        b=HVmPG8DFYfB0gi+aeqC11V1+xkUNU3gFFDY2deZ9dqTgReWsX3nan9ZZci/HC+iqho
         yF8aFkr5OcZyclCfxxjQAmoYZi1BwPW2L2W43vcIEyfV+6hfJsE87tMTgfoYa+wy3j3c
         AAy38FWab6oSTLahYMwS7AUs8SKMz69+LUIIi3oi6Y6CiqxzyOTSkmxqrk/4Y2xnr+NW
         /7c+FMt9SE+YNUs3imE9DX/H26SnAI8/yf2B4l89cbXIw2dk/u7Ra/30BGF45z9TUtYM
         rFLv3NPxmjY0fxsBqtii/grg8pyA2BZEoGB2OcVIDLWc8YQR/5ytfa0pRCBg/AxY5EOd
         CvtA==
X-Gm-Message-State: AAQBX9d5HoCjhl6Aogf4qy46CQv9bk/8ijifQ8w+3aNfcDywo/0l1WZN
	31nBiCYgwpwhE/7sUQwjsSQVEw==
X-Google-Smtp-Source: AKy350Z7S5nIBg15xObBEMjnFcgoXpWwPfgC871POYyYAMKORNyzeGXP8WOT94M+1eeV1eh2TBj2wA==
X-Received: by 2002:aa7:c587:0:b0:502:9296:a456 with SMTP id g7-20020aa7c587000000b005029296a456mr6634276edq.4.1680515512470;
        Mon, 03 Apr 2023 02:51:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805? ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id o1-20020a50c281000000b00502b0b0d75csm314317edf.46.2023.04.03.02.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 02:51:51 -0700 (PDT)
Message-ID: <6c9c74ee-b9ed-815f-dd92-37eb4c8f802a@linaro.org>
Date: Mon, 3 Apr 2023 11:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Louis Kuo
 <louis.kuo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-mediatek@lists.infradead.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>
References: <20230403071929.360911-1-jstephan@baylibre.com>
 <20230403071929.360911-3-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403071929.360911-3-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_025200_257813_43A3CD78 
X-CRM114-Status: GOOD (  17.97  )
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

On 03/04/2023 09:19, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This is a new driver that supports the MIPI CSI CD-PHY for mediatek
> mt8365 soc
> 
> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> [Julien Stephan: use regmap]
> [Julien Stephan: use GENMASK]
> Co-developed-by: Julien Stephan <jstephan@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,csi-phy.yaml        |   9 +-
>  MAINTAINERS                                   |   1 +
>  drivers/phy/mediatek/Kconfig                  |   8 +
>  drivers/phy/mediatek/Makefile                 |   2 +
>  .../phy/mediatek/phy-mtk-mipi-csi-rx-reg.h    | 435 ++++++++++++++++++
>  drivers/phy/mediatek/phy-mtk-mipi-csi.c       | 392 ++++++++++++++++
>  6 files changed, 845 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi-rx-reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-mipi-csi.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> index c026e43f35fd..ad4ba1d93a68 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,csi-phy.yaml

NAK, bindings are always separate patches. It also does not make any
sense - you just added it.

> @@ -33,9 +33,14 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    phy@10011800 {
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      phy@11c10000 {
>          compatible = "mediatek,mt8365-mipi-csi";
> -        reg = <0 0x10011800 0 0x60>;
> +        reg = <0 0x11c10000 0 0x4000>;
>          #phy-cells = <1>;
> +      };
>      };



k_mipi_dphy_of_match[] = {
> +	{.compatible = "mediatek,mt8365-mipi-csi"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mipi_dphy_of_match);
> +
> +static struct platform_driver mipi_dphy_pdrv = {
> +	.probe = mtk_mipi_dphy_probe,
> +	.remove = mtk_mipi_dphy_remove,
> +	.driver	= {
> +		.name	= "mtk-mipi-csi",
> +		.of_match_table = of_match_ptr(mtk_mipi_dphy_of_match),

Drop of_match_ptr(). You should see W=1 warnings when compile testing.


Best regards,
Krzysztof


