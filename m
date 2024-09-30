Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39880CF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2z+VWY0r2Mwj2+g1ew6nLntPn+3qonHiJh55Lny/eQ=; b=Z1gWV8/O22jDUjeAWXh4cXAgum
	n+iuCSC24YK6emzZwrBZ3X5PRv0v61v7s6OVGGSPIXJma+m3mXVpKWsEU35+4WDCf9cmLDBPO0yMO
	zEbJJY8TNiTNh2AUlvky02UxHfOscjo+s6umams5y15py0ROhV6r6yZWtLWjjAMwvzhdlkkYaBStW
	FplsFVumVj+yJu8DGYnKqA5tSdgr6zpfVJO6ARQUT6zwPXYG8vAX4xsps902eLIvbZS3E7ew+J92n
	YqG7T9wNZqtm2KKs4KeeCugGPsVy//hyxw6EJRh1pJWPoZbbFgYUfl+iP8AtFZvlpzhKdoyr7e8iN
	/nthfoCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svCp0-0000000GYYB-0zeB;
	Mon, 30 Sep 2024 09:36:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCfU-0000000GVmZ-0wlR;
	Mon, 30 Sep 2024 09:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727688370;
	bh=ESiC2GOpvxGfYWJul0YYydb+LAlHnP6rF2ndfAGzpQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HID+3H9QbZnQQwdbU8gSz8uf+Tzch3B/xjKgNr+Uhi+HGZsWtTo/kVZEHXHM8Txmn
	 BMwyXnZxzDC+l7V4NaBs/uJU63cm/Cpiilh1+laqz7+KQsokRrX5+n7CkGxbJxUUBj
	 qWBnjndvLGUSpnkKDhkRGldKcEbEqa1Re0NhGLF41+JQudOdlsuRRDlBTlBddqYPlO
	 blAVnHuASno4ANbcJqrXY3PIb3uBxXTIl5ihuCx829XRR3jN9djPgx2Wi5IpovNlyd
	 Za28LwM5HwVDVBtEOwFxtAs0nnpi2SK+hyrnuGFc630gW0RS5FNUWXbNhY/I7o1oAP
	 w+wU4V4TyKKLQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1405517E10AF;
	Mon, 30 Sep 2024 11:26:10 +0200 (CEST)
Message-ID: <2782dd71-25ae-44ae-a8df-6af995ef7413@collabora.com>
Date: Mon, 30 Sep 2024 11:26:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: mt6359: Update generic node
 name and dmic-mode
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
References: <20240930075451.14196-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930075451.14196-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_022612_447421_B0F6648A 
X-CRM114-Status: GOOD (  14.40  )
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

Il 30/09/24 09:54, Macpaul Lin ha scritto:
> Some fix and updates in the following items:
> 1. examples:
>     Update generic node name to 'audio-codec' to comply with the
>     coming change in 'mt6359.dtsi'. This change is necessary to fix the
>     dtbs_check error:
>     pmic: 'mt6359codec' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> 2. mediatek,dmic-mode:
>     After inspecting the .dts and .dtsi files using 'mt6359-codec', it was
>     discovered that the definitions of 'two wires' and 'one wire' are
>     inverted compared to the DT schema.
>     For example, the following boards using MT6359 PMIC:
>      - mt8192-asurada.dtsi
>      - mt8195-cherry.dtsi
>     These boards use the same definitions of 'dmic-mode' as other boards
>     using MT6358 PMIC. The meaning of '0' or '1' has been noted as comments
>     in the device trees.
> 
>     Upon examining the code in [1] and [2], it was confirmed that the
>     definitions of 'dmic-mode' are consistent between "MT6359 PMIC" and
>     "MT6358 PMIC". Therefore, the DT Schema should be correct as is.
> 
> References:
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/mt6358.c#n1875
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/codecs/mt6359.c#L1515
> 
> Fixes: 539237d1c609 ("dt-bindings: mediatek: mt6359: add codec document")
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



