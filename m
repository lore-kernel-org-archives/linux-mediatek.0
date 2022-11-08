Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65FCC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 18:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3hp60uFt/XqpVFEQ8lHI7m/IKYo89nJRwN7r0UdODk=; b=AndpLXuo5j9hs5
	2vJKk8AawJb64GUUEwYa1rp0PiRP5MybROKO9te2lraoy2jocZHOUTAfuBDzEFeGVGbX6mvpVZTjh
	AonCHUFYzrcqgGtk8UeLG6I8/pmEsS/GUQjF8JBsHptxukz3PCMiKNSPA8IVH4SKUrjbeQtp+YtoT
	+JXRkbCt3iEgM4pD8YkqxCVRH/hocdVDg2JvRCvmIpJAg+7cMHIUFbOP5tmalemQA9WPygBOiRCtC
	jhhqrExcssr3ISTBlod9aqid8IC1ONlJg0a/3gBEOeG4XqEi+X1OWGwvBEDROvHuwNuYtB175l730
	v8hU0GTo3XPPXYv4f++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTQK-007VpH-La; Tue, 08 Nov 2022 18:34:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osTQI-007Vnz-JQ; Tue, 08 Nov 2022 18:34:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id ja4-20020a05600c556400b003cf6e77f89cso1517012wmb.0;
        Tue, 08 Nov 2022 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3hp60uFt/XqpVFEQ8lHI7m/IKYo89nJRwN7r0UdODk=;
        b=FWfcRwAi66FGV4e2iOt3H5FG3JyY+JjnjgZF3gp1H2j6IENJmOaR4IR1a2LnfNOOWg
         jXAcNhjSFRQ1l2/nqCBJ29Mc2GYr42SFPdNZteh/A0ZdugEUTkrRffJDnXdXyF7rxwEn
         seCbGlr0lijKPcyGQUieC9RPSUzfXOKaeVpf1ypcWLh6kN+TX/GtP66BaFp1JpY7iH4Q
         tAgugbvaQ2Ww1wqAVkdJ8PoL58j9goTV4PI2SGQQf/LEHpkA1joORsX8yy8SHJ0jwbt4
         qxN8Tn8krmcKMftXKG+if3+XwqnRwxM171sEi1Eh+JEFfgU2h2ImNO6q3aTRKrvbTJiu
         wL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/3hp60uFt/XqpVFEQ8lHI7m/IKYo89nJRwN7r0UdODk=;
        b=NkwAdHImLbTOlQnRKVH9ErF2skP4wAUkBrhQbKDrzvLdmnVVHSwJ89E6AIkekGptIR
         uwDsV564iG//5QdhnjYQU797cHghrr0gxX1mNvYYdjojl4hKLWlP2vAl/DQXKL7Zv3ND
         U1jM/cbOk2nezXg+FXg7MifTp+1FIjB/peUwDefPObCFVfpV+sKwzPSb46o9cCX7upaS
         31QuqnQkIeRXcJHmnPy3jIW5CQT406tqb27eh4Gby9COZeOadEVVqBv4EYj/0FpVG/QX
         SJC/BODEFPvK//tbzl14GZdY/arX58RDQwoh0BzQdKC1kCcRtSV3gJSh2vUGfQRoGrTt
         4/bA==
X-Gm-Message-State: ANoB5pmyU7oz4emNKv9LeNAO6va1Z6m72u9HKPNXjl7K920ypQpE1ins
	jQyNYkz3qSd3MN2l7+98ThE=
X-Google-Smtp-Source: AA0mqf52uXRHtcat6g1cDBSffb9BHvne26T0RWlXx66e8mwsVjfpxFljibCX+5KvBvD4EFtE+RGBjA==
X-Received: by 2002:a05:600c:3ba6:b0:3cf:acc5:f7bd with SMTP id n38-20020a05600c3ba600b003cfacc5f7bdmr7511958wms.125.1667932449118;
        Tue, 08 Nov 2022 10:34:09 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d6a4c000000b00228692033dcsm11124391wrw.91.2022.11.08.10.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:34:08 -0800 (PST)
Message-ID: <142fe940-6fcf-4eaa-2cb6-94df541723c3@gmail.com>
Date: Tue, 8 Nov 2022 19:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 0/6] Add mmc-support for mt7986
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>, Frank Wunderlich <linux@fw-web.de>
References: <20221025132953.81286-1-linux@fw-web.de>
 <CAPDyKFriLmsSsy5LfiJJH-s7uQMD1AycE7R4NtN1_Td3XocyOQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAPDyKFriLmsSsy5LfiJJH-s7uQMD1AycE7R4NtN1_Td3XocyOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_103410_679154_DFB82DF1 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 26/10/2022 13:25, Ulf Hansson wrote:
> On Tue, 25 Oct 2022 at 15:29, Frank Wunderlich <linux@fw-web.de> wrote:
>>
>> From: Frank Wunderlich <frank-w@public-files.de>
>>
>> I've noticed the mtk-sd binding needs a bit more work get into a more
>> clean state.
>>
>> There are 2 properties missing that maybe need to be added later or
>> dropped from devicetrees:
>> drv-type (which is used in mt8183-kukui.dtsi and set to <2>)
>> and
>> r_smpl (used in mt7622-rfb1.dts and mt7622-bananapi-bpi-r64.dts, both
>> times set to <1>)
>>
>> i don't know their function and boundaries and i do not find them in
>> driver. I guess they are added by accident, so i removing them in the
>> patches 5+6.
>>
>> v2:
>> - add compatible based binding
>> v3:
>> - solve "not" statement in binding and reorder if statements,drop mt8183
>> - added patches removing invalid properties (not in driver)
>> v4:
>> - squashed part 1 (compatible) and 3 (SoC specific clock config)
>> - new mt7986 clock bindings based on info from mtk
>> - re-add mt8183 reg boundary
>> v5:
>> - add fixes-tags to Patches 4+5 and reviewed-by to 6
>> - drop quotes from mt7986 clock-names from patch 2
>>
>> Frank Wunderlich (3):
>>    arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
>>    arm64: dts: mt8183: drop drv-type from mmc-node
>>    arm64: dts: mt7622: drop r_smpl property from mmc node
>>
>> Nícolas F. R. A. Prado (1):
>>    dt-bindings: mmc: mtk-sd: Set clocks based on compatible
>>
>> Sam Shih (2):
>>    dt-bindings: mmc: Add support for Mediatek MT7986
>>    mmc: mediatek: add support for MT7986 SoC
>>
>>   .../devicetree/bindings/mmc/mtk-sd.yaml       | 149 ++++++++++++++----
>>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +-
>>   .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   1 -
>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   1 -
>>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   1 -
>>   drivers/mmc/host/mtk-sd.c                     |  14 ++
>>   6 files changed, 136 insertions(+), 36 deletions(-)
> 
> I have dropped the earlier two patches I have applied for MT7986 and
> applied patch1, 2 and 6 from this series instead, thanks!
> 

3, 4, 5 applied now thanks!

