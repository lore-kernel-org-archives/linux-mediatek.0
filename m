Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B4C5478A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/XUwk5TS9Ky2HqKC3MvObSVQS4x92SJn+KRK0ItMuw=; b=mxf73xAJrKckt8/3xF7QfLocEN
	ifQxP4tflWJ6dwJl1T90vMYNtbFh70TFLBZom1IU7rgQ2nEG+fUE/SZn8GNRkGDt43cX+4E5jO0jy
	ivV3R2w2ngesUxfyRe1WldJGcrHRtCTrcI67wpI9zFKA0KdytMHer94/KV0mp6lMfgHcNTyDFrKT1
	ZAzylBnOlwFdzZdiEJVobK34umR+shH0wMs2iPG5CqSdEIU+1/l8bQP+rKGOoOuyHskw1mqXtpJGu
	7GktqpuBDcwz5iU13qJ5TF0OzmEMhHH1i79ch9VfdTOE4COBJRZi9KHN95UjrcCodTngkWAnGpchA
	SaJypxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcquH-000000020gA-2tBe;
	Wed, 21 Feb 2024 18:01:21 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcquF-000000020fY-0ono
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Feb 2024 18:01:20 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e2e44aad03so3874577a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 10:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708538477; x=1709143277;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/XUwk5TS9Ky2HqKC3MvObSVQS4x92SJn+KRK0ItMuw=;
        b=a4qIiX+sZMz6FZzxIryDDfg4+fu80xIwJm3Z2f5qw6etc1ngXXiUbvwV0HXMmBFHgN
         o2k+AlJK5Jy6GxRxb+zaeLa0F1VR9yfgtfXiLKMJP4UGyXrrGix79m6iocisrnHp4hP7
         xiNO3Vmx4WapSE9X79kXJGWoztUSU1aprbnb3ka2jWu225eZdaub46WNMXK+DIfbGbE9
         11zDp8UhB6f5Z9Pu142XTBnPfhs+M14x2oEC7e/g4HDso6Sw86N5HlD56/NTZvkOzfem
         8OHCsWyrRZzjjfodcCZqT/AD478bEH5hn66vD7IV6309DYzaZJKGs0aDCDphB0wpmPXe
         +vaw==
X-Gm-Message-State: AOJu0YyIE1MzF0421RU8XR2xCl7gKrOMtxlPv9t/OTmm0z003pXLIOO0
	N3+FAzcT4BkZJTkCwhVPbQCMYduzEf7zYj6rY3pA/OkKblb4pS4L
X-Google-Smtp-Source: AGHT+IEh/kOMQRAU+4zZdRPprsjAmt/ymq/739JlgxltzcC9dG6jrCZCKTzw88pz8itZR4vjQoIR4g==
X-Received: by 2002:a05:6359:4125:b0:17b:759:65c2 with SMTP id kh37-20020a056359412500b0017b075965c2mr21933881rwc.10.1708538476753;
        Wed, 21 Feb 2024 10:01:16 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:d74f:a168:a26a:d7fe? ([2620:0:1000:8411:d74f:a168:a26a:d7fe])
        by smtp.gmail.com with ESMTPSA id ka36-20020a056a0093a400b006e48e0499dfsm1815313pfb.39.2024.02.21.10.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 10:01:15 -0800 (PST)
Message-ID: <923e2241-ab08-4cf6-a614-91da4b3575b8@acm.org>
Date: Wed, 21 Feb 2024 10:01:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: adjust config_scsi_dev usage
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
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
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240220094211.20678-1-peter.wang@mediatek.com>
 <46d0c5b7-7158-405d-ba38-cece4030e2bd@acm.org>
 <0874377d564ceb63efd62df3757c6e5f3a0dd03c.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <0874377d564ceb63efd62df3757c6e5f3a0dd03c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_100119_253399_B3749A2F 
X-CRM114-Status: GOOD (  10.29  )
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

On 2/20/24 18:44, Peter Wang (王信友) wrote:
> This help function is designed to assist users eliminating the check.
> Formalize the usage can make the code more concise and easier to read.
> Such as ufshcd_vops_init/ufshcd_vops_exit is also only one caller.
> Besides, it also need a comment of config_scsi_dev in ufshcd.h

My personal opinion is that the helper function makes code harder to
read because the definition of a helper function needs to be looked up
to understand the code. There are many examples in the changelog of the
kernel tree that show that there is a preference in the Linux kernel
code base to inline short functions rather than keeping or introducing
short helper functions.

Regarding the config_scsi_dev comment, shouldn't that be a separate
patch since that change is unrelated to the introduction of a helper
function?

Thanks,

Bart.

