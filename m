Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2401C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ruVZ+nqpPxejELcPa+QVovP9EcRxs5XzTtjPXBzPybw=; b=085iqiX/RmPmAuIO5OwTEAxYW3
	TqVOGe5rgdUiJAtE4O+jV0TMKjGlVhl3JY5xeQ5vxE/Q2jwswses8tzdrdfM2aH7FIulWdBsOnEQD
	F6ag0jN2Vf8du00xGQQdpQnKG/la/IWY0HdSnxuy4zQAhRXZpunTj8190pNSj2K8oTjv93Bw9sxYM
	sXcEw1vGi7d61os6erXIv2NM6tMYdZU2gFw24mMazbzcsDBCT3SgF9yVzJZJ6XFk3mx+GkkhRGPe6
	6blV65IXv6fuccIasnR3I3Y08ef0U5KleDHAF+HLP5SkZBWzmHbZycBMwz2cTAGWCXyqyUN119RN2
	uGAuxqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCSI-0071CW-2d;
	Fri, 31 Mar 2023 10:58:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCSC-00719V-2v;
	Fri, 31 Mar 2023 10:57:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id v6-20020a05600c470600b003f034269c96so3345798wmo.4;
        Fri, 31 Mar 2023 03:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680260275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruVZ+nqpPxejELcPa+QVovP9EcRxs5XzTtjPXBzPybw=;
        b=STGlQbl5pdqAFFPeA9oH+J5ICEFK3qkxQEvxknmC4v2OlpiSrx877BUe9QlCmArIRa
         PoVbu3en0sjd/b4Iokb1AiZ2ClE2HLGtYEN2xQ0DkUxDUj7G71wCC5b4zg2OJHG5ka4i
         qAeJszAOv1lbO7hwrOLAZvzj/KJOb0f9AOJO2Wmieh5Yh9VEZGAUJKlRs3fqIN+KVEgf
         UaZFhEvHrXoZ8dbanR0Z2ODNhcRELXvdARzimA772eEt75Se2cZ4F8/2NTKqzMuwj7Gk
         MU9RrX0CCqcV4b9bcBrDbxMjljcjBRfZHcNuSWbI+UQCmeOUO70voDs6hLJCgUM/SV62
         6HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruVZ+nqpPxejELcPa+QVovP9EcRxs5XzTtjPXBzPybw=;
        b=GgtjLKcmuhhnYjt9W+HXhVJ0+x176uxIVu2jlnFhzjZ/bgVKMofDkNdm+r6lmIkyHh
         iwuhdipcWHmW9tWUfGJXLZuIwrtsETouP7OzuvrJwiwtD8jCud1+h00QPyOW4Tl30+nb
         sAe/thzC93aTHlZG0WXraA/3c6KbYTGNaqj/DwXXcp9Qk5IsfeZ/mcbayo7OOTmsqrso
         pKFEWBpvCyR23E9melVKWe+vjOC5MMF4jye+O8N81lAsU/LED5CS4Gvhs/uP7uQpgsNP
         SikzqfFqC0YSPLGoh+Ed1N6qt1uCmKLKeuzq1xUBm9rWrSLTZ0fDhDZS4S/rkfwAhD3b
         RjRQ==
X-Gm-Message-State: AO0yUKVUCFk+rupUI+J5dk9RGWZpDiCvnTIlBoh82DySj8EuekDEzpP4
	CfTAAtzf5bgczyMBfzqLOpTyQAtQTJjm0Q==
X-Google-Smtp-Source: AK7set/NThtTJbIt9LOK6pAdTg6KLO5h2EdvVtCl5moj2821TwWnFFcOLxxqECrDAvoDTccyuFfKOw==
X-Received: by 2002:a05:600c:22d5:b0:3ee:3d2d:841a with SMTP id 21-20020a05600c22d500b003ee3d2d841amr21155578wmg.24.1680260275314;
        Fri, 31 Mar 2023 03:57:55 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y22-20020a7bcd96000000b003ee42696acesm2300375wmj.16.2023.03.31.03.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:57:54 -0700 (PDT)
Message-ID: <b90a3440-53f8-9384-155a-f7ac2b7f2e9c@gmail.com>
Date: Fri, 31 Mar 2023 12:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v9 02/11] arm64: dts: mediatek: Update the node name of
 SCP rpmsg subnode
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
 <20230328022733.29910-3-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230328022733.29910-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035757_811034_D10B0688 
X-CRM114-Status: GOOD (  14.22  )
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



On 28/03/2023 04:27, Tinghan Shen wrote:
> Align the node name with the definition in SCP bindings.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 2 +-
>   arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index fbe14b13051a..a259eb043de5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -810,7 +810,7 @@
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&scp_pins>;
>   
> -	cros_ec {
> +	cros-ec-rpmsg {
>   		compatible = "google,cros-ec-rpmsg";
>   		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> index 9f12257ab4e7..8f14b633c1e1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -1260,7 +1260,7 @@
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&scp_pins>;
>   
> -	cros-ec {
> +	cros-ec-rpmsg {
>   		compatible = "google,cros-ec-rpmsg";
>   		mediatek,rpmsg-name = "cros-ec-rpmsg";
>   	};

