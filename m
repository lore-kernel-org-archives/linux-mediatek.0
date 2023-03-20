Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D393FC7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dTyEzo9Mfc5DywjHIOKXsG94qHbBKoJiOpIH8IID8I=; b=WAh03AH5LTd4S+
	m+m9xps0Z0uv/R2Gm1lJLHydsYiciX2IhLYXwvOeR9o46DuuRs9H8c3a03LPYursMmm/IEjoexk/J
	uRsV4iFfhznOBa6Pokg4yFCr3XI1WPY4bxjD6goI40/3Zvrx+MpFw+4fQcwU9P68W1uK8pDrCCnok
	R35xsDIKsNzDPDaArlxiCZC/RRhRMizdPVr7MvzaqzJm16GshgiSh6Hd4IHaFxBvfB5Bzq95kxxA4
	nxd6CpCxOZZxGCRTTyy/m9Agz0yu6mpqGHSzdTJnL8QlOA0ggFBm1rfDDYMvs5/pDvwD4dk7CqYyw
	Tbq3zxWdiXCxZrqlADwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGu6-009OvV-1O;
	Mon, 20 Mar 2023 14:54:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtb-009OhP-15;
	Mon, 20 Mar 2023 14:54:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CE60660309E;
	Mon, 20 Mar 2023 14:53:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324038;
	bh=jY0xeIMw6UUQ7zRkcGEi+Oqd9cQGXZPzUS7LqCQ4dO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PfI6IZKGUuBz491LGlChcsjJXlswiVPM6GYLR8gdX0FaicIcfNERlJtMJly2Emr0H
	 N3Vj9dzY+oo90GCpnk+7C9zrTJ4y2tbm2XHvgKN3A4da5DwEavQ8IGF6hOdndk5wlx
	 brJTyMXu/OpIFdDBD7iSJhZe/vfC2KTj5Px16bCdRL8bctouDEkqWaOvEETZjbzLD/
	 bW8bHMokpZrNcKHKAfOmrIUcfPP3KUVrN8WnIjHB/ndiPClfyqVOCbAxNeEa9SMUEU
	 yiAyDZHgDh18sYZuQHU48SlE2GxHyCoYgzilCbiV1kEpjfAL7ZvWZrElmzG6Z7xEhZ
	 alWvEMX4RqyAg==
Message-ID: <d03818f3-190e-3244-5cc5-0c602a3c8b8b@collabora.com>
Date: Mon, 20 Mar 2023 15:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 12/21] dt-bindings: pinctrl: mediatek: mt8192: rename
 to mediatek,mt8192-pinctrl
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-13-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-13-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075359_501035_3D91D935 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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
> Rename pinctrl-mt8192.yaml to mediatek,mt8192-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



