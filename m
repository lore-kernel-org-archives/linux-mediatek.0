Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C43AC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8vamZNWKG+VsRUBX73rU9b31g21rAR3rtXbwTgn5DkI=; b=wPD3AZRFbMff5k
	Doh6fnY5cSYFGkaqt/74qFTGIL8qCG5Wp6RbQgxY2JjKtk+Vj17+75+3LlXxzBO4S6xRwAO4YBHTk
	OjUU7LeE3VmPWUlZLlVliypuAz5NDVq1t0MDxh+RjbcfZij++1XoErKpsNxULSGKsqLbIJE4CcT91
	Q2k+XqUl6XDaZlxW7Y9NPZr6hZXFBjVaAaBsjNQdzB0vSnjY0T0pd/1pb96UOHXJgvhwkzK3myEaQ
	wE25Y0UY08fkCzWKvASP24fkx2+cdEeNnqLC84OtsrSkZ+BQ9V99YZaKQb56F9lPSv+rTlhLgQiLw
	KVoNh7w8FeJBwIbgv+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5xZ-003ZGk-6t; Mon, 23 May 2022 11:10:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4vi-0035IV-NM; Mon, 23 May 2022 10:04:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B888A1F41C08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653300289;
 bh=GO3pTjYvyxyhAs/0dgN9/lVi2515gb9ZaDpQ4GAZKm8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dRAR+qsGkJ2/IN9jSl1ZS+W7iWu9cZmOEOHTU1+mujZBjw4VAtBWspkSiFgUe7Gj9
 l0PaGsHJEgPhshlEXnphw7w6OfIXWgms2bD9CIzeTBEe96z6gSoOs9KkfYoIPKxO6K
 ECKU8vN3+QGUP43qMHYVDa3rFKN8ynYWRbLtXRDeY+T2CMIAgwGpTF7Lbikg7r9c5E
 x6uYxn94fQdvvdocz/ZdUy8XscXlZ7KdbCQreAPyRGwZmFFe4PYS2kCD7YZJv7Oode
 7I26Bgd4rePJRexhypZoTJI7IVwFSG2Ffy8OOaB5Ar/q7e/+gm7WfkqUn+vHpTZEfB
 DtOPVkWtf1wYw==
Message-ID: <0b46efc0-bc06-5416-f24b-c53ff79736c8@collabora.com>
Date: Mon, 23 May 2022 12:04:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/4] arm64: dts: mt8183: Fix Mali GPU clock
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220523085923.1430470-1-wenst@chromium.org>
 <20220523085923.1430470-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523085923.1430470-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030450_967061_A5FAAF61 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 10:59, Chen-Yu Tsai ha scritto:
> The actual clock feeding into the Mali GPU on the MT8183 is from the
> clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
> block, which itself is simply a pass-through placeholder for the MFGPLL
> in the APMIXEDSYS block.
> 
> Fix the hardware description with the correct clock reference.
> 
> Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 01e650251928..6ced76a60aab 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1368,7 +1368,7 @@ gpu: gpu@13040000 {
>   				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
>   			interrupt-names = "job", "mmu", "gpu";
>   
> -			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> +			clocks = <&mfgcfg CLK_MFG_BG3D>;
>   
>   			power-domains =
>   				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
