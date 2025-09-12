Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA63CAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KppJeNuL2l4XFhCz5C6gp2p8nOC2OrHHCEgzAlkaVM=; b=gv3Tizg2da5k14
	I6UZUkx97pRS32dEvcQPVivv6CYuh4oXE3qTreoOoFbhM/xxfbnA/AxUH3XrwADQshL22sf8wM0Y4
	ckZKq4f03nfSPbwPAShplgZrNrXqtu9bmAD4gpSQpU8ySl7hYNulwzg5p8Pxg1XPrPFHcvDUKhbAj
	Uxfwhhnzv/YzMsveCi6hnM4ffAq21K212fF2Im43U2J5HQuBdJGNSDyrYXHM87g0PlQ0OayFCAWUM
	bRV7z4T09u5MzhQPi9rvAmlZQvLxzvOUqPN96vW8w1u3uINPssjed9imp8EzovMKC4dRAZvVCX5t+
	ooCuo5w4pjHjKc4d89tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4eu-00000009qGs-2pjU;
	Fri, 12 Sep 2025 14:21:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4er-00000009qDq-2ks1
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:21:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3e249a4d605so2147620f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686908; x=1758291708; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+KppJeNuL2l4XFhCz5C6gp2p8nOC2OrHHCEgzAlkaVM=;
        b=LVEsKusOGzNN7aziBjgqiURRLDIZOcS0/seFwhwLehNiOteObyegdCeH8B3wqNS5hc
         0v6b5cSB8hBpC0So7vH5nAUmSZ9brkTZ7NmKHF1ROsOmSOpwJsCowYlrL60SPy5is2jS
         ErsLmfgj+BIdQvVTddFcBtlejsBQo97GMp8SUe6fC1V/LlreWW3ARUD9aRYKbrAYHK3i
         um9WjmZAUSWmx3FjRTjX+MMznnoBXhET5qi8xOKyVPaoiglD5MxPODzGOsYfBNfIBzlZ
         6gthPEIjTvn34W+yXkwl9iCt8PY8N+bPJ+cGxEyhj5E8t+4QWeEBw5wnZuISE43vUJqx
         I07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686908; x=1758291708;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KppJeNuL2l4XFhCz5C6gp2p8nOC2OrHHCEgzAlkaVM=;
        b=ZIB8vgY6GiMffAHn6cjs1dVivBZvkuylfrMqMSByH0mevTVPlNFlfVvMDOHlgZfxC1
         2pSr91vtHSJkpenV5E6ix3MZGp0yKC7p5TOQidu2GmzXh+dt1pB/W1ozM15t2wkRKRCt
         K9YBO9hCr1mSLzTacT+A1VxcKAdbLDSfduEBcQ1lvAB5xbTWGtw3JSuzgLwkss6s32uo
         FOiOeZtrPN0L2NVpY+WKsPy/pt88fmiEtnhJLAPeedD2gweRJYmb6H2g0itO8a4D/UU7
         4/vmhcuGj/ZBZFjFQmVU4EszJpfMOIo5jeHtxhSH2/VONWFcS4NNGLdCdZPsxdR3N3Ho
         BwHA==
X-Forwarded-Encrypted: i=1; AJvYcCWnWixnw4FzqpqgyDG1XqMeLaCqsOfGsKJTcclY4HkufIu0N2H8wYv9JtSf5xF4Gvc+Lu1+nsVl7Ezvo7VVGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrnWK0fR2CI6G/D3MqBhHZL9Jogu1AcvRgVFMpPvms+E4a735k
	/ge9qZEnJVOGeBEGCopG6cEGLm6g8xX9041nF0XiQMZ1coSckctMBba5
X-Gm-Gg: ASbGncuEYLJKm42B2KR79EyPdlIvWsj9RyNXYfSPyvb8wv1wQx2cwy9bfJowp0YZ8md
	8kyRknklKP6ZpW1weKJ+ztMAbvCTrb57XyYs2bg7oC+U1nNiu0sQKI7cAw3dx3caJFiPaTmXQc5
	A/oj5nRWehqdrFOyAzlqsJtPuhXw3aTqEsLkkqoJXq7/CNWJQWk4yGuZqBlTMqRZnkpyyhDI8hq
	l6ym7xi4jRDNOcnpglGYQPW8NRJ8VcPd4mx/zE4tA/EcKycUEDM2XDlPkQVoDvJFkELoKJUTwRy
	LMHv+ZYHfZCgjkzPZnyVMvdOMWMM0C0LIL/kefUAv5qw3maLQfv4DeoZhSJiKIhKvE6Hhla4+Tm
	tYid4OqaGI2UmsPwDNu0dFfO2ZGZaxqbdFcl5LTx5dw==
