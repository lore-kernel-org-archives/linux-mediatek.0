Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D370C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4656561D03
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4656561D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TJcszR7ixRJuOZEFrVOMq5DcwHLDn2NM/LBFFpPzhMQ=; b=g2QRnPyFdZ+p5tHXwBIGadI/Uu
	zrUlGD64n0JEyT40BPpyNGzSIMmKGJwRqm1ZSPysP2y/2xVoEfsj1ZOViYEgntkbEa1T4EioKzuSd
	U+v348aWRfeUOfK/d1wm/1B567a1jlj2uDk3dlnmO++MCB82Su4kEYjWfvRFe4zXOOoM6oGYUwhD9
	A5o5JKSYSc6W0o5gzCh0eseSdzz1B57U0qLpa6OTAu7gXdryjgO+JJs0RLzwVLGs47sBn+Ik64hpX
	nVsiWwPrb+GLhtsAXegpn3kurBObOKNW7dmUHXAzgJ0S6oFoB/QldRFU2Zoi4gMc988v58VlHMVWi
	Jq6ohl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUqb-00D9kL-0D; Wed, 30 Jun 2021 07:41:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUq2-00D9Vr-TZ; Wed, 30 Jun 2021 07:40:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so792464wml.5; 
 Wed, 30 Jun 2021 00:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ESnsglEXUA/oJjny6ysW39DXZqWa0zaOszI34gO6+Xw=;
 b=BZlmzT+xB4JIRTvah0usPFHMmSJcAwGpRUEE8yNnFHadXBng8BHWDGe5NiHn3I/pkk
 b+mGUsQp1WgvWv7pNgLX3YWOrORvkrubrWsFPZ+SMC1WcjTq5vihnoId53id9aWpXGEt
 cfUW8ILkisSYzEqTZ0YfCEimVggW6/PD/Oq4x+5gjF23O1oz3cc8LKU0wZZtMUFlcsuQ
 bbRWnWIouTnYM7RJB3jEqEeUbIUTpvakZ8HBZ1AaY/k2XcywN0iZEXLm9xPz6/mtLL7B
 OqMfZxxTUAjW6KHfhrM4GcVwsNg3Sem4MfILH9q0mJbakEYRrLX40grsNAzDq/PdgO3q
 PiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ESnsglEXUA/oJjny6ysW39DXZqWa0zaOszI34gO6+Xw=;
 b=EApS/pwJBFFSUeXFMIWEGC2Ue9BKeuv2Z4yNVQrdYS6t6ZWp8ttGL0m5qjtn+e54nI
 d9ERyiKwOMRTYfFB+ZAS9D0SNoBxm8q20hSFc58e1g1BlgB+aOCZF0f08xD+tCPcRt4s
 YL5C85/VavJHMcF8iBZbYc0XQX8pEuKCVELpyC+Bi2lflCN/zoUZszxohTA95O4qUncX
 NcRGVYBTg6501kowhOuD6beGwre6MvJoAwLtp6vn185v+9gVkJGNM4A6Pb4NxKWMbNYg
 5x/NEPwdJJFdPr+9lwg+92PvSa8537rmzcK5NFKwsuddBmtbO5TsBnYAMyVfJNNM52dL
 Qmpw==
X-Gm-Message-State: AOAM530OUZDSfXBBZ4AtM3jlZoNlj0SehI7bfWwWTIfpP2N9Ih3gGNri
 l2PF4qfj9QlJBaEdcH4sP+Y=
X-Google-Smtp-Source: ABdhPJzEHpvyW7L35YzdPCMfy3750B4ApNGNOi4nwfJuKIL34GnQ57OlGDecCLVHBqBhmzoTebMLlg==
X-Received: by 2002:a1c:2985:: with SMTP id
 p127mr37133724wmp.165.1625038849067; 
 Wed, 30 Jun 2021 00:40:49 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id s5sm21282739wrn.38.2021.06.30.00.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 00:40:48 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 3/4] soc: mediatek: pm-domains: Add support for
 mt8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210616000659.28347-1-chun-jie.chen@mediatek.com>
 <20210616000659.28347-4-chun-jie.chen@mediatek.com>
 <3c7695d9-f7aa-0cb0-871a-f53daee0362d@collabora.com>
 <526fc951eaf6c44f04c7a84786ca3c7ddf63a9d6.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4062efe7-b327-b33b-42d3-28570cae2c6e@gmail.com>
Date: Wed, 30 Jun 2021 09:40:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <526fc951eaf6c44f04c7a84786ca3c7ddf63a9d6.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_004051_016114_94FE6DA7 
X-CRM114-Status: GOOD (  17.61  )
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



On 28/06/2021 15:15, Chun-Jie Chen wrote:
> On Fri, 2021-06-25 at 11:07 +0200, Enric Balletbo i Serra wrote:
>> Hi Chun-Jie Chen,
>>
>> Thank you for your patch.
>>
>> On 16/6/21 2:06, Chun-Jie Chen wrote:
>>> Add domain control data including bus protection data size
>>> change due to more protection steps in mt8195 and wakeup flag
>>> in power domain for wakeup control in suspend.
>>>
>>
>> The wakeup flag is used for different SoCs apart from mt8195, isn't
>> it? I'd add
>> this on a separate patch so it is not dependent on the mt8195
>> changes. This will
>> also make more clear that is not really a mt8195 thing and can help
>> in case at
>> some point we need to run a bisection because something is broken on
>> another SoC.
>>
>> Thanks,
>>   Enric
>>
>>
> 
> Yes, this wakeup flag also is used by other SoC like MT8173, but
> missing this flag in new power domain driver(mtk-pm-domain.c).
> I will separate this modification of wakeup flag from this patch but
> put it in same series. 
> 

Sounds perfect.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
