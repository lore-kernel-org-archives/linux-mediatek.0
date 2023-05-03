Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50DDC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zARvg5Dk5///bgpnaatakhQgV3sEZarzdFTn7OeemsA=; b=w+iMX6+EdngvA47yAnHtxMx5+c
	kkMuwfsegRpZEz0qYz6C/rbysuJnTq8znyEOkIBOGyiPodrk45bJ8nuauAncrb3yKYeZJvEy+moo8
	b5zbogZ6GaVMp2Un6WAd24sSh4LhIM1WKS9tIh0zx1dq913IKKfquNcGXHolXnLgKar/QpkRaG31w
	V34XIe8b3CtH/bimGIChjsjl3A57HbLe5h0BiKSKvubNsDntnXaQmIaj9P1IS98VqeN86o6p+h6JY
	9IPohXV1gMs7PUUVFER01P+Uu3BLrd+tF12K1zvdbevMcYMqttKl2JhSVqz7f09Zrqy7bGTHUc8qX
	xrJXkIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puE66-004uhS-0q;
	Wed, 03 May 2023 15:08:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puE5z-004udu-0P;
	Wed, 03 May 2023 15:08:46 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B948366056CF;
	Wed,  3 May 2023 16:08:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683126520;
	bh=D9N6mr2rUKOdTtGJmgSLqH/jJ7q57NmzT7mbNyHBx5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWOXPhsrCKmDs7wUubclBOLGm5POV+Mrha43jUNH7ppJmnrU6B2UmyPdz6W1BQTHu
	 nLk7Jfb1BvZSKqTvV+CHrtrSYiOT3JROU5yMESQYCVUST1rnTNFuBdDP77eVcggkDM
	 IZqllyebtNtV/KBw5cQfMmnkHuGJQ+w9guOKyK3q68sGdGoIQK+b0a3xvV1j0IKx9F
	 gG5uv3+ojTkNQrEcVWAqrvdoh/ze7sV4CgLwP0OXVDFhHArd7roYMb4RE4D7LJZR5V
	 AlSCJL1501UzqimPnwi4hNAT38u73VmNLmXXpClFEFpNnrH/bGYGBnSRs6mW2Qp5Kr
	 OsYp8/xZDWrCw==
Message-ID: <584879fa-1541-17d0-81dd-453333230b48@collabora.com>
Date: Wed, 3 May 2023 17:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/3] thermal/drivers/mediatek/lvts_thermal: Honor sensors
 in immediate mode
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
 Chen-Yu Tsai <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230428195347.3832687-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230428195347.3832687-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_080843_343557_311CC60E 
X-CRM114-Status: GOOD (  10.60  )
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

Il 28/04/23 21:53, Nícolas F. R. A. Prado ha scritto:
> Each controller can be configured to operate on immediate or filtered
> mode. On filtered mode, the sensors are enabled by setting the
> corresponding bits in MONCTL0, while on immediate mode, by setting
> MSRCTL1.
> 
> Previously, the code would set MSRCTL1 for all four sensors when
> configured to immediate mode, but given that the controller might not
> have all four sensors connected, this would cause interrupts to trigger
> for non-existent sensors. Fix this by handling the MSRCTL1 register
> analogously to the MONCTL0: only enable the sensors that were declared.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Awesome!!!!!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



