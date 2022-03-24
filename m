Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 17:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bm5rmDoU6+TXwrIiQNshKV7Ly/fAiWu7RdIifaluFHs=; b=Gk2bVsKYJXKD3j
	xwhG+C00XMdLB4M1adJJ92Z6OMzacGiqc6jqGoOFirgcIFCroqzBuGiaJqcMb5aWMDoR3NjHIz1Cg
	XwvbZxh1OO5ezK4Y25fD5Qyxc7HQTvoH+uOTI9gZZuH6v7ydDaLhOKd6Ph4gmZAqIBCzX5ks2+MOs
	gd/wn0z4+UeeNUWQXzFTtKg3V6B8KIqPwvIg1VGSFI7oLQ5hYVUseDjYGPYXKTzmsqDsyB/RpQuWS
	U6rK0LthA5L4zVdiAbN5JEJTUQRxTK97PbvTaDLIcQdkQcvLEPHJdqQZgFZjUZ/T6k1PLeqpohN1h
	bS7fC3G8gKxCig1alNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXRZe-00HR41-UK; Thu, 24 Mar 2022 17:48:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXRY6-00HQRJ-QY; Thu, 24 Mar 2022 17:47:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so7704992wmj.0; 
 Thu, 24 Mar 2022 10:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RpJJksH0wfu/m1hwkaHpI10R0iz63qY9JlRehAsmSG4=;
 b=beKod+HfMm0Bku5wtAVpyK+e9L2eGDgfyGQ8e9UbBgGSjnu7zlrGA5uR/c49Ndjbw8
 J3+HUUaHI3dwNQWFXzMLGxwSl+eL95Pe0KjHzYSHfvsIRH2X3PFkiekf5hSvZWpM/77I
 2JmQJ0P7/x8UAujhhJTc+8+f9Hgg8Xea5xROKP3lZlawf26HxUWhJUciens8hEc2qGTY
 vU/oE4F5QBJbUx20dy2nVwz+olJ8vOCrfLRBMRAp93z/uAD8jMY1CZ/th6bKRziC/Rqa
 zKSyC5ia/NEI3bNXkY+2qNlprabTePuB9si9yvrYNX8xgySHx1qVup7hQP40EfzwONAX
 2Iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RpJJksH0wfu/m1hwkaHpI10R0iz63qY9JlRehAsmSG4=;
 b=CAnSFoUMQzcbs3GaBCc/xJb8ikIV1NAjZqdOoCRnbO2jbzg4B99IdGIDxUzHvkezpk
 VUpKFQ8Vg106V3HQ8lCQS4psVi8acRdTNBE76LS1yDpWhCvJeMHO2bW3HmLEPsf2+hbG
 7h4ZQ9AFHizwCbw3hWhfMJ0nj9Rk9fUkZxlLmweSZJsQM4QwchGWXgkOLeLC9qCMDwS/
 eOCNIedoebulbRE2awrc8gYPPUFS4cdgceR8KHyVsUe9RJzDcivqsD8GGg2i96goZAoC
 0OlLj+yrpAEaczNz2SFk0jy8y0cpJ8pU+fXYmz6RP1iSxKuNxFj6u6OyZYooOH2xOS3Y
 sYUQ==
X-Gm-Message-State: AOAM531wR/A2Taxftx1xcHPGfOsN5q91duWGT+UvkGTcsC6ktO5Khy3f
 FOE16fZYHZQVpTKsb2dfBnJgB+2zT6gnbA==
X-Google-Smtp-Source: ABdhPJyTE3kGibu4AKZzVSRAmH3Y/noKIiLHxSXqmFeNwFfPhf2WonD+XppKjW3aV6MZN7M8s6Lhtw==
X-Received: by 2002:a1c:f705:0:b0:37d:f2e5:d8ec with SMTP id
 v5-20020a1cf705000000b0037df2e5d8ecmr15573294wmh.21.1648144020925; 
 Thu, 24 Mar 2022 10:47:00 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 n65-20020a1c2744000000b003862bfb509bsm7180786wmn.46.2022.03.24.10.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 10:47:00 -0700 (PDT)
Message-ID: <9925aacc-104f-b5b4-dd9d-26a9950b392b@gmail.com>
Date: Thu, 24 Mar 2022 18:46:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 11/22] arm64: dts: mt8192: Add efuse node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_104702_924145_A23AB03A 
X-CRM114-Status: GOOD (  14.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add efuse node for mt8192 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Applied thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 75c21edccf85..6220d6962f58 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -937,6 +937,21 @@
>   			status = "disabled";
>   		};
>   
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			lvts_e_data1: data1@1c0 {
> +				reg = <0x1c0 0x58>;
> +			};
> +
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x68>;
> +			};
> +		};
> +
>   		i2c3: i2c@11cb0000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11cb0000 0 0x1000>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
