Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE71CC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFhm1qnuIBZd5EFkDkNRL0cQCmzaBizXFcYnA/zA3Ls=; b=ap2ULrG2ePjgxOH+WgOhgyD6El
	f2AZezJHHpMvd27Rq1iuYpNpiA9q0PFnI8PniGg0xMuh4QBQPjFZe9BGV6Cs9V+PQXivazFhviRB4
	rhhE+pXOxMrBlEmmLrMK6UKNtFDUqIWd27gpF1lPQUjQ9aYoCsSaP2Jkf515SlEzaV+aSxd5Oiweu
	zhHotAe5cLLwOCYzcW7QSKdQ/8Kd+CgpthykZ5yJVLIR0XSgf5fx9DEWute4Bk9WyhfZtgPFCieQU
	OrO40ODUWt6AFHnKx2z3JkyYyRi5slvoF2TxIFv1oxALFBqUvpkxAszmalEbeZze48W8r9H9UyhNh
	0xrfu1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocpij-005Zs3-Tg; Mon, 26 Sep 2022 15:08:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocpiW-005ZoN-BC; Mon, 26 Sep 2022 15:08:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2F8BB80AD3;
	Mon, 26 Sep 2022 15:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4918DC433D6;
	Mon, 26 Sep 2022 15:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664204897;
	bh=ck8LAR0C3+inTkPwB1+T0RQ3M06BtkVKhVhA8h6PDBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CVwzF2G1iF0Kle/rqKf+Uv2SJkXkuz9ormVLF2xMMMrmO0qK8EpNdQEiXFSkZVdxW
	 mFBMA8xbgQtKzP9mUz1KsgM6dFWuSd/6Lt1kT/Lw4a85ZODlS0IlqZB8OeoRuWUN8W
	 QG5cmpE0jRSibwRVdphvPVa4emXnr1OlMdmhCVJWi1/ZhxgLbd9ttKROsGzq+1VW5y
	 ZBjPinWN82L3gQC9ylj9gUqz0kQl4BwVyg6RNlW8DCq9aZEvKNWsCaeaMnViVWfixG
	 oTbohbiI4dXDtghS3Wdc2KYavMLSQvCH1RHg2Q8SNK4HddnwYHCWoWclyEXTB3Dq+h
	 3xJv1YVy1WJdg==
Date: Mon, 26 Sep 2022 20:37:50 +0530
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
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v1 05/16] ufs: core: mcq: Configure resource regions
Message-ID: <20220926150750.GF101994@thinkpad>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
 <4d4df6ad6353b93253fb22deefb772dc59f5c84e.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d4df6ad6353b93253fb22deefb772dc59f5c84e.1663894792.git.quic_asutoshd@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_080820_700727_62E0DC4E 
X-CRM114-Status: GOOD (  30.78  )
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

On Thu, Sep 22, 2022 at 06:05:12PM -0700, Asutosh Das wrote:
> Define the mcq resources and add support to ioremap
> the resource regions.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
> ---
>  drivers/ufs/core/ufs-mcq.c | 100 ++++++++++++++++++++++++++++++++++++++++++++-
>  include/ufs/ufshcd.h       |  28 +++++++++++++
>  2 files changed, 127 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 934556f..e5cc7ab 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -17,6 +17,12 @@
>  #define UFS_MCQ_MIN_READ_QUEUES 0
>  #define UFS_MCQ_MIN_POLL_QUEUES 0
>  
> +#define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
> +#define MCQ_QCFGPTR_UNIT	0x200
> +#define MCQ_SQATTR_OFFSET(c) \
> +	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
> +#define MCQ_QCFG_SIZE	0x40
> +
>  static unsigned int dev_cmd_queue = 1;
>  
>  static int rw_queue_count_set(const char *val, const struct kernel_param *kp)
> @@ -85,6 +91,96 @@ module_param_cb(poll_queues, &poll_queue_count_ops, &poll_queues, 0644);
>  MODULE_PARM_DESC(poll_queues,
>  		 "Number of poll queues used for r/w. Default value is 1");
>  
> +/* Resources */
> +static const struct ufshcd_res_info_t ufshcd_res_info[RES_MAX] = {
> +	{.name = "ufs_mem", .resource = NULL, .base = NULL},
> +	{.name = "mcq", .resource = NULL, .base = NULL},
> +	/* Submission Queue DAO */
> +	{.name = "mcq_sqd", .resource = NULL, .base = NULL},
> +	/* Submission Queue Interrupt Status */
> +	{.name = "mcq_sqis", .resource = NULL, .base = NULL},
> +	/* Completion Queue DAO */
> +	{.name = "mcq_cqd", .resource = NULL, .base = NULL},
> +	/* Completion Queue Interrupt Status */
> +	{.name = "mcq_cqis", .resource = NULL, .base = NULL},
> +	/* MCQ vendor specific */
> +	{.name = "mcq_vs", .resource = NULL, .base = NULL},
> +};
> +
> +static int ufshcd_mcq_config_resource(struct ufs_hba *hba)
> +{
> +	struct platform_device *pdev = to_platform_device(hba->dev);
> +	struct ufshcd_res_info_t *res;
> +	struct resource *res_mem, *res_mcq;
> +	int i, ret = 0;
> +
> +	memcpy(hba->res, ufshcd_res_info, sizeof(ufshcd_res_info));
> +
> +	for (i = 0; i < RES_MAX; i++) {
> +		res = &hba->res[i];
> +		res->resource = platform_get_resource_byname(pdev,
> +							     IORESOURCE_MEM,
> +							     res->name);
> +		if (!res->resource) {
> +			dev_info(hba->dev, "Resource %s not provided\n", res->name);

This is an error if below condition gets satisfied.

> +			if (i == RES_MEM)
> +				return -ENOMEM;
> +			continue;
> +		} else if (i == RES_MEM) {
> +			res_mem = res->resource;
> +			res->base = hba->mmio_base;
> +			continue;
> +		}
> +
> +		res->base = devm_ioremap_resource(hba->dev, res->resource);
> +		if (IS_ERR(res->base)) {
> +			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
> +					 res->name, (int)PTR_ERR(res->base));
> +			res->base = NULL;
> +			ret = PTR_ERR(res->base);
> +			return ret;
> +		}
> +	}
> +
> +	res = &hba->res[RES_MCQ];
> +	/* MCQ resource provided in DT */

