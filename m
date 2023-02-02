Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8888CC05027
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 11:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0y8ikm0/uriJSrqR7napvMGotKjya5U7k4Py4klJVM=; b=LlhjtWH5/ZhtjOS6DRM0naOjpv
	DfT4zQlTvNzSph9dUtD5bY3FZ33mW2XnuN20GSLM/6+yPygnTaQlQAsxYGmAdC+WOqAOTBfksjWLa
	t1uMUml7fWqo3YL4lm2STJ4CktrM2COBa4WVligYPv5WLJWZv4rMzMKJKlYVRlu+okZ6YY/HK8QhM
	bv6tR3FWRld5Z3Sg1GwNT4LVFOEL8sKMLvQ2Ha2Hc0CXGD8vLqnRm8rBCM3svDQ+vx5cRYZjeUrb/
	kRnW4OlZGZ/wwKyR6I6ScDxX5JnPjhOZXp5TMgEZFIQfsfDyb+cMaqGW5RtkmElVhZqNZSQ3/UC2u
	wMXbhlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNY8v-00FfBq-Dn; Thu, 02 Feb 2023 11:52:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNY8l-00Ff9p-6X; Thu, 02 Feb 2023 11:52:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id t18so1478978wro.1;
        Thu, 02 Feb 2023 03:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0y8ikm0/uriJSrqR7napvMGotKjya5U7k4Py4klJVM=;
        b=k4Y1r2IHPtKLh0AA9EYiXCpQj9K9hbGt2ZIfW8wYGCDjCxQn+BKftGq1bCqmuT/l1i
         Uo8LpaGBMm9FVzMCcxVGikiThovS85InR6NaYjQPn+xo6s86o8KAMSCR+ujIVX3r5Udp
         mjSjJro1leJAitZa+LK+5uQwIS9HTIEGoi3IL6L7KtdTUZYEvTlZLZGso16mQgbGgPPs
         sPcuOBZ2EiBGoGr3CvHA1mEjOxXemEpWcvQ9inm1ToDUDVcVD9Kh+RDOEklW/bOSn00N
         fcHb6WaTpKTR9hrcsUE2DxL+CbvrhPcxaFbr62e9vkz3c3lPicBSwDfNZTRgoOJM7kAM
         oz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0y8ikm0/uriJSrqR7napvMGotKjya5U7k4Py4klJVM=;
        b=xaAwyB3ieSP5o6p4hVxCMuDmUEtF/5tx6DE6lOZ/bLxWSrLFQ8uvMfd0re4ZZaFDUu
         fvbDHo/brB2FuE3Z8RJab2q26+FOlj1fKEs2N8y46nZsqLQ4m5QIPue4ePLeASStBaD0
         M8yH7soEJT51vrCLVmMRRx+ImE5vO1S2I2xTAW5yrURJsVqIJ3CzJWeJT2NISSgwjZQH
         y/gsTmYVluN2bu6H4uPNqqykMt601GAsiZ7d6Gohy7RjBzyY10zaDIhzee6dtQmC/eIY
         02EJ4zBLtwWs1jY/G0S81lEr5v2hwOAeT8zp8WU3rOdXcFEbxM8zeZZDgt6Bt0B2Pwm8
         hCIg==
X-Gm-Message-State: AO0yUKUoa9Gdf2GqeMMyOP8+bL6S7xCV+3oWsNBme1dwhXxFwIZ5Ceyd
	TIdGoP0tsdrT0cqoYCYfs58=
X-Google-Smtp-Source: AK7set9kleGI9cl0RhP3cDudtg26Ip2ps3NNEmSBY5Glzqw4jyllNyvlkx+BwH5dsmHf735GgWGxQw==
X-Received: by 2002:a05:6000:789:b0:2bf:cb91:a40a with SMTP id bu9-20020a056000078900b002bfcb91a40amr5828501wrb.46.1675338747445;
        Thu, 02 Feb 2023 03:52:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i14-20020a0560001ace00b002c3be49ef94sm2151632wry.52.2023.02.02.03.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 03:52:26 -0800 (PST)
Message-ID: <4f6f8801-9101-482e-6f3f-bc011df42259@gmail.com>
Date: Thu, 2 Feb 2023 12:52:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible
 strings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 soc@kernel.org
References: <20230202104014.2931517-1-wenst@chromium.org>
 <4b5bb022-eb5d-2ed1-2123-eb9e502299dc@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <4b5bb022-eb5d-2ed1-2123-eb9e502299dc@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_035231_287957_2329C121 
X-CRM114-Status: GOOD (  14.65  )
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



On 02/02/2023 12:42, AngeloGioacchino Del Regno wrote:
> Il 02/02/23 11:40, Chen-Yu Tsai ha scritto:
>> When vdosys1 was initially added, it was incorrectly assumed to be
>> compatible with vdosys0, and thus both had the same mt8195-mmsys
>> compatible attached.
>>
>> This has since been corrected in commit b237efd47df7 ("dt-bindings:
>> arm: mediatek: mmsys: change compatible for MT8195") and commit
>> 82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
>> for MT8195"). The device tree needs to be fixed as well, otherwise
>> the vdosys1 block fails to work, and causes its dependent power domain
>> controller to not work either.
>>
>> Change the compatible string of vdosys1 to "mediatek,mt8195-vdosys1".
>> While at it, also add the new "mediatek,mt8195-vdosys0" compatible to
>> vdosys0.
>>
>> Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Arnd, Olof, will you take it directly or shall I provide a pull request once 
-rc1 is out?

Regards,
Matthias

>> ---
>>
>> Since we are at -rc6 and Matthias already sent out pull requests, I've
>> CC-ed soc@ so that this may be picked up directly on top of them. This
>> should be merged for -next.
>>
>> Thanks
>>
> 

