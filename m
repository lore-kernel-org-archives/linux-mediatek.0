Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DA6C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Dec 2023 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnUMUXM6tuA7Al1QfLAeLEpXFd5nn7I7VzHVP+bPxNw=; b=MVgOAIfNVWlDHTX0PX0xvhmLO/
	fSFqCuFolLxcS2fONSXv1AKtbDEseer2wKGa2hk351yi11WXz8FY0oBGIS9f4bdERt9zcfGFc3pJm
	jKiWbdvR4FJZtr3Htx0Aj8bRq/h+Vx+6iEvNShR08Ew5CRpOS8WM/JqQ5JiQrXrNZOs1vgNqaI6bj
	W2M+b50D1Vdu0mjOxhQnjmo722+atbe1MGh5aFNc9YxHNL3Dp885UInZCaPus1BrM+GJSGgLIbpzC
	KaufSGyFXz30EnBLiIi1ukDWNmIJPZknePYfJ5lkEjc0f9XOeqCqyBLMO79t96O3EePCI+aLwUaES
	depIeXcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVGu-007TxW-0W;
	Tue, 05 Dec 2023 13:15:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVGq-007TvZ-0t;
	Tue, 05 Dec 2023 13:15:29 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C16576607295;
	Tue,  5 Dec 2023 13:15:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701782123;
	bh=6DkmrpDnGeZXGofKoixLDnz2zWUHekUv7+HrZandZ4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gDPrHdHlHgN/zybDJ8CqUj7Pva762vdm9BSs7iK0NbnXWbaOqt3AV7UFiRaMf9rJ0
	 1p7SB/Af+rveT/26/3p5yiSa/pXp0i6DWKXYh0XRoSvBmhvG96qdwHzd0A2TqSZlwN
	 kJEU7hux803bOWXQtP4ftNKtPlyXfwXKuQYUVAItFJCKKmcq7xTJ+DJLDu4k5g6UhE
	 oEch2JlmUbkIAxGnX4aZ1Ke7/la77REqOHwPnY2YlaXfYuufOh3lU/OG/2WaIO6inI
	 uLhFObnoa91S+JQ7Y3Od/wPbxzuwOp6V3cYIluopevUv1aKtLCZcIFSaU46K3EDJJl
	 cPvOcu4roebpA==
Message-ID: <6e6cd1d0-c46e-496a-9a31-c1ecd75bf34f@collabora.com>
Date: Tue, 5 Dec 2023 14:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] dt-bindings: arm64: dts: mediatek: Add Acelink
 EW-7886CAX access point
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20231204200907.5687-1-zajec5@gmail.com>
 <20231204200907.5687-2-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204200907.5687-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_051528_492204_E4C82EA3 
X-CRM114-Status: UNSURE (   6.26  )
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

Il 04/12/23 21:09, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Acelink EW-7886CAX is an MT7986A (AKA Filogic 830) based access point.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



