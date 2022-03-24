Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9831BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRqL2+5mwXB4JMMOZLr9S/IunorrRFGjgcH/Xe3lLqk=; b=dc2BSNveZW3qTw
	+W3K81kgkhrg53tr+8Qq2/X4bp4/KAQPvSXf+bVoMTEacNOqyEMFGBdqgbX3BkckE85eeYdGdPYnK
	r8jOWyXDdlstUa+CSCwM/HLNDol3C9+YgkHz4G2oD0BbqbTuyMVT+F/8d9VXo0i36Z1Xokg0jSmVE
	U2l7jUmYwi+N0rrFi9rD1hm1RZe36z9VlT5PScQ8PzsHQT/h4JpZnpMMGT8IZCt69WPdIq2zlk4Ti
	5NPoqCabHnc+Z9M3qg728pSw6Wf/SfMkS3nb7gv9XKAgDVfUdzw8a1SaARMQDg3WADHGscAndl9V6
	u15Zf6zGT0eguNmFc45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXRYY-00HQc8-5p; Thu, 24 Mar 2022 17:47:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXRWr-00HPnE-Cj; Thu, 24 Mar 2022 17:45:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c1d0700b0038c99618859so7661294wms.2; 
 Thu, 24 Mar 2022 10:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Xkcd8cqeeklF/h/FFb9fiP6tou2pDeaGtCw9wrYVoYo=;
 b=cCrnhNDLmJdqRxvJY4yUMQkpnGQzjVbih+/LxojN8EXx7UXNGwPEU1gU9fdWpdSh+Q
 tWWE3zVixulfIxSx/7WBAeeAw3NTTUBHhRRIBVLEweuldDpPnULDAjJS0cz2YQmGehi/
 FZsTVmkZvx5YvZTAoqHSDVdRbL+ysNjwHA9nj/Sa9MuUPacHyANfewyMDySb2NfPlQpD
 E6U06DKsK2zjGzgL6fffkkliIyXuGwv2Pi/TLmUPMKhGZphlssATB9PfjLhitElx0Hc5
 l9HmSc6PTAd9XdXphmMF1181ahdSObqYz71BNF2rp6iDwSQD6gKNiJ/5aUuo2w1ibSIz
 VxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Xkcd8cqeeklF/h/FFb9fiP6tou2pDeaGtCw9wrYVoYo=;
 b=iQT/UPzWZJiIfWHCqAlhbAQ+feYfuOVnBknJ5Qsmz0dRRHgWgG1zryizxWLbnAZHzz
 sJAh2VL2sD9NID+ykQ2QkE/8BH8rQ47xYjCaqgfCgVsnRemaqucIwml73ZtOJVabKmDW
 wwcwt0+VX3sSb3HiEbmUT11oygVenSKf2UPyM41jwZiJ1J/0NTBns7Yp0c7W+B51X7Ay
 ulZVDs1hlgo0xhc2BYcAT4CpJuzBsQ60Ddp6fO84cnAhfHwYeOMYWstumjXck/7d5Seu
 cls6in5TTek/FnKsWh5dBHJJZ13Q/58v8SEjm9ENJwFt2M3JWp4VtWolQPOVveIaiyPm
 9YMA==
X-Gm-Message-State: AOAM533ym1rLfOiUTW00i1b8NBFEeCZaQZXn1h0vhznHw6jNRTm5IKtH
 0uFKSSCUAuV7Pk8ywr9mIag=
X-Google-Smtp-Source: ABdhPJwSoOM3Bkd++UOmpy7a+gbxRrT67AW4Qn+lS+78WGImo3CY8Dx7pEzPxToCJb4cUVix9FSxpA==
X-Received: by 2002:a05:600c:4611:b0:350:564b:d55e with SMTP id
 m17-20020a05600c461100b00350564bd55emr2962505wmo.124.1648143943465; 
 Thu, 24 Mar 2022 10:45:43 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a1cc907000000b0038c756fe683sm6514666wmb.43.2022.03.24.10.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 10:45:43 -0700 (PDT)
Message-ID: <4f1c609f-f578-5b1a-39c1-44d59b6cfd2a@gmail.com>
Date: Thu, 24 Mar 2022 18:45:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 10/22] arm64: dts: mt8192: Fix nor_flash status disable
 typo
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
 <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-11-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_104545_517420_C2072B0C 
X-CRM114-Status: GOOD (  15.21  )
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
> Correct nor_flash status disable typo of mt8192 SoC.
> 
> Fixes: d0a197a0d064a ("arm64: dts: mt8192: add nor_flash device node")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 3a7f93d8eeaa..75c21edccf85 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -934,7 +934,7 @@
>   			assigned-clock-parents = <&clk26m>;
>   			#address-cells = <1>;
>   			#size-cells = <0>;
> -			status = "disable";
> +			status = "disabled";
>   		};
>   
>   		i2c3: i2c@11cb0000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
