Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C6EC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 10:33:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E79622CE3
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 10:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E79622CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2zC1n4MYcyI+eBo/oZ1+QavSZD5UD8E65/8vH2eH08c=; b=fUNbQtAQiI6naeEQSWMWoLJbS
	yeZhqJoioAmD9QuGH+p47rbqrKgNH5D1AOnFbChWfVzjCrGUAuQnSFjmi9S+mRCuTEB5RT8sgvAFb
	ZtOUTF7N0HJtKKS7o81w8D/4Nepz7AIq3gmd9xNTaZlmALqDhIaL1xEuqrV5XV5FyILhLQ4SmbwKk
	6IUhfG2BvNkUuXsz3LPkuk9qU/DuWqDXpwd4qtnGmwvD5MR8936JIvEo/HaetkDqBSjNg9V09ONbx
	IcgGiuzYLmKetXMRShpjRm5DvTJxRX3fKwjAU1qr9wGNZBdM6NjYoH9x3gDwwjfyBEMknSf64/O0h
	f/rrl+Vmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdT3-0000dy-Uv; Wed, 13 Jan 2021 10:33:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdSz-0000cj-5a; Wed, 13 Jan 2021 10:33:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 9547A1F4102A
Subject: Re: [PATCH v3 1/2] arm64: dts: mt8183: config dsi node
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210113062834.4043956-1-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <6f4c11c7-ee1e-0308-2328-d71906a8c0c8@collabora.com>
Date: Wed, 13 Jan 2021 11:33:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210113062834.4043956-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_053329_320335_8DB84446 
X-CRM114-Status: GOOD (  18.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

On 13/1/21 7:28, Hsin-Yi Wang wrote:
> Config dsi node for mt8183 kukui. Set panel and ports.
> 
> Several kukui boards share the same panel property and only compatible
> is different. So compatible will be set in board dts for comparison
> convenience.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 37 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> index 47113e275cb52..721d16f9c3b4f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
> @@ -16,3 +16,8 @@ / {
>  	model = "MediaTek krane sku176 board";
>  	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
>  };
> +
> +&panel {
> +        status = "okay";
> +        compatible = "boe,tv101wum-nl6";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd30..c5f41b94f154e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -249,6 +249,35 @@ &cpu7 {
>  	proc-supply = <&mt6358_vproc11_reg>;
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;

It'd make sense to add also the backlight here?

+               backlight = <&backlight_lcd0>;

> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port {
> +			dsi_out: endpoint {
> +				remote-endpoint = <&panel_in>;
> +			};
> +		};
> +	};
> +};
> +

I think you should enable the MIPI TX to have DSI and panel working?

+&mipi_tx0 {
+       status = "okay";
+};


>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0_pins>;
> @@ -547,6 +576,14 @@ pins_clk {
>  		};
>  	};
>  
> +	panel_pins_default: panel_pins_default {
> +		panel_reset {
> +			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
> +			output-low;
> +			bias-pull-up;
> +		};
> +	};
> +
>  	pwm0_pin_default: pwm0_pin_default {
>  		pins1 {
>  			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
