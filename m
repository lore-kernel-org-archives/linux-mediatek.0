Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD72C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:14:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABC3230FB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CABC3230FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ue42b3Qq9flirww9DqJjVkcLvS5vbOnbS2qQvw7xqNA=; b=FACWX+djRrBSGeLIZcHMU5+f2
	Uy42UBOyTaQhqQIhk1zgyGxx+54rQMymrfDJ20W4jsu3DMtA4uhVkHqElAyJi5mGUVPjyz6xfWb7N
	ldcJu1ISsV6zUu2932i3iWY7gbNLIRNGqDXcQe91i+13UBv302nyWYMYhyEHb1iUQDfHXHwwecMhF
	f9YSybAdnGH+2Ay+bt5Do56ujDQNfEEVOSedXxgbw7YP73PJuPcFN8SeHu56LTHON2NbI00KslnM6
	zW+nAIEt/NhW1zhAW+QBd+RtYEZmwzBNmZoFWqdlqvhm1F0/PJrgxIgLAw2leDB9ZUNsKs03KjyYZ
	13ANfwJhQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx3xg-00012p-UR; Wed, 06 Jan 2021 08:14:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx3xd-000121-OC
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 08:14:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id g185so1832033wmf.3
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 00:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FfV3hyzCprel4c8D5UUPJuvA+3HUguNV7GDsYJABWM4=;
 b=jiH7vMnyXhGc6f/iiS/rTXx9kzzVUfG/BwTF2CI1kpNGidrfh3UL+Y8rhMAbfplTQ4
 1APk09ZE+FGVcGIKzGDKu5arR1tXi0qsinqrT436gD8iuG88GAuf0vOGzqLlcLeU/Hxw
 iDwYjnzvljeoblw4mZHcHTpcI0/9s46OU0sTNLJUsaYPgg7/d/KYmdqDq5m/0eYfK0KI
 GhZ+FCbYCn2RkIv+77WG/YWJMpfKTB7pr242B/FC0O0x3CnYdJGfCCT2X/Vgk5q3/Tpu
 /KQsVccG1r1Bwbpm0qaI9XgqQQb8XJ9bh+/FOCDyEiOBakkQO98ExTN2EWwr8+RrCt+m
 yPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FfV3hyzCprel4c8D5UUPJuvA+3HUguNV7GDsYJABWM4=;
 b=Qp+0rapr6+L1eiZXaJGBR9Ycz/XAfnOCL7rADPd4XLXORrNIJp8YqaOyUsrZsXb/7g
 yxz4SAzFcZWMUH/e/kcJ/reZ4w9gAugqsOZdA4oUlHy/TmtfcYORv5vNMyp0Nlm0KZjg
 8eipMTe/qhNElTYlORO6hN6e1zNXOvLfXauqkONI4dQqDPkVwIFDqdRMAtlsTD1RdvKJ
 SxB/MWk5WJyh3k0pHa9RBEXDZSM/Pt/5OcNdGqBMFj7x55vTaKFSfKFRbGd+v/yQMADr
 vqk0ZwUE2qm1wOJAz5HAL2apBwBx+mpLUzapk6YkjIUZ2ANwZqvy6ntM2CE/vooncFyh
 1lhQ==
X-Gm-Message-State: AOAM530xAOKum6AlALTa6NUVyBm0X2BkLdKHKWdbFjtI+nufalWP/q7G
 32SWJQcaHd8GySvvdtpSQjyn5A==
X-Google-Smtp-Source: ABdhPJzhtFE3/TrLKMfVx2COu7W0DF0IrzoUUUeya0H2MBGgal7PPIfG0DQ/A6JY9EnA7mGroFIOTQ==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr2639409wmj.168.1609920865385; 
 Wed, 06 Jan 2021 00:14:25 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id j2sm2103092wrh.78.2021.01.06.00.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 00:14:24 -0800 (PST)
To: Henry Chen <henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
 <c8b951b0-6412-d905-99e1-6350283b57c1@linaro.org>
 <1609918232.23066.5.camel@mtksdaap41>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH V6 08/13] interconnect: mediatek: Add interconnect
 provider driver