X-Google-Smtp-Source: AGHT+IHK+0hgrlM5khWk8t6nwTLMx7U+gfNVKxXIvA5zlpQsQiXJ7qzJDVelD4juWa0MBJUTJJKGyg==
X-Received: by 2002:a05:6000:2910:b0:3e5:47a9:1c97 with SMTP id ffacd0b85a97d-3e7659fca68mr3020779f8f.43.1757686907585;
        Fri, 12 Sep 2025 07:21:47 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607878c9sm6750010f8f.26.2025.09.12.07.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:46 -0700 (PDT)
Message-ID: <8550b468-dca5-47f3-a608-a9b4b134131c@gmail.com>
Date: Fri, 12 Sep 2025 16:19:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/38] arm64: dts: mediatek: mt8183-kukui: Move DSI panel
 node to machine dtsis
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-34-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072149_749275_B3D515AB 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Not all of the kukui machines have got a real DSI panel, infact,
> some of those have got a DSI to eDP bridge instead: this means
> that the address and size cells are necessary in the first case
> but unnecessary in the latter.
> 
> Instead of adding a bunch of /delete-node/ which would impact on
> human readability, move the entire panel node declaration to each
> of the relevant Kukui machine dtsi: even though this introduces
> some duplication, the advantages in readability surclass that.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |  5 ----
>   .../dts/mediatek/mt8183-kukui-kakadu.dtsi     | 27 ++++++++++++++++++
>   .../dts/mediatek/mt8183-kukui-kodama.dtsi     | 28 +++++++++++++++++++
>   .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 28 +++++++++++++++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 23 ---------------
>   5 files changed, 83 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index f2afca63c75a..1b74ec171c10 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -93,11 +93,6 @@ cros_ec_pwm: pwm {
>   	};
>   };
>   
> -&dsi0 {
> -	status = "okay";
> -	/delete-node/panel@0;
> -};
> -
>   &dsi_out {
>   	remote-endpoint = <&anx7625_in>;
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 472d4987615a..d71972c94e42 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -61,6 +61,33 @@ &bluetooth {
>   	firmware-name = "nvm_00440302_i2s_eu.bin";
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 1b21e3958061..b702ff066636 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -42,6 +42,34 @@ pp1800_lcd: pp1800-lcd {
>   	};
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a85c73b43195..b6cfcafd8b06 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -45,6 +45,34 @@ &bluetooth {
>   	firmware-name = "nvm_00440302_i2s_eu.bin";
>   };
>   
> +&dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		/* compatible will be set in board dts */
> +		reg = <0>;
> +		enable-gpios = <&pio 45 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_pins_default>;
> +		avdd-supply = <&ppvarn_lcd>;
> +		avee-supply = <&ppvarp_lcd>;
> +		pp1800-supply = <&pp1800_lcd>;
> +		backlight = <&backlight_lcd0>;
> +		rotation = <270>;
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi_out {
> +	remote-endpoint = <&panel_in>;
> +};
> +
>   &i2c0 {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8f3a0e85b4ed..4ac0a60fdd24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -252,29 +252,6 @@ &cpu7 {
>   
>   &dsi0 {
>   	status = "okay";
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	panel: panel@0 {
> -		/* compatible will be set in board dts */
> -		reg = <0>;
> -		enable-gpios = <&pio 45 0>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&panel_pins_default>;
> -		avdd-supply = <&ppvarn_lcd>;
> -		avee-supply = <&ppvarp_lcd>;
> -		pp1800-supply = <&pp1800_lcd>;
> -		backlight = <&backlight_lcd0>;
> -		rotation = <270>;
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi_out {
> -	remote-endpoint = <&panel_in>;
>   };
>   
>   &gic {


