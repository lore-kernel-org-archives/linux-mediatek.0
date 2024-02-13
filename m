Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4639CC48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtV80HzqaYHbVRIsxZ9pszoyesrnA8bErsiKJ6DgYfI=; b=Wfwb7bG4AMbAiT
	GlKy9yXrBGNcaODw/FFyvVdQeWiZO4TM6i7eeTKJHjfkurxk8VkjFgVMrMoccJCn0w+Vun3ve5DNi
	OSAyZ3CrW6jw8LjPjiTmwmHYDVRh5m0KNYmMASZtACicIoDVhYdq1xSWCTvBQ9z5SofL0u2dWn3Z2
	a2kJbBI6LO1F1c7PWGdXNHotWZlrrAgYj7CHPCZo89wQ+9mIRybZIkmazjUw8AXjZbCRJPbHWbNXA
	m73Sibva80huWhDC9yfOiepvxtu5PdcsDyaiiKAIajm3B7Uz9d+hrFXbusmC6xXO8eJGv37L4RYbW
	i9jb/RK9sbiYiqcz/c7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoqT-00000008ZHS-3gIo;
	Tue, 13 Feb 2024 09:12:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoqQ-00000008ZGC-0Mzo;
	Tue, 13 Feb 2024 09:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707815567;
	bh=IF9JkPNFvE+ZhS23bc558VWeMouFPJSwGah7iUkeyQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qzzapQ4jZZQHyDb2s7cv9CxYUZwuwm+L8YsGJwME6JSybXHz2O23UMHZ7HC58e+BS
	 kkaSuQqHyIMfTemMh17Fa/6NuchfPjcL9QQ6dcBBcwXHVtrbnEgpm3F7hWstTfkwDH
	 arxSPTUBIH9zNp2hnSRbd/1tpPQDsefrCJLrGQ0gcZpUiuIADznBLMf1OpFLstdxVG
	 74UUTMmhBe9AOSI8E6YStWrbVrYu3o+buco/+ZkddvCcvLTFWDmKE+U4zaEbIzbC5V
	 Sqk4yaUAF46iwuuV0prWHaFiheA0NpTAJJH2uWkhqYK09Xq6mJpvdvX5QtUTVMGane
	 4BerPvF1EKTxA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3941D3781FEF;
	Tue, 13 Feb 2024 09:12:46 +0000 (UTC)
Message-ID: <3df28f8e-4efa-4fa6-b529-daba04969ede@collabora.com>
Date: Tue, 13 Feb 2024 10:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps
 with "map-"
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240213061459.17917-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213061459.17917-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_011250_286211_25352B41 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/02/24 07:14, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
>          from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> 
> Fixes: c26f779a2295 ("arm64: dts: mt7986: add pwm-fan and cooling-maps to BPI-R3 dts")
> Cc: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



