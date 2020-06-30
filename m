Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD41C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:32:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA52206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2u0DpwAh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Iq79rUu7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABA52206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/FXNhGXYvdvVuKYFRJwWM5wFbHj93vkqvVPFoO2UmjM=; b=2u0DpwAhhcS5qcv4cSrwNPJZJ
	kl1XvNPNBWfzDod34rMhPC7Mc5f2QhUGsua73LmX3pJQ2mXPHoRF4cubz+2aOqzaZ15KLwXF4w3V0
	IX3sljwVa/DSQ5pzK1TT7Imm3Nzazg4ZQTRWf6S3wk5EvgNFcBDg0DVT9y/q1Ipt56837ZeW/GvfZ
	pLOaibcAAP/unldg5fYWpSeyCez5+CRphBTn/gF/OeIs3mfsbFCpDWs3Z5WYholzAS1g+J1CpkEqo
	Jn9kBbK4sYeIv4DFYIjqTQy9n25pRcXg8GeVgDHPc1tSuveVhxmNrvq5Fy7eLANcz3lAv2eyxeUxi
	22rMFNF6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqK7e-0000ee-An; Tue, 30 Jun 2020 17:32:42 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqK7T-0000cP-QS
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 17:32:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593538347; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ZFcSwfI5UdhOXhdrQZvHHPaea1ggOYoJbFhXiurrIwM=;
 b=Iq79rUu7QvScRzXQSAihxZlTWaKL5YIbxMXOFJJ6oMzDswFbZgW3r3IeEKZnxlOB+5O/mwf3
 0JR3My1K5F21+l/z2k+92/MuqQG8iqF3J2+QiDheA2E+rVdY/FvGSuDkXmVIC/Htdchzx4Ll
 8SUyx6Ek69TD2m0QzqnlszJCF0c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5efb772aad153efa34f14382 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 17:32:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D5EB5C433C6; Tue, 30 Jun 2020 17:32:25 +0000 (UTC)
Received: from [192.168.8.176] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D29B9C433C8;
 Tue, 30 Jun 2020 17:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D29B9C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v2] scsi: ufs: Disable WriteBooster capability in
 non-supported UFS device
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
References: <20200624074110.21919-1-stanley.chu@mediatek.com>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <7f826f0c-6ed1-b3a3-72c9-aae0a1680e23@codeaurora.org>
Date: Tue, 30 Jun 2020 10:32:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624074110.21919-1-stanley.chu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_133231_952931_37EAB26B 
X-CRM114-Status: GOOD (  25.58  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 6/24/2020 12:41 AM, Stanley Chu wrote:
> If UFS device is not qualified to enter the detection of WriteBooster
> probing by disallowed UFS version or device quirks, then WriteBooster
> capability in host shall be disabled to prevent any WriteBooster
> operations in the future.
> 
> Fixes: 3d17b9b5ab11 ("scsi: ufs: Add write booster feature support")
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/scsi/ufs/ufshcd.c | 35 +++++++++++++++++++----------------
>   1 file changed, 19 insertions(+), 16 deletions(-)
> 
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>


> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index f173ad1bd79f..c62bd47beeaa 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6847,21 +6847,31 @@ static int ufshcd_scsi_add_wlus(struct ufs_hba *hba)
>   
>   static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
>   {
> +	struct ufs_dev_info *dev_info = &hba->dev_info;
>   	u8 lun;
>   	u32 d_lu_wb_buf_alloc;
>   
>   	if (!ufshcd_is_wb_allowed(hba))
>   		return;
> +	/*
> +	 * Probe WB only for UFS-2.2 and UFS-3.1 (and later) devices or
> +	 * UFS devices with quirk UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES
> +	 * enabled
> +	 */
> +	if (!(dev_info->wspecversion >= 0x310 ||
> +	      dev_info->wspecversion == 0x220 ||
> +	     (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES)))
> +		goto wb_disabled;
>   
>   	if (hba->desc_size[QUERY_DESC_IDN_DEVICE] <
>   	    DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP + 4)
>   		goto wb_disabled;
>   
> -	hba->dev_info.d_ext_ufs_feature_sup =
> +	dev_info->d_ext_ufs_feature_sup =
>   		get_unaligned_be32(desc_buf +
>   				   DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP);
>   
> -	if (!(hba->dev_info.d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
> +	if (!(dev_info->d_ext_ufs_feature_sup & UFS_DEV_WRITE_BOOSTER_SUP))
>   		goto wb_disabled;
>   
>   	/*
> @@ -6870,17 +6880,17 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
>   	 * a max of 1 lun would have wb buffer configured.
>   	 * Now only shared buffer mode is supported.
>   	 */
> -	hba->dev_info.b_wb_buffer_type =
> +	dev_info->b_wb_buffer_type =
>   		desc_buf[DEVICE_DESC_PARAM_WB_TYPE];
>   
> -	hba->dev_info.b_presrv_uspc_en =
> +	dev_info->b_presrv_uspc_en =
>   		desc_buf[DEVICE_DESC_PARAM_WB_PRESRV_USRSPC_EN];
>   
> -	if (hba->dev_info.b_wb_buffer_type == WB_BUF_MODE_SHARED) {
> -		hba->dev_info.d_wb_alloc_units =
> +	if (dev_info->b_wb_buffer_type == WB_BUF_MODE_SHARED) {
> +		dev_info->d_wb_alloc_units =
>   		get_unaligned_be32(desc_buf +
>   				   DEVICE_DESC_PARAM_WB_SHARED_ALLOC_UNITS);
> -		if (!hba->dev_info.d_wb_alloc_units)
> +		if (!dev_info->d_wb_alloc_units)
>   			goto wb_disabled;
>   	} else {
>   		for (lun = 0; lun < UFS_UPIU_MAX_WB_LUN_ID; lun++) {
> @@ -6891,7 +6901,7 @@ static void ufshcd_wb_probe(struct ufs_hba *hba, u8 *desc_buf)
>   					(u8 *)&d_lu_wb_buf_alloc,
>   					sizeof(d_lu_wb_buf_alloc));
>   			if (d_lu_wb_buf_alloc) {
> -				hba->dev_info.wb_dedicated_lu = lun;
> +				dev_info->wb_dedicated_lu = lun;
>   				break;
>   			}
>   		}
> @@ -6977,14 +6987,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
>   
>   	ufs_fixup_device_setup(hba);
>   
> -	/*
> -	 * Probe WB only for UFS-3.1 devices or UFS devices with quirk
> -	 * UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES enabled
> -	 */
> -	if (dev_info->wspecversion >= 0x310 ||
> -	    dev_info->wspecversion == 0x220 ||
> -	    (hba->dev_quirks & UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES))
> -		ufshcd_wb_probe(hba, desc_buf);
> +	ufshcd_wb_probe(hba, desc_buf);
>   
>   	/*
>   	 * ufshcd_read_string_desc returns size of the string
> 


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
