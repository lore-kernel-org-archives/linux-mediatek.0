Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93159C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPrr5vkd2rYgejIwUMWJzS+nqPWI3EpvuWuHwQVmmTM=; b=hp+I7msJngBpUIbzgA0ppL+YgA
	xHm4UT6D2oar1ZG798HBSn6GPyZKMDz/z7qJMg01Q/dLLu8U+Ojv6q1A9tEnHiCrGSC6MlGNtUBe0
	SAdUb2zdSTasFuF8NHs+Mr0HtX0xZxTQXC15mS4wasSIO5MxW4BZTTrSM8poPvf6E5Z2XMPdFw7OJ
	joVSNvSCUmFHBxaw9SKjgKqmB6kyah5ZoC1KaCj7/Wjw5o5H/sFSH+fWkupCJ4SdtF3qN938xtacZ
	PLeh8Tu0LZfW46FA7y+amP6VBafWd3S7p2okiD41bwlfadXFYHvu31y5/viAX274cZ1uVh80bEK1Y
	tzlul5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAXb-00CABk-5C; Thu, 25 Aug 2022 10:56:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAXM-00C9pw-9n; Thu, 25 Aug 2022 10:56:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id d16so18810467wrr.3;
        Thu, 25 Aug 2022 03:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fPrr5vkd2rYgejIwUMWJzS+nqPWI3EpvuWuHwQVmmTM=;
        b=cXvaY2qOO7GXdF10qORYtkwnYW/U2uYVCxUsFydUQpKoF1XHBGmwRiTjT0ABAr9JvD
         ARlzpiLEEjjZZgHgFlMzAfwlZKviBb+dpad26IDYFmdSCzUP6orxKYXZVVxmYg/8L1E0
         qUUtRg3cdFEpsFePagPneRBkPo0aM0w0shRPLbBTyP3W19kCefJCL18Dd3u0SzaxryWT
         uEWDBVlzTsE+iExuFOZNAx43Z47EDSYLpVJO29qtiy3c0jAs2ap5KTMnaT3aujKmppso
         s9YgGUHm6R6ZukXqqZPKh3w7nfUieGQKnjyJeWmb2JeMF3pXpp86if9SGFPHpnDnOIpe
         HbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fPrr5vkd2rYgejIwUMWJzS+nqPWI3EpvuWuHwQVmmTM=;
        b=fvUeDTAIJaCmKSTGvCBXCoPKLXKRW+lVJGMhYDCe8L7y6reQHB4MUny7OPi/J81EOC
         0tzfgWqw4XvsnSBu5z4T1i8UbySSlm907VjwSF9Z2FYx1KithnHiLKX4IkUQEZjsLQ/p
         Tv/CGZ25Thibci7ZXQVyCEGLc21xGgAXWl3n1fhyb9Xn6koVth+aFTYlWQSdH/lE1Nn4
         NjHVWuxqHM+kBFWFAaAPs2qRq0wPMy5Q+moyzTtjtz5CTWVIr2FNJV1+az1xCzlt5Fa5
         gLPSgJnO7hmeD06Jpe5Vsyye7lXs+DSttTyhm2BQ7n75SB/YxoBCLwTWES4ZzJmCCrJ4
         AONg==
X-Gm-Message-State: ACgBeo3ehFiOVwMzJxffneIVa9ZdVT50m/7eQ/Kr1tGmOjtBbii1iUOj
	gTbPubC+m8O4FD0VBC5fTZk=
X-Google-Smtp-Source: AA6agR48AFG+EbCXcMuPyresO0qOUX5PNhKvhn8fo+4y7J2rjEHtEWHDtMQGSB9W7NgWp4ncKMpC/g==
X-Received: by 2002:a05:6000:a0d:b0:225:4bf3:95bd with SMTP id co13-20020a0560000a0d00b002254bf395bdmr1942368wrb.289.1661424994934;
        Thu, 25 Aug 2022 03:56:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w4-20020a05600018c400b0021e5adb92desm19445731wrq.60.2022.08.25.03.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 03:56:33 -0700 (PDT)
Message-ID: <9ba586d6-bc1b-05b6-1018-d8f774e2c952@gmail.com>
Date: Thu, 25 Aug 2022 12:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for
 MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, ck.hu@mediatek.com,
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 hsinyi@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_035636_372093_5E2EB23C 
X-CRM114-Status: GOOD (  18.60  )
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



On 25/08/2022 07:56, Bo-Chen Chen wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..bfbdd30d2092 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,7 +31,8 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys
> +              - mediatek,mt8195-vdosys0
> +              - mediatek,mt8195-vdosys1

If I understand correctly support for vdosys0 is merged with the old compatible. 
We should therefore keep mediatek,mt8195-mmsys as a fallback for 
mediatek,mt8195-vdosys0.

Regards,
Matthias


>                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:

