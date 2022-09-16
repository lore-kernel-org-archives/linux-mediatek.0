Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E547ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Feo+txNMREv9gGYCjdzt5aBtj7MBH0ePNzjWAS9UyuM=; b=oPKfOYfN3lQY9A97m7HqQXYpM9
	B4bLt8AL1tpgsIZSqTgomoUO4VAtLVpPgjCJefxtpWzUT1cup1U+cbHqX/OrlK9kbjgtoR1HG1asn
	YC3NX0IeSpSGDt6181ZgwdFhm9fLTh8e3gukZaMYG4ckIPg76auM2ZqFCxqo1A846nRrtU4LET2s9
	4cOBBiO8HExzhiEDwx4mO/x2TXCGWmloY2E26e6AZ02HW/DYlWb8YZ8SLEURTzWphiQHv6jDvG33d
	ndf2xEyt2ThWMOUFHRIabZiaDKJkXOKyN08ibU3JPNLl0PA3i/C29YhXOZZJJ5NAx9mC1DAx0KCaO
	Bs/No+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJ48-00HGqq-QT; Fri, 16 Sep 2022 21:40:04 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZJ45-00HGnK-DY
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 21:40:03 +0000
Received: by mail-pg1-f172.google.com with SMTP id t70so21510171pgc.5
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Sep 2022 14:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Feo+txNMREv9gGYCjdzt5aBtj7MBH0ePNzjWAS9UyuM=;
        b=SFgc9Os3kcPnWKqjOH7L50B5Iyp9APlA7L1xa0tdlXtAy8JMWJ2xmm32CRWsLCGENz
         DBWn/danquQ4cskzQWV4kTSPEIUL2lJK3nrMLRcV1OOAUHtcQs54KNt5mo2dUQ76WMe1
         jjViQZTJK2vwjAv6b3JDysoYQ7jdIfN4zH4nsVjLHrNeBYrnJFx3q8JVCl0gaxrKBymz
         8fofrlzNz5bAldXBfKKVfvDpZkw7Fr4f7M6bGnmSbrtKjzcLGD/pReXrs/aKH7K7PmcL
         uzIv1kHKeYsJVzTvu7H4pjIhRiFeqFcnWvRBpM7DhY1TIAHi3Dr+JBfSzPlFM4GgxPB/
         oNZQ==
X-Gm-Message-State: ACrzQf1qVr4IOcbSjq/a2y1GO/whAwBFw8gN27iTAia+UGHEtaQYBKn/
	it2OSSul7MQd5zH1w2JKg0M=
X-Google-Smtp-Source: AMsMyM6p8gWMfSJV3B4FCygHSVhBVqmPBmHt/1vOfGsiDEZrbQB9Ri2VCzj+jj+rqlXZpQV8lyJQow==
X-Received: by 2002:a63:4f08:0:b0:438:d81c:2d32 with SMTP id d8-20020a634f08000000b00438d81c2d32mr6218859pgb.411.1663364397672;
        Fri, 16 Sep 2022 14:39:57 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id y3-20020a17090a134300b001fe2ab750bbsm1949644pjf.29.2022.09.16.14.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 14:39:56 -0700 (PDT)
Message-ID: <4fadab02-5ab7-03d5-e849-55eaa26113cf@acm.org>
Date: Fri, 16 Sep 2022 14:39:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1] ufs: core: bypass get rpm when err handling with
 pm_op_in_progress
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220915115858.7642-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220915115858.7642-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_144001_594261_834FDCED 
X-CRM114-Status: GOOD (  11.36  )
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

On 9/15/22 04:58, peter.wang@mediatek.com wrote:
> -static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
> +static void ufshcd_err_handling_prepare(struct ufs_hba *hba, bool *rpm_put)
>   {
> -	ufshcd_rpm_get_sync(hba);
> +	if (!hba->pm_op_in_progress) {
> +		ufshcd_rpm_get_sync(hba);
> +		*rpm_put = true;
> +	}
> +

Hi Peter,

I don't think that this patch is sufficient. If 
ufshcd_err_handling_prepare() is called by the host reset handler 
(ufshcd_eh_host_reset_handler()) then the host state will be 
SHOST_RECOVERY. In that state SCSI command submission will hang and 
hence any ufshcd_rpm_get_sync() call will hang.

How about removing the ufshcd_rpm_get_sync() call from 
ufshcd_err_handling_prepare() and the ufshcd_rpm_put() call from 
ufshcd_err_handling_unprepare()? It is guaranteed that no commands are 
in progress for a runtime suspended LUN so the code for aborting pending 
requests in the UFS error handler will be skipped anyway if it is 
invoked for a runtime suspended device.

Thanks,

Bart.

