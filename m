Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F57C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 01:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QAxitb0ls1ooux+j7WSh6362qnzmsRmp9ZuJHwXqCvg=; b=ywC1FcZNIpge/oMs0PyGnnydlX
	7tFDJ6wcptqeeEhmfmKuU072OLapPE+3U24qNGcm2umOXuQfX855VZtsmGsdRLlabIZauZDlUcnGp
	3N/enlDLy4lLGJgfd7twQqcJAx5Mw98hb7QQ9Hc1LVryDrztwF+RrL0M0phV06B7OP+wYebGppK4/
	9EbyXCkyycaFNwsuMcaqJ1uS/xVyiSoEf7aN9988eEIfsXA6pH84T0yz926KdoGzg//UK9576waRd
	mwtZr+sJYSPMlwc5uZk5fnUSv0DnbvDGWr/OXYGSAZjBXXMSDeWfvaBO8Ed6h77agFj850I6EfHKZ
	odQLBmDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0WsM-0000000EZpO-2r79;
	Sat, 27 Apr 2024 01:29:14 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0WsJ-0000000EZoY-10LD;
	Sat, 27 Apr 2024 01:29:12 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s0WsA-0000000060D-3rUx;
	Sat, 27 Apr 2024 01:29:03 +0000
Date: Sat, 27 Apr 2024 02:28:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc.unal@arinc9.com
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt7986: set PHY address of
 MT7531 switch to 0x1f
Message-ID: <ZixU287DdhvRyZBe@makrotopia.org>
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <20240314-for-mediatek-mt7531-phy-address-v1-2-52f58db01acd@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314-for-mediatek-mt7531-phy-address-v1-2-52f58db01acd@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_182911_305099_7177CC57 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Arınç,

On Thu, Mar 14, 2024 at 03:20:05PM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7531 switch listens on PHY address 0x1f on an MDIO bus. I've got two
> findings that support this. There's no bootstrapping option to change the
> PHY address of the switch. The Linux driver hardcodes 0x1f as the PHY
> address of the switch. So the reg property on the device tree is currently
> ignored by the Linux driver.
> 
> Therefore, describe the correct PHY address on boards that have this
> switch. This is already the case on all MT7986 boards here, so use
> hexadecimal numbering and align the switch node name with the reg value.

Sorry for the late reply to this series which I had not noticed earlier.
My comment below applies for the whole series.

While this is generally correct, you are mixing cosmetic with functional
changes here.

Replacing
reg = <31>;
with
reg = <0x1f>;
is a purely cosmetic change (and it's up to maintainers taste to like
one or the other notation more).

On the other hand replacing
switch@0 or switch@31
with
switch@1f
is fixing a bug. Yet even that doesn't have any functional impact on the
affected boards as there aren't any other DT nodes which would collide
with that incorrect address, nor does the driver actually care about the
node name (not before and not after your patch
"net: dsa: mt7530-mdio: read PHY address of switch from device tree").
Anyway, there *is* something wrong and everybody should agree it's a
good thing to fix it.

So imho you should start with a patch only replacing all instances of
mt7530/mt7531 switch nodes named 'switch@0' or 'switch@31' with
'switch@1f' as that's fixing an actual (minor) bug.

The other thing, using hexadecimal notation for the 'reg' property is
a mere matter of (statistically unusual) taste. I fully get the point
that using hexdecimal for both, the address in the node name as well
as the 'reg' property avoids the exact divergence of the two you are
fixing now.

Byt statistically unusual I mean:
$ find -name \*.dts\* | while read line; do grep 'reg.*=.*<[0-9]*>' $line ; done | wc -l
37284
$ find -name \*.dts\* | while read line; do grep 'reg.*=.*<0x[0-9a-fA-F]*>' $line ; done | wc -l
10339

(I know the above regexp could be done more accurately, but it's good
enough to demonstrate my point)

So please make this four patches. Two fixing the wrong node names.
And another two opening the (purely cosmetic) debate to use hexademical
notation for the 'reg' property.


Cheers


Daniel



> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> index e04b1c0c0ebb..2f92f8cfd8a3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
> @@ -200,9 +200,9 @@ mdio: mdio-bus {
>  };
>  
>  &mdio {
> -	switch: switch@31 {
> +	switch: switch@1f {
>  		compatible = "mediatek,mt7531";
> -		reg = <31>;
> +		reg = <0x1f>;
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index 5d8e3d3f6c20..47f75ece1872 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -84,9 +84,9 @@ mdio: mdio-bus {
>  };
>  
>  &mdio {
> -	switch: switch@0 {
> +	switch: switch@1f {
>  		compatible = "mediatek,mt7531";
> -		reg = <31>;
> +		reg = <0x1f>;
>  		reset-gpios = <&pio 5 0>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 58f77d932429..5148a69f4729 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -61,9 +61,9 @@ mdio: mdio-bus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> -		switch@0 {
> +		switch@1f {
>  			compatible = "mediatek,mt7531";
> -			reg = <31>;
> +			reg = <0x1f>;
>  			reset-gpios = <&pio 5 0>;
>  
>  			ports {
> 
> -- 
> 2.40.1
> 
> 

