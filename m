Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7533C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfwT9jIm5vIA6k5YbOkqQAeIeIMG7LNP0etjeksjkTw=; b=Py+PJk9Ws2hOju05RRCnwCw+gt
	A6rAFuFUjOrtN59IvL5R3Jz1zGQIwDjniBNqyWnG9ml6zbPGRMvitjOMou3QwOL2hKEY0rJJ2AIHW
	Zl32TSMt5eQqDPOIYpv269n8mPV9lN55D1Qmoo6NkCI09HVG1v2za1IdVa/GCzNr09E+CH6jWzxie
	uCp/iuoezb5n8uKzpxdQ0vN9EjlMxbnFhhyTTAgnO/V0W+RLcwXVUF3wdjO8B8pRzRmXKQhij6BFN
	nduGygm565MZSADv4P4nKOlN9brrcshjNPqQ4Mlu/mGt+QAlrJr+kzVUglSHFhNSjSMWfEXFbX0Of
	HxbUY+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYtC-008pz4-6i; Thu, 16 Feb 2023 07:41:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYt2-008pxF-3e; Thu, 16 Feb 2023 07:41:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD7EA61EA3;
	Thu, 16 Feb 2023 07:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46F04C433D2;
	Thu, 16 Feb 2023 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676533258;
	bh=CsjYBJv3KoyajR+dTDD6EPW6J8/wsE97iPGoBTCmLjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=asoBJcP4g5hiqe6+H63ficVX5ZhIUHvvvRqgP/o21FJASYhO+1Q0dELVGFI3Of2+7
	 czmYWZd+RqRnQRT8PJJgScEeKS5aJvlxx9qiuL2z5NOfeNUy5RQBmeB4oyrK47Y78B
	 WTL+PMlJkVxcIqKoy1977rXuV7I5EOtKreScHcDwtPEQkfyMeItcPiDFIwVttVBmpN
	 zcssRomtuKczYGSQc/jBu4qOGj/TocjNzf4eqYd/Vlo5GWaNY0BAh+SRYORWX2BHpj
	 gqsOC9hKXvLPXIIxuWP6NTtO5EyRmSUcVgloTCQxaI3rqUZ0EIrSurOeM2AQ1PLPNc
	 li1Edq5IRJ7KQ==
Date: Thu, 16 Feb 2023 13:10:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, peter.wang@mediatek.com,
	stanley.chu@mediatek.com, alice.chao@mediatek.com,
	chun-hung.wu@mediatek.com, cc.chou@mediatek.com,
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
	mason.zhang@mediatek.com, quic_asutoshd@quicinc.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] scsi: ufs: core: Fix mcq tag calcualtion
Message-ID: <20230216074040.GB2420@thinkpad>
References: <20230215123750.15785-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215123750.15785-1-powen.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_234100_225941_AB80F3B6 
X-CRM114-Status: GOOD (  19.95  )
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

On Wed, Feb 15, 2023 at 08:37:45PM +0800, Po-Wen Kao wrote:
> Transfer command descriptor is allocated in ufshcd_memory_alloc()
> and referenced by transfer request descriptor with stride size
> sizeof_utp_transfer_cmd_desc()
> instead of
> sizeof(struct utp_transfer_cmd_desc).
> 
> Consequently, computing tag by address offset should also refer to the
> same stride.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>

Fixes tag?

> ---
>  drivers/ufs/core/ufs-mcq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 31df052fbc41..3a27fa4b0024 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -265,7 +265,7 @@ static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
>  	addr = (le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA) -
>  		hba->ucdl_dma_addr;
>  
> -	return div_u64(addr, sizeof(struct utp_transfer_cmd_desc));
> +	return div_u64(addr, sizeof_utp_transfer_cmd_desc(hba));

I think it is not a good practice to name variables after the standard
operators like sizeof(). It is confusing at its best.

How about renaming this function to get_ucd_size() or something relevant?

But the change itself LGTM!

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

>  }
>  
>  static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
> -- 
> 2.18.0
> 

-- 
மணிவண்ணன் சதாசிவம்

