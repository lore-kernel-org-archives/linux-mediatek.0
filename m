Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F3CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tV9pMRgdRwKF46TeBBMYLu5xlTCgPW7mhEdnvZE58GM=; b=MnQUwZr9uXJp2Y
	KdjwIoh0SZ0z7dwAm18zp7Znx7pkvwATLmrGkS5r4zw0sPfhuoFHENdZExjVGVus4nRn0ZsiulgvE
	+CfSq3ac/outr4uSqz1kVCwXUhVpMEQY5ofm7L1eKf5R2Dmcy8bJ7hjctAqegCd44af66fSb0shw4
	eQtVhMcmQmC4+dxLdXiedJCxC5F/rOa9BGpgWyKZru9O1SD0GaTT8IlC+GnEDQDx0fsHP1l8BAuUr
	5lRr+hA5HKSqWBEg9VQ6duxHN0fhmEvzna1Lx3IyYfbgeqzHd5iDhDQebK/3ECTv760f74oe+mLw4
	8T2A0Y4L0DX8PbZfMKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMbUs-00BU48-Ou; Tue, 22 Feb 2022 20:10:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMbUf-00BTzM-CX; Tue, 22 Feb 2022 20:10:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 962771F43B94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645560640;
 bh=ijj2dOGdIN4gy/4SAGPiZ20l35Ou58dlQ9MCO5DfMIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G29CedeLHQLOCZfpfQbXX3XGa/nWcAvsTeMiNJZOsDGFnAgdYZyDnAgQFbC8m0deA
 Vt+3/geQqeCPUzmdB8wrYXBCKB8CHJt/Ld9rS/uXc4iwNVZ515AAHeKJX66hivM9ZJ
 r4XlsCk6FQDniPjKYHIRdBU2uL8rvjBZpY/BLcnZRPdKFnt/j9jGwOiBX10U28FGjD
 NOsL0t71Wz/Jaq8/1ui5ABEk4ws6yxl508TopE3RbC9rVksAgYX9I6H2MlM5rFdmGK
 lCeQ6zxWsUnJFqZWKCm9laTtntmxnljkOuVnFnIOIN83ghTGSdsB5ClP6jrzGSDBud
 AcqnN5T8i1n+Q==
Date: Tue, 22 Feb 2022 15:10:34 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
Subject: Re: [PATCH v2 06/23] arm64: dts: mt8192: Add usb-phy node
Message-ID: <20220222201034.pb36pfrgujushsge@notapiano>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220218091633.9368-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_121041_584949_5629DA1E 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, Feb 18, 2022 at 05:16:16PM +0800, Allen-KH Cheng wrote:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 61aadd7bd397..ce18d692175f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -875,6 +875,31 @@
>  			#clock-cells = <1>;
>  		};
>  
> +		u3phy0: usb-phy@11e40000 {

According to Documentation/devicetree/bindings/phy/mediatek,tphy.yaml, this node
should be called t-phy. Only the child nodes should be usb-phy.

> +			compatible = "mediatek,mt8192-tphy",
> +				     "mediatek,generic-tphy-v2";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			status = "okay";

"okay" is already the default status, so you can drop this line, as well as the
ones on the child nodes below.

> +
> +			u2port0: usb-phy@11e40000 {
> +				reg = <0 0x11e40000 0 0x700>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				status = "okay";
> +			};
> +
> +			u3port0: usb-phy@11e40700 {
> +				reg = <0 0x11e40700 0 0x900>;
> +				clocks = <&clk26m>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +				status = "okay";
> +			};
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
