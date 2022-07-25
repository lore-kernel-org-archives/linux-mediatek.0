Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C06C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZB75PK3JfUIqfUmaootNe+mIh0b0aOCSELXD0i+nYy0=; b=BmGplV6RzcwYkPWWsj9lFjtpOv
	/tr2ZaPKKxwfphex/SGCsoPKVXshIHMgR9cEP3sDfnIbbVw+ph/ZH6g/UtPwjsoUh8z2+vQzexgfu
	6JkLaFg+hVB9fInzkWEM2yBTXF2iTpYF/jkatOKuyUtJ74o+ywBWn6DAKLQwORt8jqWikxnywIVfA
	Su71OsvE89RcVUWw3GASvVUkCMR6CouhyB51ub0QaZzXQmvpsB7MGtIj9ZenRY+uEsksvuWPQdyii
	d8kRtFm8DGItO65C65QhDzu9q+80X5TfJaBBj9f8lSrgWqZinZVNaTeDCA4Myy713Z176/y8pxgqy
	HkVMdxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFts5-007CrW-PR; Mon, 25 Jul 2022 08:55:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtrj-007CYf-LW; Mon, 25 Jul 2022 08:55:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7458A66015E7;
	Mon, 25 Jul 2022 09:55:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658739302;
	bh=nenqEXGE3IZ9WGlkTsG5lPONpJPHRhKFYXZDmTqECdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WAeB++PMD2Q3OW6jvKBbTHRH/GguC5+j7kc2/SeN3LxTUPqFMfMI2W258cB5wzNsZ
	 DOgzugrOVAF9PLuE/j5mhADUphce4THMaCOXb7tY+4OW74ei1QrUHbwOebai15LGqw
	 XoIH5eJqvkj3Z9STb32V7WBPAeFigUlntNvcY0nqHzAhinjWwdlfRl7lJtoYYvZBn0
	 dowOlDBRF7Zlinl1Wre+aE89MvlxdV+XwfemuXkPTeULRwAYjKtZYxe1rjKhTEyQ3X
	 LJOItWOrTOAHIJFh4Q9/s3083dWTXC4/RrVDDpcXRCDIlQFhuj2hY1XXeQRF6EHlnc
	 67pTYig+XLztQ==
Message-ID: <bbdde7ce-4512-2e61-5e1a-e22e5cb91184@collabora.com>
Date: Mon, 25 Jul 2022 10:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add MT8365 power domains
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20220725081853.1636444-1-msp@baylibre.com>
 <20220725081853.1636444-2-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220725081853.1636444-2-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_015503_901328_AC904595 
X-CRM114-Status: GOOD (  15.89  )
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

Il 25/07/22 10:18, Markus Schneider-Pargmann ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add power domains dt-bindings for MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>      Changes in v2:
>      - Made include/dt-bindings/power/mt8365-power.h dual-license.
> 
>   .../power/mediatek,power-controller.yaml      |  2 ++
>   include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
>   2 files changed, 21 insertions(+)
>   create mode 100644 include/dt-bindings/power/mt8365-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 135c6f722091..2c6d3e4246b2 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -29,6 +29,7 @@ properties:
>         - mediatek,mt8186-power-controller
>         - mediatek,mt8192-power-controller
>         - mediatek,mt8195-power-controller
> +      - mediatek,mt8365-power-controller
>   
>     '#power-domain-cells':
>       const: 1
> @@ -67,6 +68,7 @@ patternProperties:
>                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
>                 "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
>                 "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> +              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
>           maxItems: 1
>   
>         clocks:
> diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
> new file mode 100644
> index 000000000000..e6cfd0ec7871
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8365-power.h

Please rename this file to add the vendor prefix.

mediatek,mt8365-power.h

Thanks,
Angelo


