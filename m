Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC607C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:08:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F62B20780
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F62B20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Pa928+fcGqnV6N7b3c2CCxeorxnz8uYk4JJD2OArww=; b=ZYypHDHwXm+2/D1zlzWBi0uO3
	vgSEZ26GqA/lEswfyxQKjugTrxWmq3Z6pIAlZ1mfCsiQYtpTdDEiHr2DgKw8j64V0tc3XUbXKQckY
	EH7jgBUW0ISfLJ10Puvaan845+/VB29d+u80+QBdqDRAZJs7+c/yo/dqbdHKJlZXeDDgAaON2Mchs
	xEcZSb9kGzLZ8srrT0p4qycMQPqMLSnJb6vrnakxqwgPqtfkO9IcB9tbLMkmxMs9EUPl03sX5QKg2
	k2Bf/K4BYO1uKMyN93N2qxHH/Fe11/WdTQDKKEuVttFWKuZ9oMNnf0r21TqibhQ1gQdDcylgUq3BX
	g64hSY5tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq8wV-0005qk-FJ; Fri, 18 Dec 2020 06:08:43 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq8wS-0005pW-US
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:08:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608271718; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uS4mzlo3uSd6U8vrzsDXSBBTfBn/BjCQj5rxsqIrlfA=;
 b=OQk5oJQzyNQET3zekE7Fg9esiQx6nx+3DBgvh2bofx3RITuDjoWUUrB5yWN5ynb1KSxRWm62
 VMtSx95D5AOWFIG/v2cNOfPKRD5cbTiF1FrRlp0ZOoP5upt9AzzE0VWs/6c8LAbQRDua/7GX
 8iujAuLFDBpNteYbNJFW8zdOsXo=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fdc47653d3433393d77ff2d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:08:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7B51C433ED; Fri, 18 Dec 2020 06:08:37 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3600C433CA;
 Fri, 18 Dec 2020 06:08:35 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:08:35 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 1/4] scsi: ufs: Refactor cancelling clkscaling works
In-Reply-To: <20201216131639.4128-2-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <20201216131639.4128-2-stanley.chu@mediatek.com>
Message-ID: <0a96e3c62a0a77c78285fe92f2db2cd3@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_010841_023729_7A1CA031 
X-CRM114-Status: GOOD (  14.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 21:16, Stanley Chu wrote:
> Cancelling suspend_work and resume_work is only required while
> suspending clk-scaling. Thus moving these two invokes into
> ufshcd_suspend_clkscaling() function.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 052479a56a6f..a91b73a1fc48 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1451,6 +1451,9 @@ static void ufshcd_suspend_clkscaling(struct 
> ufs_hba *hba)
>  	if (!ufshcd_is_clkscaling_supported(hba))
>  		return;
> 
> +	cancel_work_sync(&hba->clk_scaling.suspend_work);
> +	cancel_work_sync(&hba->clk_scaling.resume_work);
> +
>  	spin_lock_irqsave(hba->host->host_lock, flags);
>  	if (!hba->clk_scaling.is_suspended) {
>  		suspend = true;
> @@ -1514,9 +1517,6 @@ static ssize_t
> ufshcd_clkscale_enable_store(struct device *dev,
>  	pm_runtime_get_sync(hba->dev);
>  	ufshcd_hold(hba, false);
> 
> -	cancel_work_sync(&hba->clk_scaling.suspend_work);
> -	cancel_work_sync(&hba->clk_scaling.resume_work);
> -
>  	if (value) {
>  		ufshcd_resume_clkscaling(hba);
>  	} else {
> @@ -5663,11 +5663,8 @@ static void ufshcd_err_handling_prepare(struct
> ufs_hba *hba)
>  		ufshcd_vops_resume(hba, UFS_RUNTIME_PM);
>  	} else {
>  		ufshcd_hold(hba, false);
> -		if (hba->clk_scaling.is_enabled) {
> -			cancel_work_sync(&hba->clk_scaling.suspend_work);
> -			cancel_work_sync(&hba->clk_scaling.resume_work);
> +		if (hba->clk_scaling.is_enabled)
>  			ufshcd_suspend_clkscaling(hba);
> -		}
>  	}
>  	down_write(&hba->clk_scaling_lock);
>  	hba->clk_scaling.is_allowed = false;
> @@ -8512,11 +8509,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	ufshcd_hold(hba, false);
>  	hba->clk_gating.is_suspended = true;
> 
> -	if (hba->clk_scaling.is_enabled) {
> -		cancel_work_sync(&hba->clk_scaling.suspend_work);
> -		cancel_work_sync(&hba->clk_scaling.resume_work);
> +	if (hba->clk_scaling.is_enabled)
>  		ufshcd_suspend_clkscaling(hba);
> -	}
> +
>  	down_write(&hba->clk_scaling_lock);
>  	hba->clk_scaling.is_allowed = false;
>  	up_write(&hba->clk_scaling_lock);

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
