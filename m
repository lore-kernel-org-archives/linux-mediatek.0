Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8478C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 13:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsSZ4xmQ15S9yMS17JAsRW4h2Rkx74lE9OsNIPFxOkQ=; b=vILc+cjGQBd5BYltyohKQWPp8C
	lKXZvBAUcGb5Ty34ZgJEukbrkJgNCbi4K0Lnd61/HRDYoapX8pwMAX2DpqSCJ7y/pA5cebckBxADH
	he8LdovyhWnEUxhgGi9ZwDiEzvS50ydgmFBQwd6cFcu0WXvjZLIurrECi5QTMtWqUKVGHZ3p+ZCBF
	Wg156byuXO7qN/NZgYdsDulwSueJvTdk+wF6R8QV1MCOadbzcXgRJymqWJQxLopsMEUfaAIVgqnzO
	sGTT62zt8SRLkA2+opXOAhEC2jbqHT4c5+bo8Hh5JX80Qrf2cypmwrJRhCltRJygkGRqfwWI5VIc3
	GZeiIToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R9B-00GtwR-2b;
	Tue, 21 Nov 2023 13:50:37 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5R95-00GtuV-14;
	Tue, 21 Nov 2023 13:50:35 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507962561adso8126812e87.0;
        Tue, 21 Nov 2023 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700574628; x=1701179428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsSZ4xmQ15S9yMS17JAsRW4h2Rkx74lE9OsNIPFxOkQ=;
        b=UHB5OcqckxY/47aDPnsNsLQz3L9lukxBu/qKtmQLH8P2XRxGzZBnv2HJg9yVOXlJRI
         krxjip/0Bp1pZ9kJO7OQ7HtwhTQ/mPAWkdAceWSFTnL5POdwzqCVQl0Clyzhbx+OJRgL
         vITb2CkqK+vtBbstrDH25ZBxke9GOQoUGzpama7fKJRPQ+aemLtSlE7emF8eBRP4YS8e
         aB4bY8lK3QvaEJX3Nk8uZXgwymRI7xccxlmVUlW3YJ2JX1xnEJAzqe1u9tYWxeNe4X9e
         boi5qfSV7gGJqpFsmKLhMW+mFoZMvV6MfOyjYsbZ834+nVoD6DablU+zkBOGEdEZSHDe
         s3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700574628; x=1701179428;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsSZ4xmQ15S9yMS17JAsRW4h2Rkx74lE9OsNIPFxOkQ=;
        b=bo6QtWIKePCv++pTA+VugRFxYH2fLToLfoShJrSDvQQhdgxvmkcHzFh783Pjpc6Rwm
         7AAhRuspfQ9jGTDiMsZyrde8wRI97n7cTXtwD8TAVwtXyB9qf2lRGiiA6eO7ilghw66Z
         8piRHcXA1eExG556DOQPqa9PlRyhthgw4HdmuhIW91h+SkWuYmwwFCo2D1bic/x4JmMa
         nuxYPkaYhh7bchYuazUhpH0uXeV/lBf6aCdAzIJxsv9TOp5zh1UHSR7EmnX6MSbRM6Tl
         MHtPeFpKqoResfI6KjY8BuKbeazWb9DtHj4n3gqG8yk04C0+LDb5c0akbHOrsGiAlmVE
         actQ==
X-Gm-Message-State: AOJu0Yxy/LIimVqy3wwQWcqAUOd7xxO3BLDEHaY1WwH7SftNKy09eJQy
	eDXQLONPfHe9sy/W1YSJOKQ=
X-Google-Smtp-Source: AGHT+IEkTjbfcTVtQDhRxyOicMVLyNrkuXAz4VFKYhfMhGGhtOFUGeva748aJGx+4+x/mNNiugtNJw==
X-Received: by 2002:a05:6512:41e:b0:50a:6fc5:e95c with SMTP id u30-20020a056512041e00b0050a6fc5e95cmr6763271lfk.60.1700574628173;
        Tue, 21 Nov 2023 05:50:28 -0800 (PST)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id w26-20020a05651204da00b00509471d41besm1520588lfq.211.2023.11.21.05.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 05:50:27 -0800 (PST)
Message-ID: <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com>
Date: Tue, 21 Nov 2023 14:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Andrew Davis <afd@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>,
 Olof Johansson <olof@lixom.net>, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_055031_370303_62DDAD5B 
X-CRM114-Status: GOOD (  34.77  )
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

On 20.11.2023 09:40, Krzysztof Kozlowski wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.

I really like the overall idea. Thanks for coming up with that!

Two questions inline.


