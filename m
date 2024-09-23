Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F3CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/p5vp+3qkkITxzDJCERgzt5yUgLEHP0TY8OyGowAHEY=; b=FkvTRek8PplHyA98q5wadgjk23
	zV5ozyPXQlivHf1wmHBJOcNik31Ib3tswrmr7eIyAmxkDB7dpFMTd60qhFfVo4KxBcpsB/gh1EcCv
	QeOeHtxiHcMi1wjZ9nAX4El5BwIroW6t/XOXsc9pX02c+Q1FhpXgGY8Qgo9DC6UjTicuZy7NuM+NL
	nim38MvvWvmtmMz0qWgRqNCsV86ztOEnBRbW9IuLhLFeJUKtS2ZnLgfOxPsYX+XY49lXiQ+tiAJia
	SyhTIj8jLu6COux2t6sEM/asOs6GZPJ+c8/f3uUz2XKWVwA5uHR7wEikz6t1MSGdVAxzjkCvbl1l1
	e4cJOPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnf2-00000000FBH-2qeW;
	Mon, 23 Sep 2024 18:19:48 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssnf0-00000000FAE-12CU
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 18:19:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XCB9G04yWz6ClY9Z;
	Mon, 23 Sep 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727115575; x=1729707576; bh=/p5vp+3qkkITxzDJCERgzt5y
	UgLEHP0TY8OyGowAHEY=; b=s1YSmD+rynvq6OuTyYbXiq6tmK3qZhqY2aAJ8gO+
	5Xaw9v5Y6CTaDugwnmkJLMsABvvLUGoczmIQsqHa63a+TIrpaoIPbRB37INU8+7j
	3iVDtwHxotLfG+5zzbJJ+ePMqm+7v11lIFHgECnhcevCaszPDyJeqdzta6dXPpIk
	Obl4yvVZnn8HfWREexh7Ds6vGH3h5qNcuUIN7wfNklGoJLo33DQyHCr+8JgtJgiI
	0DEZZrAIhfBl7Urf/dKR1x0k6wEb7tuwILhBlhGI79EISbKTTfE3+pDZc/T4YtZZ
	kK/tP4T8flzzyIO+qYhOFU/IB2M8tZ/RfQ4pVEtPN4gOsg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id RnVevXBzYcuz; Mon, 23 Sep 2024 18:19:35 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XCB8y2jg5z6ClY9Y;
	Mon, 23 Sep 2024 18:19:30 +0000 (UTC)
Message-ID: <f08fbc51-22a7-4c13-b9d4-ee7f4920bcfa@acm.org>
Date: Mon, 23 Sep 2024 11:19:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] ufs: core: fix error handler process for MCQ abort
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com
References: <20240923080344.19084-1-peter.wang@mediatek.com>
 <20240923080344.19084-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240923080344.19084-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_111946_324745_137F3327 
X-CRM114-Status: GOOD (  16.39  )
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

On 9/23/24 1:03 AM, peter.wang@mediatek.com wrote:
> When the error handler successfully aborts a MCQ request,
> it only releases the command and does not notify the SCSI layer.
> This may cause another abort after 30 seconds timeout.
> This patch notifies the SCSI layer to requeue the request.
> 
> Additionally, ignore the OCS: ABORTED CQ slot after MCQ mode
> SQ cleanup. This makes the behavior of MCQ mode consistent with
> that of legacy SDB mode.
> 
> Also, print logs for OCS: ABORTED and OCS_INVALID_COMMAND_STATUS
> for debugging purposes.

Although I like the approach of this patch, two comments below.

> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index a6f818cdef0e..b5c7bc50a27e 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5405,9 +5405,15 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
>   		break;
>   	case OCS_ABORTED:
>   		result |= DID_ABORT << 16;
> +		dev_warn(hba->dev,
> +				"OCS aborted from controller = %x for tag %d\n",
> +				ocs, lrbp->task_tag);
>   		break;

Including the OCS status in this message seems redundant to me.

>   	case OCS_INVALID_COMMAND_STATUS:
>   		result |= DID_REQUEUE << 16;
> +		dev_warn(hba->dev,
> +				"OCS invaild from controller = %x for tag %d\n",
> +				ocs, lrbp->task_tag);

Also here, including the OCS status in this message seems redundant to me.

Please change "invaild" into "invalid".

> @@ -5526,6 +5532,18 @@ void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
>   			ufshcd_update_monitor(hba, lrbp);
>   		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
>   		cmd->result = ufshcd_transfer_rsp_status(hba, lrbp, cqe);
> +
> +		/*
> +		 * Ignore MCQ OCS: ABORTED posted by the host controller.
> +		 * This makes the behavior of MCQ mode consistent with that
> +		 * of legacy SDB mode.
> +		 */
> +		if (hba->mcq_enabled) {
> +			ocs = ufshcd_get_tr_ocs(lrbp, cqe);
> +			if (ocs == OCS_ABORTED)
> +				return;
> +		}

Why only ignore the OCS_ABORTED status in MCQ mode? Is my understanding
correct that MediaTek controllers can also report this status in legacy 
mode?

Thanks,

Bart.

