Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED2FC7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 07:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNmCBlJ65rW/6CKCayrgvDDM3w8DQxd3NMRp+kjeCYs=; b=bSwymi4g/47Qy2u6AMtjPUrL7p
	WICBJbny82NT5/hGLSEa8fnDPOugOEab/65vrt2QLUD8whPRlTDqo5EX5t3bhLS5m4ORaLXTX9Dkm
	6u1pH09zR51GHw2IJ69lYxBNSXlCdN5GrraWf5S2oAOSdf2Si6XGUZFAzujZMjlQS8TEU82Ps7SkU
	3gcRrA7DEUoMEkaTzQNAUqrf9sn1Knq96wBQewB9Hv5RLxGyBArCisqU9dd/znDD5+K8je/5yvPr+
	6wDBHsY+I1chJDVtfuMZB+GGIXFZ/hyjeVzMXSbTmQ/WCugcHIqe+A6z98fA0CjD5YIKMPp0bRyRY
	7p6dDs/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tf4-00Chve-10;
	Tue, 30 May 2023 07:20:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3tf0-00ChtT-2t;
	Tue, 30 May 2023 07:20:52 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 501FE66059A8;
	Tue, 30 May 2023 08:20:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685431249;
	bh=lgjfkOTJugsOncbDLF7RUG2y6maF/FKtu4KMDqzu7Ag=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S6KUhgeOby8usw6eaS1elypoK0jqSEHUtpkJyl/+lRaAJlCKr6wYSBWmHHjE+/hKl
	 beOYgc4Q9BSK58WezALLdepdc6+SBn8wqZfEOx0jBOWQVRbDLmEFeG1LwxtShL9rG8
	 jG8QMl4IXfIo+RYMEGzoNnEgs4xTBLe4Of7YZij7LpSc6BVEhfd911RwveQGnZGIEC
	 TAn0iOp+Qyfoc8wbq5g7mUd6FVzAgOLJdLSC50gJ+frkwR4N/unSXjZCCJLAOdKi/f
	 +yygjK8JcfnndM+4aAXl7YgjtZyNx/bAV7nclKHts+jONXNAR8sYClMErmNBGbsRJA
	 6NNn0A+9ezYLA==
Message-ID: <14a23717-b517-3d7d-bd5b-17e265dffe82@collabora.com>
Date: Tue, 30 May 2023 09:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/3] scsi: ufs: core: Introduce mcq ops to config cqid
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
References: <20230530023227.16653-1-powen.kao@mediatek.com>
 <20230530023227.16653-2-powen.kao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230530023227.16653-2-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_002051_081449_7406FB85 
X-CRM114-Status: GOOD (  23.96  )
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

Il 30/05/23 04:32, Po-Wen Kao ha scritto:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> MCQ sq/cq mapping is not just one for one, could many for one.
> This patch allow host driver to change the mapping, assign cqid
> for each hw queue.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c     |  2 +-
>   drivers/ufs/core/ufshcd-priv.h |  8 ++++++++
>   drivers/ufs/core/ufshcd.c      | 11 +++++++++++
>   include/ufs/ufshcd.h           |  3 +++
>   4 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 51b3c6ae781d..1ba9c395c6b0 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -368,7 +368,7 @@ void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
>   		 * Submission Queue Attribute
>   		 */
>   		ufsmcq_writel(hba, (1 << QUEUE_EN_OFFSET) | qsize |
> -			      (i << QUEUE_ID_OFFSET),
> +			      (hwq->cqid << QUEUE_ID_OFFSET),
>   			      MCQ_CFG_n(REG_SQATTR, i));
>   	}
>   }
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index d53b93c21a0c..2de068b96c71 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -287,6 +287,14 @@ static inline int ufshcd_mcq_vops_config_esi(struct ufs_hba *hba)
>   	return -EOPNOTSUPP;
>   }
>   
> +static inline int ufshcd_mcq_vops_config_cqid(struct ufs_hba *hba)
> +{
> +	if (hba->vops && hba->vops->config_cqid)
> +		return hba->vops->config_cqid(hba);
> +
> +	return -EOPNOTSUPP;
> +}
> +
>   extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
>   
>   /**
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 4ec8dacb447c..fad9ff4469b0 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8488,11 +8488,22 @@ static int ufshcd_alloc_mcq(struct ufs_hba *hba)
>   static void ufshcd_config_mcq(struct ufs_hba *hba)
>   {
>   	int ret;
> +	struct ufs_hw_queue *hwq;
> +	int i;
>   
>   	ret = ufshcd_mcq_vops_config_esi(hba);
>   	dev_info(hba->dev, "ESI %sconfigured\n", ret ? "is not " : "");
>   
>   	ufshcd_enable_intr(hba, UFSHCD_ENABLE_MCQ_INTRS);
> +
> +	ret = ufshcd_mcq_vops_config_cqid(hba);
> +	if (ret) {

If your return value here is not -EOPNOTSUPP you may want to perform some
different action... and perhaps ufshcd_config_mcq() should be changed to
return a failure.
Should also be trivial to do so, since this function is called 3 times in
total, and only in ufshcd_device_init(), which is already returning int.

So, I would say....

static int ufshcd_config_mcq(struct ufs_hba *hba)
{

..... code .....

	ret = ufshcd_mcq_vops_config_cqid(hba);
	if (ret) {
		if (ret != -EOPNOTSUPP)
			return ret;

		/* No special configuration, go for 1:1 mapping */
		for (i = 0; ....)
			....
	}

Regards,
Angelo



