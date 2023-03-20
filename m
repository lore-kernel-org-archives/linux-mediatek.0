Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A6FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XM1UW3ErtM0Ekrm/4kPEENpRJnR0/SCQbqHQEc+DzDo=; b=S91D1ZjNttBH5j
	7ds0ac0pPyrWeKxJzj5GTJV/VxoCqQchg2TgoxH7u/vTCBHk3r0LYwPF+W0ie2STcEIDZ8s2Iasv9
	vFW/bjhPSOOzQA6/oUI9PVw3fFVyqf5DegF4KWanOb0a/h8eAgWIchUwpteObplOP5cEQ1wGIIYXq
	7QmCmeV63g1IKAvGSaCvi9TfJWUUc5yckeQvOzfBmByHahMr09gdAGunQ8oHzWS3s0xePQGJ2UpGj
	KZZHOIWzJHBucnLOEObeGcUo4rpjZqUdSti1eKYiVj+M436IK+QWEKEEJXY22yUEK5fsQ0yHDuH9l
	XzM9MN1ADynPRugb8jZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peH02-009RgI-1P;
	Mon, 20 Mar 2023 15:00:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGzy-009ReE-3D;
	Mon, 20 Mar 2023 15:00:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 47A0B6602173;
	Mon, 20 Mar 2023 15:00:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324433;
	bh=AfixiP+8HtjjvMIA24QWs2GNAgmS/cAvbsYFMd2V1R8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lGZKoKJxulxhXT27+WHTQ+D3jlwfNFNNGlfa364Q4mk2q1N9H4KmoaTaDyUmAY+PK
	 g5K9dzh3EqHGF5Hcuy0xo+uTHp8TF0LvQ7hagbAuZhREWCG79YJmzP7kjQHQShKYO8
	 HskdECNhT4ha3jDhD5NUjeFKZUkg9Gk4SHl1g71s+arA9SYUlGXoHQdrPHmqGsJ/R0
	 FFRytE5zUKlv29DQO5ksvTNSV6QKI1Z+mJrII540pU/bTMm10lf4Yixtex3xaes4JU
	 c+X2xcpw7ifZCuI48Gu2lt35+InR0TgHPJ72E462Ytm+6G7eqc66eIvM6bBbdx0daB
	 9/Ce92kV9ANgQ==
Message-ID: <a19a4310-3228-c6b5-8eec-ed7f35eb5e13@collabora.com>
Date: Mon, 20 Mar 2023 16:00:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 11/21] dt-bindings: pinctrl: mediatek: mt8186: rename
 to mediatek,mt8186-pinctrl
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-12-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-12-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_080035_173074_359B3071 
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
> Rename pinctrl-mt8186.yaml to mediatek,mt8186-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



