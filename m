Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0C8CA5517
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 09:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWEsvnDWpVXGm7zokRKIR1/KacZnoiAVeNx5EXZhzC0=; b=h4B7ZS1lT2jFRQeYiKqU7fFpVm
	QqBkTPBfjmiPXlS/eCWaB/dL6br7UVifPe88zxRz1Ii9JMFWveDo+vJkpoPVxeniAbInD8tkd0/AW
	GgtmeOUQZNuBjAZsr6CQsjMWvLmpIFbBaXuIhWAz7OBRmQxtx+8NrDs1ctAGoPo8oYY5NSINQlxuw
	jlCugFQt8SQThr43DSTH2mY6YcQiZAUVe4e3OpsgjnFYR43SM/48+pBiRHwiZavLRHqR1oX/2SwO5
	aTPpNWtlHvA387eLGYPwbJwLCyP+3ydEv/H6ZP8CKxkXAUv8yIL+RQxgst0xQr9lgdCxshFIp19b0
	BmdTsivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLyI-005HUJ-2T;
	Wed, 13 Sep 2023 09:15:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLyF-005HTE-0e;
	Wed, 13 Sep 2023 09:15:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 02D43660732C;
	Wed, 13 Sep 2023 10:15:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694596537;
	bh=+x1Lus2omcxwTQh/70pIi5tcxa6KKlOel+MXnr2anU0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hcXsAp5siwSYtRCayPcgeqa3e7E80a/nScSBAx0id8t3e3QvJE0LhZTRx3dwT2NCO
	 q2cR4FFecXHuX+sQV4K9YolHUnqVmLq9/hfEqQAwQWIf8+rg4cLoasbOJUYd8eGb1N
	 lyfZbNP3MhqJkgpaxazLxCeqyL4LTyMMK/yyc5QBFGGKBYmWld41mA+BTQytRFw6L8
	 Tj5qVxT1eF1r6EFTaFKqEHJGoPwMgj9UGWATja2Su7FtARhiPcJpHyZK9L9VX9l61N
	 mUdYl5lPw7q3KPnicFNnUKvAhjUZcwurIBTbBkYLQAYKKvMakR9HqEPoVziC5g5Pe/
	 h1BTNoISIvWJw==
Message-ID: <93074a59-8747-910e-0b76-4682e827ff73@collabora.com>
Date: Wed, 13 Sep 2023 11:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH -next v2 19/25] spi: mtk-snfi: Use helper function
 devm_clk_get_enabled()
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>
Cc: andrew@aj.id.au, avifishman70@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, benjaminfair@google.com,
 broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 fancer.lancer@gmail.com, florian.fainelli@broadcom.com, heiko@sntech.de,
 jbrunet@baylibre.com, joel@jms.id.au, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, neil.armstrong@linaro.org, olteanv@gmail.com,
 openbmc@lists.ozlabs.org, rjui@broadcom.com, sbranden@broadcom.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, venture@google.com,
 yuenn@google.com, Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230823133938.1359106-1-lizetao1@huawei.com>
 <20230823133938.1359106-20-lizetao1@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823133938.1359106-20-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021539_376683_62CED104 
X-CRM114-Status: UNSURE (   8.40  )
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

Il 23/08/23 15:39, Li Zetao ha scritto:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> Also, devm_clk_get_optional() and clk_prepare_enable() can now be
> replaced by devm_clk_get_optional_enabled().Moreover, the two functions
> mtk_snand_enable_clk() and mtk_snand_disable_clk() no longer are used,
> drop them for clean code.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