Message-ID: <a416a55c-0a7e-6505-ef53-b03f5dbc6cdc@linaro.org>
Date: Wed, 6 Jan 2021 10:14:26 +0200
MIME-Version: 1.0
In-Reply-To: <1609918232.23066.5.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_031430_100365_845CE668 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/6/21 09:30, Henry Chen wrote:
> On Mon, 2021-01-04 at 20:36 +0200, Georgi Djakov wrote:
>> On 12/24/20 08:08, Henry Chen wrote:
>>> Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
>>> using the interconnect framework.
>>>
>>>                ICC provider         ICC Nodes
>>>                                 ----          ----
>>>                ---------       |CPU |   |--- |VPU |
>>>       -----   |         |-----  ----    |     ----
>>>      |DRAM |--|DRAM     |       ----    |     ----
>>>      |     |--|scheduler|----- |GPU |   |--- |DISP|
>>>      |     |--|(EMI)    |       ----    |     ----
>>>      |     |--|         |       -----   |     ----
>>>       -----   |         |----- |MMSYS|--|--- |VDEC|
>>>                ---------        -----   |     ----
>>>                  /|\                    |     ----
>>>                   |change DRAM freq     |--- |VENC|
>>>                ----------               |     ----
>>>               |  DVFSR   |              |
>>>               |          |              |     ----
>>>                ----------               |--- |IMG |
>>>                                         |     ----
>>>                                         |     ----
>>>                                         |--- |CAM |
>>>                                               ----
>>>
>>> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
>>> ---
>>>    drivers/interconnect/Kconfig            |   1 +
>>>    drivers/interconnect/Makefile           |   1 +
>>>    drivers/interconnect/mediatek/Kconfig   |  13 ++
>>>    drivers/interconnect/mediatek/Makefile  |   3 +
>>>    drivers/interconnect/mediatek/mtk-emi.c | 330 ++++++++++++++++++++++++++++++++
>>>    5 files changed, 348 insertions(+)
>>>    create mode 100644 drivers/interconnect/mediatek/Kconfig
>>>    create mode 100644 drivers/interconnect/mediatek/Makefile
>>>    create mode 100644 drivers/interconnect/mediatek/mtk-emi.c
>>>
>>> diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
>>> index 5b7204e..e939f5a 100644
>>> --- a/drivers/interconnect/Kconfig
>>> +++ b/drivers/interconnect/Kconfig
>>> @@ -13,5 +13,6 @@ if INTERCONNECT
>>>    
>>>    source "drivers/interconnect/imx/Kconfig"
>>>    source "drivers/interconnect/qcom/Kconfig"
>>> +source "drivers/interconnect/mediatek/Kconfig"
>>
>> Sort alphabetically please.
> Ok
>>
>>>    
>>>    endif
>>> diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
>>> index d203520..0643a24 100644
>>> --- a/drivers/interconnect/Makefile
>>> +++ b/drivers/interconnect/Makefile
>>> @@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
>>>    obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
>>>    obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
>>>    obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
>>> +obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
>>
>> Ditto.
> Ok
>>
>>> diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
>>> new file mode 100644
>>> index 0000000..972d3bb
>>> --- /dev/null
>>> +++ b/drivers/interconnect/mediatek/Kconfig
>>> @@ -0,0 +1,13 @@
>>> +config INTERCONNECT_MTK
>>> +	bool "Mediatek Network-on-Chip interconnect drivers"
>>> +	depends on ARCH_MEDIATEK
>>> +	help
>>> +	  Support for Mediatek's Network-on-Chip interconnect hardware.
>>> +
>>> +config INTERCONNECT_MTK_EMI
>>> +	tristate "Mediatek EMI interconnect driver"
>>> +	depends on INTERCONNECT_MTK
>>> +	depends on (MTK_DVFSRC && OF)
>>
>> Would it be possible to enable COMPILE_TEST?
> Do you means change to "depends on (MTK_DVFSRC && OF) || COMPILE_TEST" ?

Yeah, there is a stub for mtk_dvfsrc_send_request(). Maybe we could even change
it for INTERCONNECT_MTK to something like:
	depends on ARCH_MEDIATEK || COMPILE_TEST
Will this work?

Thanks,
Georgi

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
