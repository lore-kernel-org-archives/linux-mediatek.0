Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CE0C25B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ntannu2iyIZJZd6N8oQV5JWFBy+cldpCxP8BIz2YFuU=; b=UAE8TcBAzalHIIgq6+V80GROUm
	v0+BTAP4OUzeVhN563pvURbdJQWZbxuaXgoFmvzZU13V5PA8hj9rxmJthJ7eiuLPsXqEK47oemMpc
	GRX12x9weN+ZIIkqBrq/+blPPyodLRhUljbQbHaQ/fzpJTFccsnKINLd0QEGTktAgt1DXPefzLxfO
	RHtlA/ZSrmMwmxSDf9q7gpGr6zKsxWh8t4Ea/Y8R0p3Fw8CF4OT4EZnFcmhT++5JThWR6sWmVJtho
	8AtwiCmqXTK8SEQVtNFzqIl82duq06+oKWQZriPeh+FEGD/wCrxU3Jcn3EzZ7PvxQlmoae/JwA9SY
	cKSY2y3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvap-00Dw5G-1L;
	Thu, 26 Oct 2023 08:19:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvvam-00Dw4F-0f;
	Thu, 26 Oct 2023 08:19:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E8A866607331;
	Thu, 26 Oct 2023 09:19:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698308386;
	bh=ht4JFF3g1Fwjjt3mjY/tBbZu83PIsEDlEPPJpQRNU9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QhDXSIsBAzjEeYQL+LLJy71b+xXL8YqjRSN2I6o/gPQnbySlaWvdxYlgFIvW8Ovde
	 IjjPbs2W5Ow43XEfUiM5ZvTFpepb10qqC5VOTRQSsYRo8pHwAgSLDV4UxasDjPD1R+
	 oQXMG8UwVnr6L3zRLYGNWT05FTNu8pBbKOu+6FRGlbUdHVOcIcdOGzI+XtivMrI97Y
	 72lgAuWnE+uztVsh1MySJimWv6QfR++LQx0zXOlJ4h2xJ0lY94oGj/MC2mlyTc5MR9
	 6YyM2xTotO29IN2M7+l+E1P/ZSLFaudMWyqOW+bvW630aZgwNA2Z6qv5tnRWKI/yCj
	 U6l8FxTHalrxQ==
Message-ID: <5cd915ee-7820-4e7e-b391-54bd6068feef@collabora.com>
Date: Thu, 26 Oct 2023 10:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add a few mt8183 follower boards.
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231025215517.1388735-1-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_011948_382466_1C28B62D 
X-CRM114-Status: GOOD (  11.38  )
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

Il 25/10/23 23:48, Hsin-Yi Wang ha scritto:
> Add makomo, pico, and katsu which are mt8183 followers.
> 

In this version, this series looks good to me;

I've sent some commits to the lists performing fixes and improvements to
the MediaTek devicetrees yesterday, including the interrupts-extended
changes to all of them.

Unfortunately, this series will not apply on top of those cleanups.

Can you please rebase this series on top of [1] and send a v4?
That'd make things a lot easier for me.

[1]: 
https://lore.kernel.org/all/20231025093816.44327-1-angelogioacchino.delregno@collabora.com/

Thanks,
Angelo

> Hsin-Yi Wang (7):
>    arm64: dts: mt8183: kukui: Fix underscores in node names
>    dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
>    arm64: dts: mt8183: Add kukui katsu board
>    dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
>    arm64: dts: mt8183: Add jacuzzi makomo board
>    dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
>    arm64: dts: mt8183: Add jacuzzi pico/pico6 board
> 
>   .../devicetree/bindings/arm/mediatek.yaml     |  21 ++++
>   arch/arm64/boot/dts/mediatek/Makefile         |   6 +
>   .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  24 ++++
>   .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  24 ++++
>   .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
>   .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   6 +-
>   .../mediatek/mt8183-kukui-kakadu-sku22.dts    |  18 +++
>   .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  18 +++
>   .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  15 +--
>   .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  36 ++++++
>   .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  40 +++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  94 +++++++--------
>   13 files changed, 384 insertions(+), 64 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> 


