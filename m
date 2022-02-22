Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75366C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 23:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uX4K11iTYO2xQq25OYUb8q2fW+N/t9zPEFBE0sRGecw=; b=Qq1OuK+XMoPXge
	2zbFg5qQwaJKRSUM9HeN8xN02g1Tk1GVOl3YXYOz6kfoLaXJoI54OGjNomV6bGzeKYffzoJJVMPku
	nyoR8R2CLOe5lyjt8vJDzGjaR7sYtYWL9IfC7MKaYu0r9HI6E9zrc6Ixs3z8ktRC3MYW0VkQFoWK3
	wvpuCQp/UrKLBPcjVbYurEktccNhC/d5oJohbG+n4hCLGKacn0OpBSwUjB0XNTEpxonwE/L9zI6TH
	tGdk1tOf6vAwKLff15puvpkZjefCPxdmIUJdPgO6oG56j29SSQvUlG2QT5SLpTxrZGVFk7fMRy9vh
	fAdopJecOIBiQ0HSV7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMeOx-00BtFW-TW; Tue, 22 Feb 2022 23:16:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMeOk-00BtBL-OY; Tue, 22 Feb 2022 23:16:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id EC1691F42A25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645571801;
 bh=r6PeHk2jtY6t4pgQWhoW5J6l8CZI1VG43nrak3LpCXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUQ5gjZpK0k1MfDhWh4gwKuGJY8QtXR+gfjkIi1dSVHB/QfrzDXWAfgzpsJ4B4I+a
 9qkZrZ+zW1YN51SUsZmIXglwH7ETI3pVBloGriz/FwcZADdJRjltvIx3PjSGRyu+ll
 1lXbrg5UNPJqIiwF3nGcsizdzZmTn6sGgu9P9j3pSLFCvrypFg9f/7YPjSflujBcy0
 jVVc+PmCxBYM9uJcYMt5tyrT2kcYyqEvK2FPHSIUBv4MruH2i7DCwo1kWIbXdmCtaR
 RLeiz9o/K6/O7C4CjqgPeVNjZiHyoKD4+fXCjvpl11T7rsyC0Qr9dyMXQXn80l1f9b
 MFA/IKqRamyWw==
Date: Tue, 22 Feb 2022 18:16:35 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 21/23] arm64: dts: mt8192: Add dsi node
Message-ID: <20220222231635.33cupieckldkzgzn@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_151646_988948_D02DA991 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 18, 2022 at 05:16:31PM +0800, Allen-KH Cheng wrote:
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 026f2d8141b0..1f1555fd18f5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1350,6 +1350,19 @@
>  			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>  		};
>  
> +		dsi0: dsi@14010000 {
> +			compatible = "mediatek,mt8183-dsi";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,syscon-dsi = <&mmsys 0x140>;
> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				<&mmsys CLK_MM_DSI_DSI0>,
> +				<&mipi_tx0>;

Please fix the indentation.

> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";
> +		};
> +
>  		ovl_2l2: ovl@14014000 {
>  			compatible = "mediatek,mt8192-disp-ovl-2l";
>  			reg = <0 0x14014000 0 0x1000>;
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
