Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD88C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 14:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0pHvASbuexBEzMztTeqSTKR3kXm5VKcKtXka9O3BNo=; b=puuFW58I4k8QwfBgsoX0Xrlvwu
	1Pitoe/ILALNLaEgvagbSg5xfsCb5Kcl78odm8OmdQpoadcdOMM6c9Wys/6sw9ztqs7ZiijpR3s+E
	BTaJuOMChmSDM2RCYZo0v9fqJf3rcwt8+VL/o59Qc8om3djNYrO/U/z1tDqNVaZAdtLZj9IUuQV3y
	YIBCM93MwTFdcSsSdtCHQWU1Sh0doDgf5/KBP/ip6lkcwldz2DN6L2hhqL8hzts126yyM0vA2I2hH
	izHu+nt+gzUCBTVzYOewMly4ogHdq6qkJK4hH5OEN2DEpTdyHdIdKY6F6Xa4kwS4XF70n9pscPL1+
	dBVjGvkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSInP-006DD0-UL; Wed, 15 Feb 2023 14:30:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSInF-006DAK-BQ; Wed, 15 Feb 2023 14:29:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D0E966020E0;
	Wed, 15 Feb 2023 14:29:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676471393;
	bh=7q+8dNYL/2VORRV49y6U9IKXin8dzr+DqWZ4K1xflFk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=d2TOQnXU3I/RFS5jqXtPVt5fMugZiiKfs0qaBwzNvTsQSRY8PiWKwVK5/1CM3R2Or
	 6OWLEgVcRtuIdGWOZdn0eV7qjB+h+oLs9M2KG2P/3d1HabS9hodgqbDDMCUkOvXpwi
	 /z8ROm7vcXhjhJyh/Poj9AFABj2f9OsZCfF4ctrtOqCP4PID8jGbEAD2o4uYtwGlIr
	 yqpS5hZLOrVIuQpIQ++j+TrcJSaoNnX7GLFvHfWJCPt8xkPWWT6v92jLCIKzPM5C/N
	 HimyhpY4TqA3qNNZZRa762rqfRtExa+ktT2o/L0JcXYFIkUe+QITjG5XHvk8Y3DpOr
	 tfRlQvxukAtFA==
Message-ID: <deefed32-f675-5f71-3eae-6ef3f07ed5f2@collabora.com>
Date: Wed, 15 Feb 2023 15:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/3] rtc: mt6397: select IRQ_DOMAIN instead of depending
 on it
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Peter Rosin <peda@axentia.se>
References: <20230213041535.12083-1-rdunlap@infradead.org>
 <20230213041535.12083-4-rdunlap@infradead.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230213041535.12083-4-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_062957_629184_FE756555 
X-CRM114-Status: GOOD (  16.87  )
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

Il 13/02/23 05:15, Randy Dunlap ha scritto:
> IRQ_DOMAIN is a hidden (not user visible) symbol. Users cannot set
> it directly thru "make *config", so drivers should select it instead
> of depending on it if they need it.
> Relying on it being set for a dependency is risky.
> 
> Consistently using "select" or "depends on" can also help reduce
> Kconfig circular dependency issues.
> 
> Therefore, change the use of "depends on" for IRQ_DOMAIN to
> "select" for RTC_DRV_MT6397.
> 
> Fixes: 04d3ba70a3c9 ("rtc: mt6397: add IRQ domain dependency")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Eddie Huang <eddie.huang@mediatek.com>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-rtc@vger.kernel.org
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Peter Rosin <peda@axentia.se>
> ---
> I have a similar patch (should be a series) for REGMAP.
> 
>   drivers/rtc/Kconfig |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)


