Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB2C6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 16:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJHhT7sj6HaXEjtRT3CI6cJihbcdVBxmrgJKvBNqUU4=; b=rzqdMD+Z9gBVV9MZvUDJwTg6Az
	gg2zhcsM/MjG7QWwvZvNpPggdpZ9geU3MfywOwSvXISEtFDT4QwvUT0IB9NT0PXSplcYMZM6X/srX
	6pEH44ejGbClGJPcFTjcTKFcCw0j3aCs/dAA7o5IhD3aOQM9OY6u56sVQFPej/p30CEjm7azUpt+C
	MRbPhZCKeCv9DJcrG7FLPWhZqyJYR1hv+RuBEooyA8lIHgYCuIingb3cGWbOXFavEm+DiSUUTeDRQ
	xGveBpzK+N8ngAnysk4OALjgHchkGAlT6xicdWB2QyKSAMm+7xXAeyulc7XhCmR8nXDX2PJA7Z2fv
	WabfNf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXlpU-002pSe-H8; Thu, 02 Mar 2023 16:30:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkpR-002g2R-AG; Thu, 02 Mar 2023 15:26:46 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 305C26602081;
	Thu,  2 Mar 2023 15:26:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677770803;
	bh=U11kXg9GMD7Whi/I3g38OrRrWVczX1UuFxzmgWtNI+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hyoGZAPCwe9dYxoGWNhYLwv8fhpKyk3lsyOeMyTq9cx1QrgTxFCl0juYo+U10nWrk
	 Ob0Rz2RqGbl0KKMOyMjYl70KWUOw9QIwosD7olxaz0TXrfBM9FFk/VMOUiF59y2OMJ
	 avNMp8GJDK2uv/Ry4L+mr0kD5vq90vYMeuwPgUEf2dmuMK+BgqcptlmLscBd3w1yP4
	 7hS34hG4i8cSW2buP1rrRsixbMRvbm+SawxVoK5f0deL5XmAja6w+ziA8fzFH6/L29
	 RBQQMOf5Mdivv7RbjHXZRuUOl/SgSB7bn/smGswoa1F6t9u2/jZq1zg7jNaYmd0ql8
	 WLgqaxCuu4bvA==
Message-ID: <f0def8ec-ae85-de89-f858-81847134d641@collabora.com>
Date: Thu, 2 Mar 2023 16:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] dt-bindings: power: Add binding for MediaTek
 MT6735 power controller
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230302122708.73848-1-y.oudjana@protonmail.com>
 <20230302122708.73848-2-y.oudjana@protonmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230302122708.73848-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_072645_541970_CAB312DC 
X-CRM114-Status: GOOD (  15.75  )
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

Il 02/03/23 13:27, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT binding for MediaTek MT6735 SCPSYS power controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   .../bindings/power/mediatek,power-controller.yaml  |  2 ++
>   .../devicetree/bindings/soc/mediatek/scpsys.txt    |  1 +
>   include/dt-bindings/power/mt6735-power.h           | 14 ++++++++++++++

I know many others don't follow the right binding filenames and I am sure
you named it like that looking at the other ones, but please rename this
to mediatek,mt6735-power.h and resend.

The rest looks good.

>   3 files changed, 17 insertions(+)
>   create mode 100644 include/dt-bindings/power/mt6735-power.h
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index c9acef80f452..710db61cab53 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -23,6 +23,7 @@ properties:
>   
>     compatible:
>       enum:
> +      - mediatek,mt6735-power-controller
>         - mediatek,mt6795-power-controller
>         - mediatek,mt8167-power-controller
>         - mediatek,mt8173-power-controller
> @@ -81,6 +82,7 @@ $defs:
>         reg:
>           description: |
>             Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/mt6735-power.h" - for MT6735 type power domain.

P.S.: Don't forget to update this addition after the rename :-)

After - and only after - renaming,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

