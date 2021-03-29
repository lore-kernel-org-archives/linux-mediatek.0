Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13089C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:35:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A40361879
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A40361879
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HEhcUqAN5uvw+54IP/ZhgZAel97UDsM9M2a8V64f7XE=; b=Ue/je/Vn2XOzf2SIql5HN3IL2
	4nf+PwsjGFUhOmetZUEtn9JlNu8suweR9GIWKqbqapGJSK/nZ/NwUHN4QLRNXKyymZTidDm2v1VVi
	habwKHF3uF2Myc1naJnWIpkfo6WVaEOsVS6OnU1bbb0ySeFLitga2wAM/kp4OzIroDeM1nW23rYLV
	6+795Nw1pouabcLsnx+Zm/tVOiZgYIkO1rWG8U48UFwzL7N7ni7Ie+sNN7RvGZIDMLEhRXBWytXoC
	Blq95bGSwb2qRw5zPu1o89RxpEwsdVcBQh2frEH4az56sxt/MvdjWp43bU9OSrWFV0dNSK3bBV8ws
	U/2bjLSgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0TC-001h4A-SI; Mon, 29 Mar 2021 22:34:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsDy-000gnb-KM; Mon, 29 Mar 2021 13:46:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo6682821wmq.4; 
 Mon, 29 Mar 2021 06:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rZ0ttQmQI38kgtwimwZOypMElesqYSV1+5uAEl6XReI=;
 b=aXrEUr2HfLf/OkoGix2kXX2gaejpeIC6TS8dm/pMOZ383IzDcRMNlJIOyRWYzFe0SW
 nySVI9Sx3U87QQwvMpsgSFraJZQ75BFpr3nCfBldspaT6JbL7NPEa+bZlishv3UfKeoU
 d2HFDwZJ/SisxNV7yVr/uWo5Vs9kzG8DVJY4R6YJnJoEDDw5jZnMuSefFCNVHp/pONbs
 w718mLUmn0OT4MQwg1RiUiqSdMBF1E50pYWf+rIm8q/BVQF9q3toq6AlWBPvSt8PtJ8o
 HAe0vKWGlDaBaa6IsdtsfxIIsx7DbI+ih1d48ZA/oNahSgNmbZYOQyHcQkmfzyvrMVb/
 Ns7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rZ0ttQmQI38kgtwimwZOypMElesqYSV1+5uAEl6XReI=;
 b=OJVE3rnofGV0d9fWN7fy5wyWlL49T+kdlTk5E3Gxdu4nnFzvsIx7pAleOtE5XortIw
 UEpNbgF6VHZDkXeuNFKH9q9HUxe+/7m7cjQ/yPprzQGAu95mo17AinNE9KlsqSf0PAon
 K/IwiI1jEgIZSGnbIxYX5zHhITY0dZV2cTdt0wZFRHAe+oBSUqHflkL22OCWllV6VkKG
 ASU0oXNC/+vci71QVDQLE1C8pz//jhflev4fyu/v4KzGeoDi2fUY9QA1/xFMbVusUryF
 DfAFlUKGDgbJJSH/KccH5MwgS/m/wGkv5ph9/i4lDgxzMiG/dh+ODpuxJNvVGohCm4OB
 CR5A==
X-Gm-Message-State: AOAM530BD0OZct3F2NiEzlRTuvrVjToXSx9J+PHs63NqWpUFsVa/iw6J
 +jaqueuJQoFj2Dh9jzIWKw4=
X-Google-Smtp-Source: ABdhPJwsFeaTfLQho0KOF6d5TsjacpYyW3Pw0n29HGyU/IuKNc+SapdcNLoG9R2gdUilBHUWOqUPCQ==
X-Received: by 2002:a05:600c:2247:: with SMTP id
 a7mr25237250wmm.131.1617025593712; 
 Mon, 29 Mar 2021 06:46:33 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id c131sm26103482wma.37.2021.03.29.06.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:46:33 -0700 (PDT)
Subject: Re: [PATCH v5 05/13] arm64: dts: mt8173: fix property typo of 'phys'
 in dsi node
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, stable <stable@vger.kernel.org>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-5-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <849d620a-a209-f89f-8303-9d0c9b740045@gmail.com>
Date: Mon, 29 Mar 2021 15:46:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-5-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144634_817726_08FBF339 
X-CRM114-Status: GOOD (  16.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/03/2021 10:22, Chunfeng Yun wrote:
> Use 'phys' instead of 'phy'.
> 
> Fixes: 81ad4dbaf7af ("arm64: dts: mt8173: Add display subsystem related nodes")
> Cc: stable <stable@vger.kernel.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v5: merged into this series, add Reviewed-by CK
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 7fa870e4386a..ecb37a7e6870 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1235,7 +1235,7 @@
>  				 <&mmsys CLK_MM_DSI1_DIGITAL>,
>  				 <&mipi_tx1>;
>  			clock-names = "engine", "digital", "hs";
> -			phy = <&mipi_tx1>;
> +			phys = <&mipi_tx1>;
>  			phy-names = "dphy";
>  			status = "disabled";
>  		};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
