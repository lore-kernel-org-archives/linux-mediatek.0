Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8722C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 15:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o72TIxa/ZoEXKAKPN/1He1bePLVT2KBIFd9SL61XRjQ=; b=1Elr2stL6F2B5z0MuvfCvWmZ8p
	WzNBoenGP6tAay3S7hFBzk2BdJMVZZYpWIIIZ8S7gIrzcqaCdH2wx8A/ZIr1Hhea4eypILlWn3m4k
	o62X3G1t8m+8HQBkM66+uG7efAnwqVfUF/9wXQ1Rsnv+hCihenvRJ3Hwg3r/kp/67byKegQTyxcty
	NvGCdd8pckoaPZNsd40NWEwrLAVc7kAMZZ+s4AF9Pug8o4RdnOfCR9cFtmkpptD6gScuHBsamR41l
	wHUuGvkL9DFp2bNo8ve2zp+9il8j5wIrjuUCVfPniGWqFfCs1rhMPO2f0RoO+ypZNKkFlu2y7Zc+O
	/7XpMbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocqJ1-005nEg-Mt; Mon, 26 Sep 2022 15:46:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocqIq-005nBI-Mp; Mon, 26 Sep 2022 15:45:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 364E160EC3;
	Mon, 26 Sep 2022 15:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD35C433D6;
	Mon, 26 Sep 2022 15:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664207152;
	bh=6hyTFJAEj3/dM5VsZlBu/+ra5mc/qGQXYL8EHYeBUig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QITwqRN2zwUk3y5wcXVWLSaoiuE1y/mvDSVYjLnr/Qk+hGIToRX9aonS2/Z2AG1FW
	 FZmaKqi1ihyT1G3eELpWrzB9rwWhCO0C/BXVBmRkqiAdSC/MCAwbBRH6PJ78HYp1Le
	 3yAAR+3F0HeuuiwDdGy6mWvfg26u/JM0aIyb6s/CcmncUHRqQ1GghUmQav691soYp4
	 J4YMJuSuxuFHGerfaxxBKnyJ1SFO22wWof5ZjOSroYUfIaUZxMXdiYgmfIiYE6Og59
	 7LLvB7LmYJmmmjakBZ/afW6XKdPl5vG/UpjLROiUqagn3GglEU+QRD1I1TxIiWpEL6
	 oOEsShl/1o7oQ==
Date: Mon, 26 Sep 2022 21:15:32 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Asutosh Das <quic_asutoshd@quicinc.com>
Cc: quic_nguyenb@quicinc.com, quic_xiaosenh@quicinc.com,
	quic_cang@quicinc.com, quic_nitirawa@quicinc.com,
	quic_rampraka@quicinc.com, quic_richardp@quicinc.com,
	stanley.chu@mediatek.com, adrian.hunter@intel.com,
	bvanassche@acm.org, avri.altman@wdc.com, beanhuo@micron.com,
	martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Kiwoong Kim <kwmad.kim@samsung.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 07/16] ufs: core: mcq: Allocate memory for mcq mode
Message-ID: <20220926154532.GH101994@thinkpad>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <66d2f7b0794b4f95ad8db223408b710d7a5e2b8c.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66d2f7b0794b4f95ad8db223408b710d7a5e2b8c.1663894792.git.quic_asutoshd@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_084552_853614_6635B070 
X-CRM114-Status: GOOD (  31.47  )
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

