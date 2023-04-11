Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04182C77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3T3CK8z1gSm+4HGK1PzRxR+6buBvDUtDkUZmQKnyFM=; b=ql2WstGUXWov994l7WzJ+5/FsH
	dvUXCHIPfNiBlhgsqCdMhT1CgrXOzZyXzmjDRjTD3FGPTPjXwe77NEXPQOb+sJOWw4Gip0WkKm6Ih
	W36pUrvEyX6MEuWqZ37V1n1KgTwoY+kwNg3eF1GIjji6S+7ls59lK+vVUFG4YTYge8x8Sx0ox7L+L
	WbOaCXf8pxTHY0FIzVl0oOF+QEkn/K4o+vBWB05pORp6xndzKZU4q9POvY6HpqTjFq7/iqAMaMBFA
	yYH5vgJwQ8Le97mE6bBA+/RaDrC+hu3QsqKdm+e/QTO7FYvhwSmuIRdgStv8b38KfiYMZGRyoM1bC
	jus0Ob5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHAU-000bnS-1d;
	Tue, 11 Apr 2023 16:48:30 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmHAP-000ble-2e;
	Tue, 11 Apr 2023 16:48:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so4671333wms.1;
        Tue, 11 Apr 2023 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681231701;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r3T3CK8z1gSm+4HGK1PzRxR+6buBvDUtDkUZmQKnyFM=;
        b=mktPsWYrrZvIU4fdI63FAzf6dQcaDrfAr+P7aFKFjNSV2TDLbVt0A8mwT+tpHXlRrD
         OOVn9Hh0MbxuC1LMGK5r4+Ris5mA1i09alBb2Jx22jJbH5L0hXHPEppSlTitlvqq8U+d
         5lCaE9fjWKWwL4ctcgdfMHEWw55LtBG+d9kS6NVmPqkGdv0dwKyAK+VEj0LbmwAzx1x5
         h9VwhbyMahsraUSu9ca/wdFGG6Aklb0W0qUUgj41Begsv2TVWr4QEU2D741H9qPawAGW
         yk9+yxq6lKKvimQk9vpgoGB3CF8kqIRWlkOKkiDkyDJ7evtj28FePQ8jgr7HEEr/se6b
         f+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681231701;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r3T3CK8z1gSm+4HGK1PzRxR+6buBvDUtDkUZmQKnyFM=;
        b=DHKIuOWn47nXLfkPp1y/i/UmLDRAwyWxIxbG+8O/eELr50+eFNqMET0NZZl/w7kw/6
         DWZgVdlaMc2VnfPDxBuBOki31cbkn4eoEpP3Ag01ONcugKEV4brvjx1sey6Ckq3I0mD9
         bInMHixGW0O7gezq+UaUtbl/rTFTDyxJPLL01MWravhEGcVlU6A/0NNqX6ILx07Ep1P5
         fXi/mpqREk7HI4g0SbR1flGBivx41R1BL7beRvIrWC/OyyNWan8jMWZJVjuWG+tKOwle
         dtcJJxkvlmgBnQthJdtbCGWqe37UzVLe8igJ8udpUfVob/pSe54uXbjXzuwK2RlQOgSV
         DZJg==
X-Gm-Message-State: AAQBX9dLvRJSvuqK9oFil4eXk20LWLulrkkfuIh+5Bqjh90LzGR8CvTT
	78KOwUuP7WISdbDurF+V4P8=
X-Google-Smtp-Source: AKy350Y2yZpAd514faF3XI3M3XvQ4Yl5IXK41ZAw+7JnjYoxs1bbgfbAxZW92JA+pZAICcdFRpzeKQ==
X-Received: by 2002:a1c:7c03:0:b0:3ef:5940:5f45 with SMTP id x3-20020a1c7c03000000b003ef59405f45mr9592921wmc.23.1681231701369;
        Tue, 11 Apr 2023 09:48:21 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c4f5300b003f07eca7af2sm13738678wmq.40.2023.04.11.09.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 09:48:20 -0700 (PDT)
Message-ID: <6cd3294d-787f-0fba-9e75-157aa610356b@gmail.com>
Date: Tue, 11 Apr 2023 18:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 00/17] MT6795 Helio X10 and Sony Xperia M5: DT step 2!
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
 houlong.wei@mediatek.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
 <77528d8d-29f3-9bae-33f3-3296c9c8b0b1@gmail.com>
In-Reply-To: <77528d8d-29f3-9bae-33f3-3296c9c8b0b1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_094825_859589_D9DF90BC 
X-CRM114-Status: GOOD (  20.16  )
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



