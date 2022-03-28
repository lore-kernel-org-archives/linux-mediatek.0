Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF226C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 11:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cni5sfqjENo2WVJqhXGYNFoQM2uEx4LA6GvQjr9HWEs=; b=VBpZMAXeAdakRf
	tIaNODGubCWyajXpOQz4thFSWeCWwRXm24HIw2Q7E4AmPQMRWBjodz+HxXbesLVqWcMdCQyVk0rHA
	oKQdyhUroXMjBVSaM49thKWXEUdKBFYuBXOeMla99UQzObczvY2G5QrmGmAlWx3JphBkQqAxOAGLy
	fOg+Aa2GRmpMCYHpE9uz9knwQRqZsUmgxUbJD9EoWgEK9y7RVUpszszsgjvzk7FYcYj0g7kKr61kc
	weJ4MISsQvEyWTUE44jx8nSwO00Mo/0UW3U8CAkPXHNYDNTT+7I/j5vP2aRK1Md15+luTuetqw2VN
	EFCYMfIjj/KHihZKURRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYn8F-008HsU-RY; Mon, 28 Mar 2022 11:01:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYn82-008HpU-IL; Mon, 28 Mar 2022 11:01:43 +0000
Received: by mail-wm1-x32e.google.com with SMTP id r64so8142746wmr.4;
 Mon, 28 Mar 2022 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ykS4CFll+H8Op4I03/7dYBqilBTYX83XNgnoe/3NCaQ=;
 b=Tga44SEmd85Vio2pvHqbRpA9ki7G9bZleXwfWn8CAc7+fIoER46ZP5xU23nXz53Muw
 dWkEuYJbyTSGubrEopIW+asPWzQaClUbHjuygPfqyhtTIuAl0Kw5p4NGl2HJU0r49ilp
 1+iLpL66KNyapj5/oAV9kW9zx3NaXNS0AaBpORa2YaaNG02WGcuiGNUEIg8lhOfXFgQR
 QmUpXdbmdTQPbV+HtaU1c1BV9ohGsrS6l1lJoMcsocKDsXbjPn3dSJBJpjYzEztsAigv
 hcZ2H7F90xgtvGiT98lZx+yrtcNpy3pxq5U9E800+jpo4dI6+uRBX7o7ycyBHncpOPD/
 OA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ykS4CFll+H8Op4I03/7dYBqilBTYX83XNgnoe/3NCaQ=;
 b=jvugmQ5nh8EmU6jnV9wF/iQpwTvDsv7cz4LMI16pzDodlAso2RJqVn3rHgt70izQaL
 hgBLsiC+nT4r/qy2m80+jV/moNM1pwaH+XEsKkh2d1y61Em3E8L0j32l8MfeDsG6CSvJ
 4oPWe7mTyKl+eUDISvp0Ixy63IQ/Gcdp6jjQR6KL5j35QkBZxJihHu1mq5gx8owXDRr1
 cKrLEQnkRshaGcF9OJOcmDfpB/vo7rURxaRfeDAkBujTjM/bdAx/c3gaXVWAAx7udCuc
 eCeIhAWdY4wMGp508fjGHKyQioyre8VaTXvTtErTtvewtBosIvVt6UThH0MfSCh6YpEF
 12Vg==
X-Gm-Message-State: AOAM533ZN60GRjotlm42DS9S6se/mZ6uymSJsAYtsHWAY+WOsScDOO4R
 +KAU7aZEHoi13rZCFnUqhtIvOrUip5VvEw==
X-Google-Smtp-Source: ABdhPJz+3FYb0vlsoBwsGqN15gEbC63jvqxk7dxSUOipeu2cUeO5/VB4TypAZM8vKCUZng5dwSUO5w==
X-Received: by 2002:a05:600c:4ec8:b0:38c:90fb:d3bf with SMTP id
 g8-20020a05600c4ec800b0038c90fbd3bfmr25380404wmq.0.1648465300738; 
 Mon, 28 Mar 2022 04:01:40 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfd1c3000000b00205820686dasm13960361wrd.5.2022.03.28.04.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 04:01:40 -0700 (PDT)
Message-ID: <3f786a4d-146f-f378-df19-6903727d27b7@gmail.com>
Date: Mon, 28 Mar 2022 13:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 20/22] arm64: dts: mt8192: Add dsi node
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
 <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-21-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_040142_644724_4B17FB16 
X-CRM114-Status: GOOD (  14.36  )
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
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 59183fb6c80b..08e0dd2483d1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
>   #include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/power/mt8192-power.h>
> +#include <dt-bindings/reset/mt8192-resets.h>
>   #include <dt-bindings/reset/ti-syscon.h>
>   
>   / {
> @@ -1203,6 +1204,7 @@
>   			compatible = "mediatek,mt8192-mmsys", "syscon";
>   			reg = <0 0x14000000 0 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		mutex: mutex@14001000 {
> @@ -1327,6 +1329,20 @@
>   			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
>   		};
>   
> +		dsi0: dsi@14010000 {
> +			compatible = "mediatek,mt8183-dsi";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				 <&mmsys CLK_MM_DSI_DSI0>,
> +				 <&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			resets = <&mmsys MT8192_MMSYS_SW0_RST_B_DISP_DSI0>;
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";
> +			status = "disabled";

We are missing the output port node.

Regards,
Matthias

> +		};
> +
>   		ovl_2l2: ovl@14014000 {
>   			compatible = "mediatek,mt8192-disp-ovl-2l";
>   			reg = <0 0x14014000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
