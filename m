Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7505ECDB483
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1UPZMSkgkIyz+Vra1Gma2AD0nnQUamicNB8T2Fp4Ik=; b=PCpLBDKiYXuNGj/O/s08W/pqeF
	9YXATM9slRKakymw4bK+X/W6wONQqQ+b/V2MTe1zMxW1AVeaH+IpOrw0yDcR5bV2jUPc5MkP2MTw3
	1Ir3pXd2MAmtKx73MgtaVhtMM2AQWRw9xlZFPdwwr3+sNQptz4Yy2omQwjzRvCjGjb1oM/x2wF5QS
	WSfpj2TizRMLY2XtdnOIIp81K3BnOlzIuc0myjVkRMeMQe4l8XtLhXy+A0ooVXhdk3607LAISqIT7
	Fg+hRFTVlRzuZinvB6FNFqFv+vMIWO7nd5vLcyBr5lRsdrKYXh8M4iReszOprj7HI/qUWrpmidfBb
	Ct1i+GDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKyN-003rCO-0Z;
	Fri, 13 Oct 2023 16:25:11 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrKyK-003rBk-1a
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Oct 2023 16:25:09 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6c0b8f42409so1451375a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Oct 2023 09:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697214306; x=1697819106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1UPZMSkgkIyz+Vra1Gma2AD0nnQUamicNB8T2Fp4Ik=;
        b=wVEiOo3GPJslLoqOVzch9Wzio+S8OGGjbAXVGIk7iUz2G/j8frl0Tuda4AZYDc7I4z
         UWnPBfJA5jI6d7NJpm/TZjxkEuXb0fG4mTWInpEksJHyH+nqqnjZmAya21e+GU5FzLgv
         FxAugZjPncptZ9Z3rQdQ4QPDvwdOyCYFfa3yvXoAHMfbMD0OUi+Nc8dRsByJdcpi4l92
         Wqq+Vy8tHJpDNbAQdFZao0c/6u0kRdeKhpPrv7RyXRtFS/aF9ioL5Tv+kmWus/fNfXip
         +n9YnAlInaDcg2o3rpyiHUaYOmqJgOacgLEkI9yOaz4cJFvxHUPQ3OAojEKT8OZnQzB3
         g66Q==
X-Gm-Message-State: AOJu0YzxuWzJit/oZD9EbDJvX2P3+LtSsrs95f/k6Cj4da9jBqE/7mKi
	8EV/cSHii/JJG2fCkhCo1D8=
X-Google-Smtp-Source: AGHT+IE8q9T0QFZWQdEfbvIJy8QqOvoNnNJ/2tOQ1A2x9Asl91CGy/lxD72TnZBes+dsnajzXAC6JQ==
X-Received: by 2002:a9d:7d8a:0:b0:6bc:65ad:1b08 with SMTP id j10-20020a9d7d8a000000b006bc65ad1b08mr26718029otn.28.1697214305886;
        Fri, 13 Oct 2023 09:25:05 -0700 (PDT)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id o4-20020aa79784000000b006934a1c69f8sm2520692pfp.24.2023.10.13.09.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 09:25:05 -0700 (PDT)
Message-ID: <cc40e03a-1e43-4659-8579-1b9d22d7c34a@acm.org>
Date: Fri, 13 Oct 2023 09:25:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ufs: core: fix abnormal scale up after last cmd
 finish
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
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
References: <20230831130826.5592-1-peter.wang@mediatek.com>
 <20230831130826.5592-3-peter.wang@mediatek.com>
 <5afd3b643d75cd3a65adba84b2d31ef355e58abe.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5afd3b643d75cd3a65adba84b2d31ef355e58abe.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_092508_535890_E79E9DC9 
X-CRM114-Status: UNSURE (   6.98  )
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

On 10/13/23 02:42, Peter Wang (王信友) wrote:
> This patch still need your review.

Hi Peter,

Although I can see that patch 2/3 made it to lore.kernel.org, I did not receive
that patch in my mailbox. This probably was caused by an issue by the mailserver
I'm using. I will download the emails I'm missing from lore.kernel.org and review
these patches.

Thanks,

Bart.


