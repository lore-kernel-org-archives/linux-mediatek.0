Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA23C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 06:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EPJ98Wq79Al/JALNWABjuVNLkg5bKyaeh2mw0Y8YsAw=; b=QCfdvM4zKcOohOhNfx8WpQeUM6
	5zg5gixZr1FWfWSiptOHpiS+vptA2k1AwLtVMKmOsqKNUSkZ9KiSpUIfeI6eUjGI0lhbv8+QuRMQm
	MK9J4e//QZX+4ZNm1hVBvyicLHOa+9RHkLv20lPct1ak07Avbr6zku+rgsOWXhoGX0nUagfi7pxTm
	8cb6Oc1D4EvwBuQ7DXp82L/hzER+P6xCNSTT4naX2frXjqwoAhepYUSW5weZhRznoo8LYmLYepFv7
	xTmUgNohQ1S5IC2yZbyvN5nH4pcqFpiGudoU2nD0UYX3yPFSp4Bc64In+miUy3e4+/qs7c7l+A1Gu
	UNCY2CMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rINRY-00E4fF-06;
	Wed, 27 Dec 2023 06:31:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rINRT-00E4dH-2f;
	Wed, 27 Dec 2023 06:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D4F6CE091D;
	Wed, 27 Dec 2023 06:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7B6C433C7;
	Wed, 27 Dec 2023 06:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703658651;
	bh=axysAKGKpEKkYuBldpcX4OwH/06/63fo7fdgfaaiYJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQrvPlfW/CtT5sS+oEY90/+eqaqBHhGEYLemgV/ZKcGWOjusFD97MO+09SIWOnKOo
	 tgdwO0+xBuD+X0dYrbW6kvvEQEhlc0DVt6JjrD0/kvARe7Y8Mrrf/+u9BVG0a+La/x
	 cH+jGCFdHEUUmGkBLXqJnnIgQ6s6UUPUwFt1OlXQ5xDRRVBaMikZYb8g4qIgT961Yq
	 aRWvXiarXxNcIb6V5ltQlMEMLt/vUTDfwTsqCLphFrWBouu+dJQSdsph1/N30ZLJ+6
	 ZzOwWPTdVVI2sUyluEm8Gmpqsql8oEVBD2lu3ZTDIrLQaL5CdVxaBoGB7QZDb/fJoI
	 RSoEakRp8wKjA==
Date: Wed, 27 Dec 2023 12:00:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chanwoo Lee <cw9316.lee@samsung.com>
Cc: alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	peter.wang@mediatek.com, chu.stanley@gmail.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com, quic_cang@quicinc.com,
	quic_asutoshd@quicinc.com, powen.kao@mediatek.com,
	quic_nguyenb@quicinc.com, yang.lee@linux.alibaba.com,
	beanhuo@micron.com, Arthur.Simchaev@wdc.com, ebiggers@google.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, grant.jung@samsung.com,
	jt77.jang@samsung.com, dh0421.hwang@samsung.com,
	sh043.lee@samsung.com
Subject: Re: [PATCH v2] ufs: mcq: Adding a function for MCQ enable
Message-ID: <20231227063038.GJ2814@thinkpad>
References: <CGME20231221065637epcas1p203dcd5cfb1d4a3964fff9543a041d78d@epcas1p2.samsung.com>
 <20231221065608.9899-1-cw9316.lee@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231221065608.9899-1-cw9316.lee@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_223100_229021_1C99F2D4 
X-CRM114-Status: GOOD (  21.52  )
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

On Thu, Dec 21, 2023 at 03:56:08PM +0900, Chanwoo Lee wrote:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> The REG_UFS_MEM_CFG register is too general(broad)
> and it is difficult to know the meaning only with a value of 0x1.
> So far, comments were required.
> 
> Therefore, I have added new functions and defines
> to improve code readability/reusability.
> 
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>

I would reword the subject and description as below:

```
ufs: mcq: Add definition for REG_UFS_MEM_CFG register

Instead of hardcoding the register field, add the proper definition. While
at it, let's also use ufshcd_rmwl() to simplify updating this register.
```

- Mani
> 
> * v1->v2:
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

