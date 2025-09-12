Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6D9CAC58F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Sep 2025 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVQP7t1cLcCA6lBEVBFP9JUfq8lpy4ICoOinMrOslso=; b=r9UXbqwBnRuzAN
	lPVLUhTfakIWMLZkFpO+GyWXqSejzp0LQFMWuRy0xRarGxeebNSySR//RWotxQaBXgNDr//8kvJdV
	LQCvTGTBr8pGhZ/Lp16BJs98wVmZkQtoNphVf2wELhEDqzqwubHATai/cQk46m9ueViFoN98giH0F
	qO2eVH5bkC4ZnhW2UJEg2fvC7en9WihpOM7fkq4EnSFQyhXKLxMYXsxqxjmyObjm0kdtm6v6yt8Gu
	a0rgVZczxb317VcO2BRAzIbTc/88kdfL4cTEnFYm27jWzYG7QHegH3nm9rbc5gJitaoGEDez0l2Ny
	VIn8x1Mx5SbfcQmVmMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4ek-00000009q83-0dag;
	Fri, 12 Sep 2025 14:21:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4eh-00000009q4g-0eto
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Sep 2025 14:21:40 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so12264455e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686897; x=1758291697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQP7t1cLcCA6lBEVBFP9JUfq8lpy4ICoOinMrOslso=;
        b=li0jOPQPIHQhrS1/hrSLa/Kq8sapuMfm/FFtTq5U183b3nce1Ck1fPJDmZC21v3WQo
         Q/QGdT/oHsy9qY35BNtwFz6zQNrn46Rn1M06T+CyTQEbVXjirmzLlzZLQfAUGR+ik6KH
         BsWmfES5aniN9LFpUGEtR0W4PjseTWCf7uDGC2EEvsM6QioUPtwFfyBv76WwbF8hPPDx
         r91keFOX11dLx7TzgZJ3rb1kvROyQA5/80sD2HF+ewaXEpXJvnWNDNWVwsgHKWSV62O/
         m1pZdCp+p2POjfbm1Jb82I6nVaSBPmNrNFbo/hDpPU5ifKarLV1lDULJgxDauoNmi2Ys
         694w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686897; x=1758291697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQP7t1cLcCA6lBEVBFP9JUfq8lpy4ICoOinMrOslso=;
        b=Rr7jUp6DWRSlBOnY6889YtuHcqBaTNUzveoJ/aUq4VnHLgAjpVpMNP+CXFN/4rttxo
         jA+Um1ZQSlmIfWY0VU+waBg45VCoLcP6ekdR/KJGD8cw6QrMs6BUtnvdkDaHeSC5FZnF
         EbOxHAbRgBtVr+CK7YVD5aBi5kNER0B46D7qmLiQj0c4jXl8XO2XJ/8Nryi4YkqppQ+Q
         osICf9k5k3dDru9aQfQ7ITdYE7Na1PJnAOqfTnn3A6vgEt0Yqv2KOBO9dfTfi+kjmcA4
         QRGHR35BKdagudogQCfSFSH4pmQ90bZufzJ78Ig0LAu/UotyXxuNg4pP9Yy2IRQQc+g4
         DvQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFkyjRQbhzv89ZIB2hJbalYGgE/rH5bIx3yh6LKbCYxhVC5805lPk/WnvlD570thZ6BG4JbYP2x58aI2uKNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt/LM0Ypts4tqnzUoWnJMxAItOLdA4x2l7k/8i4fENGrox/0Jq
	2lPYB3Qj0F5ANdTU9gDhywSCMrPn1MYRg/S0hmPrCJULKZu5LdFxdyn0
X-Gm-Gg: ASbGncsgot32vyxTOd9Ixj95Vr6ckNjzLaiIve7hLrgKMTWVdw5KwkMRORTqV2EPoI1
	7t1p/QRKu/3uRS9imElLIxpiFOdpNrh3IvAmtRml0mHa9vO5HKfeEwqOIFPspsS4AGtrTFCMrfr
	c7uYN7sYfbC+ft1HsB3Ved2XUCgutdan6ms64s4m+YojnfrtKo/ZFC6aAUufGQ+0oijB4KCCg1h
	BNwfA8DAkGEiSboEScekmBNJnahrSYlGf7H2J0Gu8+OP/6EjdqYKyT8ajf+pz/wmhLD3QnvnZ5h
	onsTqKLhEJmeby9yLe1INKL/hkP44nba2Lcw4ErRZ5S6rCql/74SSyQb9F9IqQqh6/7KxYe02RF
	w7fmmBb6HoETn6TlTZSrnSqgjGsHynxYVf7lEQXIoRg==
X-Google-Smtp-Source: AGHT+IG+xDsxpXBLWFezvQTqJTVrSqvL47N9F5wGJK2iMq/HB1ui6QHRTpehxtgIBE7xqsz00wIiOg==
X-Received: by 2002:a05:600c:6b06:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45f211d0795mr28862295e9.10.1757686897084;
        Fri, 12 Sep 2025 07:21:37 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e015784c3sm71413955e9.10.2025.09.12.07.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:35 -0700 (PDT)
