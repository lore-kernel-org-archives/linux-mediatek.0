Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B303EC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 07:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1izOXo7iPsqjt3/XsxZnlBiJudqECZWwrJpYoA1bkPk=; b=OLe19V4HJS52cHMnt2f28USqGU
	C9jHxNhBmTDF1XdxCnrs7GculA1aGaa33mkJzcaTwFFKzQlq/gnvWxuqeA5g6KCMR3OTM9UeVFhnv
	ndx43se0dJSUsAGBtQjGdALXuTQFfUsKIUV5RXfiBrVDCZ+rBHUugnsZKAO9AiD4zDNjlswdOXgjU
	A67qH4lYdCNchiSia2zHWg36cG/cXLxktBcrvOKM5DmdkQ/Fn2/HQ0CrOAOnVl09RVaGDPERRbCIM
	KezjpdYSPoG6b71L4RZGns6APFstvHSIb52nNY4QEDhyEbMA5zv8LlXRijxHzb83RX8zvrls8iH8u
	OlGYhM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXGdv-00FHxt-FK; Wed, 01 Mar 2023 07:12:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXGdl-00FHxB-GA; Wed, 01 Mar 2023 07:12:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D85306122C;
	Wed,  1 Mar 2023 07:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFE9C433D2;
	Wed,  1 Mar 2023 07:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677654757;
	bh=dc+qbsouFRSJQdCe0kqILs/W2bbgcHad39FmSk9VmIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jqzi5xmM51AYcw2nWxsyhtHT/Cbg9aG+N2JYc2NuX2Wyl1iCPzKHDRz0hrZxXOwr7
	 L6l7zCOB/G3JSGyvzwNDqeX+IbvMxbcbY1z50yBoD01/+Jd8hu9xY+DRVO87HHJgm/
	 4EOUJXXOWkL7shTmDjzTaxgbl3lzXVEPfz2jhx7/1e4O3R/EEw6OIOnZFkeDhxL17c
	 i9nvj4vBqat+AKBPj67C8iSJdt91J3XlPS7lWYB5STugkvRgNhM3U0sDi55QDnJS/s
	 yc0xNl+C64BmghRSzonKx9gU2g4A7Ug2cQjGYUI2B+eyfL0z8UVSYP/aZs1QXI6f0v
	 yD55hYTrnYvjg==
Date: Wed, 1 Mar 2023 12:42:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, peter.wang@mediatek.com,
	stanley.chu@mediatek.com, alice.chao@mediatek.com,
	naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
	cc.chou@mediatek.com, eddie.huang@mediatek.com,
	mason.zhang@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com
Subject: Re: [PATCH v3 2/6] scsi: ufs: core: Rename symbols
Message-ID: <20230301071228.GB5409@thinkpad>
References: <20230223152757.13606-1-powen.kao@mediatek.com>
 <20230223152757.13606-3-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230223152757.13606-3-powen.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_231241_659917_503BBB04 
X-CRM114-Status: GOOD (  20.86  )
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

Subject could mention the actual function that is being renamed:
sizeof_utp_transfer_cmd_desc

On Thu, Feb 23, 2023 at 11:27:52PM +0800, Po-Wen Kao wrote:
> To avoid confusion, sizeof_utp_transfer_cmd_desc() is renamed to
> ufshcd_get_ucd_size().
> 

How about:

"Naming the functions after standard operators like sizeof may cause
confusion. So let's rename it to ufshcd_get_ucd_size()."

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> Reviewed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>  drivers/ufs/core/ufs-mcq.c | 2 +-
>  drivers/ufs/core/ufshcd.c  | 8 ++++----
>  include/ufs/ufshcd.h       | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 3a27fa4b0024..a39746b2a8be 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
>  	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
>  		hba->ucdl_dma_addr;
>  
> -	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));
> +	return div_u64(addr, ufshcd_get_ucd_size(hba));
>  }
>  
>  static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 3b3cf78d3b10..81c9f07ebfc8 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -2823,10 +2823,10 @@ static void ufshcd_map_queues(struct Scsi_Host *shost)
>  static void ufshcd_init_lrb(struct ufs_hba *hba, struct ufshcd_lrb *lrb, int i)
>  {
>  	struct utp_transfer_cmd_desc *cmd_descp = (void *)hba->ucdl_base_addr +
> -		i * sizeof_utp_transfer_cmd_desc(hba);
> +		i * ufshcd_get_ucd_size(hba);
>  	struct utp_transfer_req_desc *utrdlp = hba->utrdl_base_addr;
>  	dma_addr_t cmd_desc_element_addr = hba->ucdl_dma_addr +
> -		i * sizeof_utp_transfer_cmd_desc(hba);
> +		i * ufshcd_get_ucd_size(hba);
>  	u16 response_offset = offsetof(struct utp_transfer_cmd_desc,
>  				       response_upiu);
>  	u16 prdt_offset = offsetof(struct utp_transfer_cmd_desc, prd_table);
> @@ -3735,7 +3735,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>  	size_t utmrdl_size, utrdl_size, ucdl_size;
>  
>  	/* Allocate memory for UTP command descriptors */
> -	ucdl_size = sizeof_utp_transfer_cmd_desc(hba) * hba->nutrs;
> +	ucdl_size = ufshcd_get_ucd_size(hba) * hba->nutrs;
>  	hba->ucdl_base_addr = dmam_alloc_coherent(hba->dev,
>  						  ucdl_size,
>  						  &hba->ucdl_dma_addr,
> @@ -3835,7 +3835,7 @@ static void ufshcd_host_memory_configure(struct ufs_hba *hba)
>  	prdt_offset =
>  		offsetof(struct utp_transfer_cmd_desc, prd_table);
>  
> -	cmd_desc_size = sizeof_utp_transfer_cmd_desc(hba);
> +	cmd_desc_size = ufshcd_get_ucd_size(hba);
>  	cmd_desc_dma_addr = hba->ucdl_dma_addr;
>  
>  	for (i = 0; i < hba->nutrs; i++) {
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index ed9e3d5addb3..8f79cca449e1 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -1136,7 +1136,7 @@ static inline size_t ufshcd_sg_entry_size(const struct ufs_hba *hba)
>  	({ (void)(hba); BUILD_BUG_ON(sg_entry_size != sizeof(struct ufshcd_sg_entry)); })
>  #endif
>  
> -static inline size_t sizeof_utp_transfer_cmd_desc(const struct ufs_hba *hba)
> +static inline size_t ufshcd_get_ucd_size(const struct ufs_hba *hba)
>  {
>  	return sizeof(struct utp_transfer_cmd_desc) + SG_ALL * ufshcd_sg_entry_size(hba);
>  }
> -- 
> 2.18.0
> 

-- 
மணிவண்ணன் சதாசிவம்

