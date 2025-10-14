Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF7CCCD192
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 15:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41wA36PDmhkunY1fcShaZGqOcjr8qbaTCvwQtvR3cYc=; b=yd3+VAucD5r+TiuApy39p+aPPb
	6xdP+L69lSG/iYYf6dU5b22OEN/pF8b/2vpammCN1xPXbTRN5XBDtGhA1iAYX37vx7OGNheSYeCUh
	4sqHJ7h6pJCaem5arbUpkoqdvBXZojF6ZMeI65BVVT6teQOQziy0oS/4ucTUAPEDH5nl/PhIJ/aT2
	n0RFA0ohcaNprVCdW5f+lfBuQoFpIICNhlOx7ldVI+80n8xK0l9orhCPmvQrdxDqvNPLDaZ+UGbuo
	nqTglxdu96bYs8/N7k2TnG4VdqY1ficEcuQyCqfYfT3PKZgZ1tRB5TfSafUyH6be7qpEyImtvebSo
	nB/pNaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hEr-0000000GtmA-2Oef;
	Tue, 14 Oct 2025 15:47:01 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hEp-0000000Gtlb-0xf5
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 15:47:00 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cmJVp0ppFzlgqyn;
	Tue, 14 Oct 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760456812; x=1763048813; bh=41wA36PDmhkunY1fcShaZGqO
	cjr8qbaTCvwQtvR3cYc=; b=q0lgc2Z2rCKoqzO7LWFpGajvWVZKHMhp47QdyrJJ
	GoLYNwouKm8vLx7i/GrrLwh3admP+NRxjmUO1AZVg8MAsu27zoWg66I22j5LJgzw
	IYhLY5vLQtLc+19yN3Xo/puH1+JOdXG3QZfK+hdHdkd6h8XoZOBQRkJ+sAteN8ss
	nX8TFNnuB85xtUHvAvBS5Vn3em6qhvTUbcWNAHUko1Ds2ZCHhcxKGR0GfcOZrrmN
	HNGcMLE78jNsWu/ttoOKWXaNO4g3kcuZuobVR/Pm+wguTSWJW079kgPKPTnN5GMy
	8C8OJniH1GSx6eIn3ksGfNjVAgcMjQK+XM85rFX27Rtzog==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G4BRsfDz7acL; Tue, 14 Oct 2025 15:46:52 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cmJVS1Np3zlgqVm;
	Tue, 14 Oct 2025 15:46:39 +0000 (UTC)
Message-ID: <4c47f800-0536-452a-b64b-d177fa306418@acm.org>
Date: Tue, 14 Oct 2025 08:46:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ufs: core: support dumping CQ entry in MCQ Mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
 naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20251014131758.270324-1-peter.wang@mediatek.com>
 <20251014131758.270324-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251014131758.270324-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_084659_396186_99FF5DBA 
X-CRM114-Status: GOOD (  13.01  )
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

On 10/14/25 6:15 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index d779cc777a17..b90500126b35 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -599,7 +599,8 @@ static void ufshcd_print_evt_hist(struct ufs_hba *hba)
>   }
>   
>   static
> -void ufshcd_print_tr(struct ufs_hba *hba, int tag, bool pr_prdt)
> +void ufshcd_print_tr(struct ufs_hba *hba, struct cq_entry *cqe,
> +		     int tag, bool pr_prdt)
>   {
>   	const struct ufshcd_lrb *lrbp;
>   	int prdt_length;
> @@ -618,6 +619,8 @@ void ufshcd_print_tr(struct ufs_hba *hba, int tag, bool pr_prdt)
>   
>   	ufshcd_hex_dump("UPIU TRD: ", lrbp->utr_descriptor_ptr,
>   			sizeof(struct utp_transfer_req_desc));
> +	if (cqe)
> +		ufshcd_hex_dump("UPIU CQE: ", cqe, sizeof(struct cq_entry));
>   	dev_err(hba->dev, "UPIU[%d] - Request UPIU phys@0x%llx\n", tag,
>   		(u64)lrbp->ucd_req_dma_addr);
>   	ufshcd_hex_dump("UPIU REQ: ", lrbp->ucd_req_ptr,
> @@ -648,7 +651,7 @@ static bool ufshcd_print_tr_iter(struct request *req, void *priv)
>   	struct Scsi_Host *shost = sdev->host;
>   	struct ufs_hba *hba = shost_priv(shost);
>   
> -	ufshcd_print_tr(hba, req->tag, *(bool *)priv);
> +	ufshcd_print_tr(hba, NULL, req->tag, *(bool *)priv);
>   
>   	return true;
>   }
> @@ -5536,7 +5539,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
>   
>   	if ((host_byte(result) != DID_OK) &&
>   	    (host_byte(result) != DID_REQUEUE) && !hba->silence_err_logs)
> -		ufshcd_print_tr(hba, lrbp->task_tag, true);
> +		ufshcd_print_tr(hba, cqe, lrbp->task_tag, true);
>   	return result;
>   }
>   
> @@ -7763,9 +7766,9 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
>   		ufshcd_print_evt_hist(hba);
>   		ufshcd_print_host_state(hba);
>   		ufshcd_print_pwr_info(hba);
> -		ufshcd_print_tr(hba, tag, true);
> +		ufshcd_print_tr(hba, NULL, tag, true);
>   	} else {
> -		ufshcd_print_tr(hba, tag, false);
> +		ufshcd_print_tr(hba, NULL, tag, false);
>   	}
>   	hba->req_abort_count++;

So there are four callers of ufshcd_print_tr() and only one caller dumps
the CQE? Wouldn't it be better not to add any arguments to
ufshcd_print_tr() and instead add the code for dumping the CQE directly
in the only function that needs this functionality?

Thanks,

Bart.



