Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B7EC83F12
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34xysteFXtIeD/9v4k2P9zCOodV4mwgQ1ZAO+uSmcnQ=; b=SSigdLxUxzELDByGwO1PbRY6hI
	AAWMAF5V3DBrirE0cEzTTFuv7VCJHZl/1KzPvWbgVL6jiMZwAmJtImDXUhK4mFkbKqB0i0WXCSrTH
	IHveyHKykE4k6uWCzgVK8xlnWfXENPfk1Js81FVPC+6jNwguc+xYMCcibHV+D56Cwbb55mdhMRpUO
	jhUvi2rcCfyD/feBpT6B6dxz8T0g4HjWLjTZKUQIhIHDMYXSIL4sF63RVLBvfuBSVsf+n9XwymAuJ
	mdNLuXBl6tj3Ld73srlzL9rPOIk5tDKTEG18uOCcIIWigkhVI5AZAXOYv9IPyGCcMRiz0TC/rz8bD
	U4kjZLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2CX-00Bua8-2n;
	Tue, 29 Aug 2023 17:08:25 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2CV-00BuYQ-2e
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 17:08:25 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c504386374so3369596fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 10:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328900; x=1693933700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34xysteFXtIeD/9v4k2P9zCOodV4mwgQ1ZAO+uSmcnQ=;
        b=T5lNndTwwFaXzGkSX8TrFEK909ncx0YaKfwsYOQ2i/0ab2UD4QJQfC3SqTbj9tHGnW
         nqKxl6Vt/myjrb7ohCDfIjmct0p/9oHDvg5Rl2LWI6MEntCOSvNnwxOXhpLgCvFZOsVB
         xddCrUH7kdm3uZTY0Z+Gru8ZZWQfzlHzrWg7eYC7F1U7w7KJSvWSaLUdknqClq6JB0kq
         Oijw6sU7pAqxioy7/mISdbr3awJdTvFm7tey7GfTFijcKbYjsIUL6IDDHH9pDHul7XZ5
         KxN2r+Qim++MhMUeBLy9jacJiGgmxJZsU8+G/s4rAEZbvcDfHhaPmhRm0wnVchowLsrs
         Og4w==
X-Gm-Message-State: AOJu0YwzO89CWufMpPAAAXGAas6+hPPdmZj2Bxub2mz03V8bbl5K3OGA
	U25S/bdkKwWyrxMcmNtlM3M=
X-Google-Smtp-Source: AGHT+IHq3K+K7sMsWcudCmDgfnfRY6EhgE49ac9ZBemSBFawT7JhVsiceDdG9H7k/Pz+idVXEjtHoQ==
X-Received: by 2002:a05:6871:5214:b0:1c8:c27f:7dbb with SMTP id ht20-20020a056871521400b001c8c27f7dbbmr18790350oac.41.1693328899927;
        Tue, 29 Aug 2023 10:08:19 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001bf5e24b2a8sm9595806plf.174.2023.08.29.10.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:08:19 -0700 (PDT)
Message-ID: <0bff609c-48d7-482c-9cba-9643a5d33686@acm.org>
Date: Tue, 29 Aug 2023 10:08:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ufs: core: only suspend clock scaling if scale
 down
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com
References: <20230823092948.22734-1-peter.wang@mediatek.com>
 <20230823092948.22734-2-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_100823_858522_60448E00 
X-CRM114-Status: GOOD (  16.12  )
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

On 8/23/23 02:29, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> If clock scale up and suspend clock scaling, ufs will keep high
> performance/power mode but no read/write requests on going.
> It is logic wrong and have power concern.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 129446775796..e3672e55efae 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1458,7 +1458,7 @@ static int ufshcd_devfreq_target(struct device *dev,
>   		ktime_to_us(ktime_sub(ktime_get(), start)), ret);
>   
>   out:
> -	if (sched_clk_scaling_suspend_work)
> +	if (sched_clk_scaling_suspend_work && !scale_up)
>   		queue_work(hba->clk_scaling.workq,
>   			   &hba->clk_scaling.suspend_work);
>   

Is this perhaps the same patch as
https://lore.kernel.org/linux-scsi/20230801133458.6837-1-peter.wang@mediatek.com/ 
?

Thanks,

Bart.

