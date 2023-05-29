Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A902C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myJE6wqP7SpgcJyO3f8/0tcs82r/jtAw33/b3j2JkJ8=; b=uZ2JKQuCBFp0wm/BK9arYHEve4
	/VGq2Zt42btpMETuTEidxR/gNkFkOmEGtisVYazJWANUI1EzzlWFmwJS87sHb27girmhKd6/Fewk+
	tTj2m2Xx1HCt4j0RXFODibbSFpFBzkp4DNyeynKWjDtI/dsZHvHRz7LK0TTRkLXRk/IFKbCol3xbT
	buB/i0/2hKIspki1yt33cigd3+vVoHYS+yis4OJ1H2Oh96bLd0o0RCVbDtipIM4Jx2YobT7EmkXHp
	vjYWr/9a40mJ/ahZzvpStQKj8FotWuJuH2ug+qp48BLSZKnXN/5o0ko9ImlX4kS2z1plSkG5ZXq8j
	4XUplJtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dDx-00Ae9c-2m;
	Mon, 29 May 2023 13:47:49 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dDu-00Ae7r-0H;
	Mon, 29 May 2023 13:47:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3063433fa66so2025275f8f.3;
        Mon, 29 May 2023 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368064; x=1687960064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myJE6wqP7SpgcJyO3f8/0tcs82r/jtAw33/b3j2JkJ8=;
        b=oCpcveOpc3ZxOpH99/p0DTvagTnLnycBju6u9B40KEfprAGFjUByl9JlqOLM/v1+8U
         CGqm3R588wyIj0Pj6Dp/toPskJS/CZidIXvZcgfB2lNvWxST65L0b1WWKhGnGoILA1hS
         Juz8Kk2fmmW979GQpwI2/eEI0oWWlBcMa7/cQEaboUWgSGowZzAegovGuyC57RO/WVZK
         4Zn3qpOxCebc7xVHB+Y4Xkaggmr3XAr7SkX3q6RvyrvXt8tWAn7XlzVhPZ3L/NAsCjtQ
         R6nayL5XJKPqNFy+zbSgo5n7NWEF8mJXEFkdBNuacnyn5ty8pOyLdctD7G0agT1ZmhoT
         W4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368064; x=1687960064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myJE6wqP7SpgcJyO3f8/0tcs82r/jtAw33/b3j2JkJ8=;
        b=guObWPUuJqDyVtr8Vh/1AzuDEMgIV/lF7pznc91K7Pzd0PEF0Lbl/uSfyJ0gu1Qev8
         hqjltSoLnq/CvxHNHVQ5TsEfdZb8dGsXCufxoiscgTAdGYUFWjucV6R9vyeQ6e1DxX8b
         NIG1UaBrTgYLFgaIdRh1KmFpbQNJTNLNGJqUXXeIoF0aUGuGE9sBAxJ2vvhWxJ/Z/ozd
         SYLjYABg1laxByfg0HvSGjs5mlncGtkUK/6kyofojelXz/jQaNrJg1JU35sYHr81bFdl
         zH371BRUVQzoTSSU3H/cEPN7mEzKEXuwcy3HsbLNe6Kjx5p6bJ//VHslkJjkaCVx6FSz
         V1tA==
X-Gm-Message-State: AC+VfDxrbjW5I6GdXEf7b7561Oks8qpWS5O91Uk+HxvrJFPVZ/7XvzXm
	6qA9qAk4imyvLK8JIN/XlAI=
X-Google-Smtp-Source: ACHHUZ4CbOFmTDokYBwfIa3AupZCc9BFrord46r0GreN2feVi5EocX/omYSGgSN05k20qNnh3fvB3g==
X-Received: by 2002:adf:cd8a:0:b0:30a:e59f:cd60 with SMTP id q10-20020adfcd8a000000b0030ae59fcd60mr5247477wrj.48.1685368064021;
        Mon, 29 May 2023 06:47:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t16-20020a5d6910000000b00307a86a4bcesm30885wru.35.2023.05.29.06.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:47:43 -0700 (PDT)
Message-ID: <e9064b57-bbe2-7774-1d08-4d7b8e28ecbf@gmail.com>
Date: Mon, 29 May 2023 15:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
Content-Language: en-US, ca-ES, es-ES
To: bchihi@baylibre.com, daniel.lezcano@linaro.org,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, khilman@baylibre.com,
 james.lo@mediatek.com, rex-bc.chen@mediatek.com
References: <20230405100907.53740-1-bchihi@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230405100907.53740-1-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_064746_130015_522DE255 
X-CRM114-Status: GOOD (  18.23  )
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



On 05/04/2023 12:09, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add AP Domain thermal zones for the mt8195 and
> specify the targeted temperature thresholds.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> 

Applied, thanks!

> ---
> This patch squashes and replaces
> 
> [PATCH 3/4] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
> https://lore.kernel.org/all/20230307154524.118541-4-bchihi@baylibre.com/
> 
> and
> 
> [PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds
> https://lore.kernel.org/all/20230307154524.118541-5-bchihi@baylibre.com/
> 
> of the series
> 
> [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
> https://lore.kernel.org/all/20230307154524.118541-1-bchihi@baylibre.com/
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 180 +++++++++++++++++++++++
>   1 file changed, 180 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 972c5b86ddae..75da456c512b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2909,5 +2909,185 @@ map0 {
>   				};
>   			};
>   		};
> +
> +		vpu0-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
> +
> +			trips {
> +				vpu0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				vpu0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		vpu1-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_VPU1>;
> +
> +			trips {
> +				vpu1_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				vpu1_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu0-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_GPU0>;
> +
> +			trips {
> +				gpu0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		gpu1-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_GPU1>;
> +
> +			trips {
> +				gpu1_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				gpu1_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		vdec-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_VDEC>;
> +
> +			trips {
> +				vdec_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				vdec_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		img-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_IMG>;
> +
> +			trips {
> +				img_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				img_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		infra-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_INFRA>;
> +
> +			trips {
> +				infra_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				infra_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cam0-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_CAM0>;
> +
> +			trips {
> +				cam0_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cam0_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		cam1-thermal {
> +			polling-delay = <1000>;
> +			polling-delay-passive = <250>;
> +			thermal-sensors = <&lvts_ap MT8195_AP_CAM1>;
> +
> +			trips {
> +				cam1_alert: trip-alert {
> +					temperature = <85000>;
> +					hysteresis = <2000>;
> +					type = "passive";
> +				};
> +
> +				cam1_crit: trip-crit {
> +					temperature = <100000>;
> +					hysteresis = <2000>;
> +					type = "critical";
> +				};
> +			};
> +		};
>   	};
>   };

