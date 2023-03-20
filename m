Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6027C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6ifMmnzx5Lc/eZqkI5cwbVchU1wsxDS/R7/2dawSSg=; b=ay0EJxhpxxC2QG
	zaZCDEXrlLAcdz5zrJJByChlsDEN2CcEk8LsyjMmOaihdukS/kQ01b7b405i2BzLDZ899G63TfefL
	H+oBLYKeJZC5uT9Ji8ELcI1p/DrNPi74moYlCrcyZBIiV8MLrFUrSK/RbYuv6KTr2ZE8oW14X5jSM
	GQI2mSCo4R+IuYhdOtMRRD0oHNdl5tIwMmXZ15Yd9/A1Kx40sd32X3UNRlLfBso3ki39l+pcp3yHS
	lEcjsBgi5rzozRNVlGx7ex/kz0kPq85Hy2i+ePvKnFHYY6rAdNmiUgGle6q//d5+bhhSpF6o3ggqP
	Lr890rMdet0nh4FggBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtg-009OkP-2D;
	Mon, 20 Mar 2023 14:54:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtV-009Of0-18;
	Mon, 20 Mar 2023 14:53:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D628660304E;
	Mon, 20 Mar 2023 14:53:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324032;
	bh=GukYhj0Q8tZk/wdan9J/AO6SKQnUASOOxI3DtziQLZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UtHeNUiD6r/+xZtni2CGnfNZh3CG8qdegVGZgzCZHdy5cxvbMujKpMQnZOiwO99bc
	 Omy1c+6VpvDmwyTxjpXiAMhRBxnTE3fTMrWtDGu3i9A9FLPbuSE/Xhd9zkkZiyY3Oh
	 L/+Ha2+o7ZV9aTLfnif8s/qgnTGvVQ6rpKBg0UdVK3Vp7xaT9T/EWejdkyWah17wIP
	 O3WoG0kQ9Y6/GRhLqiy64oQxuwW7VxVtsOYHHcvi7s9OIZfyFDHQqPv+WIUoW2fD89
	 Dbk+RSWjfZrBgF1ihFFtWWd5ThnQtKLItWQ8lP3fgbycx1wQKo2+7/wEvtgMmJsgYU
	 6nB5NN/e8H2vw==
Message-ID: <c3677049-97aa-f477-5903-323345216f59@collabora.com>
Date: Mon, 20 Mar 2023 15:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 13/21] dt-bindings: pinctrl: mediatek: mt8195: rename
 to mediatek,mt8195-pinctrl
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-14-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-14-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075353_521492_1478E87B 
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
> Rename pinctrl-mt8195.yaml to mediatek,mt8195-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



