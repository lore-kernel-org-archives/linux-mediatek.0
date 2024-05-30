Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB576C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 10:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hM78kxR45YTptAnKtVfPyr2ogZaYO0Iaoakr62oc3mA=; b=q+mo6dM64UDhhKKqeAuk1NQj/u
	NWaJbRxe9z8ulkgtM8wzqaUyKqLdzjGi6hDc778/gqDbjoLID24HvZ5w8bZNO7V8/g05OLEXwL2O3
	j0R6KwlOIMND8KteYWLrGkDO+SFbn33tl44p2SQTiSGmzXZRZn/JtYwijnyDjRsiUDnoVVrxR6G39
	q+0vAUDz3b3U0lbKAFYVzGAS6nj0pWDG0sX0PtsLszI0aOkW1p/KTpic2LH8t2DpBa7+o2kW2zv3Q
	fcICqyESzxQ855KDLPX5dV3GrstaSg6ZjRmedJ86qOlvV1jXalPhr9zmtr6u1i+ssgew+y1A34f0d
	OAn+dx3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdi-00000006vTP-0sEO;
	Thu, 30 May 2024 10:04:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCcdL-00000006vGw-3pUk;
	Thu, 30 May 2024 10:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717063422;
	bh=vM8aBy1EFJ3SUlY6OijOqDmrHOooruLWDwMTT3MCdpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rWZHEG0Ll21lZ+BMbIT5Z99zrIB5oW9lp4FEllue5LfVEDLKNFYWl2udQA4XxhqA1
	 4sHi7VuFaBfQn9FSlKhidfGVFjlpEWt/+D6NZ757sSU+WxPTUX88qnDWxeIcs6n3vD
	 zdlBNBDNo6ph9SFAGamYDtDTp5Q2mOgMMLOCuNz8rpQcG35rqFskI5wp+N9O3omOuS
	 V7VLbzIRyWuDdj8E6F9zISJgEw9lTwPDao7lX5ZNRYerOBAq4MNPP2OHUgmDfjyEY/
	 Hn+5ZHpYqymwNpsHzUbpE/6Gwg/YIWLpQaB2EntCCbubz4ifO2hSN65FqNNDpobJE9
	 BRYfWAGkEcgXg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A76B37821AD;
	Thu, 30 May 2024 10:03:41 +0000 (UTC)
Message-ID: <4f20f130-c9ab-43ea-a758-e29d7be10db0@collabora.com>
Date: Thu, 30 May 2024 12:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power
 domain clock
To: Chen-Yu Tsai <wenst@chromium.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240530083513.4135052-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_030344_155343_C365B1AB 
X-CRM114-Status: GOOD (  17.74  )
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

Il 30/05/24 10:35, Chen-Yu Tsai ha scritto:
> The MFG_ASYNC domain, which is likely associated to the whole MFG block,
> currently specifies clk26m as its domain clock. This is bogus, since the
> clock is an external crystal with no controls. Also, the MFG block has
> a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
> diagram, gates access to the hardware registers. Having this one as the
> domain clock makes much more sense. This also fixes access to the MFGTOP
> registers.
> 
> Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.
> 
> Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Just one question... what happens if there's no GPU support at all and this
power domain gets powered off?

I expect the answer to be "nothing", so I'm preventively giving you my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

....but if I'm wrong and the answer isn't exactly "nothing", then I still agree
with this commit, but only after removing the Fixes tag.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 3458be7f7f61..136b28f80cc2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
>   				};
>   				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
>   					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
> -					clocks = <&clk26m>;
> +					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
>   					clock-names = "mfg";
>   					#address-cells = <1>;
>   					#size-cells = <0>;



