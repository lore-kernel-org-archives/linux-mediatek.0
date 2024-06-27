Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E539C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ETjSuiBGz/j4BOauY9/duKhstSMiIxQ7/voA5iz9AU=; b=mD2M1dMpJCOnv3tDJaVCMVpgf+
	hdPle/xocfAodSe9Q4i1+z/7oj0tjp8U6otzRay6YRDOvQP9G5D7gWDTbLLpIhGWvZnHZmqGw8lKh
	0Yh0ocC2BJitwwzjpruCKhAkk7pkpAhw0+IlhcdZIhsLBHa8SqegQCGF4JhpKDuTtZMERwoRQ24NY
	PE1KyODaukuIx7by23T/YzoDabDvEIBA0r4eCwED8Yo+nT827sDPil3uqKp47MY1OPE8RUDL7q0gU
	QFUN+4VaQ8OwRMn9xJ+Me6ghHsK1kyfH2tU1GILzvBEm/TyVJrKMcG0o8MOvgV9iv2+3hiFc4tiRo
	T3UuiF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnDE-0000000A8zP-33wW;
	Thu, 27 Jun 2024 11:22:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMnC1-0000000A8mq-0neK
	for linux-mediatek@bombadil.infradead.org;
	Thu, 27 Jun 2024 11:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0ETjSuiBGz/j4BOauY9/duKhstSMiIxQ7/voA5iz9AU=; b=TLgVw/8XHDGWccwE8pmfRl+sa5
	g/OJgxaWi3mwQUgS+RglmVSmyLbFzIUYTuK2D6az7ab53NDbE4dEroxq/2aLu3CYCWMhKt6RpAtnn
	o+Nqq254n+hmMTCRLCg4xUNN8D8RRf/k8ybUDubsV2njdQrfi5/SKTxytT9VXtVJ6UFPvLhSqWFdr
	8kauzqV73gUp8JrD3GyaSAvmZ3wDVcED17vW6q7zZhSAgV7Wk1jJFpfzjSyVEQ1zfDYE7gTnp9mkc
	74XdsN1MeYP+b7raGy82kUwNdXfNibX2j/bj0ft5Fd/vt3wpocYnAPO2GEAmaXWOdImpBljO9YHhf
	hRalc9vQ==;
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMlIa-00000008nSG-049U
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 09:20:17 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3d56285aa18so682670b6e.2
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 02:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719480006; x=1720084806; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ETjSuiBGz/j4BOauY9/duKhstSMiIxQ7/voA5iz9AU=;
        b=VNyQh6X69WQt7Rs0+QRjFkp1mBSeTVgeF1SCP65LbAovYPk/g5aCdZ0yDpoTeyl9Q0
         voE8AvvRSb/gJ5T2O40QDdmv3l/khrq2djNMkkiGepV0epEvObRP9q3/eHbCkABuSYsd
         1NnBG9PyMeqjjb39JBEN7TWItbmYutbAJ1sY9unRD2z2VPT9/oCtu33n5gWufHYDJJyG
         5+Qq47TKpllGuvu1rxKrSoNWcGg50sAXS8MpF0Dod+8znGJ2ii/94/FdUi5G9JcVWmi7
         Vnx5AOa6Z8SrddiC/Nl7jg6x6LL5IqWjr+Ha2GAuDuMV2PJ6wEs+7+SadtHgGq9WSuio
         n4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719480006; x=1720084806;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ETjSuiBGz/j4BOauY9/duKhstSMiIxQ7/voA5iz9AU=;
        b=Cz/aUUd19o/TGqop4HpJUwQrTFNvTOOqQ7bMRt1aXemIFJGlJWqNGWVcpq/J1oQBdC
         ByQVMa2D5c9CIR9svLrJq68RuTKVmbUGWnO+KZ0XVQTtxMCZC0MdzQcFfNE/0xOq9uCg
         5kJBe0UEdo+oJaYIhDbkrPoizBgG8udphPrnyBALTcNI7iK+ZvISPB+RMhoTtq43uZHV
         Bnvd8EKrVnrv64QUa3SJNIrckydF2y0HQxQgRBxY7Xp3bx4vPdqIe0gY8HM4LkKBVlxG
         pjLDlVkxWW59AStvMz1TNRNuJ23JdL9VMGOBRHv/g2ycPBXX1o+DiyG7EoTltUXyXOtZ
         SAsg==
X-Gm-Message-State: AOJu0YxNOP1M7Jwx593A48ENOdHG+spEwMOwXuTMYCdRqWFsKv+/PafV
	ex9Wu4XN4NsRKlN5cAtD7nU3HPApMk3a8e/M1uEF0AB9tBZaHgLD
X-Google-Smtp-Source: AGHT+IHjdpOyBFenniHMqFqVjKBOxZ6X632fUyQ+pzaAHZpGbnal/OLNuPUb9R3gz3dfs+8P38opOA==
X-Received: by 2002:a05:6808:13c4:b0:3d5:5e88:d125 with SMTP id 5614622812f47-3d55e88d5edmr6027659b6e.21.1719480006568;
        Thu, 27 Jun 2024 02:20:06 -0700 (PDT)
Received: from [0.0.0.0] (97.64.23.41.16clouds.com. [97.64.23.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72745d074adsm617213a12.36.2024.06.27.02.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 02:20:06 -0700 (PDT)
Message-ID: <54f5df88-ca0a-40dd-92ef-3f64c170ba55@gmail.com>
Date: Thu, 27 Jun 2024 17:19:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
Content-Language: en-US
To: Bart Van Assche <bvanassche@acm.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
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
 <b5ee63bb-4db9-47fc-9b09-1fde0447f6f8@acm.org>
From: Wenchao Hao <haowenchao22@gmail.com>
In-Reply-To: <b5ee63bb-4db9-47fc-9b09-1fde0447f6f8@acm.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_102014_120576_8B02FC61 
X-CRM114-Status: UNSURE (   8.53  )
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

On 2024/6/27 1:13, Bart Van Assche wrote:
> On 6/25/24 8:56 PM, Peter Wang (王信友) wrote:
>> Sorry I have not explain root-cause clearly.
>> I will add more clear root-cause analyze next version.
>>
>> And it is not an invalid pointer is passed to blk_mq_unique_tag(),
>> I means blk_mq_unique_tag function try access null pointer.
>> It is differnt and cause misunderstanding.
>>
>> The null pinter blk_mq_unique_tag try access is:
>> rq->mq_hctx(NULL)->queue_num.
>>
>> The racing flow is:
>>
>> Thread A
>> ufshcd_err_handler                    step 1
>>     ufshcd_cmd_inflight(true)            step 3
>>     ufshcd_mcq_req_to_hwq
>>         blk_mq_unique_tag
>>             rq->mq_hctx->queue_num        step 5
>>
>> Thread B               
>> ufs_mtk_mcq_intr(cq complete ISR)            step 2
>>     scsi_done                       
>>         ...
>>         __blk_mq_free_request
>>             rq->mq_hctx = NULL;        step 4
> 
> How about surrounding the blk_mq_unique_tag() call with
> atomic_inc_not_zero(&req->ref) / atomic_dec(&req->ref)?
> 

Hi Bart,

A small wonder, then should we append __blk_mq_free_request() if
req->ref decreased to 0 like following?

        if (req_ref_put_and_test(rq))
                __blk_mq_free_request(rq);
 

> Thanks,
> 
> Bart.
> 


