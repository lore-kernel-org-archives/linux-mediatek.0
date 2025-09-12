Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C864BCA101F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 08:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDDGxmSQnI+LF//IhWeJUVryIZ5KB4uMttxS7ciwLO4=; b=IxZHw779VnS9qo5BCksj8l89WJ
	PQFT6tr9paWe4aHQeY17Q1jsTad93/E8vEsgW+kIraz4J/Sc04jZrT9xTSqZTsq494/giahOwxrrO
	IQabZRULc7Dbh9Hhkfl/hs8JiuSN6EkLxXnRTEmcF5PZs8qQBlv+M/uIfXBsGWDyN15d+0bCwDUyd
	jhyVDb/gzxmgVZNOX7MQ5RcsX+X7gmfJO1N6tFGP94sKpLsorga/t0LiMKkmRkqgymKcgKhLDTaNv
	xuTyz/GJn1TiQJrR68cMzIOKANzaQsSIF43fTQPvm+JP9IyB3zwudUW8cC9iaxSMW6i8R7Rqs+QIY
	7P6MABBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwytg-00000007q8B-0Mlw;
	Fri, 12 Sep 2025 08:12:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwytZ-00000007q3j-0yfc;
	Fri, 12 Sep 2025 08:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757664725;
	bh=eWR3vaX15OYYOq96vK9zNVE0Car4mWmBLZ+FSu8GRD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S+MPOBouXjh2kEqeq27ZiA0yzeUPQ9i45uteJlppl8S943xiCtHrTqzxBkIQoMmXF
	 aJUMkXghcWX8a+cb1UfJtIlSMOQNFl8LWm6vi2eDDA2EkNnnVMXjU6hnwpIDhEM1MR
	 hmxx9CNSXQAXiHoJcmS7qG6L6gyy8QS3S4us+FfTHTCM0eYM5q9t4IhweCFf5tie+0
	 jw+3VPbWoQf+SCU9koDGrLL3vphgqvmA2rmvR0hBT1GjDMaR+PU5evzHUCWd3imhjm
	 X+6Z/dJ8L0ELwkO/x9y1DnafowMz484TjHqY8HGS9O3fAhISKOaCH8dhhpA40LAuOp
	 r/WJ2ML9lvQNQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C410F17E1389;
	Fri, 12 Sep 2025 10:12:03 +0200 (CEST)
Message-ID: <1963f06f-ae2e-414e-a218-01da0322723d@collabora.com>
Date: Fri, 12 Sep 2025 10:12:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] dt-bindings: pinctrl: mt65xx: Allow
 gpio-line-names
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>, airlied@gmail.com,
 amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-9-ariel.dalessandro@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250911151001.108744-9-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_011237_411129_C8826E53 
X-CRM114-Status: GOOD (  11.10  )
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

Il 11/09/25 17:09, Ariel D'Alessandro ha scritto:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> index b9680b896f12f..aa71398cf522f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -43,6 +43,8 @@ properties:
>         the amount of cells must be specified as 2. See the below mentioned gpio
>         binding representation for description of particular cells.
>   
> +  gpio-line-names: true
> +
>     mediatek,pctl-regmap:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       items:


