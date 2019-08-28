From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH net-next v4 3/3] dt-bindings: net: ethernet: Update mt7622
 docs and dts to reflect the new phylink API
Date: Wed, 28 Aug 2019 11:29:45 +0200
Message-ID: <e45565b1-bb63-66af-16f6-5c7c1094dd67@gmail.com>
References: <20190825174341.20750-1-opensource@vdorst.com>
 <20190825174341.20750-4-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190825174341.20750-4-opensource@vdorst.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Nelson Chang <nelson.chang@mediatek.com>, "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Frank Wunderlich <frank-w@public-files.de>, Stefan Roese <sr@denx.de>
List-Id: linux-mediatek@lists.infradead.org

Hi David,

On 25/08/2019 19:43, René van Dorst wrote:
> This patch the removes the recently added mediatek,physpeed property.
> Use the fixed-link property speed = <2500> to set the phy in 2.5Gbit.
> See mt7622-bananapi-bpi-r64.dts for a working example.
> 
> Signed-off-by: René van Dorst <opensource@vdorst.com>
> --
> v3->v4:
> * no change
> v2->v3:
> * no change
> v1->v2:
> * SGMII port only support BASE-X at 2.5Gbit.
> ---
>  .../arm/mediatek/mediatek,sgmiisys.txt        |  2 --
>  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 28 +++++++++++++------
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi      |  1 -
>  3 files changed, 19 insertions(+), 12 deletions(-)

Thanks for taking this patch. For the next time, please make sure that dts[i]
patches are independent from the binding description, as dts[i] should go
through my tree. No problem for this round, just saying for the future.

Regards,
Matthias

> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> index f5518f26a914..30cb645c0e54 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> @@ -9,8 +9,6 @@ Required Properties:
>  	- "mediatek,mt7622-sgmiisys", "syscon"
>  	- "mediatek,mt7629-sgmiisys", "syscon"
>  - #clock-cells: Must be 1
> -- mediatek,physpeed: Should be one of "auto", "1000" or "2500" to match up
> -		     the capability of the target PHY.
>  
>  The SGMIISYS controller uses the common clk binding from
>  Documentation/devicetree/bindings/clock/clock-bindings.txt
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index 710c5c3d87d3..83e10591e0e5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -115,24 +115,34 @@
>  };
>  
>  &eth {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&eth_pins>;
>  	status = "okay";
> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "2500base-x";
> +
> +		fixed-link {
> +			speed = <2500>;
> +			full-duplex;
> +			pause;
> +		};
> +	};
>  
>  	gmac1: mac@1 {
>  		compatible = "mediatek,eth-mac";
>  		reg = <1>;
> -		phy-handle = <&phy5>;
> +		phy-mode = "rgmii";
> +
> +		fixed-link {
> +			speed = <1000>;
> +			full-duplex;
> +			pause;
> +		};
>  	};
>  
> -	mdio-bus {
> +	mdio: mdio-bus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> -
> -		phy5: ethernet-phy@5 {
> -			reg = <5>;
> -			phy-mode = "sgmii";
> -		};
>  	};
>  };
>  
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index d1e13d340e26..dac51e98204c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -931,6 +931,5 @@
>  			     "syscon";
>  		reg = <0 0x1b128000 0 0x3000>;
>  		#clock-cells = <1>;
> -		mediatek,physpeed = "2500";
>  	};
>  };
> 
