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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913BEC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:38:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2943C617C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 22:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2943C617C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8/82wGJnemDFjOQ5XDxQQXP3GIyUGIFK2Y9AFCUfQ3U=; b=Kv81qGrEcFjjqyR86XyUIj42y
	NlZ7AWXoG9UP68msOpRqFWGj9xDUhNQUONqBrJj/YFw1s8Yd839pn71etfcB5grN6AoBjYg4kEA5j
	BepLQXonyStasBNPYGXoK2o4BDfeyv9suaQAEtwGCjcXyPHPoSPw9YG0qSTXkRuGDReME54ntXJeO
	RDkoCEZqA/dF/DT4SlaZObBFBZ4JDFmwji2gSSHNAxxJ/6eZYG0z0GQdRVLRU/JN8Wabtv5p/PAWp
	v5Dj2zo12U2hhTh1VAga5cx+zfh0bK1WveVDKH9pnPj7dMrOF4SH3UE+Fu0zQ57K9lSJy+UVBST4X
	da6WvBEMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0WK-001iIV-LR; Mon, 29 Mar 2021 22:38:04 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQsEa-000gqX-TC; Mon, 29 Mar 2021 13:47:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so6705485wmj.2; 
 Mon, 29 Mar 2021 06:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZvzgiV2nSwBn6Q8dJPr/Ctf77sdhvnpJP3sNw2DTkQM=;
 b=i8QSVI0D3LEga2X5WIQ3W3/mZv3QboeegLFcBkjwjtp7EYuoVIWme1JwudklBmykEE
 nlJQxBXLOdXKNkZeztN2c+Xipn7JupOACYUvhfuLFRhHepeYT9Blt/KxmZSgfjrkr8G4
 Nu+cbfnjTqO6z9tc1lveJaU9tp24dTS62j+JSdMtvdjKcf3qPlc1dW/Gi0RIng2cLUmn
 ZqwlYXBDhEvsq2nEjg+YwhjgoyxYxVQswSAkETdh1Rc38zFtZ/s59gzS9gCsBOC5HxUx
 tjXTk8118zWLy9cMgbi50XAX/oiyEiyjgvH4YH0Oo2H1CqzMh3wUZH+PdS1CKX9Od2OI
 83vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZvzgiV2nSwBn6Q8dJPr/Ctf77sdhvnpJP3sNw2DTkQM=;
 b=aHlGeG/J7ReRExpMCfuvYOSJ6eCx9jgrg/h10dGB3jX2gC5N/monNL/CRNFcu3b29q
 4gj5Kn70u2CkKh7/MkI+fLeKcoJa1YY7DgU/hu4BYHinPc9iUz8ljVIiDdEUFlTpZJD7
 QyY8aqcg4VkXSGTxu83Edc89A6t6ZW9ultXRAcJnzOkZXNpWeJUAWPTCTbxBCUtEbKbI
 TuGI5gm2l4HxITvp+bVWwO/6PnFim21eDkLojcra675smVxBongfmS/Z+EHlgXjzNBUf
 z0RapNbNU35c18ETM7cypEOP/bjJCiCeOhg6t8hZdopEU0H2q8m9o2QgxVZnn1JC70jx
 V/CA==
X-Gm-Message-State: AOAM533azYgHTf+EUimc7uuXpiX4qJ+CyO3QhR92inqYpSTI7TxhU65y
 UhsavoKqDKnDwiXnPtyWaIU=
X-Google-Smtp-Source: ABdhPJyGvufcTPc2hzUFUUCpwwx6QBJ/M0LmHOUV1Yhmv35Zc+bNMvcSZk8TgVOu9KQY9NndjIFCGw==
X-Received: by 2002:a7b:c186:: with SMTP id y6mr25371592wmi.84.1617025632328; 
 Mon, 29 Mar 2021 06:47:12 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id z1sm29922043wru.95.2021.03.29.06.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 06:47:11 -0700 (PDT)
Subject: Re: [PATCH v5 10/13] arm64: dts: mediatek: mt8183: fix dtbs_check
 warning
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
 <20210316092232.9806-10-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a744a9ae-2687-39ec-332e-09ec5fdf6fb0@gmail.com>
Date: Mon, 29 Mar 2021 15:47:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316092232.9806-10-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_144713_043730_6455D9BC 
X-CRM114-Status: GOOD (  16.30  )
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
> Harmonize node names, compatibles and properties.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Applied now to v5.12-next/dts64

> ---
> v4~v5: no changes
> v3: remove property clock-names suggested by CK
> v2: no changes
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 80519a145f13..8882d35ac6ab 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -880,7 +880,7 @@
>  			ranges;
>  			status = "disabled";
>  
> -			usb_host: xhci@11200000 {
> +			usb_host: usb@11200000 {
>  				compatible = "mediatek,mt8183-xhci",
>  					     "mediatek,mtk-xhci";
>  				reg = <0 0x11200000 0 0x1000>;
> @@ -923,11 +923,10 @@
>  			status = "disabled";
>  		};
>  
> -		mipi_tx0: mipi-dphy@11e50000 {
> +		mipi_tx0: dsi-phy@11e50000 {
>  			compatible = "mediatek,mt8183-mipi-tx";
>  			reg = <0 0x11e50000 0 0x1000>;
>  			clocks = <&apmixedsys CLK_APMIXED_MIPID0_26M>;
> -			clock-names = "ref_clk";
>  			#clock-cells = <0>;
>  			#phy-cells = <0>;
>  			clock-output-names = "mipi_tx0_pll";
> @@ -946,11 +945,10 @@
>  			};
>  		};
>  
> -		u3phy: usb-phy@11f40000 {
> +		u3phy: t-phy@11f40000 {
>  			compatible = "mediatek,mt8183-tphy",
>  				     "mediatek,generic-tphy-v2";
>  			#address-cells = <1>;
> -			#phy-cells = <1>;
>  			#size-cells = <1>;
>  			ranges = <0 0 0x11f40000 0x1000>;
>  			status = "okay";
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
