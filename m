Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57D8C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 16:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym8XN/Df1WlMo9mD7X4HtFJt2SYBy5ajgwkXdj3Ufko=; b=Mj0HQux35QWBa/pBPG8noZdBI5
	nr9bYtIPNVhuoAs6tGzgmx9PmQnc8Z2dOi30aAQCK8ll6wyyvzEo9q+oG7L9puMG3sWf9aop93DXc
	ooSMriSeVA1ya+OhPitk9d1Ivhgrm7dbHenFdD3XDOaG6ZCkE0gsiIh8v5D23suECPZ+pysM5nxGo
	UUiReuHoN6VetP/U1rgoMTv1cdXo3n/U9tO/fGcFXIfry4VAR6ADV/HOrVYFLHRu4mnKhXuLNbjbR
	EbHx9m10/fX4MWxkcwbrBd90mC8cSJhyO9DNNua+YRl9z+2LKm8LRM0BNg+BJ98jG0S6/ibGC/GDY
	H0OwselQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi25-008WpA-32;
	Tue, 02 Jan 2024 16:54:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKi1z-008WnE-2Q;
	Tue, 02 Jan 2024 16:54:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6A41CE0FEA;
	Tue,  2 Jan 2024 16:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E317AC433C7;
	Tue,  2 Jan 2024 16:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704214455;
	bh=Xs6JWdVhz8UCi2Nb+OZ68Hcw6GchoGb6m+i1P4qfvuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mT94ck572c8+zWeYLk5Ty8g9hs+aLOzRuOHkgL7yBhTPleFzdpvBPLc3hYYQkek8L
	 K5tDaUuauPOfkKBwB9ZEgYu9Mddik0WrFru4v6+Zvt2J7OWnBpEI1R4g1b/5TR9fgg
	 XbHOZ0N4eGT2vTwzKROzBM27+kSbQYF/0zeEGG8OljQmtekYaAnwu4npup1sXEIc8z
	 4JrikAmlbHqkFBUeoE1BYQrPGnC9sPh42ZqyXBfVKsJCA/dlre3rpmLFEiSKd+2vQT
	 RYbGJoRbgGxDLEGiNRMRULMbpOPMePIl4lQaWWb0yE1r10UwpdIdosIHQvpr1TlYVm
	 /MquyPnPKrAXg==
Date: Tue, 2 Jan 2024 22:23:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	peter.wang@mediatek.com, chu.stanley@gmail.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com, quic_cang@quicinc.com,
	quic_asutoshd@quicinc.com, powen.kao@mediatek.com,
	quic_nguyenb@quicinc.com, yang.lee@linux.alibaba.com,
	athierry@redhat.com, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, grant.jung@samsung.com,
	jt77.jang@samsung.com, dh0421.hwang@samsung.com,
	sh043.lee@samsung.com
Subject: Re: [PATCH v3] ufs: mcq: Add definition for REG_UFS_MEM_CFG register
Message-ID: <20240102165356.GD4917@thinkpad>
References: <CGME20240102014248epcas1p4d49dcf2cd3f020bed88eebaeba648789@epcas1p4.samsung.com>
 <20240102014222.23351-1-cw9316.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240102014222.23351-1-cw9316.lee@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_085420_254670_527BB741 
X-CRM114-Status: GOOD (  19.27  )
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

