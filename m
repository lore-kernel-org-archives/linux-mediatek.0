Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF02C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:39:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A83D61864
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A83D61864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bCho/IREFuvz/AouxhAUk46FAhMWfHpbylXMkZQCDd4=; b=p+78Ebda+lrmC2P7Dkwd3IOw+
	3TmGRUfToTPdUW4CqB2RMIIEbB7o65+c/sGx7RdWudMmBlva59t3/X39VOnxfpNVUHM0kXw+L72hE
	02RyZy0r+mHQu+GuMA/w2ubemXPNjCx9Sh7ObcY72ZjbvI7ZS9lNyhI4btIk4iOBbCdYEhFX4VyMi
	LZiOoOk2UIsiD39x77nbO9wgnhwpPqSDyN45/J3aV5VBpz2ILBkJRtciM4YGRFN4pUqpHu3VfTlSD
	wKE5IPxBQXRu5A8Iu4bMjNbuhBsBNolc7ci49ysScKeVxipOQt48/vV+J7qYStYHKHALSFNmKW1Pt
	hrooesZMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0Xg-001jCS-UE; Mon, 29 Mar 2021 22:39:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsF4-000gsX-OE; Mon, 29 Mar 2021 13:47:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id x16so12927494wrn.4;
 Mon, 29 Mar 2021 06:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LDEzUvKkjAIAvpEGtHLesvgMticNcLTXLAP3FMyOp20=;
 b=QgMv/ynDdRRfWLLD1H+6oPildJRa0NtXPSoikSLeCdIBE9YYdG9IhWa3D0NHkYueHe
 8chQPBQz5nGPtY9fgNvn9APGFCv6tmTskaHuxDYLAJmQQ9a8TDj+H/Mds222JcgNMPdn
 UH2Jvu2nq9lc8DlHoRfJveHMdC8kgU/2tB7M65tY41CEth45jvkrap7CtyHshYRJ3VBx
 aDhyqbRUyg7O/cZBPJsVP7uLx3UMHWekrJOYgJhUIk93zpV+YhvS3Ky0ydwFcirY0E6p
 Zf7IN+mNu9Sf9MUFmyPW/CWXNWJWotMApizLID1AuUkyC5hb4QK1H++JUgU1QdLJKel2
 rFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LDEzUvKkjAIAvpEGtHLesvgMticNcLTXLAP3FMyOp20=;
 b=tNurBelK5YCe1v6OW//6Iwvj9NQCSqzMt/olfWiJXpKNhZ9S5e/7J594rhYTEpfkN9
 aY5pAjxPwW38DuOB15vAvq0o+MPDYt/CnXUeiBFObrsnojbE3UQ74JMbA9ZxiYkP8S0L
 1y0CZZkTzSD/ipXfb22OpLTp9j4mUiGmV8OGA3IArGo2JBs/+GFIo8jGuMpNRikUmnmL
 LiYp6rI9t7LP6tsIYNHXnCqsWu9xF1PTC41rF4OD88YUsGz44i7FdRbr097ceBFzRIzf
 i7x5/CI2+f1PYV5R6qIIgmgxwc9HzfnXEkHuEDdPyPF9roXqAjEJZSXo/PqW3mYb7xY9
 9y9Q==
X-Gm-Message-State: AOAM533u61r8gofL/Ans321bBP1VMgkkFOzEyPF2/LuYU3ADaXgL+P8S
 8L9p9rlOAzHjzsOI4U5SWRA=
X-Google-Smtp-Source: ABdhPJyzByzyqLM6tlsL+vq+denDIyXkVf9F+7u6Otbf7WudUQp4OKErhkmujtGBPS5iAhA+nISOvg==
X-Received: by 2002:adf:fd48:: with SMTP id h8mr29064992wrs.229.1617025662200; 
 Mon, 29 Mar 2021 06:47:42 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id y205sm30561793wmc.18.2021.03.29.06.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:47:41 -0700 (PDT)
Subject: Re: [PATCH v5 13/13] arm: dts: mt2701: harmonize node names and
 compatibles
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jie Qiu <jie.qiu@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Cawa Cheng <cawa.cheng@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-13-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b6e523bb-8991-b5e8-576d-55190e7fc49f@gmail.com>
Date: Mon, 29 Mar 2021 15:47:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-13-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144743_050283_9A697A52 
X-CRM114-Status: GOOD (  16.41  )
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
> This is used to fix dtbs_check warning
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>


Applied now to v5.12-next/dts32

> ---
> v2~v5: no changes
> ---
>  arch/arm/boot/dts/mt2701.dtsi | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> index fade14284017..4776f85d6d5b 100644
> --- a/arch/arm/boot/dts/mt2701.dtsi
> +++ b/arch/arm/boot/dts/mt2701.dtsi
> @@ -607,7 +607,7 @@
>  	};
>  
>  	usb0: usb@1a1c0000 {
> -		compatible = "mediatek,mt8173-xhci";
> +		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
>  		reg = <0 0x1a1c0000 0 0x1000>,
>  		      <0 0x1a1c4700 0 0x0100>;
>  		reg-names = "mac", "ippc";
> @@ -620,8 +620,9 @@
>  		status = "disabled";
>  	};
>  
> -	u3phy0: usb-phy@1a1c4000 {
> -		compatible = "mediatek,mt2701-u3phy";
> +	u3phy0: t-phy@1a1c4000 {
> +		compatible = "mediatek,mt2701-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a1c4000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -646,7 +647,7 @@
>  	};
>  
>  	usb1: usb@1a240000 {
> -		compatible = "mediatek,mt8173-xhci";
> +		compatible = "mediatek,mt2701-xhci", "mediatek,mtk-xhci";
>  		reg = <0 0x1a240000 0 0x1000>,
>  		      <0 0x1a244700 0 0x0100>;
>  		reg-names = "mac", "ippc";
> @@ -659,8 +660,9 @@
>  		status = "disabled";
>  	};
>  
> -	u3phy1: usb-phy@1a244000 {
> -		compatible = "mediatek,mt2701-u3phy";
> +	u3phy1: t-phy@1a244000 {
> +		compatible = "mediatek,mt2701-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x1a244000 0 0x0700>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -700,8 +702,9 @@
>  		status = "disabled";
>  	};
>  
> -	u2phy0: usb-phy@11210000 {
> -		compatible = "mediatek,generic-tphy-v1";
> +	u2phy0: t-phy@11210000 {
> +		compatible = "mediatek,mt2701-tphy",
> +			     "mediatek,generic-tphy-v1";
>  		reg = <0 0x11210000 0 0x0800>;
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
