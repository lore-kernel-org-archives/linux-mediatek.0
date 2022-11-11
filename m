Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22FCC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj8TZH6FHZaJ1Y0eiYMLLPzwa67amSVNW3qpHCEWrZE=; b=HGjksEAJv6hZmE
	Sq2HWWWq6V0ck866XqxTrhwcTYR+XijnV5ZEG04JAq1rFbHEtu8W8TvCeEOUrT5a4SzJcPoau6wg2
	NBgvMrJkFlanjSwBLSyQY3eMsOhlWsN6CtM+a/0B7wsHhnjZS41W/OO63boS7JiimPUcYaFtwtUgz
	xEUpFv0pbNDx2bWRo4HHGUKEyh+wd+tbvPr7gaBafk/zOy1xcWtR2V+pvaR9DflcTSz+403k2Yl+B
	/b4gY8cy1QF0NAvS8jVxNJvT7IBraIPhN1CTEx+nAoqU6X3owMSrFzjaW55VGyqQILujyyC3BbAuE
	IF4xsTFT+c504/AiSW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPpL-00EOTn-9O; Fri, 11 Nov 2022 08:55:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPp1-00EOHS-OM; Fri, 11 Nov 2022 08:55:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso5376466wmb.0;
        Fri, 11 Nov 2022 00:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zj8TZH6FHZaJ1Y0eiYMLLPzwa67amSVNW3qpHCEWrZE=;
        b=mWMLW2/uMJD573/qJJXZSTCbmxYU7kkXWZZCedNYMz/0AIVNuezCtnvD2AhJ112QsW
         b2ie5wcZ2wFpwaRb510Kx1nTFDJj2p0T9p8eYI3TTWVnnwcRvU/Sy+LzplTHB4sThRiA
         jtTn+J5MHQ5IoJJBhHUkEfIcBn+QTcCGEvr2TG6z/KWZAElxG1KLhGsu5UGcpQKloSzU
         DJP+9cR57HOn6liPJC6uDbP9WyDJvh24HvzSU1kaYXxCbYRfw+48GtZuApOydYCTOdP/
         9Luyok6bw7TjkekusjdOz8wBTqaP1nsM0D7CKVP9cQ3STDxGaQvlVcPozrQxQxCtPUYt
         WAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zj8TZH6FHZaJ1Y0eiYMLLPzwa67amSVNW3qpHCEWrZE=;
        b=fpUSxFcqQg4H1+cE0EtPns45xSCNLV5/XY7e5tczsKqIUxPRWFEt7kgzVIthp01sRz
         7WwyfMd887hna4twOX8Z4UdhVW+qkJ0uZUkgFiYIhjjBjA/h0gTruQ/H3ew5vwB9iggk
         R7/RaOphkta1Z/7OBrYsPE+Xj/XTYf0p+juUJdVxIOzJnUZqd4rHnxl+3y4lW3QPgeYn
         zutQoxUZp34/0X9/keX4dhof+0PW0KE3eXWVpr27DbfDNQ4mhJlx2dMN5g7AUsRaKH+j
         kWiomB8OjF743G3Dds9/YuSrUIfr7zOKhu2YLCt6iBl9/7M7rZeR89TeOeOoMtFD3riF
         9hww==
X-Gm-Message-State: ANoB5pnNzxfiK82bUAtlzpTyMVjJzU0lMgsTp0zDdhuu375qDDD93OWC
	MrmWb8EKooi07o8N56KMpJ8=
X-Google-Smtp-Source: AA0mqf5gpxoWo3QN+NFqQyVSF9ENcnuCFFW908PzcZPm9wb9ZK9Z0PdC7xQtzbGzZyh/67SuVZ86kQ==
X-Received: by 2002:a05:600c:2d05:b0:3b4:8603:e2ae with SMTP id x5-20020a05600c2d0500b003b48603e2aemr530274wmf.148.1668156932059;
        Fri, 11 Nov 2022 00:55:32 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z15-20020a056000110f00b0022a3a887ceasm1327149wrw.49.2022.11.11.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:55:30 -0800 (PST)
