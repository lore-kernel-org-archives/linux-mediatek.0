Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FD3C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 18:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6626120746
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 18:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BFKicqFn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="P8Qwb/7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6626120746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wjRZqcfjI+vo9qg+SBr636KqxNNIHboPxbrycXXvsPI=; b=BFKicqFn7BF36I5Zk+d15OrZy
	oyXwVH+O1itTfR1d/fVoYc1rdHOtzMSnhtO7hk2f8z+BVwv9mYYlFQHEM4AgrkgtkFGrNGeGvsueR
	WfyFLw2CPi9qw9Jl2hkKOjuxHy9Gv9ErzoskUKtKPW5gUm6zkXi/Mnvw1uOoTcU35XOKsMYya3c06
	yXvQIUfOpPkxyKXB4jgq5HvNISIB61uZP2mTHg4/7cWB2leKmrDNhPZY4sDtBbjH0wn3aKwgTxZrY
	pfLuEmQf2s9lgFadyE/q7jWngmY37BcOLulBQDFTT/D6QbTkywutMgVpAdtr65gT5B2secQx4+kPf
	jPU+FxAJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX7UY-0004OS-DC; Fri, 08 May 2020 18:12:58 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX7U8-0003z0-V1
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 18:12:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588961554; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=wPiyQjSJF8vUdRxJrjwFgYJTIXhq+dC/nAsEoueYbiA=;
 b=P8Qwb/7mQf4LJMQpSpqJ+bkCnTzHpDT38Ijj4qb4VEcWYoofcmIW5PLRbe6HOpun7lyUZO5O
 Rcklyc4rjHOLGERpGPhbj9P36hvD7EEte+5LJFOiJ8t8IyxMZAymZ5vMx/bKA5qUlVZ0nMEU
 pQEPP96qF/GfbSoljLFlLEc4AeE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb5a10a.7f0590c69618-smtp-out-n01;
 Fri, 08 May 2020 18:12:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A759AC433BA; Fri,  8 May 2020 18:12:25 +0000 (UTC)
Received: from [192.168.8.176] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B44CC433D2;
 Fri,  8 May 2020 18:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B44CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 3/5] scsi: ufs: customize flush threshold for
 WriteBooster
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200508171513.14665-1-stanley.chu@mediatek.com>
 <20200508171513.14665-4-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <4196ff98-093e-3708-d166-a7a7c6046c57@codeaurora.org>
Date: Fri, 8 May 2020 11:12:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508171513.14665-4-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_111234_767961_20FABA21 
X-CRM114-Status: GOOD (  20.67  )
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

On 5/8/2020 10:15 AM, Stanley Chu wrote:
> Allow flush threshold for WriteBooster to be customizable by
> vendors. To achieve this, make the value as a variable in struct
> ufs_hba first.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/scsi/ufs/ufshcd.c | 6 ++++--
>   drivers/scsi/ufs/ufshcd.h | 1 +
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index cdacbe6378a1..9a0ce6550c2f 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -5301,8 +5301,8 @@ static bool ufshcd_wb_presrv_usrspc_keep_vcc_on(struct ufs_hba *hba,
>   			 cur_buf);
>   		return false;
>   	}
> -	/* Let it continue to flush when >60% full */
> -	if (avail_buf < UFS_WB_40_PERCENT_BUF_REMAIN)
> +	/* Let it continue to flush when available buffer exceeds threshold */
> +	if (avail_buf < hba->vps->wb_flush_threshold)
>   		return true;
>   
>   	return false;
> @@ -6839,6 +6839,7 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
>   		if (!d_lu_wb_buf_alloc)
>   			goto wb_disabled;
>   	}
> +
Is this newline needed?

>   	return;
>   
>   wb_disabled:
> @@ -7462,6 +7463,7 @@ static const struct attribute_group *ufshcd_driver_groups[] = {
>   
>   static struct ufs_hba_variant_params ufs_hba_vps = {
>   	.hba_enable_delay_us		= 1000,
> +	.wb_flush_threshold		= UFS_WB_40_PERCENT_BUF_REMAIN,
>   	.devfreq_profile.polling_ms	= 100,
>   	.devfreq_profile.target		= ufshcd_devfreq_target,
>   	.devfreq_profile.get_dev_status	= ufshcd_devfreq_get_dev_status,
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index f7bdf52ba8b0..e3dfb48e669e 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -570,6 +570,7 @@ struct ufs_hba_variant_params {
>   	struct devfreq_dev_profile devfreq_profile;
>   	struct devfreq_simple_ondemand_data ondemand_data;
>   	u16 hba_enable_delay_us;
> +	u32 wb_flush_threshold;
>   };
>   
>   /**
> 

Patch[3] & [4] may be combined into a single patch perhaps?
Patch[4] just redoes what [3] did in a different way, so might as well 
just do what patch[4] does right away.


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
