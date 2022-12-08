Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E17C63705
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Dec 2022 08:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeN4tbC8QYcjeXtnRCV0L0VBx1w71ZeUSLmAb6QYLH4=; b=fhf5a9KyggCbABpcaZl6PCIYSv
	Q7UU8qEnI0QTK7+3gkGR08RO/44RuUQRqG3xrpvGdhgWADiGuk8vZdOZdXXORKdOKjFRJZZHGIsIv
	fGTMrSjRlUQ2irDUIvDBvjhin/aYjDapGQF3M0BcvUdegB1cjVd0ETO/o8y6nvuTkD0UFM+cW9DUT
	hhG779hVawA9Y1y3vcMSqemwQ9YD8MnLDXKKf/Y8RVY/PXBkwkQNphCuaMLvseHBhuO/QZEbLs06o
	UfeORgqkTXmZKbhKOtGNOTuA+WkOK3cdBAs/P7rWIsbW0Me7M/Vrz+fZjhnp0cOJ+5cV8wBbSa7DK
	u2SqRPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cfc-00APuq-Qf; Thu, 08 Dec 2022 08:54:20 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3CY4-00AHqj-Sj
	for linux-mediatek@lists.infradead.org; Thu, 08 Dec 2022 08:46:34 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bn5so832724ljb.2
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Dec 2022 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeN4tbC8QYcjeXtnRCV0L0VBx1w71ZeUSLmAb6QYLH4=;
        b=qH4NqlWKo3zt47ik7YIU7kmdLYYcvVcO6GSKeDJl6/FJDRKqjaKiZ20t70P3vsf5en
         um9WTdmrMn0KhBo63A72CPiffEesD3chqRklTOKElHTQ4s2trN/3Zm/GF/By4MdxhqXm
         vTax0XL5x02hgxffuacSJPfnFtYy1DvGMzk6aVd3SLy/vM3Z4lW1GnG1m1FEag5ta2Bt
         tN2HRl85CSq/83+XNMmD1hS0qu5Fx0fsLwFanA2YLaQTzAro8a+h4HLCDwuHXsVqFNcQ
         sVBatq/pAHSSUMeH0R140l91GO9ceAMmsmEfvL/YNTrKlK3EX3zbBaPSvJRI4gFdX93x
         Gtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeN4tbC8QYcjeXtnRCV0L0VBx1w71ZeUSLmAb6QYLH4=;
        b=LYAcGDoU9o28UwzIFzymX2pel3NnyMJnO+Y297GJVR5+ZUfawp2G6g5ktiVyitrj8o
         dDAmIBd48n8HI3Vx7tyPjaHBBknWIKfKX13po5Hmb8hHiJEocaHs6D8fK99ndqVWu/Iw
         +YQoPRNIYT+K/pvqJIqjEbcilK003eto+SMCw7eIXLseLneqoHTEQbqApld91qnFcbHh
         7lx99Pl6hJQjN/dbpyZZKUNlbstM63hbAHJMyAT2dwcxClA4XhQWdu34T7bh5FgnLbQX
         Sp3BvkIHfcEojXZ3rEAQdZaJZjz7bH022h/qSL+T/QPK85HJXwij4LTN0veu06C+lJ28
         652A==
X-Gm-Message-State: ANoB5pnPZQ7S5SGHVdymOwrlKB1LB2G+eCu4KeUUpsRv4x2iBlkUx9GW
	Tg62t4gOsfUVRU4ddqn3ByKP7WZtWyLY42/PfWE=
X-Google-Smtp-Source: AA0mqf4oyc9MWULxVZ5mmTZx6NmoFsEfusvnFxRcT6pk965wUtiV7p7TVZN0HGcgHbu3gYT4dV3T2A==
X-Received: by 2002:a05:651c:50f:b0:279:dbb8:4549 with SMTP id o15-20020a05651c050f00b00279dbb84549mr8910987ljp.79.1670489188855;
        Thu, 08 Dec 2022 00:46:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m18-20020a194352000000b004b55ca53543sm2169721lfj.233.2022.12.08.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 00:46:28 -0800 (PST)
Message-ID: <d5f58e82-2644-3e16-f27a-de72ed8ab74d@linaro.org>
Date: Thu, 8 Dec 2022 09:46:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
 <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
 <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
 <b877af37-462e-c923-41c0-09c370062700@collabora.com>
 <97408c484927b6520ec79b23220496d628156e5f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <97408c484927b6520ec79b23220496d628156e5f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_004632_963980_48E20B9C 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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

On 08/12/2022 02:15, Xiangsheng Hou (侯祥胜) wrote:
>>>
>>> There have two rx related timing properties in spi-peripheral-
>>> props.
>>> The rx-sample-delay-ns have been used in Mediatek snfi driver to
>>> adjust
>>> controller sample delay.
>>> However another spi-rx-delay-us is in microseconds. Take 52MHz for
>>> example, the clock cycle will be 19.23ns which lower than 1us. This
>>> may
>>> not easy to by one clock cycle.
>>>
>>
>> I agree, but nothing prevents you from adding your own property for
>> that.
>>
>> I propose "mediatek,rx-latch-latency-ns" or "mediatek,rx-latency-ns", 
>> so that
>> we can specify the delay in nanoseconds: in that case, when we
>> specify 19ns,
>> the driver will safely round that resulting in 52MHz == 19.23ns =>
>> 19ns valid.
> 
> Will be fixed in next series.

I am fine with this approach, but after explanations I was also fine
with clock cycles as unit. It's still quite specific unit and I think
several timings on buses are clock-cycle dependent, not time dependent.

Best regards,
Krzysztof


