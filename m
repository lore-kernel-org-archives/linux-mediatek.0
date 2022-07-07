Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA333C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZy9zLvCbA7cK853IWC2TavU1qQufu4iU2PTYSJ5Xh4=; b=doLWMIzTRaBXcTG86Dl9sty7M3
	yz8CqmVeG4HRfR009S5YRriQvXrVnMIohLyjWvM6t6L507AhEy0CENXi5jXFjE8Gzb7QNGl1xrzvt
	9eTNq2FuwqwdTThE4fewWnpgtdcbPyihndgTgnPckJVDujNI4X5/6SIVuRBJ+2YfYy8QbYJ5l32Et
	T+DOM3xsVjrwD46dQdJW4RjpfcZvubKQLUz/Iu5h/TfM1AH7OXZtYx6A2X18yC85u2h81Ed49FzGG
	K+Go2TPai/7udpHJ77XfoHbvXzMAMSTLB81PvXielolTJAykAoS0R2uC2fPL5hZr91ulDZryMOAgJ
	uFrkOipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N7e-00FG2s-FY; Thu, 07 Jul 2022 08:44:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9N7K-00FFvW-VR; Thu, 07 Jul 2022 08:44:12 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 12DDA66019A9;
	Thu,  7 Jul 2022 09:44:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657183449;
	bh=+zAEIKs7YroL5Yo+4bX4N+9I19+tgQa/D+6CA86qynI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ml4Ir+94JlnK/EruXiDEM/GFJnSrvxp469kDuhEpl/+9d9P4QZTUqA6h+gcFJoOwv
	 VYWMv0A9AyLEk4f67ymHwbG4s62Y6csu5W4u4kQ4id1Iym09gtw+e41wkSkOTA5pIj
	 t143KcirWZSL7PMuj9+vfqg3rT3MfwefkFHGwf7qsRdf2F3HWoo3DSjaqnLeBe8Yzs
	 Mr/qLVWaN0wCC4xzcnBAhILsjONTU3cGf2BrPGkfPc+k4ORoqJGUp2+cxLxmRpVkk9
	 W5IejPtip4R3U/eg4fMag4XHXwAGw895tAnX+Pzd2nKNTTevmRbnKEOTq69+/xCHxD
	 CaGBmYftv20ug==
Message-ID: <6fa9abc6-6ab8-9c47-c295-c413f119e608@collabora.com>
Date: Thu, 7 Jul 2022 10:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V1 1/2] dt-bindings: i2c: update bindings for MT8188 SoC
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com,
 david-yh.chiu@mediatek.com, liju-clr.chen@mediatek.com
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
 <20220707054617.13583-2-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220707054617.13583-2-kewei.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_014411_194305_CD0F914A 
X-CRM114-Status: GOOD (  11.72  )
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

Il 07/07/22 07:46, Kewei Xu ha scritto:
> Add a DT binding documentation for the MT8188 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> index 16a1a3118204..4e730fb7be56 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
> @@ -27,6 +27,7 @@ properties:
>         - const: mediatek,mt8173-i2c
>         - const: mediatek,mt8183-i2c
>         - const: mediatek,mt8186-i2c
> +      - const: mediatek,mt8188-i2c
>         - const: mediatek,mt8192-i2c
>         - items:
>             - enum:

