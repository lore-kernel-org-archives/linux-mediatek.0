Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19C2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:33:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B4F61415
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B4F61415
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U/b3szOrDaYFmuFNn0f0+8ZGGLJAvR94K7cWK5O0rzM=; b=V612/IfVofd6dkbPTdz+8V5cp
	1jWz1FBD7AxpZOuorHngfUh1Xk1JWo5A63mXggscWPDZSgCOXGrQYGnaxwdNrWfkcfFo+HQ4wyzEE
	CWeA+A8skkMj+MBa578AwlY0WTpNmpALRotiDulNQwYp7zsQlrjTdst8HWHBko+vqaU3L0260DDru
	bQL9DIjx3f4I4orhmQe487aey1/DD6yvy9lALAbpKpFM83qGem0EmaesSxDxyAQOEREGGLOST5ag2
	RQdFl00O8r7cxfSgwddHxmvB3LuZ5LlIdLY/a3ungA4UurmLL7A9pk9/drgGCcqh3AsOXJz7AJ6BL
	fGrZ0O8dA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhOZq-0074jE-6y; Fri, 14 May 2021 03:33:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOZn-0074ij-Bn; Fri, 14 May 2021 03:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=dikOEtKsjpSnaSM6EeOCvys/XjUwuAHcvPk4ndAPdHw=; b=XeXpvYlOz1/Mykthq7r3feziSf
 0yVua8snzSMTkYXPtUxaAuIi+KwApTMXxB6xoLTLRSmAHHkiMLFxX1LmkQ7L12m9Vi0sf3jzfxIVs
 x26/55F/eehhoAjMwmbLNKdvm+lVncw9F69QHCHf5r052zxmlYtu3r8uDjKRFb/8Q6rPKofh11YIy
 SAklI310+2AM3E9s3rk6Mx5Tu9Wk3ZXnqy0DFXntWCccrnjgWjNa9pJh6udNXA1B1beTtUdLmxRKv
 drIGnuKU7S9G7FuEuHyowQQjwjSzBNPzSMEeRmeTrdZEB0YDrBBuLro3uRmyZXSiXkgirf3iZGwdV
 GNN3M+kA==;
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhOZk-00Bgcd-Fq; Fri, 14 May 2021 03:33:22 +0000
Received: by mail-qk1-x72e.google.com with SMTP id v8so9646642qkv.1;
 Thu, 13 May 2021 20:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dikOEtKsjpSnaSM6EeOCvys/XjUwuAHcvPk4ndAPdHw=;
 b=R8a18YS6HJp3phFIY2QEf9KyEjYwVhdcNOeUaJyfG0KGADoFZ5pz9/xsXV9JlkcuEs
 /Nr0nnynrNh/3r0YE2lk/n1yar78j+m8Z2Fe60fVaF/IL2JasnaR4TpZP7qVqtPyiMD+
 8nMAOWDYFkaIjXgBX5cPZ8IKen5SRatdTarJKG4FSt7C3Q/awJUmaAspZj3d4TfnWkug
 WFvLhAcEgpZsbKJOy2ZwNPmZl+iLnq+IB+jxGYBbqIYRehNUsXBePAuMvu0G7CDGNRow
 0sueRRVqGIZddz3s0UOPYjXcJR29p7CKBdb2rUKNyZ5NB7oEoCyZMF0b2RO/NviwU6AK
 9V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dikOEtKsjpSnaSM6EeOCvys/XjUwuAHcvPk4ndAPdHw=;
 b=IgyHG288ElvTUJPP1ulK23fbvxkC4ncH530SbtbymTa9LU1H1fJDUGL8M0H6126B72
 4TL66c8XPdYE2k48RLv84yCs5n1LHRMQ6hRQq5Mj+KB1RTZXhBggLEEwBAjJGC/2o3wq
 Y5y9AkigiiZ82e+9aru3PQGiB+2PLuh5HSOY3U5qenYwYwTbK9vexEoDgVIBXNQUFXSr
 2vG0LmTZbqvOE71OuEHpD8eA1Wg3Sfn0/AbaKZGcaqgliX8GFVaWgt11fpgILP0KcmJI
 0yK6QKpws6RrR8KwGGeGq8HKZSCqOGd+9FNdGXK12ICfJ6CJKdm4gFnpl7y+6qrdF1Gt
 NUyA==
