Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8FDC433EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C2B2221F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pe9h4kzf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="pp5Frewz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C2B2221F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RHthjZlx35p1SvCfFrD1lRUdMVRSwzvFjjJ677PKnA0=; b=pe9h4kzfSK4UP9wG8lJJkGcfE
	mrjKQUbpEBG3Eb2gE0yla2wrLb/Bu70HzaiW0khXriBBwgWWYIvVi6GZoIXVSHx49W1rREUxF2mDR
	e0bgEnaTXb8DAMH4nWxvwbTUMTxCI8B9I8NgvnGXgSwvLtLzQK1U5Wx1d2vb7uYMd3BV+tPjLYPIk
	QtE5irvCD+OQqsf7PX5UH3qNmZy1uql6unIRmlo7jrpuG1yxUOm2wrAsuD6jABskDYkY9bQ2c3iCb
	VQvUeOUdlMkMLqL/xbAHXqg4YQGZHd7LkZ98CHJU7XLANjA+LiYJ745/J9PpViFubnxUgmEE2tllY
	m8FVrsJrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvH6P-0006Wp-JF; Tue, 14 Jul 2020 09:19:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvH6J-0006V8-BN
 for linux-mediatek@lists.infradead.org; Tue, 14 Jul 2020 09:19:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594718389; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zlrj8wHvZscOUM1wkDSJh1QyspQdZdaCu/BwRVbN4oA=;
 b=pp5FrewzITeTY2lZs91nWqYw8ED4gTf9jvQ0DWEuWstfkOTmDY/aBWC7FZLRr8kqpqdN7EyN
 kPX2pVa/rIr3PLb+RFUZIcVUgl2BfePcTj3vPj0uQso+c1+8BOP5PUJl7gR2X5wlV+UBEPEq
 GxkeHjoK9ExxcGoBOJMplL7boq4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f0d78a3427cd55766be833b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 14 Jul 2020 09:19:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 87B6AC43391; Tue, 14 Jul 2020 09:19:30 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B8FAAC433CA;
 Tue, 14 Jul 2020 09:19:29 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 17:19:29 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 2/2] scsi: ufs: Fix and simplify setup_xfer_req variant
 operation
In-Reply-To: <20200706060707.32608-3-stanley.chu@mediatek.com>
References: <20200706060707.32608-1-stanley.chu@mediatek.com>
 <20200706060707.32608-3-stanley.chu@mediatek.com>
Message-ID: <74cc1ad32c414762ab5d18ed8b46c26a@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_051949_252576_B9AA3E07 
X-CRM114-Status: GOOD (  13.16  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, cc.chou@mediatek.com,
 linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-07-06 14:07, Stanley Chu wrote:
> Add missing "setup_xfer_req" call in ufshcd_issue_devman_upiu_cmd()
> by ufs-bsg path, and collect all "setup_xfer_req" calls to an unified
> place, i.e., ufshcd_send_command(), to simplify the driver.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: Can Guo <cang@codeaurora.org>

> ---
>  drivers/scsi/ufs/ufshcd.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 71e8d7c782bd..8603b07045a6 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -1925,8 +1925,11 @@ static void
> ufshcd_clk_scaling_update_busy(struct ufs_hba *hba)
>  static inline
>  void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
>  {
> -	hba->lrb[task_tag].issue_time_stamp = ktime_get();
> -	hba->lrb[task_tag].compl_time_stamp = ktime_set(0, 0);
> +	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
> +
> +	lrbp->issue_time_stamp = ktime_get();
> +	lrbp->compl_time_stamp = ktime_set(0, 0);
> +	ufshcd_vops_setup_xfer_req(hba, task_tag, (lrbp->cmd ? true : 
> false));
>  	ufshcd_add_command_trace(hba, task_tag, "send");
>  	ufshcd_clk_scaling_start_busy(hba);
>  	__set_bit(task_tag, &hba->outstanding_reqs);
> @@ -2544,7 +2547,6 @@ static int ufshcd_queuecommand(struct Scsi_Host
> *host, struct scsi_cmnd *cmd)
> 
>  	/* issue command to the controller */
>  	spin_lock_irqsave(hba->host->host_lock, flags);
> -	ufshcd_vops_setup_xfer_req(hba, tag, true);
>  	ufshcd_send_command(hba, tag);
>  out_unlock:
>  	spin_unlock_irqrestore(hba->host->host_lock, flags);
> @@ -2731,7 +2733,6 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba 
> *hba,
>  	/* Make sure descriptors are ready before ringing the doorbell */
>  	wmb();
>  	spin_lock_irqsave(hba->host->host_lock, flags);
> -	ufshcd_vops_setup_xfer_req(hba, tag, false);
>  	ufshcd_send_command(hba, tag);
>  	spin_unlock_irqrestore(hba->host->host_lock, flags);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
