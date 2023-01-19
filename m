Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00259C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cPBvf7gOD1mlRpnCgq8WRyagLHuPQlmCbvSeVmuCsQ=; b=aVMnE35Tp5NQfloy5/R3UJnFIS
	JFYGJ7K1WMuGOzax+spPJrYySx+EvAQsVKiTLqJzECXkpdlr38s33vY9af1bTzEG6f3uuU/4nDRF3
	rtDOXQYFiqJ/FC8F108C0vW05qyh55dBC2epbHr1Zcf77klg123tzUYIq6esLvwZAvJQhtnIXqXn9
	FAEmV/GeR8I4ZMWrrXdogGo+IbiNHGt40WJ41H3NQXbF7DZgnEfDY22TFpi4biPSWe1ZoNtqOZKRT
	59aAasQL5iBEfd6EPLiJQKYHOiTy4GL+CKg+CraTj+pYdJLLY6pnD07ltnb9TGyZcgpDthfDP1HCS
	Sej5sC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVsG-005IgH-Of; Thu, 19 Jan 2023 14:26:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVry-005IYH-M6; Thu, 19 Jan 2023 14:26:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CD2166003AE;
	Thu, 19 Jan 2023 14:26:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674138377;
	bh=ZIe5yqaxTy9L2ycOBJ1E+XvV/jSScf3+kST/Lx30c6w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Re6RpkzC8eP7wmKOfuy/jmDsBJpgP1RgEMrDw7TrWVFnCURyEN+C3SYg840tuV9Ga
	 fVFjoo+lk/FfHue5Nw0JdT/GDvnIKPUdNv1ka8XnV2uHeLeucUZ3YUJSdUlUXH+lyu
	 Ux0FvxhuPQERqysMy4AZHebmZIZG3iZ+hlPKBJGScMOFaFeZe9PMGYG5ESvyaoA8ue
	 FwD+/b+wO4KFQL8zCAV2ydnooiJDuW4DGSdVWv7o6LDrAuqPAfogaMpPbrwLuArlfr
	 M36CVcyw7xXE2Dvu6sOXlMswxpT2beE0fXXXyA9+CFkxNSn8ZMBSFOIGELQL5sSotg
	 VxDLKc/7GpIUg==
Message-ID: <d462e9b0-7900-e611-a464-0484cdba4571@collabora.com>
Date: Thu, 19 Jan 2023 15:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] dt-bindings: clock: add some compatible strings for
 MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674137304.git.daniel@makrotopia.org>
 <cad4f70cd009ba82e39c623485389c021992762e.1674137304.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cad4f70cd009ba82e39c623485389c021992762e.1674137304.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_062622_975339_4C0FEFD1 
X-CRM114-Status: GOOD (  11.49  )
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

Il 19/01/23 15:11, Daniel Golle ha scritto:
> Add compatible strings for MT7981 to existing binding documenation
> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

dt-bindings: clock: Add apmixedsys/topckgen compatibles for MT7981

looks better as a title... :-)

Regards,
Angelo

> ---
>   Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml | 1 +
>   Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml   | 1 +
>   2 files changed, 2 insertions(+)
> 


