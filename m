Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31287C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzy+/rqWIUjeQ4VZkRw1iKom7okmH6/KiTaF3FBcIjY=; b=1j25Tgr8MZHvOUO6htc7wMLCcp
	jlafP+HuRC85QEeBENYJUpe3Nx6yGhTBN01b2dYshTRwDa6EgTw9D/B+3cGoGozgbrajgaQaC7i9D
	cdDEzuVQd13lh8KC+e7SHw8V+v4007fcP1p3/XFSoJRFNCNV0lcQqfW6D1lFziU1GmczN/JrGXHXA
	70x09fwox8fW9q1urh3pN5z4RcOOToPlUUFoum81qhz/83cRSCPFc94mug/VuZlQevEtXVLUYQMWD
	XXvVhtqfOViJhuiF4HEJH5RHjSBI/JlergOpDdlLwRyn8Fd/wpgNXOyntL/GHua81Ka5fdbJKJ9eb
	zQWhr2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvRx-008JWj-Ej; Mon, 25 Jul 2022 10:36:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvRQ-008JLM-DW; Mon, 25 Jul 2022 10:36:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 817D266015E7;
	Mon, 25 Jul 2022 11:35:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658745359;
	bh=jEQh6kA6cG5l8Za0dnxbvc3C991fy8Px0Uzw5Xq3bXY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iRyB95T2NEuTF+YHchnVkWaT9MeJrFWEHlwRmXCxBg5+S9wJrJh3SMNo783Om/Xqe
	 LVWzCV4wsoRfy8I14Es5TDCugvgxzCDsKGU3SBC4vkPU3kdAlRvw7NCiXSOOtG6S9h
	 iQY3DN8sTKYurDBZm4dU+5BNlE4BrVeN57GJ6bJsB+CVB3aAO6JMWWhovVxR6SJE9+
	 B1/HL7WcKcDov3k/YeUO+ZdADFx8Fl69dNGc295BHPsRhx0a1NEdiSG+f+5vyv/aHD
	 6Y2PoP6kxMLtMqls0LmziKVJYxmI8VNX+TflvUipBzGoi7imrdfVKMOskR7cFVKyke
	 7v9TE6FJrgfdg==
Message-ID: <6a36c425-ca49-c7ec-69cd-f79dcce5bedc@collabora.com>
Date: Mon, 25 Jul 2022 12:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mt8186: Add gpio-line-names
 property
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220725100253.10687-1-allen-kh.cheng@mediatek.com>
 <20220725100253.10687-2-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220725100253.10687-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_033600_615860_3A616939 
X-CRM114-Status: GOOD (  13.66  )
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

Il 25/07/22 12:02, Allen-KH Cheng ha scritto:
> Add the 'gpio-line-names' property to mt8186-pinctrl, as this will be
> used in devicetrees to describe pin names.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> index 8a2bb8608291..6784885edc5c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> @@ -28,6 +28,8 @@ properties:
>     gpio-ranges:
>       maxItems: 1
>   
> +  gpio-line-names: true
> +
>     reg:
>       description: |
>         Physical address base for gpio base registers. There are 8 different GPIO


