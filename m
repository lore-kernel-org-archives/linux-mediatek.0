Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF15C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYmR5W26TEhlXrl4FPGFZL6Kqr3wH54Kcl2RTIatj5g=; b=2U+3BEChMlYoly
	NwZLgR7NG4YcKfSlJm71KV7+I9cPpJKpEQIr5TZbrsOB7FcHCJ/pubH/f4ZTr4j/G4Mk7R9A8wTWf
	+cSNDoWhPLSEnZzHHIPGLpOfOtMCU5WkQ3/wVf38De/9NY7pzHem1aw2kt5s7P86GjGgzGJX63VDG
	yfOgsYo86dr1Wxhl0VxN0RnZdVfR/36/pkof4Ufbk9YU5za92ITVHcAH2ALI/DqH4rR6MzAww0amC
	Bf9HAstIXccYycXPUQunlX69rIpgkA1Mt+qRtJ93r0Ltiph0UFCYEwVxBh3RyxRJ1vrYaKHAJJGnl
	mrJtKcA6HCPvQyIbifNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3Or-00EbyW-UT; Fri, 18 Feb 2022 13:34:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2o4-00ELgu-BN; Fri, 18 Feb 2022 12:56:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 05B621F4241F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188975;
 bh=vYybVfxwdCEV/CCokEdFCHCzJx1h/SHusE4GhNmMHlo=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=QotMRuu+LAfP3106/kPC5ecRGxEaUOMWkk+1ZftxenKUfoeO1TIS/wuEDnFqx1TRZ
 uxa342L6RjZy16Qz0SLE7HEMkhPpxcE8pw0l4x/qDVkjqMo74oGmNLr5Ry8gZokD5R
 127vodAYPwJNOm6+lTsirhMk2ZcRgRk4EhmJwUXOA6uM/ib0ZSHiAyLWRLGfJDaD3O
 3QYClKEo3gBTKm+U5zFJSafREWmxnirtpQGVDsK+fU7S8Bq0di0rLaOPn5CoN+mZaE
 yMeh7pj4plhboKj3QIIvj9ICZ/jU6GN4roGM3MPi629Mv1B5ldTfQjLHd0EWOlaTIW
 dolwkQkhT8Iaw==
Message-ID: <0c28ee90-6dc0-9230-1feb-7c0c2cde24c1@collabora.com>
Date: Fri, 18 Feb 2022 13:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 18/23] arm64: dts: mt8192: Add dpi node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-19-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-19-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045616_620078_E241DC70 
X-CRM114-Status: GOOD (  12.84  )
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

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add dpi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 543a80252ce5..55bcbf72a366 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1242,6 +1242,16 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   		};
>   
> +		dpi0: dpi@14016000 {
> +			compatible = "mediatek,mt8192-dpi";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DPI_DPI0>,
> +				<&mmsys CLK_MM_DISP_DPI0>,
> +				<&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";

Please, for the same reason explained for mipi_tx0:

			status = "disabled";

> +		};
> +
>   		iommu0: m4u@1401d000 {
>   			compatible = "mediatek,mt8192-m4u";
>   			reg = <0 0x1401d000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