X-Gm-Message-State: AOAM533UmglsmOxQXkWWIEUu5gmoJdp+tUCFuiuFif+1KiZmDvpVZHhb
 Bn2R16gUEB8o63MybLQZZi+0OFx9niM=
X-Google-Smtp-Source: ABdhPJxKUhy1wkjiDM88Lx/kWnHYTq+k4qyZ1TgnfXEQA/btpVvWYWl1NPYV9wQnb2DoFgGXCNAICg==
X-Received: by 2002:a05:620a:753:: with SMTP id
 i19mr27343988qki.320.1620963199268; 
 Thu, 13 May 2021 20:33:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v22sm3738581qtq.77.2021.05.13.20.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 20:33:18 -0700 (PDT)
To: Roger Lu <roger.lu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen <fan.chen@mediatek.com>,
 HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee <yt.lee@mediatek.com>,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-4-roger.lu@mediatek.com>
 <20210506045115.GA767398@roeck-us.net>
 <7a7a07adedf5d3f430fecf81aed35c6321e5b634.camel@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v16 3/7] soc: mediatek: SVS: introduce MTK SVS engine
Message-ID: <ec5f064f-41f1-f8f9-9a6d-fdf02c43cb8d@roeck-us.net>
Date: Thu, 13 May 2021 20:33:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <7a7a07adedf5d3f430fecf81aed35c6321e5b634.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_203320_568972_9017BA17 
X-CRM114-Status: GOOD (  23.20  )
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

On 5/13/21 8:10 PM, Roger Lu wrote:
> Hi Guenter,
> 
> Sorry for the late reply and thanks for the notice.
> 
> On Wed, 2021-05-05 at 21:51 -0700, Guenter Roeck wrote:
>> On Wed, Apr 28, 2021 at 02:54:36PM +0800, Roger Lu wrote:
>>> The Smart Voltage Scaling(SVS) engine is a piece of hardware
>>> which calculates suitable SVS bank voltages to OPP voltage table.
>>> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
>>> when receiving OPP_EVENT_ADJUST_VOLTAGE.
>>>
>>> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
>>> ---
>>>   drivers/soc/mediatek/Kconfig   |   10 +
>>>   drivers/soc/mediatek/Makefile  |    1 +
>>>   drivers/soc/mediatek/mtk-svs.c | 1723
>>> ++++++++++++++++++++++++++++++++
>>>   3 files changed, 1734 insertions(+)
>>>   create mode 100644 drivers/soc/mediatek/mtk-svs.c
>>>
>>
>> [ ... ]
>>
>>> +
>>> +	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
>>> +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL,
>>> svs_isr,
>>> +					svsp->irqflags, svsp->name,
>>> svsp);
>>
>> 0-day reports:
>>
>> drivers/soc/mediatek/mtk-svs.c:1663:7-32: ERROR:
>> 	Threaded IRQ with no primary handler requested without
>> IRQF_ONESHOT
>>
>> I would be a bit concerned about this. There is no primary (hard)
>> interrupt handler, meaning the hard interrupt may be re-enabled after
>> the default hard interrupt handler runs. This might result in endless
>> interrupts.
> 
> Oh, we add IRQF_ONESHOT in "svs_get_svs_mt8183_platform_data()" for
> threaded irq. So, please kindly let us know if we need to set more
> flags or any other potential risks we should be aware. Thanks in
> advance.
> 

After reviewing the code, I think this was actually a false alarm,
at least if svsp->irqflags always includes IRQF_ONESHOT.
The code is kind of unusual, though. Unless I am missing something,
svsp->irqflags is only set in one place and it is always set
to IRQF_TRIGGER_LOW | IRQF_ONESHOT. If there is a remote chance
that the flag is ever different, it would have been better (and less
confusing) to specify IRQF_ONESHOT directly when requesting the
interrupt (because it is always needed, no matter which SOC).
If the flags are always the same, there is no reason for having
the svsp->irqflags variable in the first place.

Thanks,
Guenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