Perhaps move the comment above and use, "Bail out if MCQ resource is provided by
the platform".

> +	if (res->base)
> +		goto out;
> +
> +	/* Manually allocate MCQ resource */

/* Manually allocate "mcq" resource from "ufs_mem" */

> +	res_mcq = res->resource;
> +	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
> +	if (!res_mcq) {
> +		dev_err(hba->dev, "Failed to alloate MCQ resource\n");

allocate

> +		return ret;
> +	}
> +
> +	res_mcq->start = res_mem->start +
> +			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
> +	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
> +	res_mcq->flags = res_mem->flags;
> +	res_mcq->name = "mcq";
> +
> +	ret = insert_resource(&iomem_resource, res_mcq);
> +	if (ret) {
> +		dev_err(hba->dev, "Failed to insert MCQ resource %d\n", ret);
> +		return ret;
> +	}
> +
> +	res->base = devm_ioremap_resource(hba->dev, res_mcq);
> +	if (IS_ERR(res->base)) {
> +		dev_err(hba->dev, "Map MCQ registers failed, err=%d\n",

"MCQ registers mapping failed, err=%d"

> +			(int)PTR_ERR(res->base));
> +		ret = PTR_ERR(res->base);
> +		res->base = NULL;
> +		return ret;
> +	}
> +
> +out:
> +	hba->mcq_base = res->base;
> +	return 0;
> +}
> +
>  static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>  {
>  	int i, rem;
> @@ -126,7 +222,9 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
>  	int ret;
>  
>  	ret = ufshcd_mcq_config_nr_queues(hba);
> -
> +	if (ret)
> +		return ret;

Newline

> +	ret = ufshcd_mcq_config_resource(hba);
>  	return ret;
>  }
>  
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 298e103..54d742a 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -720,6 +720,30 @@ struct ufs_hba_monitor {
>  };
>  
>  /**
> + * struct ufshcd_res_info_t - MCQ related resource regions
> + *
> + * @name: resource name
> + * @resource: pointer to resource region
> + * @base: register base address
> + */
> +struct ufshcd_res_info_t {
> +	const char *name;
> +	struct resource *resource;
> +	void __iomem *base;
> +};
> +
> +enum ufshcd_res {
> +	RES_MEM,

RES_UFS since the resource name is "ufs_mem"?

Thanks,
Mani

> +	RES_MCQ,
> +	RES_MCQ_SQD,
> +	RES_MCQ_SQIS,
> +	RES_MCQ_CQD,
> +	RES_MCQ_CQIS,
> +	RES_MCQ_VS,
> +	RES_MAX,
> +};
> +
> +/**
>   * struct ufs_hba - per adapter private structure
>   * @mmio_base: UFSHCI base register address
>   * @ucdl_base_addr: UFS Command Descriptor base address
> @@ -829,6 +853,8 @@ struct ufs_hba_monitor {
>   * @mcq_sup: is mcq supported by UFSHC
>   * @nr_hw_queues: number of hardware queues configured
>   * @nr_queues: number of Queues of different queue types
> + * @res: array of resource info of MCQ registers
> + * @mcq_base: Multi circular queue registers base address
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> @@ -981,6 +1007,8 @@ struct ufs_hba {
>  	bool mcq_sup;
>  	unsigned int nr_hw_queues;
>  	unsigned int nr_queues[HCTX_MAX_TYPES];
> +	struct ufshcd_res_info_t res[RES_MAX];
> +	void __iomem *mcq_base;
>  };
>  
>  static inline bool is_mcq_supported(struct ufs_hba *hba)
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