On Tue, Jan 02, 2024 at 10:42:22AM +0900, Chanwoo Lee wrote:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Instead of hardcoding the register field, add the proper definition. While
> at it, let's also use ufshcd_rmwl() to simplify updating this register.
> 
> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> * v2->v3: Change subject and description
>   v2 : https://patchwork.kernel.org/project/linux-scsi/patch/20231221065608.9899-1-cw9316.lee@samsung.com/
> 
> * v1->v2:
>   v1 : https://patchwork.kernel.org/project/linux-scsi/patch/20231220052737.19857-1-cw9316.lee@samsung.com/
>    1) Excluding ESI_ENABLE
>    2) Replace with ufshcd_rmwl, BIT()
>    3) Separating hba->mcq_enabled
> ---
>  drivers/ufs/core/ufs-mcq.c      | 6 ++++++
>  drivers/ufs/core/ufshcd.c       | 4 +---
>  drivers/ufs/host/ufs-mediatek.c | 4 +---
>  include/ufs/ufshcd.h            | 1 +
>  include/ufs/ufshci.h            | 3 +++
>  5 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 0787456c2b89..edc752e55878 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -399,6 +399,12 @@ void ufshcd_mcq_enable_esi(struct ufs_hba *hba)
>  }
>  EXPORT_SYMBOL_GPL(ufshcd_mcq_enable_esi);
>  
> +void ufshcd_mcq_enable(struct ufs_hba *hba)
> +{
> +	ufshcd_rmwl(hba, MCQ_MODE_SELECT, MCQ_MODE_SELECT, REG_UFS_MEM_CFG);
> +}
> +EXPORT_SYMBOL_GPL(ufshcd_mcq_enable);
> +
>  void ufshcd_mcq_config_esi(struct ufs_hba *hba, struct msi_msg *msg)
>  {
>  	ufshcd_writel(hba, msg->address_lo, REG_UFS_ESILBA);
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index ae9936fc6ffb..30df6f6a72c6 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -8723,9 +8723,7 @@ static void ufshcd_config_mcq(struct ufs_hba *hba)
>  	hba->host->can_queue = hba->nutrs - UFSHCD_NUM_RESERVED;
>  	hba->reserved_slot = hba->nutrs - UFSHCD_NUM_RESERVED;
>  
> -	/* Select MCQ mode */
> -	ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
> -		      REG_UFS_MEM_CFG);
> +	ufshcd_mcq_enable(hba);
>  	hba->mcq_enabled = true;
>  
>  	dev_info(hba->dev, "MCQ configured, nr_queues=%d, io_queues=%d, read_queue=%d, poll_queues=%d, queue_depth=%d\n",
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index fc61790d289b..1048add66419 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1219,9 +1219,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
>  		ufs_mtk_config_mcq(hba, false);
>  		ufshcd_mcq_make_queues_operational(hba);
>  		ufshcd_mcq_config_mac(hba, hba->nutrs);
> -		/* Enable MCQ mode */
> -		ufshcd_writel(hba, ufshcd_readl(hba, REG_UFS_MEM_CFG) | 0x1,
> -			      REG_UFS_MEM_CFG);
> +		ufshcd_mcq_enable(hba);
>  	}
>  
>  	if (err)
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index d862c8ddce03..a96c45fa4b4b 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -1257,6 +1257,7 @@ unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
>  					 struct ufs_hw_queue *hwq);
>  void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
>  void ufshcd_mcq_enable_esi(struct ufs_hba *hba);
> +void ufshcd_mcq_enable(struct ufs_hba *hba);
>  void ufshcd_mcq_config_esi(struct ufs_hba *hba, struct msi_msg *msg);
>  
>  int ufshcd_opp_config_clks(struct device *dev, struct opp_table *opp_table,
> diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
> index d5accacae6bc..2a6989a70671 100644
> --- a/include/ufs/ufshci.h
> +++ b/include/ufs/ufshci.h
> @@ -282,6 +282,9 @@ enum {
>  /* UTMRLRSR - UTP Task Management Request Run-Stop Register 80h */
>  #define UTP_TASK_REQ_LIST_RUN_STOP_BIT		0x1
>  
> +/* REG_UFS_MEM_CFG - Global Config Registers 300h */
> +#define MCQ_MODE_SELECT 	BIT(0)
> +
>  /* CQISy - CQ y Interrupt Status Register  */
>  #define UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS	0x1
>  
> -- 
> 2.29.0
> 

-- 
மணிவண்ணன் சதாசிவம்