Message-ID: <d38f8b81-b62e-18c5-1bd3-d1bc1f2b98d9@gmail.com>
Date: Fri, 11 Nov 2022 09:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 01/11] arm64: dts: mt7986: harmonize device node order
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-2-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_005536_732841_C6B43DC5 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This arrange device tree nodes in alphabetical order.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
> i modified sams patch
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220427124741.18245-2-sam.shih@mediatek.com/
> 
> by moving pio-node up instead of moving uarts down to ensure alphabetical
> order for switch-/wifi-node.
> 
> And moved uart0 and wifi in mt7986b-rfb too.
> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 94 ++++++++++----------
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 22 ++---
>   2 files changed, 58 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index afe37b702eef..6189436fe31d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -54,6 +54,53 @@ switch: switch@0 {
>   	};
>   };
>   
> +&pio {
> +	uart1_pins: uart1-pins {
> +		mux {
> +			function = "uart";
> +			groups = "uart1";
> +		};
> +	};
> +
> +	uart2_pins: uart2-pins {
> +		mux {
> +			function = "uart";
> +			groups = "uart2";
> +		};
> +	};
> +
> +	wf_2g_5g_pins: wf-2g-5g-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_2g", "wf_5g";
> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +
> +	wf_dbdc_pins: wf-dbdc-pins {
> +		mux {
> +			function = "wifi";
> +			groups = "wf_dbdc";
> +		};
> +		conf {
> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> +			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> +			drive-strength = <4>;
> +		};
> +	};
> +};
> +
>   &switch {
>   	ports {
>   		#address-cells = <1>;
> @@ -121,50 +168,3 @@ &wifi {
>   	pinctrl-0 = <&wf_2g_5g_pins>;
>   	pinctrl-1 = <&wf_dbdc_pins>;
>   };
> -
> -&pio {
> -	uart1_pins: uart1-pins {
> -		mux {
> -			function = "uart";
> -			groups = "uart1";
> -		};
> -	};
> -
> -	uart2_pins: uart2-pins {
> -		mux {
> -			function = "uart";
> -			groups = "uart2";
> -		};
> -	};
> -
> -	wf_2g_5g_pins: wf-2g-5g-pins {
> -		mux {
> -			function = "wifi";
> -			groups = "wf_2g", "wf_5g";
> -		};
> -		conf {
> -			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> -			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> -			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> -			       "WF0_TOP_CLK", "WF0_TOP_DATA", "WF1_HB1",
> -			       "WF1_HB2", "WF1_HB3", "WF1_HB4", "WF1_HB0",
> -			       "WF1_HB5", "WF1_HB6", "WF1_HB7", "WF1_HB8",
> -			       "WF1_TOP_CLK", "WF1_TOP_DATA";
> -			drive-strength = <4>;
> -		};
> -	};
> -
> -	wf_dbdc_pins: wf-dbdc-pins {
> -		mux {
> -			function = "wifi";
> -			groups = "wf_dbdc";
> -		};
> -		conf {
> -			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3", "WF0_HB4",
> -			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5", "WF0_HB6",
> -			       "WF0_HB7", "WF0_HB8", "WF0_HB9", "WF0_HB10",
> -			       "WF0_TOP_CLK", "WF0_TOP_DATA";
> -			drive-strength = <4>;
> -		};
> -	};
> -};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index 3443013b5971..7459ddb6b6f0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -25,10 +25,6 @@ memory@40000000 {
>   	};
>   };
>   
> -&uart0 {
> -	status = "okay";
> -};
> -
>   &eth {
>   	status = "okay";
>   
> @@ -99,13 +95,6 @@ fixed-link {
>   	};
>   };
>   
> -&wifi {
> -	status = "okay";
> -	pinctrl-names = "default", "dbdc";
> -	pinctrl-0 = <&wf_2g_5g_pins>;
> -	pinctrl-1 = <&wf_dbdc_pins>;
> -};
> -
>   &pio {
>   	wf_2g_5g_pins: wf-2g-5g-pins {
>   		mux {
> @@ -138,3 +127,14 @@ conf {
>   		};
>   	};
>   };
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&wifi {
> +	status = "okay";
> +	pinctrl-names = "default", "dbdc";
> +	pinctrl-0 = <&wf_2g_5g_pins>;
> +	pinctrl-1 = <&wf_dbdc_pins>;
> +};

