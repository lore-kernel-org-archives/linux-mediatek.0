Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBA8C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMPFt7qCcKlt4bBRLNTpr5RAJLhjvUZf1lQJM4mr6kc=; b=UN1urpztlCMTH4SS6PHXIlWvUI
	nDRKUb264d+LiPEEFFdqtLHkJOwN8tePTCa9rHfHjOHABgjxlax6N0uj6N7kg6jY1rFDDRsQtxpQD
	uo1nLjmTf3DmIwgaZhkkBbtp36RY51pbUe6ns0FvUZLcGLtg7SD8UaNIfbKOiZqwlQ0gz+bqfvpt8
	EnJPJOoYN6nY183b3vzXmWcgUV8B8uu1/Hy34ncokk3mAr59/UDRXuIutakTkvRxbVPlJQk1LQ0/3
	XlCh9W3fWedHMIQwrGOAz14LI0HIsV1kYzL2F8oinMHiYMAnAQo+hdXJ7cQGhDjUdeTzS+CJArDZv
	oTbeZdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2H-00000009eje-0aTo;
	Thu, 27 Jun 2024 07:59:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMk2E-00000009ehl-20Hd
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 07:59:15 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f65a3abd01so60972725ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 00:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719475153; x=1720079953; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oMPFt7qCcKlt4bBRLNTpr5RAJLhjvUZf1lQJM4mr6kc=;
        b=G26B0SZXsi0zA1TXXwqFaauL7Fsl3zOnUxlT08wcdWBmk+zJ8EmN2LHGjYJWNmHlrP
         w158nxW/gbhyudEzvJGSZJUf39vpusbXn1NkipDU5ZqqACQm5m/gS+QrZwhs0X50iSXj
         PJrNWRGacTcKmNxhZ3oSiiU80lhZ/R8Qs0EdwsxsTvRlJ8AxgdoTiEalg+Dp5Pe0TSKV
         0rO/TIsYDd/80DqMrnpSgojGg7m1oA44HlPX5d9qvk2y4GLxtykEgyzBzQox85hExW8T
         SrPn1vCF4hPRY8FdVV25+SbkV6gMb/MOQeVYCkUynMfJeoMQleHMRN+72i2fONbgtu6Y
         pwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719475153; x=1720079953;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMPFt7qCcKlt4bBRLNTpr5RAJLhjvUZf1lQJM4mr6kc=;
        b=rVfmAO9xWbbuMCiASfTUNN2GQu//X+cQA37Ud2oMkDmbmAStAyOzR5xnXJ+kJgXUed
         Lf003VgTeL5/D3oVhkkm8Xl8d6wCsN9K6hnw8hihJYo3PnagyOsaqxfwiK2xgwgOFwP7
         XjAN2rLOi2XDRdlDvc1D7z7+CWI+ZAb2isRi5APw1vGF1oF4EktTjZtO16ahEsyocz+S
         PuPCQNkAQZlfU7UaKaBZ9keNRqooIueFKPlx08H9wFvIH1/XD6bkpN/DN52K5qupPicn
         P5UutJ2m9gbh67a0kNam3tfpkRaA8zcNoF5qxPRWcpSX3p5QfbL8FNSgJlJvD4afzyV1
         A/ag==
X-Gm-Message-State: AOJu0Yyl4g8ec+BHopzXDr73dwlB6v7WNn+Xsrt7oz+ayewAwlCe8J6g
	BJyo8zisFAlTax5qNK+iBPUkAp223SOIwoLq9l3Y092MBOnQdHUe
X-Google-Smtp-Source: AGHT+IGAVQN2fy7d8glYzpm7iBHWvHCXJiWGTnics/V2+00uZxGRrbWBL+pefWqwcgKthF3qW/xaSw==
X-Received: by 2002:a17:902:ea08:b0:1f9:e3e8:456f with SMTP id d9443c01a7336-1fa23ec2d5cmr150310595ad.15.1719475152792;
        Thu, 27 Jun 2024 00:59:12 -0700 (PDT)
Received: from [0.0.0.0] (97.64.23.41.16clouds.com. [97.64.23.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac998bb2sm7157915ad.196.2024.06.27.00.59.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 00:59:12 -0700 (PDT)
Message-ID: <58505ca5-5822-47f5-a77d-a517eda0c508@gmail.com>
Date: Thu, 27 Jun 2024 15:59:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
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
From: Wenchao Hao <haowenchao22@gmail.com>
In-Reply-To: <0e1e0c0a4303f53a50a95aa0672311015ddeaee2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_005914_571455_E25A87AB 
X-CRM114-Status: GOOD (  18.51  )
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

On 2024/6/26 11:56, Peter Wang (王信友) wrote:
> On Tue, 2024-06-25 at 09:42 -0700, Bart Van Assche wrote:
>>
>>
>> Please include a full root cause analysis when reposting fixes for
>> the
>> reported crashes. It is not clear to me how it is possible that an
>> invalid pointer is passed to blk_mq_unique_tag() (0x194). As I
>> mentioned
>> in my previous email, freeing a request does not modify the request
>> pointer and does not modify the SCSI command pointer either. As one
>> can
>> derive from the blk_mq_alloc_rqs() call stack, memory for struct
>> request
>> and struct scsi_cmnd is allocated at request queue allocation time
>> and
>> is not freed until the request queue is freed. Hence, for a given
>> tag,
>> neither the request pointer nor the SCSI command pointer changes as
>> long
>> as a request queue exists. Hence my request for an explanation how it
>> is
>> possible that an invalid pointer was passed to blk_mq_unique_tag().
>>
>> Thanks,
>>
>> Bart.
>>
> 
> Hi Bart,
> 
> Sorry I have not explain root-cause clearly.
> I will add more clear root-cause analyze next version.
> 
> And it is not an invalid pointer is passed to blk_mq_unique_tag(),
> I means blk_mq_unique_tag function try access null pointer.
> It is differnt and cause misunderstanding.
> 
> The null pinter blk_mq_unique_tag try access is:
> rq->mq_hctx(NULL)->queue_num.
> 

Hi Peter, 

What is queue_num's offset of blk_mq_hw_ctx in your machine?

gdb vmlinux

(gdb) print /x (int)&((struct blk_mq_hw_ctx *)0)->queue_num
$5 = 0x164

I read your descriptions and wondered a same race flow as you described
following. But I found the offset mismatch, if the racing flow is correct,
then the address accessed in blk_mq_unique_tag() should be 0x164, not 0x194.
Maybe the offset is different between our machine?

What's more, if the racing flow is correct, I did not get how your changes
can address this racing flow.

> The racing flow is:
> 
> Thread A
> ufshcd_err_handler					step 1
> 	ufshcd_cmd_inflight(true)			step 3
> 	ufshcd_mcq_req_to_hwq
> 		blk_mq_unique_tag
> 			rq->mq_hctx->queue_num		step 5
> 
> Thread B				
> ufs_mtk_mcq_intr(cq complete ISR)			step 2
> 	scsi_done						
> 		...
> 		__blk_mq_free_request
> 			rq->mq_hctx = NULL;		step 4
> 
> Thanks.
> Peter
> 
> 
> 
> 


