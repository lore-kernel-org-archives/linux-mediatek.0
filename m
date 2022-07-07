Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA9C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fYxfJS4iSstvYXLWXAEa4lyQizRxEmOGbKvWdLJESs=; b=Oltd3TdcPrp2RFf9dOa0/tEUvc
	KLPt/3VQah9mK9dgOj7Oly2jgSv9T+UhUfTjMQxRqn383L7SUji6GNJkzFOLrIglju3vd5nvSmilm
	dw01fuatlP1xOqVDb+gs+8p18yEjDt7Ql6uhNK11WmW64/nqkc3vV8iLMEfuxYQpJC5qSXvDkPGdf
	GqovWBu2wTCGXAU/KxnDIhx8Kj2jq0TbuMUKjY4fWM1RxqIE24VV/sbhhobVvZ411BEwddT3neuKb
	7tXw5VwC6WQ18MKHdjR+loatyBZdZl4v4QkONmKIgubYIXQuA8eaPDMSn7aCkSWETzGzcw2OH4HfP
	548uAdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N9z-00FHIt-KM; Thu, 07 Jul 2022 08:46:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N9o-00FHFW-2p; Thu, 07 Jul 2022 08:46:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B696B66019AF;
	Thu,  7 Jul 2022 09:46:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657183602;
	bh=+RoEDtvlz7kX0ABpmjKMkzrvHUlXdJAQN4BA4t4KiEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hIuT6QshTj2nHgBO7rIg/1trvSfx/lMT51tKLt7DNLCM5C74CZtk0++3hez1V4wol
	 RpumqL9cqQKeX+wH7IrQtPNjHk0nC7j5OVPZ4qAcyfqlJSZOB3x2RlG7DL8A7msRyc
	 WOmsvSbgjshYbnsjiJBBP3BKGubz7+cgy66YBBbUIERCexop8xcSIDVHBOpFhgGVwe
	 SgP4GudwtXDtLW8JuLUR4b08xOOLZET8n2erjFh08AbjQX0rhnpmnryi8bsSD5nAxz
	 ZXNJqVirkiaHKkvu1GHsya8jvEXMiYFUOxOUjOKFUWEa0k5MW4vi4u7w/94/auP8UB
	 0ymH5gA8XpKhg==
Message-ID: <66db0f7e-6c42-562e-0f4e-4e741f17c979@collabora.com>
Date: Thu, 7 Jul 2022 10:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: usb: mtk-xhci: add compatible for mt8188
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220707015041.12264-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707015041.12264-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_014644_301469_0D90433C 
X-CRM114-Status: GOOD (  12.35  )
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

Il 07/07/22 03:50, Chunfeng Yun ha scritto:
> Add compatible for mt8188
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 892718459d25..97d93119d088 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -31,6 +31,7 @@ properties:
>             - mediatek,mt8173-xhci
>             - mediatek,mt8183-xhci
>             - mediatek,mt8186-xhci
> +          - mediatek,mt8188-xhci
>             - mediatek,mt8192-xhci
>             - mediatek,mt8195-xhci
>         - const: mediatek,mtk-xhci
> 



