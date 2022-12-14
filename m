Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B87C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoWbGbvZmoQLueujs8VeXmQ6SU+1k21w4CTdd0tUAT8=; b=rwIqJvwZTDAdsCKzIqp4x5bspM
	PxBDjI3KE3icRapT9TvK3US8Plf4OmqIFIc4/hAEwRjMbG8loyY2TRg+rLT5RFkiZ9Y3edNE471aY
	Bm4n1DYloUD+CQTH7XjuzZyXzcERJAsj/Ifir3v3o7RsI9kUNchFYuYGblKrAlcfO8SG/tRCJeSLl
	gwYXNHJClthmpU+W9rH61tkzzcjjCObSc14YET62UgNet7NTsA2OAAqBR94z8F3yclcUnD8rtFZ9X
	MkpyRRTrosMUpckpXwmduuHTbod1AGAh6jF9tfI3qb7uRwurTWyE7mZZmMMoK5/Tkn225lZBAdpMP
	3z/K3mRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5PsK-00FukM-E9; Wed, 14 Dec 2022 11:24:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Pry-00Fuaa-OL; Wed, 14 Dec 2022 11:24:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 27C8D6602C55;
	Wed, 14 Dec 2022 11:24:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671017050;
	bh=PPU28yPFJHaQkMV74Q4OXWxxe93thQXwf33n5IwIotM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=akix+8T02S8piOhD6U7PNF7VMdMdaGbbpFrBTVnIzYmZJsKamN19Ub06HebhxC/GE
	 WD+g/lMhvICWPk69/vVbQ1EkCGbb/pwnuYi1mMuLOMznmdNykclrS7X5+E7mUoN789
	 KDgcIjXH0gk9aRTxazjYUfzLiNa/hWCLqjnnA6NM5eExWyv2nxoClsoEc1UlK8/4em
	 NM0HlTsal+BBtPlYRoh6gMxMk2DTbaZFZcVnrx0r8yld/sFRVxJfEIJtjJ75OKa6n3
	 Ioyftgtu5XjdJ+O48ZRysqdwKmNA0lypSF69XMMauUfCHYLpWGOSA3lbb4sINnXtJz
	 qewOhB7AMpJkA==
Message-ID: <283f26c2-f19a-4ebb-d811-224c16045de5@collabora.com>
Date: Wed, 14 Dec 2022 12:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 1/7] dt-bindings: arm64: dts: mediatek: Add mt8365-evk
 board
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, khilman@baylibre.com
References: <20221213234346.2868828-1-bero@baylibre.com>
 <20221213234346.2868828-2-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221213234346.2868828-2-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_032415_022765_77273BF5 
X-CRM114-Status: UNSURE (   6.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/12/22 00:43, Bernhard Rosenkränzer ha scritto:
> Add bindings for the Mediatek mt8365-evk board.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



