Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E98C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:16:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050FE2151B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050FE2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/XXhdOWXZECxgr1Wf70MOh4htT0pEdZzAjjGwYx2sk=; b=N2uuI7gaKjlwBFr/HfraeAHep
	9sR3bjMyHD0C4s2XIODCEWA5EMdFBJIPgNsSxTxqvWUqUdMQNaF7PxYjKhqh4uUWTvBx6U65l7GgV
	AccdZ1TP7de2T+YD9X4NdsgOdHQSrpONLy0Rp13e48vWLFvVEJ6VloHuTb4/WwZOmgL4Ii87p2Zdh
	FyTmWmBF9QMCIa67kQuEL8HB2FFtvr+O3YTcn7IIvFNRK0NrypTJrlIUI1DlLnaC9EQeuTq/Pnf/m
	gvp7hoEidCP3RaqrJSIM6b0nIINQfmk0j70udF+XKtjZJ6JRyO77hsAlrQa6qohVn/7b9TlWU/fpX
	hvCnP1rdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq93p-0006fq-Vu; Fri, 18 Dec 2020 06:16:18 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq93m-0006fS-V5
 for linux-mediatek@lists.infradead.org; Fri, 18 Dec 2020 06:16:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608272175; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LTW17UsHmSpSoJcBXlNHnM6V9HWBmm35DKkl0BCtoaM=;
 b=SA4hn7vNrY9Ed/lPWz/5fL8kyMEHPNpk9Xzn9+rdTsruIb8TDauAAsNUCKBTqAi83R/FaIiZ
 xQpkPqC1pEFwU6DPcKrUWS6iSbfcY6ZyVRrxQ8k4ODobNol5A460xBiqyZVFlA/2G+FCbukC
 yBsz56ZDMsRhplSwWcyDcn9P1oQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fdc492b031793dcb4f0e897 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 06:16:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 499C8C433C6; Fri, 18 Dec 2020 06:16:11 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70198C433CA;
 Fri, 18 Dec 2020 06:16:09 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 14:16:09 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 3/4] scsi: ufs: Cleanup and refactor clk-scaling feature