> Cc: Andrew Davis <afd@ti.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Merging idea: Rob/DT bindings
> 
> Changes in v2
> =============
> 1. Hopefully incorporate entire feedback from comments:
> a. Fix \ { => / { (Rob)
> b. Name: dts-coding-style (Rob)
> c. Exceptions for ordering nodes by name for Renesas and pinctrl (Geert,
>     Konrad)
> d. Ordering properties by common/vendor (Rob)
> e. Array entries in <> (Rob)
> 
> 2. New chapter: Organizing DTSI and DTS
> 
> 3. Several grammar fixes (missing articles)
> 
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>   .../devicetree/bindings/dts-coding-style.rst  | 163 ++++++++++++++++++
>   Documentation/devicetree/bindings/index.rst   |   1 +
>   2 files changed, 164 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/dts-coding-style.rst
> 
> diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
> new file mode 100644
> index 000000000000..cc7e3b4d1b92
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst
> @@ -0,0 +1,163 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. _dtscodingstyle:
> +
> +=====================================
> +Devicetree Sources (DTS) Coding Style
> +=====================================
> +
> +When writing Devicetree Sources (DTS) please observe below guidelines.  They
> +should be considered complementary to any rules expressed already in Devicetree
> +Specification and dtc compiler (including W=1 and W=2 builds).
> +
> +Individual architectures and sub-architectures can add additional rules, making
> +the style stricter.
> +
> +Naming and Valid Characters
> +---------------------------
> +
> +1. Node and property names are allowed to use only:
> +
> +   * lowercase characters: [a-z]
> +   * digits: [0-9]
> +   * dash: -
> +
> +2. Labels are allowed to use only:
> +
> +   * lowercase characters: [a-z]
> +   * digits: [0-9]
> +   * underscore: _
> +
> +3. Unit addresses should use lowercase hex, without leading zeros (padding).
> +
> +4. Hex values in properties, e.g. "reg", should use lowercase hex.  The address
> +   part can be padded with leading zeros.
> +
> +Example::
> +
> +	gpi_dma2: dma-controller@800000 {
> +		compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
> +		reg = <0x0 0x00800000 0x0 0x60000>;
> +	}
> +
> +Order of Nodes
> +--------------
> +
> +1. Nodes within any bus, thus using unit addresses for children, shall be
> +   ordered incrementally by unit address.
> +   Alternatively for some sub-architectures, nodes of the same type can be
> +   grouped together (e.g. all I2C controllers one after another even if this
> +   breaks unit address ordering).
> +
> +2. Nodes without unit addresses should be ordered alpha-numerically by the node
> +   name.  For a few types of nodes, they can be ordered by the main property
> +   (e.g. pin configuration states ordered by value of "pins" property).
> +
> +3. When extending nodes in the board DTS via &label, the entries should be
> +   ordered alpha-numerically.

Just an idea. Would that make (more) sense to make &label-like entries
match order of nodes in included .dts(i)?

Adventages:
1. We keep unit address incremental order that is unlikely to change

Disadventages:
1. More difficult to verify


> +Example::
> +
> +	// SoC DTSI
> +
> +	/ {
> +		cpus {
> +			// ...
> +		};
> +
> +		psci {
> +			// ...
> +		};
> +
> +		soc@ {
> +			dma: dma-controller@10000 {
> +				// ...
> +			};
> +
> +			clk: clock-controller@80000 {
> +				// ...
> +			};
> +		};
> +	};
> +
> +	// Board DTS
> +
> +	&clk {
> +		// ...
> +	};
> +
> +	&dma {
> +		// ...
> +	};
> +
> +
> +Order of Properties in Device Node
> +----------------------------------
> +
> +Following order of properties in device nodes is preferred:
> +
> +1. compatible
> +2. reg
> +3. ranges
> +4. Standard/common properties (defined by common bindings, e.g. without
> +   vendor-prefixes)
> +5. Vendor-specific properties
> +6. status (if applicable)
> +7. Child nodes, where each node is preceded with a blank line
> +
> +The "status" property is by default "okay", thus it can be omitted.

I think it would really help to include position of #address-cells and
#size-cells here. In some files I saw them above "compatible" that seems
unintuitive. Some prefer putting them at end which I think makes sense
as they affect children nodes.

Whatever you choose it'd be just nice to have things consistent.


> +Example::
> +
> +	// SoC DTSI
> +
> +	usb_1_hsphy: phy@88e3000 {
> +		compatible = "qcom,sm8550-snps-eusb2-phy";
> +		reg = <0x0 0x088e3000 0x0 0x154>;
> +		#phy-cells = <0>;
> +		resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
> +		status = "disabled";
> +	};
> +
> +	// Board DTS
> +
> +	&usb_1_hsphy {
> +		clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
> +		clock-names = "ref";
> +		status = "okay";
> +	};
> +
> +
> +Indentation
> +-----------
> +
> +1. Use indentation according to :ref:`codingstyle`.
> +2. For arrays spanning across lines, it is preferred to align the continued
> +   entries with opening < from the first line.
> +3. Each entry in arrays with multiple cells (e.g. "reg" with two IO addresses)
> +   should be enclosed in <>.
> +
> +Example::
> +
> +	thermal-sensor@c271000 {
> +		compatible = "qcom,sm8550-tsens", "qcom,tsens-v2";
> +		reg = <0x0 0x0c271000 0x0 0x1000>,
> +		      <0x0 0x0c222000 0x0 0x1000>;
> +	};
> +
> +Organizing DTSI and DTS
> +-----------------------
> +
> +The DTSI and DTS files should be organized in a way representing the common
> +(and re-usable) parts of the hardware.  Typically this means organizing DTSI
> +and DTS files into several files:
> +
> +1. DTSI with contents of the entire SoC (without nodes for hardware not present
> +   on the SoC).
> +2. If applicable: DTSI with common or re-usable parts of the hardware (e.g.
> +   entire System-on-Module).
> +3. DTS representing the board.
> +
> +Hardware components which are present on the board should be placed in the
> +board DTS, not in the SoC or SoM DTSI.  A partial exception is a common
> +external reference SoC-input clock, which could be coded as a fixed-clock in
> +the SoC DTSI with its frequency provided by each board DTS.
> diff --git a/Documentation/devicetree/bindings/index.rst b/Documentation/devicetree/bindings/index.rst
> index d9002a3a0abb..cc1fbdc05657 100644
> --- a/Documentation/devicetree/bindings/index.rst
> +++ b/Documentation/devicetree/bindings/index.rst
> @@ -4,6 +4,7 @@
>      :maxdepth: 1
>   
>      ABI
> +   dts-coding-style
>      writing-bindings
>      writing-schema
>      submitting-patches


