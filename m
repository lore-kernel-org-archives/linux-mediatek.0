Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931B6C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LOxiK4C1RIS4sZAeR8ZofHu4gXMrH3Aok+bqzZlatE=; b=3woJo8UBfL6vXhXdox9f5jAFvq
	EJ/kLP6pP3iGEGGwmOpmSpi1fSMGYebTK3o8cvYI4CvxmjgN+kV/JJ8f4L4Fy6DaFFAVDCcz98rGj
	g5bB9nSpIhwVyAVnu63Hd5VThBHCWQptdtr7BliNvy0z2EdqkJMC3r9JajvrvKCcaVEMjCoHYND2P
	/8P76jrrRoOpPxEXHw1Klq0uKojaLUR51I6zcWjjxwAfjlFpmD/jvvOdvYkKA6UTUT0qMuKFVTleT
	AV8lmmNHtYQaB7fW7AIGSEuh6ic/H8UvDFyaEP68/m6luPFAncfEDxka5n9PTYencMcw/A09VC7nP
	j6W+6iCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tiP-00Cibh-0L;
	Tue, 30 May 2023 07:24:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tiK-00CiaX-2w;
	Tue, 30 May 2023 07:24:18 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 822E066065B2;
	Tue, 30 May 2023 08:24:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685431455;
	bh=P8a7Q5sU1ObUoZ2MSPwVvw2t2tUSGLVb5tySqcZlsl8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MFvJs+9ojQ3svqlyQa+rIgc4OhcWjBujR+YGimKHra1TFINbQYTcK9HIEYPS0YIyL
	 gh3Q3IDg+Ilmx7zXDb+COfWrsiPmRMr4jJ/PQghSxBaQjgyb0MN0qW4l9cZjPoeYHS
	 7NOFeaMhDfhUnC/i9zAD7aA7yoXvhCT3R9712vpOh8tuhPY8rRLCARvN0X/5uUQgQn
	 b9v3JZK57AQPZd1PxVQHB4jPwj62iZwOKKRjedHXU1jiDnlQadDbdieyzEe/WA0CM5
	 qUs0m9kUKeqmZjupyD0whYg18oYAVSjRlZaqGJq+unms45fodfqmVt0F7yoa5KLg5g
	 VHAZMiQKZTjoQ==
Message-ID: <fc5b8f88-23ec-4f15-9b24-947f3cec4471@collabora.com>
Date: Tue, 30 May 2023 09:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/1] scsi: ufs: core: Make UFS_MCQ_NUM_DEV_CMD_QUEUES a
 module parameter
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com
References: <20230530023518.16965-1-powen.kao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530023518.16965-1-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_002417_206979_56BE87AF 
X-CRM114-Status: GOOD (  26.33  )
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

Il 30/05/23 04:35, Po-Wen Kao ha scritto:
> A dedicated queue for dev commands is not mandatory, hence let
> UFS_MCQ_NUM_DEV_CMD_QUEUES become module parameter `dev_cmd_queues`
> to allow sharing first hw queue for dev commands.
> 
> When `dev_cmd_queues` is set to 0, the hwq 0 will be shared for I/O
> requests and dev commands. In the same hwq, commands are processed based
> on submission order hence might take longer to dispatch dev command
> under heavy traffic. For the host with dedicated hwq for dev commands
> can benefit in such scenario.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>


I imagine that MediaTek's UFS IP does not support dev_cmd_queues=1, does it?

In that case, this should not be a UFS module parameter, but a setting that
you provide from ufs-mediatek instead.

Regards,
Angelo

