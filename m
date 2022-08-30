Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDA8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 09:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85ddw98iKNFdMuScvqYcAwOPIMZilnqs6BhTFJ5fmQo=; b=4tO5GAoRBMihFgAnmyiBLFZZI7
	g9ONqXdfluTbElUjosGPP84w0sxVw2oOJKCDPA78asPDm1hda+xIIbHh1TE5z6ZPwqmp2fdk7B+tx
	mPi/liCkjzTUmXWxMJ0CopzsByALtjFYbhIdU4HqdL23iRVY1DicHkIh3vWRA8C2i/NDSYKXR3xDB
	h5UoBTkiXLWSBwtR037b8agQOSLCIGXHLHRiUMISEcOMm8g56EpBUCLAQxRH+hLUDGArPL0lHP6zE
	Bpm/wEO+I8oE49KZpbw2MXNo0PSadZfGte30oP4p8EWtM585yrcw9l1d/wGAtGs2jznZb8A+lgcbM
	B8sB9gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxJX-00FVKT-KE; Tue, 30 Aug 2022 09:13:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSxJH-00FV7B-M9
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 09:13:29 +0000
Received: by mail-lf1-x12d.google.com with SMTP id z29so6067889lfb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=85ddw98iKNFdMuScvqYcAwOPIMZilnqs6BhTFJ5fmQo=;
        b=RxXyqq8+0Sxkf95IUpCyHZevRPKgc/uV5kRhgHRSayzKqoncb1jP95k6uoqpB+Q7Ih
         XbDvlK7PdYc4wBljUVJm4e7bC6hgCSPMsCRiqAQT5lD/IYU2O6yQR6uF29h0OwYG5Jft
         lW+dJJNbBhSClZ4dtreIM5qESkCbodSoEsmYEC0Jt0OghwP+Au7FMDroyDf9vY38R105
         jANwEVyNnrniE9bcocSlxFMaPHqTTp+j+S5uXy9c/c7zsy9JKWQK2j1uet5Td2os0RoZ
         hWLBySci78bEdowzZO29kvGhhxBSGFoGJHHxxIFzHWfj9GK78HFt/hsI9rADW/JLcgVD
         Iilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=85ddw98iKNFdMuScvqYcAwOPIMZilnqs6BhTFJ5fmQo=;
        b=lnAooWOzPDwJU6ZRvEMTC1s3p45PoHUGiL2dtdYJsd2Z+b7oBEW0ReSt9H/ctc5bL+
         AviOurxciP+jZRo8R4hh9u1bHOyMddsvK7a+1Rnq0BPOvvD1eo39uxb+PJuLpeN0rI1H
         Ow++PvuA8rF6I9sUbW7jjeZiAB1+zDjqzsLFhmkpdkj35kIL9rc59nCji+tlqp3mMkcM
         XfstylFJQCMQLN1LQuLXg7OYrGqZL9Tv7ay4ay/cukmRQkBEiFTyDaQxTZ8+4UaOq1ts
         PXXmqbjQN77OE/DPZrnOMzKxodkk7P2/bbEfjj8vlWTX1D+mo8yNRtPz3ktHV13SZMQS
         O6wg==
X-Gm-Message-State: ACgBeo348EGdx+QajQf6RAVLFWcmTBTr2dpzrotdTapOiSFCk2TrytsS
	KAoqmMxsBU6MtHHuF6srNZKY/w==
X-Google-Smtp-Source: AA6agR6Epke9TZidjS+t7TVXu/nI8IDXuv2Zcj4qF33M58gVrL9aocLEX9bOQfB3mw2k5CxN4EZ2zg==
X-Received: by 2002:a05:6512:4012:b0:492:c667:c899 with SMTP id br18-20020a056512401200b00492c667c899mr7177797lfb.48.1661850799778;
        Tue, 30 Aug 2022 02:13:19 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id v1-20020a05651203a100b0049482adb3basm11931lfp.63.2022.08.30.02.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:13:19 -0700 (PDT)
Message-ID: <e668a86b-f47b-bc42-440a-a74591827ccb@linaro.org>
Date: Tue, 30 Aug 2022 12:13:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_021327_753899_51B60DAE 
X-CRM114-Status: GOOD (  15.84  )
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

On 30/08/2022 09:39, zheng-yan.chen wrote:
> Modify gamma compatible for mt8195.

Commit should explain why. "What" we all can easily see.
> 
> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for vdosys0")

Your patchset is not bisectable and might cause ABI break. I doubt that
it matches the criteria of backports, especially that you did not
describe here bug being fixed.

Drop the tag and explain reasons for ABI break.

> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a50ebb5d145f..d4110f6fac62 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2022,7 +2022,7 @@
>  		};
>  
>  		gamma0: gamma@1c006000 {
> -			compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";
> +			compatible = "mediatek,mt8195-disp-gamma";
>  			reg = <0 0x1c006000 0 0x1000>;
>  			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
>  			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;


Best regards,
Krzysztof

