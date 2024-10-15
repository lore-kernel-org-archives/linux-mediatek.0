Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF1BD1D870
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qgftSmzkPVyMFkAkZvkigmnkWNfEho59ZHxI7A+EBVg=; b=htKvu04pixFO0o7Vji0pLom+/v
	rIE6J4pIpA0b/SCTA4FKOkbJDP7WCcq7XEGpkWcI9Fe8xkkeTtGX1EviszKPuMpkCLYS4Y2Ya3IxH
	fffd0W8FlVSrM96XDEKSmRSgGpPh/vFjRU5IIf2IaMELXPj32RYRfX8DVts0pJ2ZRPXwRnjH+oJyR
	7+O1oZTk8kyki6xfXdBLxph+SoZWfuUWMzdJ3ZSTkzsz6WALbRB+4ZXYmdYkQ2ujh1CY6jTjT9eXB
	pmfqBVgHUHBfiD1K1DRwQioDF3XznoA+2kLUOmQmDoqZ+trlqIVpr3S/kULFqWGFgPg2L8jCAKnC7
	mV4pDgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oe0-00000009Yye-3lWl;
	Tue, 15 Oct 2024 20:59:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0oau-00000009YVz-0Ajk;
	Tue, 15 Oct 2024 20:56:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF1DB5C4CEB;
	Tue, 15 Oct 2024 20:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABD2C4CEC6;
	Tue, 15 Oct 2024 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729025799;
	bh=COqA3y5JKsekq6nOGaTnmPFsD3u1LocTUoESaQBM8sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GE+V9sNL2uXDEmkps1B1aP3XL4XRdAvgkdl6+dVVrgBTD86ZOcCDbnCVeap08q/YQ
	 k4DC6jXcdJNPVf1hcovW8aCrrMVcZ9tHRanzyFOyir49CnmDdTSkU59z9FzAzDqL6l
	 5bcsIoBWxv5cz/m4GxRcA6sOYLUm1fpVIiYj4m8kdH9+q3b01Mk++qKHPopHrqHzDa
	 SjN3JMCP6IyIba7mKmhNig2Ld0kQaCszIcoZYggjHtIfMB77ZKosr3vgpogLO/Lrwm
	 pzX85fYZb3Rp+lrZJgE7DYngOmlSCf9qxFtpPLbUo5/6qkhPZOeNoYGyFGMaJ8ytPy
	 KPQ/Z9FLG7wCw==
Date: Tue, 15 Oct 2024 15:56:37 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	ChiYuan Huang <cy_huang@richtek.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Chris-qj chen <chris-qj.chen@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Simon Sun <simon.sun@yunjingtech.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
Message-ID: <20241015205637.GB1934266-robh@kernel.org>
References: <20241015103337.20479-1-macpaul.lin@mediatek.com>
 <20241015103337.20479-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015103337.20479-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_135640_197003_7EDBEE40 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, Oct 15, 2024 at 06:33:37PM +0800, Macpaul Lin wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, and related settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SSUSB (SuperSpeed USB).
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../dts/mediatek/mt8395-genio-1200-evk.dts    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 5f16fb820580..b91a46f4a702 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -249,6 +249,39 @@ mt6360: pmic@34 {
>  		#interrupt-cells = <1>;
>  		pinctrl-0 = <&mt6360_pins>;
>  
> +		tcpc {
> +			compatible = "mediatek,mt6360-tcpc";
> +			interrupts-extended = <&pio 17 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "PD_IRQB";
> +
> +			connector {
> +				compatible = "usb-c-connector";
> +				label = "USB-C";
> +				data-role = "dual";
> +				power-role = "dual";
> +				try-power-role = "sink";
> +				source-pdos = <PDO_FIXED(5000, 1000, \
> +					       PDO_FIXED_DUAL_ROLE | \
> +					       PDO_FIXED_DATA_SWAP)>;
> +				sink-pdos = <PDO_FIXED(5000, 2000, \
> +					     PDO_FIXED_DUAL_ROLE | \
> +					     PDO_FIXED_DATA_SWAP)>;
> +				op-sink-microwatt = <10000000>;
> +			};
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					mt6360_ssusb_ep: endpoint {
> +						remote-endpoint = <&ssusb_ep>;

No, this is wrong. This should go to 'port@1' in the connector node. 
That is the SS connection.

Rob

