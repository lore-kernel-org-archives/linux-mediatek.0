Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6405C83F15
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 19:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7GpDWXjt97ECSFVXng+31f5cy+/s0jhYwD4ACEqG5Q0=; b=r6u/iL5PGfJ3GhVvUehnXaFL2/
	G50twFPtr74LFkJF2z9agWtR0x5qPf88QJVIB8v+2gruxy3nbuRkvO0OEN1krmgSwSbi1za67XJ0j
	A6+AFiFW75Z6SvSMLlYqVB/IbVezjUMgJFqxfBfUUgcit381AFLayekGr0qQp5yjxQfZHoQ4rvNtP
	jrGNmuf4b949f7n9TY3VONlxZcTtvIN9iUArCi4lKwo60oA+O00cqfiJ8CaeUFrfBnuHaoOLJQS8Q
	9x7HUv1tnLMxUrfMPE8pXBDDAE9zZMD0hh02CR1tGqfD34PH/66gJBtWq1c7+LMrZCL/o3Wrma10s
	fN1LPgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR6A-00E4cg-2E;
	Wed, 30 Aug 2023 19:43:30 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbR67-00E4c7-22
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 19:43:28 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c0d0bf18d6so331445ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Aug 2023 12:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693424606; x=1694029406;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GpDWXjt97ECSFVXng+31f5cy+/s0jhYwD4ACEqG5Q0=;
        b=l8ZpHlVxW4FkaWeAExdUQI8i/mg9fO/kEk0h3q/9imPk/QjcCpxF8Dym6O/1TfLH6A
         5CxUIhitEXRke65WgSamob+wf5cxahwlMRLyWRZWBt1No4QWUB5u48GVUbqSDQgqt7bP
         1qXEp1o6E/HBI2Bu1Pe6dLzfYY6GjtAum7lakZQIkFbjGBRO8Nz+NmaP+oJi0eknHX+u
         5L+xHbaGWNU8uMq0qXbrCDzZFyL0azyr+mN//v2yxB8sF0A19ye7Bkf3yUPrAK0FPpU3
         6NYc7GXabtPXcT4LUi2rUvf24hegvuvwHbTjo3hADIHin9K7/P1NdT6D9mxHbUjvwvm3
         CxQw==
X-Gm-Message-State: AOJu0YyxsvcKkEs8rdBjQHjpkrwHrKVsbx4DGjnd7WyTWake1Rx0/eYB
	NaSQZobb4hFHaFdttBg+SVs=
X-Google-Smtp-Source: AGHT+IHahRuD5OROFWtT3YiHqTTv9IwkQK2/Yrp6PejQKzKB4OlP1bvL8YrgOT3dru6EWV3llnHLPQ==
X-Received: by 2002:a17:902:d505:b0:1b8:971c:b7b7 with SMTP id b5-20020a170902d50500b001b8971cb7b7mr3730445plg.56.1693424606385;
        Wed, 30 Aug 2023 12:43:26 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090274c400b001b891259eddsm11427279plt.197.2023.08.30.12.43.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 12:43:25 -0700 (PDT)
Message-ID: <822010a3-aeb1-4ef1-a2fa-ea100c33b3f2@acm.org>
Date: Wed, 30 Aug 2023 12:43:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ufs: core: fix abnormal scale up after last cmd
 finish
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6X?=
 =?UTF-8?Q?=29?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20230823092948.22734-1-peter.wang@mediatek.com>
 <20230823092948.22734-3-peter.wang@mediatek.com>
 <468fb5a4-32d5-42a7-b00f-115044954125@acm.org>
 <3d3ef797414961e2eb6bc9d6dbfd45a32e7381eb.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <3d3ef797414961e2eb6bc9d6dbfd45a32e7381eb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_124327_692141_83087CDF 
X-CRM114-Status: UNSURE (   7.31  )
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

On 8/29/23 20:00, Peter Wang (王信友) wrote:
> Second __ufshcd_suspend_clkscaling is called from ufs wl suspend, which no on-going cmd.
> 
> So, it should be not a problem. (cmd finish suspend clock scaling racing with new cmd start busy)

This patch inlines one of the two __ufshcd_suspend_clkscaling() calls.
I think it would be better if both calls are inlined.

Thanks,

Bart.