On Thu, Sep 22, 2022 at 06:05:14PM -0700, Asutosh Das wrote:
> To read the bqueuedepth, the device descriptor is fetched
> in Single Doorbell Mode. This allocated memory may not be
> enough for MCQ mode because the number of tags supported
> in MCQ mode may be larger than in SDB mode.
> Hence, release the memory allocated in SDB mode and allocate
> memory for MCQ mode operation.
> Defines the ufs hardware queue and Completion Queue Entry.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
> ---
>  drivers/ufs/core/ufs-mcq.c     | 59 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/ufs/core/ufshcd-priv.h |  1 +
>  drivers/ufs/core/ufshcd.c      | 39 +++++++++++++++++++++++++---
>  include/ufs/ufshcd.h           | 19 ++++++++++++++
>  include/ufs/ufshci.h           | 21 +++++++++++++++
>  5 files changed, 134 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index e52066e..e2854a3 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -251,14 +251,69 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> +int ufshcd_mcq_memory_alloc(struct ufs_hba *hba)
> +{
> +	struct ufs_hw_queue *hwq;
> +	size_t utrdl_size, cqe_size;
> +	int i;
> +
> +	for (i = 0; i < hba->nr_hw_queues; i++) {
> +		hwq = &hba->uhq[i];
> +
> +		utrdl_size = sizeof(struct utp_transfer_req_desc) *
> +			     hwq->max_entries;
> +		hwq->sqe_base_addr = dmam_alloc_coherent(hba->dev, utrdl_size,
> +							 &hwq->sqe_dma_addr,
> +							 GFP_KERNEL);
> +		if (!hwq->sqe_dma_addr) {
> +			dev_err(hba->dev, "SQE allocation failed\n");
> +			return -ENOMEM;
> +		}
> +
> +		cqe_size = sizeof(struct cq_entry) * hwq->max_entries;
> +		hwq->cqe_base_addr = dmam_alloc_coherent(hba->dev, cqe_size,
> +							 &hwq->cqe_dma_addr,
> +							 GFP_KERNEL);
> +		if (!hwq->cqe_dma_addr) {
> +			dev_err(hba->dev, "CQE allocation failed\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  int ufshcd_mcq_init(struct ufs_hba *hba)
>  {
> -	int ret;
> +	int ret, i;
> +	struct ufs_hw_queue *hwq;
>  
>  	ret = ufshcd_mcq_config_nr_queues(hba);
>  	if (ret)
>  		return ret;
>  	ret = ufshcd_mcq_config_resource(hba);
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	hba->uhq = devm_kmalloc(hba->dev,
> +				hba->nr_hw_queues * sizeof(struct ufs_hw_queue),
> +				GFP_KERNEL);
> +	if (!hba->uhq) {
> +		dev_err(hba->dev, "Alloc ufs hw queue failed\n");

"Failed to allocate memory for UFS hw queues"

> +		ret = -ENOMEM;
> +		return ret;

return -ENOMEM

> +	}
> +
> +	for (i = 0; i < hba->nr_hw_queues; i++) {
> +		hwq = &hba->uhq[i];
> +		hwq->max_entries = hba->nutrs;
> +	}
> +
> +	/* The very first HW queue is to serve device command */
> +	hba->dev_cmd_queue = &hba->uhq[0];
> +	/* Give dev_cmd_queue the minimal number of entries */
> +	hba->dev_cmd_queue->max_entries = 2;

Perhaps add a define for 2? Not a big deal but it adds readability.

> +
> +	return 0;
>  }
>  
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index 6d16beb..f624682 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -52,6 +52,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
>  void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
>  int ufshcd_mcq_init(struct ufs_hba *hba);
>  u32 ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
> +int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
>  
>  #define SD_ASCII_STD true
>  #define SD_RAW false
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index a71b57e..5fc1e5e 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -3676,6 +3676,8 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>  		goto out;
>  	}
>  
> +	if (hba->utmrdl_base_addr)
> +		goto skip_utmrdl;

Is this change belongs to this patch?

>  	/*
>  	 * Allocate memory for UTP Task Management descriptors
>  	 * UFSHCI requires 1024 byte alignment of UTMRD
> @@ -3692,6 +3694,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>  		goto out;
>  	}
>  
> +skip_utmrdl:
>  	/* Allocate memory for local reference block */
>  	hba->lrb = devm_kcalloc(hba->dev,
>  				hba->nutrs, sizeof(struct ufshcd_lrb),
> @@ -8173,6 +8176,22 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
>  	return ret;
>  }
>  
> +/* SDB - Single Doorbell */
> +static void ufshcd_release_sdb_queue(struct ufs_hba *hba, int nutrs)
> +{
> +	size_t ucdl_size, utrdl_size;
> +
> +	ucdl_size = sizeof(struct utp_transfer_cmd_desc) * nutrs;
> +	dmam_free_coherent(hba->dev, ucdl_size, hba->ucdl_base_addr,
> +			   hba->ucdl_dma_addr);
> +
> +	utrdl_size = sizeof(struct utp_transfer_req_desc) * nutrs;
> +	dmam_free_coherent(hba->dev, utrdl_size, hba->utrdl_base_addr,
> +			   hba->utrdl_dma_addr);
> +
> +	devm_kfree(hba->dev, hba->lrb);
> +}
> +
>  static int ufshcd_config_mcq(struct ufs_hba *hba)
>  {
>  	int ret;
> @@ -8180,11 +8199,25 @@ static int ufshcd_config_mcq(struct ufs_hba *hba)
>  
>  	hba->nutrs = ufshcd_mcq_decide_queue_depth(hba);
>  	ret = ufshcd_mcq_init(hba);
> -	if (ret) {
> -		hba->nutrs = old_nutrs;
> -		return ret;
> +	if (ret)
> +		goto err;
> +

Please add a comment here on what the check is for and what the code below
does.

> +	if (hba->nutrs != old_nutrs) {
> +		ufshcd_release_sdb_queue(hba, old_nutrs);
> +		ret = ufshcd_memory_alloc(hba);
> +		if (ret)
> +			goto err;
> +		ufshcd_host_memory_configure(hba);
>  	}
> +
> +	ret = ufshcd_mcq_memory_alloc(hba);
> +	if (ret)
> +		goto err;
> +
>  	return 0;
> +err:
> +	hba->nutrs = old_nutrs;
> +	return ret;
>  }
>  
>  /**
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 630a0eb..e54d624 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -857,6 +857,8 @@ enum ufshcd_res {
>   * @nr_queues: number of Queues of different queue types
>   * @res: array of resource info of MCQ registers
>   * @mcq_base: Multi circular queue registers base address
> + * @uhq: array of supported hardware queues
> + * @dev_cmd_queue: Queue for issuing device management commands
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> @@ -1011,6 +1013,23 @@ struct ufs_hba {
>  	unsigned int nr_queues[HCTX_MAX_TYPES];
>  	struct ufshcd_res_info_t res[RES_MAX];
>  	void __iomem *mcq_base;
> +	struct ufs_hw_queue *uhq;

s/uhq/hw_queues

Thanks,
Mani

> +	struct ufs_hw_queue *dev_cmd_queue;
> +};
> +
> +/**
> + * @sqe_base_addr: submission queue entry base address
> + * @sqe_dma_addr: submission queue dma address
> + * @cqe_base_addr: completion queue base address
> + * @cqe_dma_addr: completion queue dma address
> + * @max_entries: max number of slots in this hardware queue
> + */
> +struct ufs_hw_queue {
> +	void *sqe_base_addr;
> +	dma_addr_t sqe_dma_addr;
> +	struct cq_entry *cqe_base_addr;
> +	dma_addr_t cqe_dma_addr;
> +	u32 max_entries;
>  };
>  
>  static inline bool is_mcq_supported(struct ufs_hba *hba)
> diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
> index ca7db49d..7fa8faf 100644
> --- a/include/ufs/ufshci.h
> +++ b/include/ufs/ufshci.h
> @@ -490,6 +490,27 @@ struct utp_transfer_req_desc {
>  	__le16  prd_table_offset;
>  };
>  
> +struct cq_entry {
> +	/* DW 0-1 */
> +	__le64 command_desc_base_addr;
> +
> +	/* DW 2 */
> +	__le16  response_upiu_length;
> +	__le16  response_upiu_offset;
> +
> +	/* DW 3 */
> +	__le16  prd_table_length;
> +	__le16  prd_table_offset;
> +
> +	/* DW 4 */
> +	__le32 status;
> +
> +	/* DW 5-7 */
> +	u32 reserved[3];
> +};
> +
> +static_assert(sizeof(struct cq_entry) == 32);
> +
>  /*
>   * UTMRD structure.
>   */
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

