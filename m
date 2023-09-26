Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708C0E7D26E
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9iMKLytFa1oLDVpCAv5o6ELdq0pVwsssmnwxd8H15I=; b=mgf5qyHl4A6iXWiXUZnUwULqEX
	iu6rWfFcTN/ktWPS/U7GezjkCclPlNOP5s78riV8rTQ6WRO25KOks1tfRKgUjjRsIljvdfALRyw6g
	UDI9MYpHWtCKhUGJ9WhKDYYi5U9HpRe0X7RecaKlXIVnlp7jbYln6Z5TVyW6+XGNOPtSSgZ+GIThd
	ukonRTrc4MFOf5cje0XpnXVez5fIuiLGScFP8kmhC7oaJC7PJ1FXYY3bNXgQaPfuRpnidu4QaL2NI
	9bj8hzWfjf5TNgIKghrRfS76oqZGDcYNI3+4w15tYHlcMCP7a0c9+7DlTrTUyGcK70VknzYYHHwZ/
	/fi0m7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Fw-00FxGK-28;
	Tue, 26 Sep 2023 09:21:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Ft-00FxEr-1C;
	Tue, 26 Sep 2023 09:21:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 579876607313;
	Tue, 26 Sep 2023 10:21:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695720076;
	bh=FKvRcZczMijqG8YmeVx25lsAadHS5xULTP5v1ZDi/Yc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IxceUlmBtOiC/bvzFXAWd7X6itv/URlN7AFBiOcK3qw/JI6FdPQ7x2maqYXNOIF6G
	 yUaxFobcey3F38OEXcTHnoNSvnF9OZKUpzWlJwpBuzs90t8iFoc0XfWEY+vmpUv2UK
	 UR23LHeESMsF+1o6ednzjwZICOFm4La8tDnuh7xal4g/raZtu8xS4RK2YxtCaGMLfm
	 OTo1C2+tdT3+RQ54FdySt5HVa3t10HFru7Jal1XFqM/hJWDLHR7alucwLg43SaNi9A
	 Hr+DIw0bTQdt0XNdP67RoYlbIFke85DgrFfVtecKdj2ztqkwyX0v2pZ3sQJAVFINiZ
	 ikOrEbFs7/NwA==
Message-ID: <05086c59-f6df-7a72-59be-762fdcd0a31f@collabora.com>
Date: Tue, 26 Sep 2023 11:21:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: mfd: Add missing unevaluatedProperties on
 child node schemas
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
 Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>,
 - Keerthy <j-keerthy@ti.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20230925212729.1976117-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230925212729.1976117-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_022121_555805_FE8D561B 
X-CRM114-Status: GOOD (  12.60  )
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

Il 25/09/23 23:27, Rob Herring ha scritto:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties as needed, and then add any missing properties
> flagged by the addition.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/mfd/maxim,max5970.yaml   | 5 +++++
>   Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 2 ++
>   Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml  | 1 +
>   Documentation/devicetree/bindings/mfd/rockchip,rk808.yaml  | 1 +
>   Documentation/devicetree/bindings/mfd/rockchip,rk809.yaml  | 3 ++-
>   Documentation/devicetree/bindings/mfd/rockchip,rk818.yaml  | 1 +
>   Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml   | 1 +
>   Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml   | 1 +
>   Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml   | 1 +
>   9 files changed, 15 insertions(+), 1 deletion(-)
> 