In-Reply-To: <20201216131639.4128-4-stanley.chu@mediatek.com>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <20201216131639.4128-4-stanley.chu@mediatek.com>
Message-ID: <cda3a961b396c48e95b32dd70961ef1b@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_011615_999728_0B944958 
X-CRM114-Status: GOOD (  17.12  )
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
> Manipulate clock scaling related stuff only if the host capability
> supports clock scaling feature to avoid redundant code execution.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 64 ++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 9cc16598136d..ce0528f2e2ed 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1448,9 +1448,6 @@ static void ufshcd_suspend_clkscaling(struct 
> ufs_hba *hba)
>  	unsigned long flags;
>  	bool suspend = false;
> 
> -	if (!ufshcd_is_clkscaling_supported(hba))
> -		return;
> -
>  	cancel_work_sync(&hba->clk_scaling.suspend_work);
>  	cancel_work_sync(&hba->clk_scaling.resume_work);
> 
> @@ -1470,9 +1467,6 @@ static void ufshcd_resume_clkscaling(struct 
> ufs_hba *hba)
>  	unsigned long flags;
>  	bool resume = false;
> 
> -	if (!ufshcd_is_clkscaling_supported(hba))
> -		return;
> -
>  	spin_lock_irqsave(hba->host->host_lock, flags);
>  	if (hba->clk_scaling.is_suspended) {
>  		resume = true;
> @@ -5642,6 +5636,26 @@ static inline void
> ufshcd_schedule_eh_work(struct ufs_hba *hba)
>  	}
>  }
> 
> +static void ufshcd_clk_scaling_allow(struct ufs_hba *hba, bool allow)
> +{
> +	down_write(&hba->clk_scaling_lock);
> +	hba->clk_scaling.is_allowed = allow;
> +	up_write(&hba->clk_scaling_lock);
> +}
> +
> +static void ufshcd_clk_scaling_suspend(struct ufs_hba *hba, bool 
> suspend)
> +{
> +	if (suspend) {
> +		if (hba->clk_scaling.is_enabled)
> +			ufshcd_suspend_clkscaling(hba);
> +		ufshcd_clk_scaling_allow(hba, false);
> +	} else {
> +		ufshcd_clk_scaling_allow(hba, true);
> +		if (hba->clk_scaling.is_enabled)
> +			ufshcd_resume_clkscaling(hba);
> +	}
> +}
> +
>  static void ufshcd_err_handling_prepare(struct ufs_hba *hba)
>  {
>  	pm_runtime_get_sync(hba->dev);
> @@ -5663,23 +5677,20 @@ static void ufshcd_err_handling_prepare(struct
> ufs_hba *hba)
>  		ufshcd_vops_resume(hba, UFS_RUNTIME_PM);
>  	} else {
>  		ufshcd_hold(hba, false);
> -		if (hba->clk_scaling.is_enabled)
> +		if (ufshcd_is_clkscaling_supported(hba) &&
> +		    hba->clk_scaling.is_enabled)
>  			ufshcd_suspend_clkscaling(hba);
>  	}
> -	down_write(&hba->clk_scaling_lock);
> -	hba->clk_scaling.is_allowed = false;
> -	up_write(&hba->clk_scaling_lock);
> +	ufshcd_clk_scaling_allow(hba, false);
>  }
> 
>  static void ufshcd_err_handling_unprepare(struct ufs_hba *hba)
>  {
>  	ufshcd_release(hba);
> 
> -	down_write(&hba->clk_scaling_lock);
> -	hba->clk_scaling.is_allowed = true;
> -	up_write(&hba->clk_scaling_lock);
> -	if (hba->clk_scaling.is_enabled)
> -		ufshcd_resume_clkscaling(hba);
> +	if (ufshcd_is_clkscaling_supported(hba))
> +		ufshcd_clk_scaling_suspend(hba, false);
> +
>  	pm_runtime_put(hba->dev);
>  }
> 
> @@ -8507,12 +8518,8 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	ufshcd_hold(hba, false);
>  	hba->clk_gating.is_suspended = true;
> 
> -	if (hba->clk_scaling.is_enabled)
> -		ufshcd_suspend_clkscaling(hba);
> -
> -	down_write(&hba->clk_scaling_lock);
> -	hba->clk_scaling.is_allowed = false;
> -	up_write(&hba->clk_scaling_lock);
> +	if (ufshcd_is_clkscaling_supported(hba))
> +		ufshcd_clk_scaling_suspend(hba, true);
> 
>  	if (req_dev_pwr_mode == UFS_ACTIVE_PWR_MODE &&
>  			req_link_state == UIC_LINK_ACTIVE_STATE) {
> @@ -8618,11 +8625,9 @@ static int ufshcd_suspend(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
>  	if (!ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE))
>  		ufshcd_disable_auto_bkops(hba);
>  enable_gating:
> -	down_write(&hba->clk_scaling_lock);
> -	hba->clk_scaling.is_allowed = true;
> -	up_write(&hba->clk_scaling_lock);
> -	if (hba->clk_scaling.is_enabled)
> -		ufshcd_resume_clkscaling(hba);
> +	if (ufshcd_is_clkscaling_supported(hba))
> +		ufshcd_clk_scaling_suspend(hba, false);
> +
>  	hba->clk_gating.is_suspended = false;
>  	hba->dev_info.b_rpm_dev_flush_capable = false;
>  	ufshcd_release(hba);
> @@ -8719,11 +8724,8 @@ static int ufshcd_resume(struct ufs_hba *hba,
> enum ufs_pm_op pm_op)
> 
>  	hba->clk_gating.is_suspended = false;
> 
> -	down_write(&hba->clk_scaling_lock);
> -	hba->clk_scaling.is_allowed = true;
> -	up_write(&hba->clk_scaling_lock);
> -	if (hba->clk_scaling.is_enabled)
> -		ufshcd_resume_clkscaling(hba);
> +	if (ufshcd_is_clkscaling_supported(hba))
> +		ufshcd_clk_scaling_suspend(hba, false);
> 
>  	/* Enable Auto-Hibernate if configured */
>  	ufshcd_auto_hibern8_enable(hba);

Thanks for the cleanup

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