Message-ID: <fb81c74a-d53d-4917-9516-9854e825913a@gmail.com>
Date: Fri, 12 Sep 2025 16:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/38] arm64: dts: mediatek: mt8183: Migrate to display
 controller OF graph
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-33-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072139_273676_3D5D7CDF 
X-CRM114-Status: GOOD (  17.34  )
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
> The display related IPs in MT8183 are flexible and support being
> interconnected with different instances of DDP IPs forming a full
> Display Data Path that ends with an actual display output, which
> is board specific.
> 
> Add a common graph in the main mt8183.dtsi devicetree, which is
> shared between all of the currently supported boards, and do it
> such that only a very minimal amount of changes are needed to
> each board - the only required change was done in mt8183-pumpkin,
> using a phandle to assign the display to DPI0.
> 
> All boards featuring any display functionality will extend this
> common graph to hook the display controller of the SoC to their
> specific output port(s).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../boot/dts/mediatek/mt8183-pumpkin.dts      |   8 +-
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 239 +++++++++++++++++-
>   2 files changed, 238 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index d5fcb010e1ac..cf1d33384bf0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -531,10 +531,8 @@ &dpi0 {
>   	pinctrl-0 = <&dpi_func_pins>;
>   	pinctrl-1 = <&dpi_idle_pins>;
>   	status = "okay";
> +};
>   
> -	port {
> -		dpi_out: endpoint {
> -			remote-endpoint = <&it66121_in>;
> -		};
> -	};
> +&dpi_out {
> +	remote-endpoint = <&it66121_in>;
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 3c1fe80e64b9..960d8955d018 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1667,6 +1667,21 @@ mmsys: syscon@14000000 {
>   			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
>   				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +
> +			port {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				mmsys_ep_main: endpoint@0 {
> +					reg = <0>;
> +					remote-endpoint = <&ovl0_in>;
> +				};
> +
> +				mmsys_ep_ext: endpoint@1 {
> +					reg = <1>;
> +					remote-endpoint = <&ovl_2l1_in>;
> +				};
> +			};
>   		};
>   
>   		dma-controller0@14001000 {
> @@ -1733,6 +1748,25 @@ ovl0: ovl@14008000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL0>;
>   			iommus = <&iommu M4U_PORT_DISP_OVL0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x8000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl0_in: endpoint {
> +						remote-endpoint = <&mmsys_ep_main>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl0_out: endpoint {
> +						remote-endpoint = <&ovl_2l0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ovl_2l0: ovl@14009000 {
> @@ -1743,6 +1777,25 @@ ovl_2l0: ovl@14009000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
>   			iommus = <&iommu M4U_PORT_DISP_2L_OVL0_LARB0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl_2l0_in: endpoint {
> +						remote-endpoint = <&ovl0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl_2l0_out: endpoint {
> +						remote-endpoint = <&rdma0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ovl_2l1: ovl@1400a000 {
> @@ -1753,6 +1806,25 @@ ovl_2l1: ovl@1400a000 {
>   			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
>   			iommus = <&iommu M4U_PORT_DISP_2L_OVL1_LARB0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ovl_2l1_in: endpoint {
> +						remote-endpoint = <&mmsys_ep_ext>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ovl_2l1_out: endpoint {
> +						remote-endpoint = <&rdma1_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		rdma0: rdma@1400b000 {
> @@ -1764,6 +1836,25 @@ rdma0: rdma@1400b000 {
>   			iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>   			mediatek,rdma-fifo-size = <5120>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					rdma0_in: endpoint {
> +						remote-endpoint = <&ovl_2l0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					rdma0_out: endpoint {
> +						remote-endpoint = <&color0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		rdma1: rdma@1400c000 {
> @@ -1775,6 +1866,25 @@ rdma1: rdma@1400c000 {
>   			iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>   			mediatek,rdma-fifo-size = <2048>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					rdma1_in: endpoint {
> +						remote-endpoint = <&ovl_2l1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					rdma1_out: endpoint {
> +						remote-endpoint = <&dpi_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		color0: color@1400e000 {
> @@ -1785,6 +1895,25 @@ color0: color@1400e000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					color0_in: endpoint {
> +						remote-endpoint = <&rdma0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					color0_out: endpoint {
> +						remote-endpoint = <&ccorr0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		ccorr0: ccorr@1400f000 {
> @@ -1794,6 +1923,25 @@ ccorr0: ccorr@1400f000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					ccorr0_in: endpoint {
> +						remote-endpoint = <&color0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					ccorr0_out: endpoint {
> +						remote-endpoint = <&aal0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		aal0: aal@14010000 {
> @@ -1803,6 +1951,25 @@ aal0: aal@14010000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_AAL0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					aal0_in: endpoint {
> +						remote-endpoint = <&ccorr0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					aal0_out: endpoint {
> +						remote-endpoint = <&gamma0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		gamma0: gamma@14011000 {
> @@ -1812,6 +1979,25 @@ gamma0: gamma@14011000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					gamma0_in: endpoint {
> +						remote-endpoint = <&aal0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					gamma0_out: endpoint {
> +						remote-endpoint = <&dither0_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		dither0: dither@14012000 {
> @@ -1821,6 +2007,25 @@ dither0: dither@14012000 {
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>   			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dither0_in: endpoint {
> +						remote-endpoint = <&gamma0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dither0_out: endpoint {
> +						remote-endpoint = <&dsi_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		dsi0: dsi@14014000 {
> @@ -1837,8 +2042,21 @@ dsi0: dsi@14014000 {
>   			phy-names = "dphy";
>   			status = "disabled";
>   
> -			port {
> -				dsi_out: endpoint { };
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi_in: endpoint {
> +						remote-endpoint = <&dither0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi_out: endpoint { };
> +				};
>   			};
>   		};
>   
> @@ -1853,8 +2071,21 @@ dpi0: dpi@14015000 {
>   			clock-names = "pixel", "engine", "pll";
>   			status = "disabled";
>   
> -			port {
> -				dpi_out: endpoint { };
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dpi_in: endpoint {
> +						remote-endpoint = <&rdma1_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dpi_out: endpoint { };
> +				};
>   			};
>   		};
>   


