Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C9FC47DD9
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iRK+9Ef5ahhMDXno1UeX1l/jSM4KMCVl6LyK4W/Z9Qw=; b=TilAdcqN47H16BP0M1PDC1+O8D
	GIYh8Rlbdv5K+Zd7/D6XXQzDNdkFUxSZ04ylWoD4rqj5EGlbYrxsiTS+SlFOy32hUOVvlVXioq5n7
	iDNifh8CpMqNSJLLV1Nq+iZcWi/fzN9aBwyS8LGWmtDZeNnwP93vsFx1agZgL8K5NzaSXmZxweeF9
	JwV0ZNFUnvclcgfkJMuz7CCcR75PFtu0jZ749w3A6xSeFhaVEOk7MXopnuiQFCy20OVa3giM0nLLs
	SIi4bpoIDM3m8C1wy844eJOZ2Aep0UWdvLCpIpPIoB+WBt7eCnDBYHlo8dr4ZFW8wjViT4gOXpZ2h
	JxF9cC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy1l-00DCmI-0f;
	Mon, 22 Jan 2024 17:24:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRy1h-00DCkM-0R;
	Mon, 22 Jan 2024 17:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705944237;
	bh=q/Db6h3lSGlyLo8SBnIe8RHfu81djoDKGGU7SHOYQ2k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uBtCLcczeAtmD4FGIX8AHJyXbfc7pM4+ZDyKIlPkc8NiniQCpgajGOvz02NniCFe5
	 j9tYgO3EnjPsT7rinfmlHsF2ZPcnxV+gpcCA87+oPmj8TwrWvERXvjRpue13yfs7Km
	 MhLEHi6s0rEx8EUWgDfxgNPJKg42t+OqCZNKAof1vKPF1lPyIF3g7SO+CBI31BfCrl
	 Php9LcG5W0xM0kCeoTiociYFp26QrnMWqT/p9jKGSlGk/4TrNHfCSM+4xqbA67KipX
	 stkf5E+aoYW5DKCh2s2IA92iHElYZ8WE5NLQi56GBxIQCXUnl3d0lQ8JM1F1JbDq4X
	 rAghQ5nIlOdEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5BE1E3780016;
	Mon, 22 Jan 2024 17:23:57 +0000 (UTC)
Message-ID: <fb04b007-f0d0-4aca-9cb2-6e6d42778560@collabora.com>
Date: Mon, 22 Jan 2024 18:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: add missing "device_type"
 to memory nodes
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240122132357.31264-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240122132357.31264-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_092401_354292_C7211E2F 
X-CRM114-Status: UNSURE (   6.34  )
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

Il 22/01/24 14:23, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: memory@40000000: 'device_type' is a required property
>          from schema $id: http://devicetree.org/schemas/memory.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: memory@40000000: 'device_type' is a required property
>          from schema $id: http://devicetree.org/schemas/memory.yaml#
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


