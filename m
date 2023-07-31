Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97991C001DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwzIp0LLoc7KvPSlJW1vCbXPdFrCMBM0DEg+rL24Ga8=; b=Qy1vwbSvuv/Ad/gwt3m+e30pU7
	gmRqBpuYxpSKieefvZpMf9E+AkBkffsiNLvKLjZIj3K3fatWQODMNpx5shStiiM3EsJhxajiXMOpq
	1jn+G3MNUwPLhFpaTq1Gzz6jtDB2jkkYfGdJx8eGqg3pRobGn/xGAkGEv4uljG6NLQ/Go8stXAjXO
	KOQoxjzFZUx1L0Jz1YXsM8bR7bh7iu/BIgV5XUC9ycUvAU+ue0BA6WH8fd8vgeCQ2x+DpslQjtO8k
	UW0VzAaW0mfuQlIjO93XestcsnlV6DGyuE/JaKQEzKe8P7GdTI7eqsLhRFv8ktgm7VEoR9EEZfduv
	O3AGj75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQCG-00F4R9-26;
	Mon, 31 Jul 2023 10:32:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQCD-00F4Nm-1a;
	Mon, 31 Jul 2023 10:32:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F03E6606FCD;
	Mon, 31 Jul 2023 11:32:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690799532;
	bh=xoosHj1qmc0o7HoZ4wSQyUt8HIP0cBsbyMoDAT5q+g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MstCsEWNQOdrkXbFZ5s2Yku4HVG5NMTLMlJFkDIwHkXuB3bRjyqFsOU/lvrIP+tNO
	 D+LeQNZGY/dEsFzS3X92INL9/RxUdvq/P6+21BbpTQt7+9YZIKdhYhfxf0tO1Nbp0l
	 rMh3qvkWVY6M21t6vnLKVwQRVe44U/JoGJbDDhiuNyYr9tsABBldGVspICjYJoR5lZ
	 eo9rSumxAL2/EuGAVnZWjbc8E2iU7Wm9atwgmU9sCKC24XLEhfIIzql9X3+6VKg9lg
	 v9OUuHkWnQ8ArqQ3FLOGVaVrDCsYAOOGGlt2iwvXmJtKU2LWe1/uQLMNv8s+dqj/Z9
	 FqDVnuC1oyDGQ==
Message-ID: <cae53693-80e9-2dcb-e222-511eb30ef74c@collabora.com>
Date: Mon, 31 Jul 2023 12:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: net: mediatek,net: fixup MAC binding
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20230729111045.1779-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230729111045.1779-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_033213_667636_BDF8A8CC 
X-CRM114-Status: UNSURE (   9.81  )
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

Il 29/07/23 13:10, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> 1. Use unevaluatedProperties
> It's needed to allow ethernet-controller.yaml properties work correctly.
> 
> 2. Drop unneeded phy-handle/phy-mode
> 
> 3. Don't require phy-handle
> Some SoCs may use fixed link.
> 
> For in-kernel MT7621 DTS files this fixes following errors:
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@0: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@0: 'phy-handle' is a required property
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@1: 'fixed-link' does not match any of the regexes: 'pinctrl-[0-9]+'
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e100000: mac@1: 'phy-handle' is a required property
>          From schema: Documentation/devicetree/bindings/net/mediatek,net.yaml
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



