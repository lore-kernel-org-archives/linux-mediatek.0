Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A7FC30653
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 01:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2PlL+cNrtgBEK7e1pegCFhmRbl6FhS1f6s/BBzg990=; b=j5m69C3mf8VXFusrJWGUDewPrK
	v7AdgjV5tHRCf0wTIUwSiXh6Rpjqa2gOcBL5Khv4172Ze7uMzbS76tR07/Kf9+aKw1wtTjVwCcu8Z
	4XAfCZsEH2xG6jEiu8ii59vU2WLmwnherWW4UTPOOP+ThSep06SgAQ+E/esDvoYm54PWzDYB8NDEP
	rXI1KRTrYnAeG/HSWAYm6ZmLy92lorftEW/YkrAKimF6cC7SB05d4A041ranhzIGU0cqshxZEkNd7
	EwFzB0KbNKnjS8O98hanLhWmPtUeN0nVfY+9NMDRrDQE9aAkCSoHZpuoyy9yTSOnKJ2nhrggQFMUt
	fsZeCWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN0fE-0000000CFBj-30oa;
	Fri, 28 Jun 2024 01:44:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN0fB-0000000CFB8-2t8F
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 01:44:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2c7dd4586afso99168a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 18:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719539073; x=1720143873; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2PlL+cNrtgBEK7e1pegCFhmRbl6FhS1f6s/BBzg990=;
        b=NbwZPYHUpy78jLdc/rWF/nGMKnT93idPasWF1yCfzzQDjxbiDSydTRjGQewZdUYAgR
         ISoWD98uqD7Z2gzr5+vuSurYGnW1A9lt8rbgX/ZvqsljNw/FdtNDzLhUyrHcERZ+IKrG
         hMFiZvr03k/mRQDs+5Rbb1SOssjLO4UjLcll7cZhwhJ5nLT1+6f8PrRJE3nJTnpzy6jD
         Q6RQTsoMbPadGv8E4U3EfxdCTLBTM4ITXeHoty73k4bA2myN0NIWpWLgBzpjQRNFidiK
         kjjVqiWKPu4lUcrNX4GK46Ux/O10169uomBegiGEKJTlHoD2d41bOzsJ0RoSVNzCS0Ij
         8GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719539073; x=1720143873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2PlL+cNrtgBEK7e1pegCFhmRbl6FhS1f6s/BBzg990=;
        b=ws5NJ1oinZuiMrvGI1gK2UKplhK7GuCJT8SrTMQBkBlX+OcyadsH+VcpPjTiZQJgLK
         17mqeaZb2b9Z9XKHmyVgEw20uS/R3mPF+DaBp/jZQJVJnJOdqyCr2hRPZ9tssjUouNw7
         yGVlU2TdHWYIajy3W3HhSL9l8Hgnq/qmNtuiErb0QlB5SNguIkVYMXji7WxcJdMOoNtx
         iRbLvrKw27j+ySFmcxf1XZkOIZPuNax13FaN8pVwHmHADxA6iE+ayWRCseAJfI2NuFDa
         nNSfqRHQvY4Arkwhh9Aax7G6tXWOUqSMxH5m+XfF/z1o8DrkRzuu9pjrYHxsd7pvLKFS
         7beg==
X-Gm-Message-State: AOJu0YxFzcEyzhcinzcP3LUGsgj0bOlmVNJ67hsxbkd/z4ZC27lpaQl+
	UZ9iBLLGLA2qpP1bOBDvcldhMdfV6doCH4GEiEADJHsjPNTYv1tH
X-Google-Smtp-Source: AGHT+IEtx/CFFSk+X0N5AWryCVBCAja3mFgba28EnBMHXYQs3DSPEosR+Gq2rOqRmv7IPhiaCA1Wcg==
X-Received: by 2002:a17:90b:4b92:b0:2c7:c788:d34d with SMTP id 98e67ed59e1d1-2c858275b3emr14169645a91.38.1719539072797;
        Thu, 27 Jun 2024 18:44:32 -0700 (PDT)
Received: from [0.0.0.0] (97.64.23.41.16clouds.com. [97.64.23.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3bc5e7sm451019a91.36.2024.06.27.18.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 18:44:32 -0700 (PDT)
Message-ID: <f4a0879d-0df7-44b0-8fa0-e2917532c1d4@gmail.com>
Date: Fri, 28 Jun 2024 09:44:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240624121158.21354-1-peter.wang@mediatek.com>
 <eec48c95-aa1c-4f07-a1f3-fdc3e124f30e@acm.org>
 <4c4d10aae216e0b6925445b0317e55a3dd0ce629.camel@mediatek.com>
 <795a89bb-12eb-4ac8-93df-6ec5173fb679@acm.org>
 <0e1e0c0a4303f53a50a95aa0672311015ddeaee2.camel@mediatek.com>
 <58505ca5-5822-47f5-a77d-a517eda0c508@gmail.com>
 <147f56027997fc37c93d4a6c438da93898fd50f6.camel@mediatek.com>
Content-Language: en-US
From: Wenchao Hao <haowenchao22@gmail.com>
In-Reply-To: <147f56027997fc37c93d4a6c438da93898fd50f6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_184433_754294_AE7762C8 
X-CRM114-Status: GOOD (  14.29  )
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

On 2024/6/27 18:58, Peter Wang (王信友) wrote:
> On Thu, 2024-06-27 at 15:59 +0800, Wenchao Hao wrote:
>>
>> Hi Peter, 
>>
>> What is queue_num's offset of blk_mq_hw_ctx in your machine?
>>
>> gdb vmlinux
>>
>> (gdb) print /x (int)&((struct blk_mq_hw_ctx *)0)->queue_num
>> $5 = 0x164
>>
>> I read your descriptions and wondered a same race flow as you
>> described
>> following. But I found the offset mismatch, if the racing flow is
>> correct,
>> then the address accessed in blk_mq_unique_tag() should be 0x164, not
>> 0x194.
>> Maybe the offset is different between our machine?
>>
>> What's more, if the racing flow is correct, I did not get how your
>> changes
>> can address this racing flow.
>>
>>
> 
> Hi Wenchao Hao,
> 
> Yes, our queue_num's offset of blk_mq_hw_ctx is 0x194.
> Our kernel version is: Linux version 6.1.68
> I think the offset is different by kernel version.
> 
> (gdb) print /x (int)&((struct blk_mq_hw_ctx *)0)->queue_num
> $1 = 0x194
> 
> And yes, it only shorten the race window of step3 and step5.
> Reduce the probability of step 4 appearing between step 3 and step 5.
> 
> 

Hi Peter,

Thanks for your reply, I understand the issue now.

> Thanks.
> Peter


