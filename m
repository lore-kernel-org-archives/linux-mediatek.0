Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C2BC47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:01:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6010561181
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6010561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jQiuzOA7922Nm2Up/OSfbWgwPZhRDSIwomkcuqh8aj0=; b=JTCTOUiE0TUcMifOqhzxbdzqas
	0FxbtMV7+DK9W4RyD9Ce3nzsV2s/TgtAeu5yAL+6AedfGBjmZ7zGb8Re7UU4VelMvmzrpJFYDZxUu
	XsuHzIbogAMm7w3F+R6CIwfde6dDr2/DJdRyfYfHNmFGbVQXLXSp8y+L44TkAeVvj9lCDzxI4lgcp
	cb464/WFZfWtdRK79XLpK1tB4ZnGoaSwPzCflAKVeO+X5vXo4sBUOMQyuaUG3zUZyUnKLarg2yO5H
	Th+DR+9YnixrVP3zMIIhsoO3/Lx3fIFNZWEn05zzWz+8JoPbCIJc12A4kULV8bCgEnmOelVYXQJm0
	Cjmv9qDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqu5S-00CXIX-KK; Wed, 09 Jun 2021 09:01:22 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtHU-00CIR8-8P; Wed, 09 Jun 2021 08:09:45 +0000
Received: by mail-wm1-f49.google.com with SMTP id f17so3434028wmf.2;
 Wed, 09 Jun 2021 01:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VgaMltfJo1z7GEQx4rEQbem+9M1sDH5NvdC/cDT43co=;
 b=K38NCOYzmomRJ7HWWg92jzk6WciNFspksJN9K+aaghil/1BPZ56e2OEPgPC/KwR+xx
 BYPEkKu1yoAHFE83Wm70y+wV7xZAPbxxxZahvpqZwqB2lnJQVbzj9AJhP0PHD6Rv/Lm6
 5sTL+YZAvkA1npgMW2b8D19Ld7BcREAG4q8crlscPMHV1B2QTzR3nKUp3iUpsRhHOS1b
 O82AfCmcAM8am9kqWuTwwMug3a4ujAfFw+5Lv/UHECP62uteXLHh5Dn9neuUQjqUVwf5
 oHl5bLlt7/yKLmjeTioQn5/lOLL5D5aTTSWnUCbwrQ5NKEeJDbi7iJNT8MIx7y1x/WaS
 zyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VgaMltfJo1z7GEQx4rEQbem+9M1sDH5NvdC/cDT43co=;
 b=jvGZKpQmbvr+Ea42ZkWI6bCzEbun2rHNufNVMnNb3VtW2sXT98e0TWy7OzJ6U4noeL
 aT8gLZHgtlbHR+d0IvjcZKk3V2HSLZ2gCDWq6FdmaWG4l4Qhzf7IRyuGTBaVXEz5aMWb
 QVgIDayySmB3LdEaSJy4EN8uSAzR0skDFBqfjo6hNU2FHKeZpEDn7eAuKU1T9THKHX+k
 MePilC2s6l3cLOMOFpONsr814XBPIXPKMEYuGqaeryA1OruIA9SkEf5w4IMEPdG/SUkX
 UOhwuweiJMyn6B5eawq6MCVTgpAhHmesuQY21//Igv4iwjq+hGxesE67OyFuev8TKCX2
 EyBg==
X-Gm-Message-State: AOAM532WBgXT8d3wj04Q0jdS1Uul1jdiFnUNs+K1mIJ+O9H/yET4H7XG
 w7BRG7jWPG5J7+01zX9f+/4=
X-Google-Smtp-Source: ABdhPJwP8qnw2dQb0Xb9SRf3aYteDR/JAE2GjpZniv4ftFR/DjNOBtVPcBQB441WfOAoZNSbCiKllg==
X-Received: by 2002:a1c:4d09:: with SMTP id o9mr26874571wmh.149.1623226122425; 
 Wed, 09 Jun 2021 01:08:42 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id f14sm4257008wri.16.2021.06.09.01.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:08:41 -0700 (PDT)
Subject: Re: [PATCH v9 18/22] clk: mediatek: Add MT8192 mmsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-19-chun-jie.chen@mediatek.com>
 <7520a10b-b362-03d4-e41b-e2098ae26621@gmail.com>
 <ef9441888d4ca82d79295106548dd3d463c9c8bc.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b7a1c230-3f09-d9be-1138-3a5fa87600e7@gmail.com>
Date: Wed, 9 Jun 2021 10:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ef9441888d4ca82d79295106548dd3d463c9c8bc.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_010944_357963_21873D35 
X-CRM114-Status: GOOD (  25.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Jie,

On 09/06/2021 00:38, Chun-Jie Chen wrote:
> On Tue, 2021-06-08 at 16:44 +0200, Matthias Brugger wrote:
>>
>> On 24/05/2021 14:20, Chun-Jie Chen wrote:
>>> Add MT8192 mmsys clock provider
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
>>> ---
>>>  drivers/clk/mediatek/Kconfig         |   6 ++
>>>  drivers/clk/mediatek/Makefile        |   1 +
>>>  drivers/clk/mediatek/clk-mt8192-mm.c | 108
>>> +++++++++++++++++++++++++++
>>>  3 files changed, 115 insertions(+)
>>>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
>>>
>>
>> [...]
>>> +
>>> +static int clk_mt8192_mm_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev = &pdev->dev;
>>> +	struct device_node *node = dev->parent->of_node;
>>> +	struct clk_onecell_data *clk_data;
>>> +	int r;
>>> +
>>> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
>>> +	if (!clk_data)
>>> +		return -ENOMEM;
>>> +
>>> +	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
>>> clk_data);
>>> +	if (r)
>>> +		return r;
>>> +
>>> +	return of_clk_add_provider(node, of_clk_src_onecell_get,
>>> clk_data);
>>> +}
>>> +
>>> +static struct platform_driver clk_mt8192_mm_drv = {
>>> +	.probe = clk_mt8192_mm_probe,
>>> +	.driver = {
>>> +		.name = "clk-mt8192-mm",
>>> +	},
>>> +};
>>
>> Did you had a look at drivers/soc/mediatek/mtk-mmsys.c? How is the
>> MMSYS
>> different from all the other SoCs? I suppose it is not. Please don't
>> just
>> implement the clock drivers, but check in existing code how they play
>> together
>> with the HW they are for. MediaTek unfortunately has the design to
>> add the clock
>> registers in the address space of the IP block that needs this
>> registers. Which
>> makes it more complicated to implement clock driver in the first
>> place.
>>
>> Regards,
>> Matthias
> 
> Did you means binding the mm clock driver by creating a platform device
> in drivers/soc/mediatek/mtk-mmsys.c? There is 8192 mmsys compatible
> data in patch [1] but lack of it in the latest patch [2], I will check
> it.
> Thanks for your kind reminder.
> 

Yes, the clock driver should be a platform driver. Binding should be done
through the soc driver.


Thanks a lot,
Matthias

> [1] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com/
> [2] 
> https://patchwork.kernel.org/project/linux-mediatek/patch/1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com/
> 
> Best Regards,
> Chun-Jie
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
