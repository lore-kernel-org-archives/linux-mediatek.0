Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB60C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 10:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyZcoTjyMEtcZwV3/B5W+C8C7NFVH52CzyEkKb2OUx8=; b=MXaf9oEHQOb5DjFXKPbcNWoNNK
	y6LZzJZ7St+khp3AqS19xbfGpwSmI+nvuweXkA3wDt1yJsv2YSmEFdn2HJBs0HIgGYkOzBLNVORTh
	0e/tkJCJhKACfgo1oRS9zBWxspVtRgW9Kal2XtFazpAnVGBQos720yAua0hFc7cC2TxHYpyaklwr6
	pZzwF7yQ3rQlDDur4XwfTLJLcv5JkrytyxdJoK3gUwP3S9qQAJ3xxR6+B/3iPhgzAn+b949QL1fzo
	f7s3nwCJTqFdv8eK+JntyOq4v35yqNNfEL2txq9ZJ1AMNIyPXafnA8yghQ1ptOS/cqN2tf3SslaGf
	1TyLyNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAWM-00C8L4-Qv; Thu, 25 Aug 2022 10:55:34 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRAWB-00C8A8-FF; Thu, 25 Aug 2022 10:55:24 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e20so23591866wri.13;
        Thu, 25 Aug 2022 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=oyZcoTjyMEtcZwV3/B5W+C8C7NFVH52CzyEkKb2OUx8=;
        b=HyQhg4wiLRifkwd4Ez1urfVRyWOqbp8ET3k+QElmPkt7sCxV5boK9k2iU13762E8+e
         zdoCcBKNoJDiwmfqijDkGwjilQgzui09HRSUDb2C6eBsW8rg90iJw9cxa8YPBWiB34xT
         2KhyRqE4JisnQhAJSiPyRjxwDaABHbBFSVLlj5TwCroYRaFanXzRqwqr2DdINe/Z0M3a
         i7lGePKh32lclpl2LYBg7h5MIKhH/zAfWTBqmcebxrYiO+ncf3owoh4dECebwosQXDCF
         jJYG1gtp9Ve/nQHVyqPPC2QM0oOsl41xu/nCEKHJluDdILGBvf8H4bAM9WzMhU09Uvxp
         genQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=oyZcoTjyMEtcZwV3/B5W+C8C7NFVH52CzyEkKb2OUx8=;
        b=3LTm/H92i+om2xxRv54GoxXWHnPUZZKZqZ7dk7DKhSOiyoW7C9KzyB9jawwg/onSaO
         Y0lyz1dfKfu+Of0QUkDu8j3y0BGq2m0ihq5TkzBT5QipHY69jfh45Um//hat9SagSTY+
         6PoK2BS86OptLArMJaP3msTrXJDP+qsOsF6Eei/RuocBFLva7mLos4cJMWW+Gzc0joVR
         aBjgvdjCxEzfOzou6AU0A+M3hnwu8uK3mcGeHr4wFU5Ni/E5lywje5QXFKKNaz7fApcR
         qAVlCBZSlXx1UIqBjnUK7mEwyDD7YYRBzaVy4sx0ejOJbSPvZ0yjAgMIX04gqC42h8r2
         LESA==
X-Gm-Message-State: ACgBeo31hUULPaa4qS/jNggZNvo2SB2HxCEVjKMbM6HQFGyaiNciPc7A
	xYZhZGlKSoRm3gPSMiXFFJg=
X-Google-Smtp-Source: AA6agR5MIH97H7VnI/JMrU8PJjngbC1n3DjQcGnGPLXQLX5ZM2HtkMsxgBi+UZuCs5VUBb+oKGw8EQ==
X-Received: by 2002:a5d:5a83:0:b0:225:62e3:9d38 with SMTP id bp3-20020a5d5a83000000b0022562e39d38mr1924361wrb.37.1661424920903;
        Thu, 25 Aug 2022 03:55:20 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d568e000000b0021e4829d359sm19068761wrv.39.2022.08.25.03.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 03:55:19 -0700 (PDT)
Message-ID: <f7ec45b8-ccd7-4776-0524-269e3188883d@gmail.com>
Date: Thu, 25 Aug 2022 12:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: change compatible for
 MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "hsinyi@google.com" <hsinyi@google.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220825055658.12429-1-rex-bc.chen@mediatek.com>
 <3ff08ae9-a4b6-2b74-23cb-69ea1d7e1033@linaro.org>
 <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <d5a00dc88bed1680caa8af895a1140324b9d079e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_035523_565329_2F5F310D 
X-CRM114-Status: GOOD (  20.69  )
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



On 25/08/2022 08:59, Bo-Chen Chen wrote:
> On Thu, 2022-08-25 at 14:11 +0800, Krzysztof Kozlowski wrote:
>> On 25/08/2022 08:56, Bo-Chen Chen wrote:
>>> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>>>
>>> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
>>> pipelines binding to 1 mmsys with the same power domain, the same
>>> clock driver and the same mediatek-drm driver.
>>>
>>> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>>> to
>>> 2 different power domains, different clock drivers and different
>>> mediatek-drm drivers.

drop clock driver example here.

>>
>> I don't see binding to different clock drivers and anyway that's not
>> really an argument here. Please focus in description on hardware
>> properties, IOW, are devices compatible or different. What is the
>> incompatible difference between VDOSYS0 and 1?
>>
>> Best regards,
>> Krzysztof
> 
> Hello Krzysztof,
> 
> Thanks for yor review.
> 
>  From the functions perspective:
> 
> Hardware pipeline of VDOSYS0 has these components: COLOR, CCORR, AAL,
> GAMMA, DITHER.
> They are related to PQ (Picture Quality) functions and they makes
> VDOSYS0 supports PQ function while they are not including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component).
> It makes VDOSYS1 supports the HDR function while it's not including in
> VDOSYS0.
> 

Please include a description of this in the commit message.

> About mediatek ETHDR, you can refer to this series:
> 
> https://lore.kernel.org/all/20220819061456.8042-2-nancy.lin@mediatek.com/
> 
> To summary:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Is this description ok for you?
> If it is ok, I will put them into commit message in next version.
> 
> BRs,
> Bo-Chen
> 

