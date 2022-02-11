Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C61C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 11:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oD2YRNAxwKaqgVaOYUj1pfxyij01LdPOb4J+4vUVHY4=; b=HlTYFpfK0j1uLu
	r2KWUTVvgwaAxkwLA3HXZRNUS39H+T6nESi6xARPyEUveKegWZuXtevj7Pl5CKj10qpPX20OOI7/p
	EcRDW1OuboYZaL6NCP1dywbp3MTuOTWVvOCK8jA/8Cbl81zWp8MCb0hctjtMPbezYwrSGLfrlma6x
	fzV4W5UTyQTl2MSIxgTpob0kZlq9aaYlSJ87mwycXbrdURLmfjbI2tPnIoOeWj3vvLaAlP+jPsRqw
	JV8n7EjFmPLO5EbHsCN/Dk13OSafKmd+EmG1vPK+DMyREIMNDqj278JTMZ2gkbhSZMoImQypcv+b6
	hJYrriWsqk2OAbXyNe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIURo-006xkY-AV; Fri, 11 Feb 2022 11:50:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIURT-006xZ5-6P; Fri, 11 Feb 2022 11:50:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B04DC1F46D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644580219;
 bh=YoiosXYfuzCdv75Q/QHeODvcQlcGqCPnisvrlLqIWlM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GTLGC4aXdUu/HNLbQWFHvoE4iM7hofN1vXc9X7vuswhNjFoA+7s1JE0VPabZpHjKP
 ur3PKD8vtNTjtm7+H3MVyS858xTgldAxBwrE+uHqul1zODaxn3Lkrw2CGShpwj4ryb
 EH6J9xrmZtiwuTwsfrnnplzsFTcFjpZhwhi0dVd02QBipVGO34lu7IPM9ZlOy6HaX5
 6eWapx+KB+Av1nl1wFLUB2NPltshUp2Bt+OgAMBY7OJKhxZueS+0DH7kF06nQTv4vf
 tMFBi/tYTl302CE/ne7Nerj49cWLDBCnexztlPIHPbRx9q1ZTcSHlYNQwopgA9RyBa
 m1zKHA0aUmgzg==
Message-ID: <e7cbca18-a343-4058-6a1e-1e6bfb167bd9@collabora.com>
Date: Fri, 11 Feb 2022 12:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11,PATCH 04/19] soc: mediatek: add driver for dvfsrc support
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao
 <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-5-dawei.chien@mediatek.com>
 <3d1ba05d-0013-a9ac-1fe1-1d60e510c574@collabora.com>
 <3d30fe7f61b558d3c2c8214e0e936903657f8231.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <3d30fe7f61b558d3c2c8214e0e936903657f8231.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_035023_596636_07265988 
