Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7C8EC8732
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIIuQrovYE14MZMA9DrHJROcuwkTTSSF0MTAzbwwxMQ=; b=K4ILopeBFK/UGu9bc9PWDtAf1T
	uL0gc+FMt1IfBS8aQC4PRdd2MByvSQHVP9SnFDwUrt4c8vMFwKpezWsInVfXJ7UHjhhPvokZIE640
	Vhs/MSg2UASYj5S8a23I6bHzpurNxb844AD9ap4n/l4R0aSax4Ks2kRmPV9sQDXNJN9lr91STMpoQ
	1b17rSHIpcIDaMUl9zj17ERlw4WveYgk/cnyuzeMR/NT60zfe9yELJLrs/vSbLSCNo8chgqr9l5o7
	4Tzsyfkb07SYt98KOPb1XfB6dI/HrEZoqpIqOcbAXIEQjOK8gTNCDVWVLIDusF5Y3hiQs7fYp5/Wt
	uoeslejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeRiX-00CyNe-0S;
	Fri, 08 Sep 2023 02:59:33 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeRiT-00CyLd-10;
	Fri, 08 Sep 2023 02:59:30 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1befe39630bso3088595ad.0;
        Thu, 07 Sep 2023 19:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694141967; x=1694746767; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nIIuQrovYE14MZMA9DrHJROcuwkTTSSF0MTAzbwwxMQ=;
        b=hK9aRXJigkT0vHK6UWVB7jFPY1wOGtJQbr3er+Y5y+XvD25lEk6S7rYp19JEF3xt0J
         cqjbC513XMWtOxuzv7y1r1opi0d2CelWjJSgtEWCL56rqYdHsUGui93vnvv5xXWTupPA
         /GRcxLkY0zyig8on9a5ppN5Cl2fIBGOUFSheJVsW1pP55jCSirY7I6vnRjmzq7eFQqqz
         89WOK2CMJ5fxi5as7Lw0XVZvxWmPUFwnwiCGHGgOSkS7TwtHnKqA2ThJhflTO/+sLTOw
         lG4w6W1XCxpiB5cAgqo2I6ed0IUF0/LETZlk1c3vml+afnZ5x53DnK4MPptd3ucoT813
         dAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694141967; x=1694746767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nIIuQrovYE14MZMA9DrHJROcuwkTTSSF0MTAzbwwxMQ=;
        b=izB9HuJibr57bKeJttbnPClHQZI+u5jocC75BY5bzC/eJqwaOIi2KvSi+PBE9enSU7
         aIRLH2qCMEdAONPGinofnkcCJV2wsAA1QSgeG4nX/LpLuPxqL7ur5pLsyRZHzr5AD0rA
         P0MZbsDgRzspJu2kh23LiSsoXzlG+yHrvZQbDqKeQyRMnpoOKbZCaKhWbLoC6i6lg430
         XQOcgNUOv7JeT6piz/y97rxDlrhGlj7gB6GXW+VAQGCjNACJ9we0N9cqqzjHtBpU3UI8
         aSqAAFJ1pv/3Jea5addbcN+kcxEJgkzCepV1PVixE4HtFNAYzQAnWuFxEBrP73X8jgDG
         ILUQ==
X-Gm-Message-State: AOJu0Yz2jeJgqsrNIgzCWsT6fMNlAkTAfkrNGiXrKZcOULBNP9On2ebl
	9K12XkMeCjIQ9HNz2Y7Jz6U=
X-Google-Smtp-Source: AGHT+IFtDC1Jp8gX6StfUbJQiFJnDW8ht3WRhsEhN8WdX7ZAkgSoUp1PWMSH0rS5G/V1kdEbxtYroA==
X-Received: by 2002:a17:902:ecd2:b0:1bb:ac37:384b with SMTP id a18-20020a170902ecd200b001bbac37384bmr1422259plh.6.1694141967190;
        Thu, 07 Sep 2023 19:59:27 -0700 (PDT)
Received: from [127.0.0.1] ([103.152.220.17])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902e74300b001b8b4730355sm428470plf.287.2023.09.07.19.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 19:59:26 -0700 (PDT)
Message-ID: <94d077db-01e3-404e-1027-fb7532dc3c5c@gmail.com>
Date: Fri, 8 Sep 2023 10:59:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] net: ethernet: bcmasp: fix possible OOB write in
 bcmasp_netfilt_get_all_active()
To: Paolo Abeni <pabeni@redhat.com>, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, mw@semihalf.com, linux@armlinux.org.uk, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, maxime.chevallier@bootlin.com,
 nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230906092107.19063-1-hbh25y@gmail.com>
 <20230906092107.19063-2-hbh25y@gmail.com>
 <7b42e1ca549f8d7d18a4df9d74a93cf527071a4d.camel@redhat.com>
Content-Language: en-US
From: Hangyu Hua <hbh25y@gmail.com>
In-Reply-To: <7b42e1ca549f8d7d18a4df9d74a93cf527071a4d.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_195929_349415_E19808B5 
X-CRM114-Status: GOOD (  18.77  )
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

On 7/9/2023 17:44, Paolo Abeni wrote:
> On Wed, 2023-09-06 at 17:21 +0800, Hangyu Hua wrote:
>> rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
>> rule_cnt from user space. So rule_cnt needs to be check before using
>> rule_locs to avoid OOB writing or NULL pointer dereference.
>>
>> Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
>> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
>> ---
>>   drivers/net/ethernet/broadcom/asp2/bcmasp.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> index d63d321f3e7b..4df2ca871af8 100644
>> --- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> +++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
>> @@ -535,6 +535,9 @@ void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
>>   	int j = 0, i;
>>   
>>   	for (i = 0; i < NUM_NET_FILTERS; i++) {
>> +		if (j == *rule_cnt)
>> +			break;
> 
> Side note: it's a bit unfortunate/confusing that the drivers can
> arbitrary return  -EMSGSIZE or silently truncate the list. I think it
> would be clearer if we could stick to single behavior - and I'll vote
> for -EMSGSIZE.

I see. I used break directly here beacause this function is defined as
void. But since you mentioned this I will fix this out.

Thanks,
Hangyu

> 
> Cheers,
> 
> Paolo
> 