> ---
>   drivers/ufs/core/ufs-mcq.c     | 35 +++++++++++++++++++++++++++-------
>   drivers/ufs/core/ufshcd-priv.h |  2 +-
>   drivers/ufs/core/ufshcd.c      |  2 +-
>   3 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 51b3c6ae781d..4ef48c84e62f 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -16,7 +16,8 @@
>   #define MAX_QUEUE_SUP GENMASK(7, 0)
>   #define UFS_MCQ_MIN_RW_QUEUES 2
>   #define UFS_MCQ_MIN_READ_QUEUES 0
> -#define UFS_MCQ_NUM_DEV_CMD_QUEUES 1
> +#define UFS_MCQ_MAX_DEV_CMD_QUEUES 1
> +#define UFS_MCQ_MIN_DEV_CMD_QUEUES 0
>   #define UFS_MCQ_MIN_POLL_QUEUES 0
>   #define QUEUE_EN_OFFSET 31
>   #define QUEUE_ID_OFFSET 16
> @@ -75,6 +76,23 @@ module_param_cb(poll_queues, &poll_queue_count_ops, &poll_queues, 0644);
>   MODULE_PARM_DESC(poll_queues,
>   		 "Number of poll queues used for r/w. Default value is 1");
>   
> +static int dev_cmd_queue_count_set(const char *val, const struct kernel_param *kp)
> +{
> +	return param_set_uint_minmax(val, kp,
> +				     UFS_MCQ_MIN_DEV_CMD_QUEUES,
> +				     UFS_MCQ_MAX_DEV_CMD_QUEUES);
> +}
> +
> +static const struct kernel_param_ops dev_cmd_queue_count_ops = {
> +	.set = dev_cmd_queue_count_set,
> +	.get = param_get_uint,
> +};
> +
> +unsigned int dev_cmd_queues = 1;
> +module_param_cb(dev_cmd_queues, &dev_cmd_queue_count_ops, &dev_cmd_queues, 0644);
> +MODULE_PARM_DESC(dev_cmd_queues,
> +		 "Number of queues used for dev command. Default value is 1");
> +
>   /**
>    * ufshcd_mcq_config_mac - Set the #Max Activ Cmds.
>    * @hba: per adapter instance
> @@ -109,7 +127,7 @@ struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
>   	u32 hwq = blk_mq_unique_tag_to_hwq(utag);
>   
>   	/* uhq[0] is used to serve device commands */
> -	return &hba->uhq[hwq + UFSHCD_MCQ_IO_QUEUE_OFFSET];
> +	return &hba->uhq[hwq + dev_cmd_queues];
>   }
>   
>   /**
> @@ -153,7 +171,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   	/* maxq is 0 based value */
>   	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1;
>   
> -	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
> +	tot_queues = dev_cmd_queues + read_queues + poll_queues +
>   			rw_queues;
>   
>   	if (hba_maxq < tot_queues) {
> @@ -162,7 +180,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   		return -EOPNOTSUPP;
>   	}
>   
> -	rem = hba_maxq - UFS_MCQ_NUM_DEV_CMD_QUEUES;
> +	rem = hba_maxq - dev_cmd_queues;
>   
>   	if (rw_queues) {
>   		hba->nr_queues[HCTX_TYPE_DEFAULT] = rw_queues;
> @@ -188,7 +206,7 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   	for (i = 0; i < HCTX_MAX_TYPES; i++)
>   		host->nr_hw_queues += hba->nr_queues[i];
>   
> -	hba->nr_hw_queues = host->nr_hw_queues + UFS_MCQ_NUM_DEV_CMD_QUEUES;
> +	hba->nr_hw_queues = host->nr_hw_queues + dev_cmd_queues;
>   	return 0;
>   }
>   
> @@ -424,8 +442,11 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
>   
>   	/* The very first HW queue serves device commands */
>   	hba->dev_cmd_queue = &hba->uhq[0];
> -	/* Give dev_cmd_queue the minimal number of entries */
> -	hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
> +	if (dev_cmd_queues) {
> +		/* Give dedicated dev_cmd_queue the minimal number of entries */
> +		hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
> +	}
> +
>   
>   	host->host_tagset = 1;
>   	return 0;
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index d53b93c21a0c..b490d645f12c 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -78,7 +78,6 @@ struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
>   unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
>   				       struct ufs_hw_queue *hwq);
>   
> -#define UFSHCD_MCQ_IO_QUEUE_OFFSET	1
>   #define SD_ASCII_STD true
>   #define SD_RAW false
>   int ufshcd_read_string_desc(struct ufs_hba *hba, u8 desc_index,
> @@ -287,6 +286,7 @@ static inline int ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
>   	return -EOPNOTSUPP;
>   }
>   
> +extern unsigned int dev_cmd_queues;
>   extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
>   
>   /**
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 4ec8dacb447c..6361e21ca1c5 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5493,7 +5493,7 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
>   	struct ufs_hw_queue *hwq;
>   
>   	if (is_mcq_enabled(hba)) {
> -		hwq = &hba->uhq[queue_num + UFSHCD_MCQ_IO_QUEUE_OFFSET];
> +		hwq = &hba->uhq[queue_num + dev_cmd_queues];
>   
>   		return ufshcd_mcq_poll_cqe_lock(hba, hwq);
>   	}


