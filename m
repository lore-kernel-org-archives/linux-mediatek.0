Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32AC1975A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 17:34:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF5CD20716
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 17:34:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4Xk+uqR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dcusUA+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF5CD20716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Pezp0B4fwCZt1NdR3gxoo62N0P94S0+zGiORpbUA+A=; b=o4Xk+uqRk+pYc/yfVCYVKSO79
	/A+GdF8GGJZy4Kew4u2+KX4BY+BBwK/AD6UDR7c8JRGkt7ClnlmYGZeSA7/fbOTVtC8jVDxR5SjqA
	zxio9PFtVSySb1JJAKAoDzAQlssdq/uDtZ/KkE8QaJmMKBI9Oesn9mobf5phPYe7KK+bmtKtrhjXC
	1+/+Yvs0K3QyQMv6l0YKKicck2Ktafct+qCfg1ciXYIE0i949vcMScRNMo12Y1CprKRcy/tfEFkjZ
	WIKIcv6YWHz2BoxbgfFsCfwtO6M9/LvTB7ABjav8YSUPhjUULeM8GUNz53ka4HFq/Lvngnuj9WqIa
	T/AZ8OYiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCRir-0001Is-UB; Thu, 12 Mar 2020 17:34:17 +0000
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCRim-0001Ho-G8
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 17:34:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584034455; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Yv5Z2WSkUNGiz0RnTA13WsE0rkZ/Ii3R3mKkEmh3yWY=;
 b=dcusUA+ku9pMB7Z+tOcyUERIPK+33BH7Wm0pTzezL+FUOiAQ3/QJn+2dkVSjivX3HprD+lZj
 /pw/f0l3HOx/gM8UrrFkezAN/JyyMGk1iA7xVMFdANjv8IG3thQjcWQkJMLW9Ly1hYIyVc8f
 HCfS2aocf6njnVAQOcoX4+NLdlE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6a727d.7f52d794b2d0-smtp-out-n01;
 Thu, 12 Mar 2020 17:33:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3D579C433BA; Thu, 12 Mar 2020 17:33:49 +0000 (UTC)
Received: from [10.46.161.159] (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 68064C433D2;
 Thu, 12 Mar 2020 17:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68064C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v2 2/8] scsi: ufs: remove init_prefetch_data in struct
 ufs_hba
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200312110908.14895-1-stanley.chu@mediatek.com>
 <20200312110908.14895-3-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <2e958801-81f0-d650-cad3-ada0b04ac972@codeaurora.org>
Date: Thu, 12 Mar 2020 10:33:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312110908.14895-3-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_103415_446824_9A912174 
X-CRM114-Status: GOOD (  18.73  )
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

On 3/12/2020 4:09 AM, Stanley Chu wrote:
> Struct init_prefetch_data currently is used privately in
> ufshcd_init_icc_levels(), thus it can be removed from struct ufs_hba.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---

Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
>   drivers/scsi/ufs/ufshcd.c | 15 ++++++---------
>   drivers/scsi/ufs/ufshcd.h | 11 -----------
>   2 files changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 314e808b0d4e..b4988b9ee36c 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6501,6 +6501,7 @@ static void ufshcd_init_icc_levels(struct ufs_hba *hba)
>   {
>   	int ret;
>   	int buff_len = hba->desc_size.pwr_desc;
> +	u32 icc_level;
>   	u8 *desc_buf;
>   
>   	desc_buf = kmalloc(buff_len, GFP_KERNEL);
> @@ -6516,21 +6517,17 @@ static void ufshcd_init_icc_levels(struct ufs_hba *hba)
>   		goto out;
>   	}
>   
> -	hba->init_prefetch_data.icc_level =
> -			ufshcd_find_max_sup_active_icc_level(hba,
> -			desc_buf, buff_len);
> -	dev_dbg(hba->dev, "%s: setting icc_level 0x%x",
> -			__func__, hba->init_prefetch_data.icc_level);
> +	icc_level =
> +		ufshcd_find_max_sup_active_icc_level(hba, desc_buf, buff_len);
> +	dev_dbg(hba->dev, "%s: setting icc_level 0x%x",	__func__, icc_level);
>   
>   	ret = ufshcd_query_attr_retry(hba, UPIU_QUERY_OPCODE_WRITE_ATTR,
> -		QUERY_ATTR_IDN_ACTIVE_ICC_LVL, 0, 0,
> -		&hba->init_prefetch_data.icc_level);
> +		QUERY_ATTR_IDN_ACTIVE_ICC_LVL, 0, 0, &icc_level);
>   
>   	if (ret)
>   		dev_err(hba->dev,
>   			"%s: Failed configuring bActiveICCLevel = %d ret = %d",
> -			__func__, hba->init_prefetch_data.icc_level , ret);
> -
> +			__func__, icc_level, ret);
>   out:
>   	kfree(desc_buf);
>   }
> diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
> index 5c10777154fc..5cf79d2319a6 100644
> --- a/drivers/scsi/ufs/ufshcd.h
> +++ b/drivers/scsi/ufs/ufshcd.h
> @@ -402,15 +402,6 @@ struct ufs_clk_scaling {
>   	bool is_suspended;
>   };
>   
> -/**
> - * struct ufs_init_prefetch - contains data that is pre-fetched once during
> - * initialization
> - * @icc_level: icc level which was read during initialization
> - */
> -struct ufs_init_prefetch {
> -	u32 icc_level;
> -};
> -
>   #define UFS_ERR_REG_HIST_LENGTH 8
>   /**
>    * struct ufs_err_reg_hist - keeps history of errors
> @@ -541,7 +532,6 @@ enum ufshcd_quirks {
>    * @intr_mask: Interrupt Mask Bits
>    * @ee_ctrl_mask: Exception event control mask
>    * @is_powered: flag to check if HBA is powered
> - * @init_prefetch_data: data pre-fetched during initialization
>    * @eh_work: Worker to handle UFS errors that require s/w attention
>    * @eeh_work: Worker to handle exception events
>    * @errors: HBA errors
> @@ -627,7 +617,6 @@ struct ufs_hba {
>   	u32 intr_mask;
>   	u16 ee_ctrl_mask;
>   	bool is_powered;
> -	struct ufs_init_prefetch init_prefetch_data;
>   
>   	/* Work Queues */
>   	struct work_struct eh_work;
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
