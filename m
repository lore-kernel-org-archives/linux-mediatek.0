Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C71C83F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g0z4vCZFb+xWLqle7EKEHd+VDY8EWLsCC+AfA6tqOs=; b=nQKU01NHv8AupUm6550vNo36Mi
	c4lZ0ZONgSGDzqjKXH9uOJFstVkfYH4oJ5FS8n62T3jcwfgTo+WYnYkbXx+x6wLNPC+OtOQtQZdNa
	fo0JmGxQ9A0NvWLPfftVR1Oij7AzB66kO5Xe5AAGxANivJabcA+xVgeSoc3p0w/8tvvGpbMhdfgX+
	9ILd2oLclKtd0q3EhC8fCZxD/6f1G5sa0Z6z5TziFH+SS3yoqzpdCfw6m/TcF9m6mCDVXdUq3tMJP
	Iwevfmegwga7VXkskBvNfspJDpuaY6P7kHVtH+0obnp846MCszZ0Re0Vtgr2lF9u0wAGUgogl+p+z
	KrlOlc6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb28r-00Bu6U-33;
	Tue, 29 Aug 2023 17:04:37 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb28p-00Bu4q-04
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 17:04:36 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdc19b782aso29322295ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 10:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693328668; x=1693933468;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2g0z4vCZFb+xWLqle7EKEHd+VDY8EWLsCC+AfA6tqOs=;
        b=XPV46CERuyRAMaB1DRd36pd868TG1Bz6AqFOSbbX/B1gmoZXPdjNhlLLZn33kLwvqt
         neXZOLxXU0vADNm0DxHzf+CNL/3S1UW5bUBjRrxrtVw591kTI+s+GH38IiT3kBKQ8wZP
         F7t5GbDfq2rZqkYXXKEWdUSNgnfh9wGosZGn6SBPJeJr7GhDKU4k2YGCpwMcMy4/lXSy
         fePnsoMZ3mw974XypR8t4JZj6IOjNgEEL7f6i6ivLxUIgprvLVliQuxOnc5qQcAxKnn6
         Tp9Kkq1XtQ4KBeuhcAyZhTEftO2M+TZizIjxlunGf3FD72rzsIuhCRbNtV04/XaK1KL9
         TijQ==
X-Gm-Message-State: AOJu0Yz9iNyv2SJEYICsuqsP2SpMhyrCM8BLZpCQRTP/d8o+qIqVTvP/
	WULltdMpYDiFMFzeGDEDEpQ=
X-Google-Smtp-Source: AGHT+IHiJckEqm4LFnNq/w9OvpLfNZxILPMYlHefKaZGTyCwiwalEX9NdlsSYfbsRNeAcP+QUiKe6Q==
X-Received: by 2002:a17:902:c945:b0:1b8:78e:7c1 with SMTP id i5-20020a170902c94500b001b8078e07c1mr31350884pla.51.1693328667919;
        Tue, 29 Aug 2023 10:04:27 -0700 (PDT)
Received: from [172.20.4.71] ([208.98.210.70])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001bf5e24b2a8sm9595806plf.174.2023.08.29.10.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:04:27 -0700 (PDT)
Message-ID: <468fb5a4-32d5-42a7-b00f-115044954125@acm.org>
Date: Tue, 29 Aug 2023 10:04:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ufs: core: fix abnormal scale up after last cmd
 finish
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
 <20230823092948.22734-3-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230823092948.22734-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_100435_063285_F08C07C2 
X-CRM114-Status: GOOD (  16.16  )
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
> When ufshcd_clk_scaling_suspend_work(Thread A) running and new command
> coming, ufshcd_clk_scaling_start_busy(Thread B) may get host_lock
> after Thread A first time release host_lock. Then Thread A second time
> get host_lock will set clk_scaling.window_start_t = 0 which scale up
> clock abnormal next polling_ms time.
> 
> Below is racing step:
> 1	hba->clk_scaling.suspend_work (Thread A)
> 	ufshcd_clk_scaling_suspend_work
> 2		spin_lock_irqsave(hba->host->host_lock, irq_flags);
> 3		hba->clk_scaling.is_suspended = true;
> 4		spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
> 		__ufshcd_suspend_clkscaling
> 7			spin_lock_irqsave(hba->host->host_lock, flags);
> 8			hba->clk_scaling.window_start_t = 0;
> 9			spin_unlock_irqrestore(hba->host->host_lock, flags);
> 
> 	ufshcd_send_command (Thread B)
> 		ufshcd_clk_scaling_start_busy
> 5			spin_lock_irqsave(hba->host->host_lock, flags);
> 			....
> 6			spin_unlock_irqrestore(hba->host->host_lock, flags);
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index e3672e55efae..017f32b3a789 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1385,9 +1385,10 @@ static void ufshcd_clk_scaling_suspend_work(struct work_struct *work)
>   		return;
>   	}
>   	hba->clk_scaling.is_suspended = true;
> +	hba->clk_scaling.window_start_t = 0;
>   	spin_unlock_irqrestore(hba->host->host_lock, irq_flags);
>   
> -	__ufshcd_suspend_clkscaling(hba);
> +	devfreq_suspend_device(hba->devfreq);
>   }
>   
>   static void ufshcd_clk_scaling_resume_work(struct work_struct *work)

There is a second __ufshcd_suspend_clkscaling() call in the same source
file. Please fix that call too.

Thanks,

Bart.