X-CRM114-Status: GOOD (  22.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/02/22 04:51, Dawei Chien ha scritto:
> On Thu, 2022-02-03 at 16:04 +0100, AngeloGioacchino Del Regno wrote:
>> Il 12/08/21 10:58, Dawei Chien ha scritto:
>>> From: Henry Chen <henryc.chen@mediatek.com>
>>>
>>> Add dvfsrc driver for MT6873/MT8183/MT8192
>>>
>>> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
>>> Signed-off-by: Dawei Chien <dawei.chien@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/Kconfig            |  11 +
>>>    drivers/soc/mediatek/Makefile           |   1 +
>>>    drivers/soc/mediatek/mtk-dvfsrc.c       | 421
>>> ++++++++++++++++++++++++++++++++
>>>    include/linux/soc/mediatek/mtk_dvfsrc.h |  35 +++
>>>    4 files changed, 468 insertions(+)
>>>    create mode 100644 drivers/soc/mediatek/mtk-dvfsrc.c
>>>    create mode 100644 include/linux/soc/mediatek/mtk_dvfsrc.h
>>>

..snip..

>>> diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c
>>> b/drivers/soc/mediatek/mtk-dvfsrc.c
>>> new file mode 100644
>>> index 000000000000..6ef167cf55bd
>>> --- /dev/null
>>> +++ b/drivers/soc/mediatek/mtk-dvfsrc.c

..snip..

>>> +static int mtk_dvfsrc_probe(struct platform_device *pdev)
>>> +{
>>> +	struct arm_smccc_res ares;
>>> +	struct resource *res;
>>> +	struct mtk_dvfsrc *dvfsrc;
>>> +	int ret;
>>> +
>>> +	dvfsrc = devm_kzalloc(&pdev->dev, sizeof(*dvfsrc), GFP_KERNEL);
>>> +	if (!dvfsrc)
>>> +		return -ENOMEM;
>>> +
>>> +	dvfsrc->dvd = of_device_get_match_data(&pdev->dev);
>>> +	dvfsrc->dev = &pdev->dev;
>>> +
>>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +	dvfsrc->regs = devm_ioremap_resource(&pdev->dev, res);
>>> +	if (IS_ERR(dvfsrc->regs))
>>> +		return PTR_ERR(dvfsrc->regs);
>>> +
>>> +	spin_lock_init(&dvfsrc->req_lock);
>>> +	mutex_init(&dvfsrc->pstate_lock);
>>> +
>>> +	arm_smccc_smc(MTK_SIP_VCOREFS_CONTROL, MTK_SIP_DVFSRC_INIT, 0,
>>> 0, 0,
>>> +		0, 0, 0, &ares);
>>> +
>>> +	if (!ares.a0) {
>>> +		dvfsrc->dram_type = ares.a1;
>>> +		dev_info(dvfsrc->dev, "dram_type: %d\n", dvfsrc-
>>>> dram_type);
>>> +	} else {
>>> +		dev_err(dvfsrc->dev, "init fails: %lu\n", ares.a0);
>>> +		return ares.a0;
>>> +	}
>>> +
>>> +	dvfsrc->curr_opps = &dvfsrc->dvd->opps_desc[dvfsrc->dram_type];
>>> +	platform_set_drvdata(pdev, dvfsrc);
>>> +
>>> +	dvfsrc->regulator = platform_device_register_data(dvfsrc->dev,
>>> +			"mtk-dvfsrc-regulator", -1, NULL, 0);
>>
>> Why are you registering platform devices like this?
>>
>> Please use device-tree instead.
>>
> 
> Thank you for advisement. Let me just describe history.
> 
> Actually, we did use device-tree to probe interconnect/regulator driver
> in v4, and reviewer had some advisement
> 
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1584092066-24425-12-git-send-email-henryc.chen@mediatek.com/#23243049
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1584092066-24425-9-git-send-email-henryc.chen@mediatek.com/#23236945
> 
> so we refer to this driver to use platform_device_register_data after
> v5.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/soc/qcom/smd-rpm.c?h=next-20220209#n213
> 
> Would you kindly give your advisement, thank you.
> 

Hello Dawei,
I was under the impression that the regulator and EMI were different hardware,
while effectively they are inside of the DVFS Resource Collector IP, and the
registers look like being a bit mixed up, so it's impossible to actually
specify a relative iospace for the regulator, or for the EMI.

In this case, from what I understand right now, the emi and regulator are not
different hardware, but "features of" the DVFS Resource Collector.

I've done some research around the kernel and, effectively, the only way that
makes sense, is to register the feature-drivers (emi/vreg) with
platform_device_register_data(), as per your current approach, even though I
have a hunch that it will look a bit confusing in device-tree, as you'd be using
the same node for both regulator and interconnects...

I would exclude doing it as a MFD driver, as I don't see any very clean way to
actually implement that.

At this point, let's just keep it as it is, or this would probably get a lot
overcomplicated for no good reasons.
So, please ignore the device-tree suggestion and go on with the other suggested
fixes for this driver.

Looking forward to see your v4!

Kind regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
