Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AFCC3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y06iPavoiDzZUdg7INTeEQO3Tw3q/FA/iiLG3rVUC30=; b=qQADNW2sBwIKSQ8QzNXHSOGpYB
	tXbgqjRzq18DWjrIc8JGZ4MMbuO15kf9qLBLA9ncNdjp+wgSizE6wP9viPXy634n3jU+JPGxKOxuB
	4itVHWlHTj57wcXM7cIAopS3oVIKHKAn47BCUqZGhkKxhjYZuS6vR8I17ST3YUx2pN8LmYSe9uaqj
	LIE3I1NEEWalaYafG75azETRxZ5biWpzqnLFAZ+ok0JiQlO7W336rNHB9YdBlUrxoDjijR6FVOWBM
	8GHR9hnprmxY2agGITmt5A3rQeTX7dBV8sgJ0P7akuAT7tB9H9yFrqQGAs+7zBlMdIn+BwNuGih2K
	JlvxUmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj0e-0000000ETyI-0OLN;
	Tue, 30 Jul 2024 09:19:08 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYj0B-0000000ETpV-2OlL;
	Tue, 30 Jul 2024 09:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722331118;
	bh=bRrg7Zj5ARTM5DtHDvFZ1E+jt/2odIow37L7E+ZvNxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dpzWUWB0Mo7i84mSMauFhlUizzmQqdiICv7yWlYyEdxYmc5dHwKzab/hpGZ2agxed
	 w4hMwrL2+e0IZD6Ucf/YQkjnfgjHHwar2b+k/CFhmp/TGJp9WlfrpS8YOtRQh7XPmb
	 ZihzaPg2KZtHQABEdD5U0BrLGOL6IIJjLKZyFOMjpjcqCo/ScCDalWAjBzPCC/jWYy
	 i4Gqdn0usWoMvWs6kyAU9VrIiiuAetpn6xXXxhkZkeGldJoHWx6wcrhl066TqDm9kb
	 SBnFzC0JIA+vxfz8TuFNliwfvmX7ZjTdaWZebdqzBnYiqCKEvzWkXo3mKxLs6dF4gY
	 HoXgg701PFY9Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 59D013780521;
	Tue, 30 Jul 2024 09:18:37 +0000 (UTC)
Message-ID: <d43dc76a-2933-476a-806c-2fbf018dc68d@collabora.com>
Date: Tue, 30 Jul 2024 11:18:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt7986: fix the switch reset
 line on BPI-R3
To: Leith Bade <leith@bade.nz>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, frank-w@public-files.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, didi.debian@cknow.org
References: <20240627075856.2314804-1-leith@bade.nz>
 <20240627075856.2314804-2-leith@bade.nz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627075856.2314804-2-leith@bade.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_021839_776464_04C05365 
X-CRM114-Status: GOOD (  14.98  )
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

Il 27/06/24 09:58, Leith Bade ha scritto:
> The current GPIO definition for the MT7531 switch reset line incorrectly
> specifies a pin GPIO_0 (GPIO5) that is connected to the boot mode
> selection DIP switch (SW1).
> 
> In the public schematic for the BPI-R3 (titled "BPI-R3-MT7986A",
> revision "V1.1", sheet 4), the SPI1_CS (GPIO32) pin of the MT7986 (U1E)
> is connected to the GbE_RESET net.
> 
> Frank Wunderlich has told me, via the Banana Pi forum, that this GbE_RESET
> net connects to the MT7531 reset line in the private part of the shematic
> he has a copy of.
> 

This commit needs a Fixes tag. After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Leith Bade <leith@bade.nz>
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index ed79ad1ae871..951612ea1e66 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -206,7 +206,7 @@ switch: switch@31 {
>   		interrupt-controller;
>   		#interrupt-cells = <1>;
>   		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
> -		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 32 GPIO_ACTIVE_HIGH>;
>   	};
>   };
>   



