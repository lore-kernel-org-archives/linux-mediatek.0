Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F9C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vvOcF04of4eueNy3j0/G+PNUIgeaFTAvFOiC1ayUAM=; b=ZahJ3lAHP9i3pfkOAspCGuZQ04
	c6Y0S8fEQRqWcIJ06gzKMZ+IoPUfkMsvByh1JCr4M09xsTT+xGlNPiyvnb2KBnkAV3vL2IGqpMV2z
	ATDHnR4XXn4kkiZ13hoTkrF6aN1WQe93u1QB6Sl8Q+Mvr4Xtb4NNJgwxduGr4I0mW/4+WFIeGitCq
	xEPemg/+ZgLTomEBUk9FiqmF47dOCFCqrJiYV1BLU5C4+8LPf5o+r4s6uSmoHwb00PSaAzh1829OE
	BfDVB++1YNqGKkA3mlhjTMFhZ04D231eYohb1BDYYCgz+cLtT4kAStR1NH6HsBMKFB9sEgnj4yPzM
	Ew9mJoRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sl8-00GZhI-Ey; Thu, 07 Jul 2022 14:45:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Sl5-00GZb6-6K; Thu, 07 Jul 2022 14:45:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id b26so26685811wrc.2;
        Thu, 07 Jul 2022 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0vvOcF04of4eueNy3j0/G+PNUIgeaFTAvFOiC1ayUAM=;
        b=YoegBB6KD2BGYIwIFRuRldiaXMtgQZEaon/lxSPUd/NBq5ujfuIiFdwN/Kk9CF9tdK
         m+6sCUv0gqnFnqu1i4kEiFHay3+ZgSbUYH0IYJipabvCJ44Sp+uN70qHfJu5fLygqBPa
         RtMkk5Ds78rZTaUGBBpLJpWrCGF8x5kF+uXNKwMO2PWTawaAacXeEytSLMnJhtR/gxi9
         JJbw9w1+8kwfDx8c7MaYBsGSME72NkmqggVbbgq/+NLCfOjNrTAEbUMcRunSdX+kzWhN
         KBdcIAGmcDoC7+3rGU+TOcT8NGPMjoU1GQkBes2xKamQp69VvQO7yGZvMHVtH7HDFoi6
         uhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0vvOcF04of4eueNy3j0/G+PNUIgeaFTAvFOiC1ayUAM=;
        b=v/g3ZgfrA76hStDLlNumyB2I9qKUvn+qjF0ehn7a/wcFp79sgYod1WDVo1UeFFybNy
         HsdMCSeEcMNAQykKqCShShjVBK7lkdrew1A4i8uqAqwdz2HslH1TBxmDlUtdoja7Cl7y
         3Y21/A+ex7Ie48xJyVZzw/x0G6YyHzpJEloDjNef0sBMC6qrwdl68+G+4UPeZyJIu1aV
         Dgyu3JsccOKE9NTF7CRV2ZpjxL0gwWmTrjqs5vwaP1869PjaFZVtyflqG0dRdCfmV1gp
         f0yIhq8+k1xkUpaVsvXIMp2bGxHoOluzDEg4tMwwZL5nZq8mQl5Qjm3WvMKKjLcFKhb0
         +bRg==
X-Gm-Message-State: AJIora9aWWyKwlAlpPXXHE6zfXiw3ma5Fghx4r+TBmI1nRQxxMS4hXTC
	6w/iSSF6+jaJtwZM7oLjRWw=
X-Google-Smtp-Source: AGRyM1tfcd/EN9bNHOdB0lihfDHNkoRbGPVjLa6AfF628mIVWi+vg43I+Azq7HsKQTP5OitdCjQiuA==
X-Received: by 2002:a05:6000:1ac7:b0:21d:134e:5d74 with SMTP id i7-20020a0560001ac700b0021d134e5d74mr44844340wry.78.1657205128650;
        Thu, 07 Jul 2022 07:45:28 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g3-20020a05600c140300b0039c96b97359sm29684100wmi.37.2022.07.07.07.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:45:27 -0700 (PDT)
Message-ID: <4447e5dc-8c79-7260-2d65-d86b5416d9a2@gmail.com>
Date: Thu, 7 Jul 2022 16:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: mt7622: fix BPI-R64 WPS button
Content-Language: en-US
To: Nick Hainke <vincent@systemli.org>, linux-mediatek@lists.infradead.org
Cc: INAGAKI Hiroshi <musashino.open@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220630111746.4098-1-vincent@systemli.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220630111746.4098-1-vincent@systemli.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_074535_309507_46C63F74 
X-CRM114-Status: GOOD (  21.56  )
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



On 30/06/2022 13:16, Nick Hainke wrote:
> The bananapi R64 (BPI-R64) experiences wrong WPS button signals.
> In OpenWrt pushing the WPS button while powering on the device will set
> it to recovery mode. Currently, this also happens without any user
> interaction. In particular, the wrong signals appear while booting the
> device or restarting it, e.g. after doing a system upgrade. If the
> device is in recovery mode the user needs to manually power cycle or
> restart it.
> 
> The official BPI-R64 sources set the WPS button to GPIO_ACTIVE_LOW in
> the device tree. This setting seems to suppress the unwanted WPS button
> press signals. So this commit changes the button from GPIO_ACTIVE_HIGH to
> GPIO_ACTIVE_LOW.
> 
> The official BPI-R64 sources can be found on
> https://github.com/BPI-SINOVOIP/BPI-R64-openwrt
> 
> Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
> 
> Suggested-by: INAGAKI Hiroshi <musashino.open@gmail.com>
> Signed-off-by: Nick Hainke <vincent@systemli.org>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index 2b9bf8dd14ec..7538918c7a82 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -49,7 +49,7 @@ factory {
>   		wps {
>   			label = "wps";
>   			linux,code = <KEY_WPS_BUTTON>;
> -			gpios = <&pio 102 GPIO_ACTIVE_HIGH>;
> +			gpios = <&pio 102 GPIO_ACTIVE_LOW>;
>   		};
>   	};
>   

