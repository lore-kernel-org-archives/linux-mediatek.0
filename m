Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA722C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S0DqKnIuSvbhL/BeaLxzkheTI1hi556Lt0X0PfWna4w=; b=gv+dnxOJ/9gzTTNC98/ZWDXzBu
	6f6NGCgU7PmJ3NjqC2oCx4Y2KupgOcHVpRFfbVWqB0pHGsLtL3zwvay2O5DDCD2mIrSs9t8p3DMpL
	ho+sPiNz7/TI2TlhAdKd2tEXovboP0NemHy0ZYILBxJ7+or2plNXpKMe5IRbmjdnGEyUn+iOde2X5
	wYmDF+LBYBMx1ZNLJb9XrKFVeY3z553uIotCgDAtTiPhNVeyLXPFsF+1JSXrz3gzcNoTPyY/Pc3MR
	tUeklEXc4OxBnlIyn1b5uY8yr6mrQ86n5E7BuzMkt47WUrYRO6TGeSnc0kzOuGEBN/HMjfLsRAiz2
	j8MF7nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7JdM-00GWVA-17; Mon, 19 Dec 2022 17:09:00 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7I75-00FPOv-Hn
	for linux-mediatek@lists.infradead.org; Mon, 19 Dec 2022 15:31:37 +0000
Received: by mail-lj1-x236.google.com with SMTP id s25so9497186lji.2
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Dec 2022 07:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S0DqKnIuSvbhL/BeaLxzkheTI1hi556Lt0X0PfWna4w=;
        b=gNAHP4f8oU+uSmknP1M4YQ+rOhfHavFCiNsIKK4QBSyFBStmpUhhvFHAaE3M/KGf9F
         3+T6yq/BY82gvlN6fPCqMfxNHcC2MlclJl2FYHbxT2baqfQaQgJirm+xMYWdROvamdgt
         z2w0lbFLLTQKPcpF4cG7gj288vACuKFP1ICfTEAKZjELgLLh1ciFwQgYGhpGCzn8cvpp
         iGKLjn2OQaxBtg20cn39EW+Lm8xYmcUzJpaorPYVWbLz8+IofEFi06JmJoEkIh3SfhgI
         ZEdkpol0s7PUdwHWkpNB3yeN6Xt4IrbUkmMWQiaKZdM+vzblx7QxmAiaKwsui3CmB/ap
         BYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0DqKnIuSvbhL/BeaLxzkheTI1hi556Lt0X0PfWna4w=;
        b=ealWdZw7v50IstvEVxfpD0+kl9s3MyPEmjsJVI+h1BRpNmRh5Bju0eJMpemyt3+p6F
         tFly3S/ze/iz/Nbq/qRDIdS3V3qIpDGkxjm2viT6lO/qGjt/eMXXG6lum0Y7jv86hYO1
         GB2pHRswmThP4ZdqJ1tHB7YcLfum4egyXOM79ozukGLJIrNEvd7/F2FnMUqNZlRGZ82e
         3UquazsYdjLEuYmJuuvePbxF/rqbo0HD7kCvvgu9equSfCNYqv/RCwBzLTaCytVHEm9Q
         kB8+aZLpkMgwlMDvRN+RgiTH1oAC0IktsougwwDjG3DM3Kpcddevvph7UfHWcWA4mIbf
         /rPg==
X-Gm-Message-State: ANoB5plSppLWusCRwI4XK7qv4Y+U3FE5/iJ2wrMT+kf9h/CmhUAVGjxi
	kLA+RPKCnW1BNbyC+vDLOhYtFQ==
X-Google-Smtp-Source: AA0mqf62K7RiXYrDz+81q5ivGgJyq7Z3xcHpva+5wqa9zeOtJavBk8Qd1E204B2w/riWMJO5tFNuzw==
X-Received: by 2002:a05:651c:2203:b0:277:81a3:f6e0 with SMTP id y3-20020a05651c220300b0027781a3f6e0mr13923805ljq.19.1671463889352;
        Mon, 19 Dec 2022 07:31:29 -0800 (PST)
Received: from [192.168.0.20] (088156141227.dynamic-2-waw-k-3-1-0.vectranet.pl. [88.156.141.227])
        by smtp.gmail.com with ESMTPSA id bf33-20020a2eaa21000000b002770e6c620bsm764964ljb.106.2022.12.19.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 07:31:28 -0800 (PST)
Message-ID: <270ba2bf-6141-724c-7406-0e27503b21bd@linaro.org>
Date: Mon, 19 Dec 2022 16:31:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/8] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221207094921.15450-1-moudy.ho@mediatek.com>
 <20221207094921.15450-2-moudy.ho@mediatek.com>
 <CAL_JsqKdaVmGKSwR0yiYGKc6Kp6jki632GA6CBOOjGzUmvSRWA@mail.gmail.com>
 <ba8ce731-2d9c-901f-e208-deafe589b723@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ba8ce731-2d9c-901f-e208-deafe589b723@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_073135_617855_BE89C429 
X-CRM114-Status: GOOD (  16.65  )
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

On 19/12/2022 16:17, Matthias Brugger wrote:
> 
> 
> On 19/12/2022 14:44, Rob Herring wrote:
>> On Wed, Dec 7, 2022 at 3:49 AM Moudy Ho <moudy.ho@mediatek.com> wrote:
>>>
>>> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
>>> hardware differences in power domains, clocks and subsystem counts,
>>> which should be determined by compatible names.
>>>
>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> This landed in today's linux-next causing the following binding
>> warnings. Is this a fix? Only fixes for 6.2 should be added during the
>> merge window.
>>
> 
> No it's not a fix, it's queued for the next -rc phase. I didn't know of the 
> limitation of linux-next only allowing fixes in the merge window.

Stephen asks for it every time. Now it is in separate email:

https://lore.kernel.org/linux-next/20221213120359.47fc3cad@canb.auug.org.au/

Previously it was in each linux-next announcement:
https://lore.kernel.org/linux-next/20220527164940.6ef5b25e@canb.auug.org.au/

> 
> Actually the patch is wrong. It shouldn't include "mediatek,mt8195-mmsys" as 
> fallback for mediatek,mt8195-vppsys[0,1].
> 
> I'll revert the whole series from v6.2-tmp/dts64 and v6.2-tmp/soc

Thanks. Please, drop all material for next cycle from linux-next.

Best regards,
Krzysztof


