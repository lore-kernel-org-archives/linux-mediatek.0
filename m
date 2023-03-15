Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E54C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi0VvHgC3UTShmV2WT9OBUD35Fi482DZ3JOU5piU4/Q=; b=yypFMEu0e7DpTwSzaWstrGYvud
	DssFFYckrC6QUMCcpEpZsWtUrR1D22ZeNP3lTegba5wlvwxHl0OuIEXLavtV5OIYB8nrSrmAW4k0H
	ueQz9sEkpkfRFe89rhPn1oCIplo1AZqqIpX5dqdPiqg019RLUF9e0cut7euZEU0R6MQaMKblnkH3K
	B+TbDadsSisYWBp8NizoMMdbA7uAjNJ785AKYURqtxpWcHLvSCY6CydKhfRagJEicolH+0qjyYQcS
	gvp0du0c3lzUTexwAAteLqK83PEo6OvX98kE9FqykZCLa6jkOKHXVIoFZmMfIvoMeysnRzzGr+CBA
	uhQxQ97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOSj-00D4pX-11;
	Wed, 15 Mar 2023 10:34:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcOSf-00D4na-0J;
	Wed, 15 Mar 2023 10:34:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 32B9C66015F1;
	Wed, 15 Mar 2023 10:34:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678876459;
	bh=FlyNjljVXfQH8sXqQul+9FStNcj5UQa68vjRYr8bIj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZtBAzml0yzK/Dr2SNII7uZoStPKI9wVCgDn4+MmcAuhEA/Psq9w+6+B0ayJl9bq9U
	 f2oJ77jcHyHREAxp1NDUctgXfCO6+jgcC6G50nj85wolvUHIofSU98AG5LF05sgQAB
	 v9o7Vl5PfjaEPu2r+ne/giu9bYUzjJcGcIoS6rHksEF0ArNpQm14ZiryYnuIhC5gI2
	 57RQj3HBsUkqfy/Hq8if2xEMaRFM2rJKPNW/xnFYoEEgeKtxqubuJmyJvKUN/cI5uo
	 PenS7w8SIfBlnsKrZaF2nUIPck1nsRWqsG0cMbEiZOJxtAcm/Mp8tauAweWI0SLwso
	 7Ynx9GUCILxUA==
Message-ID: <e15eac65-94d4-6a70-cab1-4fdb550116f7@collabora.com>
Date: Wed, 15 Mar 2023 11:34:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Revert "arm64: dts: mediatek: mt8173-elm: Move display to
 ps8640 auxiliary bus"
To: Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230315041107.2886940-1-treapking@chromium.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230315041107.2886940-1-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_033425_369574_18564453 
X-CRM114-Status: GOOD (  17.43  )
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

Il 15/03/23 05:11, Pin-yen Lin ha scritto:
> This reverts commit c2d94f72140a28d0f516b7c5e8274a9c185a04ff.
> 
> The `lg_lp120up1_mode` defined in panel-edp.c is not working for some
> panels used on elm/hana devices. Move the panel node out of the aux-bus
> subnode so the driver only uses the modes retrieved from the EDID.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

This commit was sent to fix display functionality on MT8173-Elm (Acer Chromebook
R13).... apparently this should get fixed with [1].

Investigating if this is the case.

Regards,
Angelo

[1]: 
https://patchwork.kernel.org/project/dri-devel/patch/20230315035508.2874915-1-treapking@chromium.org/

> ---
> 
>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 26 +++++++++-----------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index d452cab28c67..d45a2aeb0eb1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -90,6 +90,18 @@ switch-volume-up {
>   		};
>   	};
>   
> +	panel: panel {
> +		compatible = "lg,lp120up1";
> +		power-supply = <&panel_fixed_3v3>;
> +		backlight = <&backlight>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&ps8640_out>;
> +			};
> +		};
> +	};
> +
>   	panel_fixed_3v3: regulator1 {
>   		compatible = "regulator-fixed";
>   		regulator-name = "PANEL_3V3";
> @@ -282,20 +294,6 @@ ps8640_out: endpoint {
>   				};
>   			};
>   		};
> -
> -		aux-bus {
> -			panel: panel {
> -				compatible = "lg,lp120up1";
> -				power-supply = <&panel_fixed_3v3>;
> -				backlight = <&backlight>;
> -
> -				port {
> -					panel_in: endpoint {
> -						remote-endpoint = <&ps8640_out>;
> -					};
> -				};
> -			};
> -		};
>   	};
>   };
>   


