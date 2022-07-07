Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6561C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKCQPtlV/zp+9AxyutmXUkykhKgpm+t7LU8VMAQOZXo=; b=vO01okV/Dyo/LFvnDa3+ej7mzR
	bMU33lVUpZJbskTAiU4DcDWgOQOVP3f8XB+O6PBzqDtbwAk2WwLguhUop5J3YQujnojxyhKXkIkkw
	iDtFR4r0IY3q6OqmjQlYYGduF3Qwr4aHSI67hthzV17aiR5uc3vcvsgSBl587DYqdjhOpf1Jzo5fE
	s3AF+ifDm++1OQU1N2fHRR5YHpq2Yjo7F9LcH+DNo1oIXmAe+yoOJ78RoyYKsjYQCVWLVZ1n5ER5M
	uAbgvhLFCLkfDEE5GqLYM6NEcWeOxAQnFnv0fONH1HQyMThMR5AnKkgMECRulSyTip9+uZ7o3WSPd
	J0kb6DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SqR-00GcOe-Kr; Thu, 07 Jul 2022 14:51:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SqA-00GcI9-1k; Thu, 07 Jul 2022 14:50:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id p4so1500852wms.0;
        Thu, 07 Jul 2022 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zKCQPtlV/zp+9AxyutmXUkykhKgpm+t7LU8VMAQOZXo=;
        b=EBJoSIWSMNh7Q1ibq+I4sYH0CrcGDJBR7HCFsUv3WlC6lIeY+WB0iD1pZHLWb5hEYg
         5oqhc10dDEvdDxWkISeBeVwaC00jPuQ2y4i2S4X/deZg2PRdyztDaHCmgc4XkoNnHPdU
         0zrAezlOOkUNUpMt+vInfnHF+UPKzZR6VK11mkt1xOrjDbDyaJmSQcmnDbUnNAd2WCaZ
         1xhm07yun2rNWjUM8ridi0XFR6SiPbEaV6U7ef/YsAnydnkrhBpLUwerTNKcNPaSaRGo
         mn7N0pWFXGLMB8XhfqCS0MLZtgW8jpiIvbjGd7/WaMJlyhL4H75btFIyDomTkOJ7Rbtd
         UqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zKCQPtlV/zp+9AxyutmXUkykhKgpm+t7LU8VMAQOZXo=;
        b=LxOI+eK8wmI1WD4cihZtlN2nXKOuEfuoApt9RM3riXtj9NhMtoMcUOBR/b9E6XntI0
         Jwi54FhGT7b06icNhZmxjTxFC13XdVi6XktlpQBTyuIXmfTaUZ8sqXh4291J9x5Vzsuh
         qnt7wyuZAkEbg2mM/VPGcppc3lJ/K1OHGKgdtDCnUdmfePWCmWq0g2r56jwbHDMBEEmJ
         qaOzpHWwufpSORj5VXCHU9PscfCNU2chUAnu0Zh34xcq75p3qpJrfjOSNMTxdF6ReVgj
         zgSrwUPbSvH+z9LylCXp4qOXIgJi4nR70KktLFtTO4rwO57RWVTxZlCJF0TYS7uGrY7N
         Ha6g==
X-Gm-Message-State: AJIora+Xof3C5N8UHbsySzeMLdTe3xyFPmu1iBg3KqkwTKVr0zQ50pP3
	DmOE860+kOF7PM0ufNIeWpM=
X-Google-Smtp-Source: AGRyM1tbSjA0Rr6Nv9IbQQWPXRgiLpd2Jgw9p/RhFNjcuTYsVoEOhwrw3W1uyeQOYlyX7Q3o45E0JA==
X-Received: by 2002:a05:600c:3b87:b0:3a2:c7c1:a89 with SMTP id n7-20020a05600c3b8700b003a2c7c10a89mr5051361wms.159.1657205446330;
        Thu, 07 Jul 2022 07:50:46 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n35-20020a05600c3ba300b003a039054567sm29099955wms.18.2022.07.07.07.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:50:45 -0700 (PDT)
Message-ID: <de6412d4-732c-79cf-ac00-e0fccee44270@gmail.com>
Date: Thu, 7 Jul 2022 16:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] arm64: dts: mt8173: Fix elm panel DT node
Content-Language: en-US
To: Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220621091854.1904372-1-treapking@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220621091854.1904372-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_075050_161631_A655646E 
X-CRM114-Status: GOOD (  21.39  )
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



On 21/06/2022 11:18, Pin-Yen Lin wrote:
> Move the panel DT node under `aux-bus` node, so it won't use the buggy
> `ps8640_bridge_get_edid` to get the display modes. Also, change the
> compatible string from "lg,lp120up1" to "edp-panel", so the panel-edp
> driver gets the displays modes from the EDID instead of using the
> predefined display mode (`lg_lp129qe_mode`) in the driver, which is
> actually not working.
> 

Do we need a fixes tag here? I'm not quite sure if we fix an upstream bug here, 
to be honest.

Regards,
Matthias

> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> ---
> 
> Changes in v3:
> - Include more details in the commit message.
> 
> Changes in v2:
> - Remove the Fixes tag because this change is not compatible with the
>    old kernel versions.
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++++---------
>   1 file changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 9c75fbb31f98..1e0802a6f6d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -90,18 +90,6 @@ volume_up {
>   		};
>   	};
>   
> -	panel: panel {
> -		compatible = "lg,lp120up1";
> -		power-supply = <&panel_fixed_3v3>;
> -		backlight = <&backlight>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&ps8640_out>;
> -			};
> -		};
> -	};
> -
>   	panel_fixed_3v3: regulator1 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "PANEL_3V3";
> @@ -282,6 +270,20 @@ ps8640_out: endpoint {
>   				};
>   			};
>   		};
> +
> +		aux-bus {
> +			panel {
> +				compatible = "edp-panel";
> +				power-supply = <&panel_fixed_3v3>;
> +				backlight = <&backlight>;
> +
> +				port {
> +					panel_in: endpoint {
> +						remote-endpoint = <&ps8640_out>;
> +					};
> +				};
> +			};
> +		};
>   	};
>   };
>   

