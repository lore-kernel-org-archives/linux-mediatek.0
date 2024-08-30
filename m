Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ADFCA0EF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 21:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd2MUC+igQ7kKMJ3pfr9o8ROCaWlkkNdOLKFcewtlN8=; b=Nt0bCdV6N+24rEB3enH1MLPFHq
	8APcAkGjDZmtV5mlsAzCKKQc3y/9U9l+kZZTEIZxi7t44X+byMpBZ6ElzxQe8JAtvV3P8g3eY8Mqv
	kkUvNhNYOwjsz2EV0AfJ/6luDPWCZtZi0rrMAps27LYo22yUrTJ/1wwbUlnpUs0o2xNOGhlCBt2yj
	O6qFfRfl2mletHFj1H4ed6lrLoK1bpkLUttBxLePq52leM/UBQliktXAmfOOP5QyAT3txIIm6mk8C
	sGfs/IU8F2B9HOAlhVqYVI+NXc++nT2ygJfTlef8WmhwJCaLQvtXOHZqMNsriCBP8nTH+ucY5RTSA
	zfErnXDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk9Gz-00000007kaE-1lnY;
	Fri, 30 Aug 2024 21:35:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk9G5-00000007kTE-0NB3;
	Fri, 30 Aug 2024 21:34:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725053653;
	bh=6JkLzJUtUYqH168S14hpBrlJnWK/5jDaKFH7dIaPYv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUIc+SDyLrk3dIz0InmtjLeET5JiIGzd/rJ1IRjfH1V9O+k8e/UmMFIylwYkQX49A
	 u+/CYAWO5xaf2XXpgf4pX6Xbm3D42p2n66k+irK+7HjYGi1C483T2GXW+sBksym46t
	 AEbqDjrjZBg6qcPbRey6TF0HOFpJeMITR3cK4NLdjJGyDeOVK4romujn4EXCwHzC4b
	 4HZ3wTNmSCx9eFNSwgs4R20d3m9O5Tvo6MsD2BcqTfoBreQh82rNus9//yuIxjETbg
	 6XlEAKSMqjnQGLuX6Tax/4PoNkltGy9+ZSDNjMenk31IxygQGyABWxW2bMDriRSIGJ
	 OuvY1sRgQBftQ==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E4B717E14D5;
	Fri, 30 Aug 2024 23:34:12 +0200 (CEST)
Date: Fri, 30 Aug 2024 17:34:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [RESEND PATCH v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add
 HDMI support
Message-ID: <c0597ae3-8849-4311-bab6-1c01575ec5e0@notapiano>
References: <20240819120735.1508789-1-treapking@chromium.org>
 <20240819120735.1508789-2-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240819120735.1508789-2-treapking@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_143417_350798_B1530C7C 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, Aug 19, 2024 at 08:05:56PM +0800, Pin-yen Lin wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> The MT8183 Pumpkin board has a micro-HDMI connector. HDMI support is
> provided by an IT66121 DPI <-> HDMI bridge.
> 
> This commit enables DPI and add the node for the IT66121 bridge.

Make it imperative [1]:

Enable the DPI and add the node for the IT66121 bridge.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

You should also add a Co-developed-by tag for yourself since you made (or will
make) changes to this commit.

> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> (no changes since v1)
> 
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index 1aa668c3ccf9..ecc237355b56 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
[..]
> @@ -120,6 +132,41 @@ &i2c6 {
>  	pinctrl-0 = <&i2c6_pins>;
>  	status = "okay";
>  	clock-frequency = <100000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	it66121hdmitx: hdmitx@4c {
> +		compatible = "ite,it66121";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ite_pins>;
> +		vcn33-supply = <&mt6358_vcn33_wifi_reg>;

As pointed out by lkp this label doesn't exist:
https://lore.kernel.org/all/202408200703.MYO1s3Ne-lkp@intel.com/

See 9a8014b1d4d2 ("arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators").

> +		vcn18-supply = <&mt6358_vcn18_reg>;
> +		vrf12-supply = <&mt6358_vrf12_reg>;
> +		reset-gpios = <&pio 160 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		reg = <0x4c>;

Please take a look at https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
for among other things, suggested ordering of properties in nodes. reg is
commonly the second property.

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;

Add a blank line here.

> +				it66121_in: endpoint {
> +					bus-width = <12>;
> +					remote-endpoint = <&dpi_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;

Ditto.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

