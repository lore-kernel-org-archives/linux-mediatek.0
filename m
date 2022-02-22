Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48C8C43219
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 21:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61LQGrP/wiRcWWk2oge8emL4RGueqFfDLW7KHsuY0Bk=; b=FT/eA8djAHxSXt
	wtfbrIkprrJyLWZdxh7ViMu3Mrwl+SQaXSJNxrreOnYT06TBk85BbjbO+X8DU9h/9h8YHST94o9sB
	9Az4/Wr/CmEuQqGKoC/LW5s9tJgIoSGfVSVflmt/48vvpVXtbSQW2DTGrnWWSr4pqzdsmyNBYhDUD
	lo0GmDszKbUMSxbuAwypRe3dF6DX7n0LdIR0yxXVKibxx6mv+d4JaGKZGQfXhVkdprfIL4cAX635U
	hTqjgNXflyLC+eYf3q+KdEjmpZ6WnR4QEqSUqSC0sHUb21iFrLFWh7bN/ZFp2dQN5yyFbOXhRAV1G
	ADsyzQP+0JK7D3EBsvgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMcgy-00BfLo-AV; Tue, 22 Feb 2022 21:27:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMcgb-00BfC7-3K; Tue, 22 Feb 2022 21:27:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 85AAE1F43C9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645565223;
 bh=9taHBRKeDVk3pqAcIWviMl4FP9lPlYjt9sExErI2Two=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OI6vcjXnKEAap1oo7yLdLSKaq/zJtCvz1L565DXez7v46BufwMQtbDe4C/cTevSFm
 n95HxUQQcgERx76OqyKtISyrunX5ZASrc5P3luaIxgwBwc7MjnTLYvElFVa0sxso+B
 qJMPcsTyvp2pn1g7AYMD+QNzZcI63z+a+xKQtM7m78+gpkoZ9/pBXvWte9O7zOBI7o
 k6O70T3iFLIYkkgT8AxH1z5BuoD0S+eyIqxjWTBL/AfIuQVyNa7vSP75p28B9TEyzM
 92KxVT4xPThFwEpkASPbuB6YCRc02wFTaKJb4qb4nfNGqtwCGkKwQw2vjWrZtEUQe+
 442F7NoxtQdQQ==
Date: Tue, 22 Feb 2022 16:26:58 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 14/23] arm64: dts: mt8192: Add mipi_tx node
Message-ID: <20220222212658.xuau6t3xcvu7m4uz@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-15-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_132705_304884_4E1006D3 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, Feb 18, 2022 at 05:16:24PM +0800, Allen-KH Cheng wrote:
> Add mipi_tx node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index cfc2db501108..f5e5af949f19 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1114,6 +1114,16 @@
>  			};
>  		};
>  
> +		mipi_tx0: mipi-dphy@11e50000 {

According to Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml, this
node's name should be dsi-phy, not mipi-dphy.

> +			compatible = "mediatek,mt8183-mipi-tx";
> +			reg = <0 0x11e50000 0 0x1000>;
> +			clocks = <&apmixedsys CLK_APMIXED_MIPID26M>;
> +			clock-names = "ref_clk";
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +			clock-output-names = "mipi_tx0_pll";
> +		};
> +
>  		i2c0: i2c@11f00000 {
>  			compatible = "mediatek,mt8192-i2c";
>  			reg = <0 0x11f00000 0 0x1000>,
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
