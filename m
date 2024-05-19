Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145EBC25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 17:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFfFHRscCa8sWyp/mI5Ke4tlOhkyrUjzyPT9JQYiZXs=; b=D6dOdhljSF3KCC/6LaETxRM+pA
	ZgfecOkAiNAOlyg6AawhlPrr1GSrYD79cVJngK5a8QCzQx1sY1whVTMCFDbJTyj2hWodY28K5oJde
	OYkWu2FCuTp6sG5FEuDY8TsXmlI2lQu32Gj81kIdwptKg4wTX+kKUVFhI7gryOCJIrYLIw6rYslUZ
	HhAtcbdLqBSvHHYelHMIB1UlUQJq8NibdRZ5WsR50eMWcsR03pJ88iTQqKl7UHkH8K3tgsXWcEK8Q
	ORFPr7wSAKaHSW1rs9OatNOIhIS7I82CW6s77/iVONcIRq/Kjqtck+sthnXJ2il0YXKmTW3uZlLk2
	yBtopz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8kAm-0000000COAG-3jnm;
	Sun, 19 May 2024 17:18:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8kAi-0000000CO99-1uWE
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 17:18:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-351cda41b53so1398858f8f.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 10:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716139085; x=1716743885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFfFHRscCa8sWyp/mI5Ke4tlOhkyrUjzyPT9JQYiZXs=;
        b=WCtXXf968oWJgSjAHQgaQz8nkmgqw1Lc8wcbPkcoHoofsBpqtRuI4hv/SkR7KnVMNA
         RnZqcgbFSmujJioVerd1a5mwvdmV44Iw7L+oqlHaajcuQHXO9Kqa0zU3oGBMlS/n2DtK
         VXq3YeQvEQjFGi388n6U+aImZ1Ekk5+s/qHdlYnrY3024DROr2ARQgzGVc7HHg+aAO91
         0zGbLKjFQJIXfFCR5R6t6mHOGSM+A1ddKAg7EwUldaAE2n7GOQXXLWowAOFCEbmjAbxw
         exR1wzje5kx6Bh2WOGC+SLFeC9tAA0giOnP09CudwENnSO9RFhXrAOfCvJkqBXlChix8
         N+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716139085; x=1716743885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFfFHRscCa8sWyp/mI5Ke4tlOhkyrUjzyPT9JQYiZXs=;
        b=eE6x/3Zc2fk6of11iHlMd/MoMf3YiwFo6xTWR2ec0d4mQlppC5MkrtkQ5Dh+m47JH2
         evOTWsVNYEHSE3T07XcRzzGGNAwWCDCvN5338TT2Zp9G6yFii5Z9Cs0rYOh/FbESu+lV
         G+BjU4VLlIVtm1Dzt1OX6B3ESpepnJJV6UIr0xMmS0c298D3165JHw31s5FLliTzbKEf
         XbQDc2P7Y1glRRGrS4HUXzpQO/fWRqWPXU8NYyqOABV0ScbqVYf4TToI75p6AAVUkkdv
         mHG4BneGjprKYdUKRkTFIRw6LamTBXrcQ9TKW+3Fg4epmW+1D/n1l4lhWLdcMcsqS5Sv
         Holw==
X-Forwarded-Encrypted: i=1; AJvYcCUjtMoA+0i5G3Gk6kiJE3YpxzZQEtqCiw1XlTNK8SuJqov2aI4FB9EsTsqZyGsarrlGyccVFaeP1x12/XbOSUQro6eYgQpU/SZjWYm5gWdzRFkY
X-Gm-Message-State: AOJu0Ywu4MeEAyOwric0eynXleVTcfFRQtGtSsNLLpajJrG4pzNKRIhx
	R9fRwBzsQvBOkUekgSHp+oG7KFGC37e0Tgpv9+RPJDN0jzJFfzaMsnaxjEksSgw=
X-Google-Smtp-Source: AGHT+IEVe3OJrvn9s1tUxcavG0nrrG8NUEl7NTZuN0MfcIVSegrUuefd4sCREc8FAj/4MId4r0LPwQ==
X-Received: by 2002:a5d:6350:0:b0:351:dea5:f808 with SMTP id ffacd0b85a97d-351dea6093bmr7250421f8f.26.1716139085076;
        Sun, 19 May 2024 10:18:05 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896a89sm26871478f8f.31.2024.05.19.10.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 May 2024 10:18:04 -0700 (PDT)
Message-ID: <ce1de395-3f60-4f7f-9424-bf036134de94@baylibre.com>
Date: Sun, 19 May 2024 19:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20240516081104.83458-1-angelogioacchino.delregno@collabora.com>
 <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240516081104.83458-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_101808_624477_2C94DACF 
X-CRM114-Status: GOOD (  10.10  )
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

Hi Angelo,

On 16/05/2024 10:11, AngeloGioacchino Del Regno wrote:
> +    oneOf:
> +      - required:
> +          - endpoint@0
> +      - required:
> +          - endpoint@1
> +      - required:
> +          - endpoint@2

I'm not sure this is what you expect because I must remove this part to pass the dt-validate.

I have 2 possible display at the same time (DSI and DPI), then I add this in my DTSI:

		mmsys: syscon@14000000 {
			compatible = "mediatek,mt8365-mmsys", "syscon";
			reg = <0 0x14000000 0 0x1000>;
			#clock-cells = <1>;
			port {
				#address-cells = <1>;
				#size-cells = <0>;

				mmsys_main: endpoint@0 {
					reg = <0>;
					remote-endpoint = <&ovl0_in>;
				};
				mmsys_ext: endpoint@1 {
					reg = <1>;
					remote-endpoint = <&rdma1_in>;
				};
			};
		};

But the DTS check returns me an error:

dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
/home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@14000000: port: 
More than one condition true in oneOf schema:
         {'$ref': '/schemas/graph.yaml#/properties/port', 

          'oneOf': [{'required': ['endpoint@0']}, 

                    {'required': ['endpoint@1']}, 

                    {'required': ['endpoint@2']}], 

          'properties': {'endpoint@0': {'$ref': '/schemas/graph.yaml#/properties/endpoint'}, 

                         'endpoint@1': {'$ref': '/schemas/graph.yaml#/properties/endpoint'},
                         'endpoint@2': {'$ref': '/schemas/graph.yaml#/properties/endpoint'}}} 

         from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#


In other hand, if I use "ports" to keep only one endpoint for each port:

		mmsys: syscon@14000000 {
			compatible = "mediatek,mt8365-mmsys", "syscon";
			reg = <0 0x14000000 0 0x1000>;
			#clock-cells = <1>;
			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					#address-cells = <1>;
					#size-cells = <0>;
					reg = <0>;
					mmsys_main: endpoint@0 {
						reg = <0>;
						remote-endpoint = <&ovl0_in>;
					};
				};

				port@1 {
					#address-cells = <1>;
					#size-cells = <0>;
					reg = <1>;
					mmsys_ext: endpoint@1 {
						reg = <1>;
						remote-endpoint = <&rdma1_in>;
					};
				};
			};
		};

The DTS check returns another error:

dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb
/home/*******/linux-upstream/arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: syscon@14000000: 'ports' 
does not match any of the regexes: 'pinctrl-[0-9]+'
         from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#

Additionally, with the last DTS example, displays aren't working, probably because "ports" isn't 
well parsed.

So, I don't know how you want to manage multiple display, but IMHO there are 2 ways:
- removing the current "oneOf".
- adding the "ports" support in the documentation and driver (to be parsed).

Still possible I missed something and I doing shit :)

-- 
Regards,
Alexandre

