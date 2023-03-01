Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45317C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 18:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zg98MgWwNc6aZh94xCdr9oJM0+ApGLWaqsOAQluX6tU=; b=tYnuczCC6JvGpCX/ifVVDwo9Qd
	AbkgEnHqB5JdzYFFowLbqZemikK/xn4TX94tC1ICnFTTHns42Xc57s4NSk/DexIENBs2fiXmxZvDC
	t3rui32YKd5c/7XxIO1iDqaULajdH5pe5+Cbtz7teavdJp21ZWw1hdnKqGdSMbwK2byPvZK/46srl
	0pJiayaRvnjcekQ7kVRcChKOaDe1nu3i9B566AdOOrJ0A6j3rd9ZSPm50+2pfm03pScdkYnURNxos
	NQJYiEEJTAZ+q5L5NkhhrX7KsuRVwnXWWfcFZoOzgZsLOi9j15ZRsgv8rl8AAI+qpFEYEV00yb1m2
	LwrMYvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXRXP-00HBpb-No; Wed, 01 Mar 2023 18:50:51 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXRXM-00HBo0-S8; Wed, 01 Mar 2023 18:50:50 +0000
Received: by mail-pl1-f176.google.com with SMTP id i5so13334594pla.2;
        Wed, 01 Mar 2023 10:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zg98MgWwNc6aZh94xCdr9oJM0+ApGLWaqsOAQluX6tU=;
        b=v5GkoaIqtHes2LZHzG008/Dvo/xqjmAD50l76UT7z5H7FYumA4ERAofiEzMGohAsU8
         mne6y7XEwgoxbkw+GkHKJp+ExgddfBEW7A6gF21x8cW2OA2ElhubhBIlwSDcT2pplJ0S
         vm9acHDXHQqPUN6m34gVvZ9k7s+UQmJtWLrdDquw0Od87nJt6v0zhD/We3v4WFzOhT1b
         insrRftwGoM59L4DMVtwmt69AZJghyIKsDiIhXsQditaXXI9m4KgDhYgYEalXBvbpHtx
         Z4QWVcJQg4P4wWd0YvhWf5vPQSxRPvyG59o4FBMPy02qB+mM1DjiqNTeOI+N65SHfR2u
         ewZw==
X-Gm-Message-State: AO0yUKUBTLLTbqLD3tEq2xhRuI3FkUu+j0IXRyqNyCl8IoTmgevysLr9
	C8jMwJZRDYVfQY8m1A9mS7s=
X-Google-Smtp-Source: AK7set9u+NzbfYeo686zDMAFl04xD8Pph/E1g7L9BlqRFstkRybhM7M2i5bRLPKRUnTneqBFFO5e4Q==
X-Received: by 2002:a17:902:e886:b0:19d:b02:cca5 with SMTP id w6-20020a170902e88600b0019d0b02cca5mr7772883plg.12.1677696646037;
        Wed, 01 Mar 2023 10:50:46 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:e8e:76a3:8425:6d37? ([2620:15c:211:201:e8e:76a3:8425:6d37])
        by smtp.gmail.com with ESMTPSA id ik19-20020a170902ab1300b00194c1281ca9sm8778424plb.166.2023.03.01.10.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 10:50:45 -0800 (PST)
Message-ID: <db9031f6-f0cd-fc79-a00d-c1f52abc286f@acm.org>
Date: Wed, 1 Mar 2023 10:50:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] scsi: ufs: core: Add hwq print for debug
Content-Language: en-US
To: =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "quic_asutoshd@quicinc.com" <quic_asutoshd@quicinc.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?=
 <stanley.chu@mediatek.com>, =?UTF-8?B?TWFzb24gWmhhbmcgKOeroOi+iSk=?=
 <Mason.Zhang@mediatek.com>, "quic_cang@quicinc.com" <quic_cang@quicinc.com>
References: <20230222030427.957-1-powen.kao@mediatek.com>
 <20230222030427.957-5-powen.kao@mediatek.com>
 <1b9c2bc9-a349-062a-597c-336804c05394@quicinc.com>
 <74bedcff32df0c93c14b004814017f3344247528.camel@mediatek.com>
 <0c17dd26-b1aa-54b0-6dc4-561cd996cead@quicinc.com>
 <76f74b86-8ff1-2346-4f5e-0048543bd8b0@quicinc.com>
 <f629f1b72e4859d79aac279ef3327715000e3210.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <f629f1b72e4859d79aac279ef3327715000e3210.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_105048_954476_6F9D8494 
X-CRM114-Status: GOOD (  10.91  )
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

On 2/28/23 18:17, Powen Kao (高伯文) wrote:
> Sure, we can first integrate ur patch and see if anything is missing
> that need further upstream. Due to comapct schedule, I would kindly ask
> if it will be ready by the end of this week? :) Thanks

Please trim e-mails before replying and please reply below the original 
text instead of above. From https://en.wikipedia.org/wiki/Posting_style:

Because it messes up the order in which people normally read text.
Why is top-posting such a bad thing?
Top-posting.
What is the most annoying thing in e-mail?

Thanks,

Bart.

