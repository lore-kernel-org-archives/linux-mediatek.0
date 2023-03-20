Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0C3C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 15:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Td4fd+tFhYBcKTIKKiS5dIBjeWLYiTrtksW7Kwz+PiU=; b=yYlD95H4ZrflEm
	ieH9/vWBgK5LC5M/ywSpp88pmVBwFcao9kPd3zyTVJ7rteP0tlZqU78mDmJQLs1wIXJxkiHwRScNk
	E0d0bvFq9MYS28zLDNU1ntUV0re1Q3EOtQgpLUpXuEE9odkISctUVD4ubhqhgrLXGBYLYroOQNhJi
	E1DDtqH+c9RqBMeCTe5B1p9f+++r/wDEm9HpGR6fQby71ZzaskiWIDjo+A+TAz6JLcLVziOcikRox
	wJ9b+Wg5TkW1jJp6JD05CgcmrMccxfDCsR810q3FlxzxNMtGUYhsz/4Td1Q6vr1Z3+n6EoB334DG/
	I5749Uh180fm2TeHk1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGzt-009Rbw-1s;
	Mon, 20 Mar 2023 15:00:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGzd-009RU1-13;
	Mon, 20 Mar 2023 15:00:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF766660212C;
	Mon, 20 Mar 2023 15:00:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324411;
	bh=69r7ZJ7lFz8tBgGhwZoAQpSTq3WnA5tKdeH7p99cqsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FXf6S4YEmmMAIySgVsoRQJfX1gpJGGnOTA1pmvDKiMkygZcbGxRYV8B2kkwoGMO1P
	 UEoyuLFZYh16TQ0EDqps/0OaHYp0ZPC25L8JrF0/y0HQXSf3JLYigFpLzNqx28Dfy8
	 yIYd2oyKoyYNPeCNzEmu4ZzEZjAbpfxHg0Rab2X1yTH2TvbWMUzFQgD4BJ4joSQuBs
	 9TWNRYBHurfikKt3tjxT/FRZukfXP8pMD0WxRiYFPtZuUtnbARWzqAyrpoeC7I6KsB
	 GQFN+Mwi/45P47Suv4Mh3B/vKsl2M9bneGds8zAFi1CECZTyc0jW4n1ilBcUbbCBIV
	 NIgIlTI2irtbw==
Message-ID: <1d0c0e49-4f50-7fc8-d514-b19cf4054066@collabora.com>
Date: Mon, 20 Mar 2023 16:00:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 20/21] dt-bindings: pinctrl: mediatek: mt7620: split
 binding
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-21-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-21-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_080013_496768_F7DEDDAB 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/23 22:30, arinc9.unal@gmail.com ha scritto:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7628 and MT7688 SoCs contain different pin muxing information,
> therefore, should be split. This can be done now that there are compatible
> strings to distinguish them from other SoCs.
> 
> Split the schema out to mediatek,mt76x8-pinctrl.yaml.
> 
> Remove mediatek,mt76x8-pinctrl from mt7620.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>   .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 379 +--------------
>   .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 450 ++++++++++++++++++

AFAIK, wildcards aren't allowed, so the new file should instead be called
"mediatek,mt7628-pinctrl.yaml", the compatible string "ralink,mt76x8-pinctrl"
should be deprecated (but still present as to not break ABI), and the driver
updated to accept the compatible string "ralink,mt7628-pinctrl".

At that point, you could update the devicetrees as well: for MT7628, you'd
have a node using

compatible = "ralink,mt7628-pinctrl";

while for MT7688, you'd have

compatible = "ralink,mt7688-pinctrl", "ralink,mt7628-pinctrl";

If you don't want to go through those lengths, you could still do the
cleanup that you wanted to perform, but with a filename containing no
wildcards - anyway.

Regards,
Angelo


