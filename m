Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6309BC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R47iGWS4WnNysd5I5c8LqLhv0aBD8z026RJHsgkjeuU=; b=KbeGCQj6w7VN1F
	gQRBr8RdE1mqP3wq3+qqYq0LLGucuIhfsyuE7ernqPAFC3nV466XsO8F+kmIhdl0OaTTNSPWVQrCp
	u5y/lPCyNyu0a2FORPzFLyFUMVPK1X6xPKtRqC6tl5zaBWXKRpvzPDBEcbk3t1owMEQBq8Zf5yUFS
	90mVFyk9v9vg5PxwflfSGwaY+rqssv/g3Nc/SUVH1ziCw3LcDmZZDUzNiU+S4pSwOh+8halbDHwB0
	kHyJ3WzjJvw2vUlwaLj3rHkW9wRLlV3Sa1/KWFI/2HrNRf1ruFNY70WWBzXXFCQnMeOfptKZGcDtu
	RSSiQNgWoUMzEVYz5qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkniy-00EQJJ-O3; Sat, 30 Apr 2022 14:05:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkniv-00EQIh-PQ; Sat, 30 Apr 2022 14:05:27 +0000
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <heiko@sntech.de>)
 id 1nknid-0001W7-8u; Sat, 30 Apr 2022 16:05:07 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Date: Sat, 30 Apr 2022 16:05:06 +0200
Message-ID: <3557249.iIbC2pHGDl@phil>
In-Reply-To: <20220430130347.15190-5-linux@fw-web.de>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_070525_874748_5DEC5FA2 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Samstag, 30. April 2022, 15:03:47 CEST schrieb Frank Wunderlich:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Device Tree node for mt7531 switch connected to gmac0.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - drop status=disabled
> ---
>  .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index ed2f2bd9a016..f0ffbe818170 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> @@ -437,6 +437,54 @@ &i2c5 {
>  	status = "disabled";
>  };
>  
> +&mdio0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	switch@0 {
> +		compatible = "mediatek,mt7531";
> +		reg = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +				label = "lan0";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				label = "lan1";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				label = "lan2";
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				label = "lan3";
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				label = "cpu";
> +				ethernet = <&gmac0>;
> +				phy-mode = "rgmii";
- phy-mode: String, the following values are acceptable for port labeled
	"cpu":
	If compatible mediatek,mt7530 or mediatek,mt7621 is set,
	must be either "trgmii" or "rgmii"
	If compatible mediatek,mt7531 is set,
	must be either "sgmii", "1000base-x" or "2500base-x"

So I guess the phy-mode needs to change?


Heiko

> +
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +					pause;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &mdio1 {
>  	rgmii_phy1: ethernet-phy@0 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> 





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