On 02/04/2023 19:26, Matthias Brugger wrote:
> 
> 
> On 27/03/2023 10:36, AngeloGioacchino Del Regno wrote:
>> Changes in v2:
>>   - Squashed the addition of mediatek,mt6795-gce.h header with the
>>     commit adding the MT6795 GCE compatible.
>>
>> This series further enhances the support for the MT6795 Helio X10 SoC
>> and the Sony Xperia M5 smartphone.
>>
>> In particular, for the SoC support, this adds:
>>   - Frequency Hopping support
>>   - I2C controllers
>>   - Power domains
>>   - IOMMU support and LARBs
>>   - GCE/CMDQ Mailbox
>>   - VDECSYS and VENCSYS clocks
>>   - MMSYS support
>>
>> ...and, on the Xperia M5 smartphone, this adds:
>>   - Frequency Hopping with Spread Spectrum for MAINPLL, MPLL, MSDCPLL
>>   - Touchscreen support (Synaptics S2726, fw id: 1898977, RMI4 protocol)
>>   - Accelerometer
>>   - Magnetometer
>>   - Proximity sensor
>>   - NFC support
>>
>> ...all of which was successfully tested on the Xperia M5 smartphone.
>>
>> This series depends on [1] for the MMSYS support.
>>
>> Plan for step 3 is to push upstream full display support, which does
>> already work on my custom tree ;-)
>>
>> [1]: 
>> https://lore.kernel.org/all/20230309102618.114157-1-angelogioacchino.delregno@collabora.com/
>>
>> Cheers!
>>
> 
> Applied all but:
> 4/17 dt-binding already applied
> 7/17 dt-binding not applied
> 8/17 we are missing the dt binding
> 

I dropped the following patches for now:
09/17 and 11/17 due to missing 07/17 this break creation of DTBs.

I also dopped 14/17 and 15/17 as buidling the DTBs gave the following warning:
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts:104.21-109.4: Warning 
(unit_address_format): /soc/i2c@11010000/accelerometer@0x10: unit name should 
not have leading "0x"
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts:111.20-114.4: Warning 
(unit_address_format): /soc/i2c@11010000/magnetometer@0x12: unit name should not 
have leading "0x"
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts:104.21-109.4: Warning 
(i2c_bus_reg): /soc/i2c@11010000/accelerometer@0x10: I2C bus unit address format 
error, expected "10"
arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts:111.20-114.4: Warning 
(i2c_bus_reg): /soc/i2c@11010000/magnetometer@0x12: I2C bus unit address format 
error, expected "12"

Regards,
Matthias

> Thanks a lot for the great work
> Matthias
> 
>> AngeloGioacchino Del Regno (17):
>>    arm64: dts: mediatek: mt6795: Add Frequency Hopping Controller node
>>    arm64: dts: mediatek: mt6795: Add apmixedsys syscon node
>>    arm64: dts: mediatek: mt6795: xperia-m5: Enable Frequency Hopping
>>    dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
>>    arm64: dts: mediatek: mt6795: Add nodes for I2C controllers
>>    arm64: dts: mediatek: mt6795: Add SoC power domains
>>    dt-bindings: mailbox: mediatek,gce-mailbox: Add support for MT6795
>>    arm64: dts: mediatek: mt6795: Add support for the CMDQ/GCE mailbox
>>    arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
>>    arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
>>    arm64: dts: mediatek: mt6795: Add support for IOMMU and LARBs
>>    arm64: dts: mediatek: mt6795-xperia-m5: Enable I2C 0-3 busses
>>    arm64: dts: mediatek: mt6795-xperia-m5: Add Synaptics RMI4 Touchscreen
>>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMA255 Accelerometer
>>    arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
>>    arm64: dts: mediatek: mt6795-xperia-m5: Add Sensortek STK3310
>>      Proximity
>>    arm64: dts: mediatek: mt6795-xperia-m5: Add NXP PN547 NFC on I2C3
>>
>>   .../devicetree/bindings/i2c/i2c-mt65xx.yaml   |   4 +
>>   .../mailbox/mediatek,gce-mailbox.yaml         |  20 +-
>>   .../dts/mediatek/mt6795-sony-xperia-m5.dts    | 166 ++++++++++++
>>   arch/arm64/boot/dts/mediatek/mt6795.dtsi      | 245 ++++++++++++++++++
>>   include/dt-bindings/gce/mediatek,mt6795-gce.h | 123 +++++++++
>>   5 files changed, 550 insertions(+), 8 deletions(-)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt6795-gce.h
>>

