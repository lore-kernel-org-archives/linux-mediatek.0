Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2C3C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 16:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C9AE21473
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 16:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQ2TsoZq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="pc+tlIHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C9AE21473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Oh/bkxku1LtXYUdp7S9qU+o8M/3UCQMSzhtFsYHtsU=; b=CQ2TsoZqQpBpwrun81g5VN+IV
	MAeDVz8p01L1pn7uD/jSmw2h+xSt89V5inMcB+sXkM2kuLXFZGCqqgIQCr1S7GeWLhrCjxSZdQuR/
	WsdvAQ0oOjilu34/qI1n0n8hTWnmdjxSQGWdYwmzNlXpfdZ+S0+l4O2iSTtRs8Jx2lvwoPqSvpqXV
	5w5aHaxQX8vi4BlROISTdgpKFF0UGqDLYw1rh0/zqVikX0Oc1Ei2GgtpiB7go9QbB+LyHOXu0u4CJ
	cLyGPn5pD+oHn9YRK7QtcAwQLo2Va/n1xw/eVP+1siZEhhIWSvoW/6rPrDXSlFyT9i/NI18pWnZ+j
	mx6pIWd6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX5j2-0005Wl-0I; Fri, 08 May 2020 16:19:48 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX5iu-0005Pm-2j
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 16:19:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588954781; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Sehda5KYpri+SgmjTuPUNWxcMIV/yX17URV1EJd8KjM=;
 b=pc+tlIHmWL/2QxxJN2OeZhMjGI44jkIkRN5hF2QahzEtCzCXPp/hxNkfw9diGjdB5DVLJVQQ
 i5zDo0dG5J5MLNRPvfjaCbYHDgiy9tHpr1cYVMtY/CIj+OKD9qqcvwZCVUrkYg2uAXvZEEpe
 m5smKv35FDqJWKB5igv32pDojS8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb5868d.7f9bac6812d0-smtp-out-n01;
 Fri, 08 May 2020 16:19:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 07043C43636; Fri,  8 May 2020 16:19:24 +0000 (UTC)
Received: from [192.168.8.176] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CCDF0C433D2;
 Fri,  8 May 2020 16:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCDF0C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v8 8/8] scsi: ufs: cleanup WriteBooster feature
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200508080115.24233-1-stanley.chu@mediatek.com>
 <20200508080115.24233-9-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <ca589cd1-bf28-7227-02d7-1c7789f6f6e9@codeaurora.org>
Date: Fri, 8 May 2020 09:19:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508080115.24233-9-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_091941_450173_DAB3D979 
X-CRM114-Status: GOOD (  21.37  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/8/2020 1:01 AM, Stanley Chu wrote:
> Small cleanup as below items,
> 
> 1. Use ufshcd_is_wb_allowed() directly instead of ufshcd_wb_sup()
>     since ufshcd_wb_sup() just returns the result of
>     ufshcd_is_wb_allowed().
> 
> 2. In ufshcd_suspend(), "else if (!ufshcd_is_runtime_pm(pm_op))
>     can be simplified to "else" since both have the same meaning.
> 
> This patch does not change any functionality.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Avri Altman <avri.altman@wdc.com>
> ---

The whole series looks good to me.

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

>   drivers/scsi/ufs/ufshcd.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index b6a0d77d47ac..426073a518ef 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -253,7 +253,6 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, bool scale_up);
>   static irqreturn_t ufshcd_intr(int irq, void *__hba);
>   static int ufshcd_change_power_mode(struct ufs_hba *hba,
>   			     struct ufs_pa_layer_attr *pwr_mode);
> -static bool ufshcd_wb_sup(struct ufs_hba *hba);
>   static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba);
>   static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba);
>   static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable);
> @@ -285,7 +284,7 @@ static inline void ufshcd_wb_config(struct ufs_hba *hba)
>   {
>   	int ret;
>   
> -	if (!ufshcd_wb_sup(hba))
> +	if (!ufshcd_is_wb_allowed(hba))
>   		return;
>   
>   	ret = ufshcd_wb_ctrl(hba, true);
> @@ -5197,18 +5196,13 @@ static void ufshcd_bkops_exception_event_handler(struct ufs_hba *hba)
>   				__func__, err);
>   }
>   
> -static bool ufshcd_wb_sup(struct ufs_hba *hba)
> -{
> -	return ufshcd_is_wb_allowed(hba);
> -}
> -
>   static int ufshcd_wb_ctrl(struct ufs_hba *hba, bool enable)
>   {
>   	int ret;
>   	u8 index;
>   	enum query_opcode opcode;
>   
> -	if (!ufshcd_wb_sup(hba))
> +	if (!ufshcd_is_wb_allowed(hba))
>   		return 0;
>   
>   	if (!(enable ^ hba->wb_enabled))
> @@ -5264,7 +5258,7 @@ static int ufshcd_wb_buf_flush_enable(struct ufs_hba *hba)
>   	int ret;
>   	u8 index;
>   
> -	if (!ufshcd_wb_sup(hba) || hba->wb_buf_flush_enabled)
> +	if (!ufshcd_is_wb_allowed(hba) || hba->wb_buf_flush_enabled)
>   		return 0;
>   
>   	index = ufshcd_wb_get_flag_index(hba);
> @@ -5286,7 +5280,7 @@ static int ufshcd_wb_buf_flush_disable(struct ufs_hba *hba)
>   	int ret;
>   	u8 index;
>   
> -	if (!ufshcd_wb_sup(hba) || !hba->wb_buf_flush_enabled)
> +	if (!ufshcd_is_wb_allowed(hba) || !hba->wb_buf_flush_enabled)
>   		return 0;
>   
>   	index = ufshcd_wb_get_flag_index(hba);
> @@ -5336,7 +5330,7 @@ static bool ufshcd_wb_keep_vcc_on(struct ufs_hba *hba)
>   	int ret;
>   	u32 avail_buf;
>   
> -	if (!ufshcd_wb_sup(hba))
> +	if (!ufshcd_is_wb_allowed(hba))
>   		return false;
>   	/*
>   	 * The ufs device needs the vcc to be ON to flush.
> @@ -8235,12 +8229,12 @@ static int ufshcd_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>   		 * configured WB type is 70% full, keep vcc ON
>   		 * for the device to flush the wb buffer
>   		 */
> -		if ((hba->auto_bkops_enabled && ufshcd_wb_sup(hba)) ||
> +		if ((hba->auto_bkops_enabled && ufshcd_is_wb_allowed(hba)) ||
>   		    ufshcd_wb_keep_vcc_on(hba))
>   			hba->dev_info.keep_vcc_on = true;
>   		else
>   			hba->dev_info.keep_vcc_on = false;
> -	} else if (!ufshcd_is_runtime_pm(pm_op)) {
> +	} else {
>   		hba->dev_info.keep_vcc_on = false;
>   	}
>   
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
