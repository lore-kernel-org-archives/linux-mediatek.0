Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72424CCF9E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 16:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1uARAEtCZ8e6OEALGT3Y0Ul/ZUS/KuncBTF6dONDlI=; b=z9hRdvozjJee5YkT2DUcos3lRm
	IxUQx2e7LApD34wsUph3NQIW37X1BQsTCv4VDsdmZrJVbXJUO9z7Ge/4dkOxrgFQDVfrRLZvQVdMo
	eAiCzE66+7s+RBLYT6SGTv+Ae+pqVt410oqeZQ1yOahp7gVpKrH6GCQa7+ZeTU6530qIztuXSRgL4
	E1FJvCNjCx5FlQS1oGJZUgtaOp5NmiufRHh/A8Ustl73NaIN7WMkzeuPLRdNFHXaCtIbsTfiNMmlv
	m4GADaFn48Hv6oH/+9ovn8kwm3RFODjV0wM45fb0kTwMewclxhgMfo8UwYHJg/bNnHbYB9SZSLGnM
	kEriLM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVJZ-000000067g0-1a8P;
	Wed, 25 Sep 2024 16:56:33 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVJW-000000067fX-3MgW
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 16:56:32 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XDNDF5ffhzlgTWQ;
	Wed, 25 Sep 2024 16:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727283380; x=1729875381; bh=W1uARAEtCZ8e6OEALGT3Y0Ul
	/ZUS/KuncBTF6dONDlI=; b=knUhiyHLVbFzyYlAwrAT6d8/3aeP5MhmDlNCPNdn
	h7qhOz8b9M9+Ye7ofQa/bSObAG79D/TtWhmP4u/cJxB97P4F9qbo51VBx7x2v2I/
	7O/jXpIYAiGYl80StA3EIxUEHP7Udjg3mR5jCcVN9ds1OtludtxRkJKH+/wDVT8m
	9WKXqKbc1ri4qIdHUlW/Oklfa9082LMGeUfYxg5h0mqmxGEl0G16WLVqqRB5A91D
	IhnLZvpSmu7v0jmKFRYFTq4iQgi1EywILGwQA6D9Gv++orCFNwnton1674/vXDz+
	JFTYvX74BTUt8o5Ac1NVMyBJeVjFW4qg9ad5RSscDqFR+A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CGrYvXZT-pvp; Wed, 25 Sep 2024 16:56:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XDNCz56jPzlgTWK;
	Wed, 25 Sep 2024 16:56:15 +0000 (UTC)
Message-ID: <03b34628-d70b-4ce6-ad87-3c2070105bfa@acm.org>
Date: Wed, 25 Sep 2024 09:56:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] ufs: core: add a quirk for MediaTek SDB mode
 aborted
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com
References: <20240925095546.19492-1-peter.wang@mediatek.com>
 <20240925095546.19492-4-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240925095546.19492-4-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_095630_887327_80733B7A 
X-CRM114-Status: GOOD (  19.78  )
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

On 9/25/24 2:55 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Because the MediaTek UFS controller uses UTRLCLR to clear commands
> and fills the OCS with ABORTED, this patch introduces a quirk to
> treat ABORTED as INVALID_OCS_VALUE.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c       | 5 ++++-
>   drivers/ufs/host/ufs-mediatek.c | 1 +
>   include/ufs/ufshcd.h            | 6 ++++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 4fff929b70d6..d429817fca94 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -5404,7 +5404,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
>   		}
>   		break;
>   	case OCS_ABORTED:
> -		result |= DID_ABORT << 16;
> +		if (hba->quirks & UFSHCD_QUIRK_OCS_ABORTED)
> +			result |= DID_REQUEUE << 16;
> +		else
> +			result |= DID_ABORT << 16;
>   		dev_warn(hba->dev,
>   				"OCS aborted from controller for tag %d\n",
>   				lrbp->task_tag);
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index 02c9064284e1..8a4c1b8f5a26 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c
> @@ -1021,6 +1021,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
>   	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
>   	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
>   	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
> +	hba->quirks |= UFSHCD_QUIRK_OCS_ABORTED;
>   	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
>   
>   	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 0fd2aebac728..8f156803d703 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -684,6 +684,12 @@ enum ufshcd_quirks {
>   	 * single doorbell mode.
>   	 */
>   	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,
> +
> +	/*
> +	 * Some host controllers set OCS_ABORTED after UTRLCLR (SDB mode),
> +	 * this quirk is set to treat OCS: ABORTED as INVALID_OCS_VALUE
> +	 */
> +	UFSHCD_QUIRK_OCS_ABORTED			= 1 << 26,
>   };
>   
>   enum ufshcd_caps {

ufshcd_transfer_rsp_status() only has one caller, namely 
ufshcd_compl_one_cqe(). The previous patch makes sure that that 
ufshcd_compl_one_cqe() is not called if a SCSI command is aborted. So
why does this patch modify how OCS_ABORTED is processed? Is this patch
necessary or can it perhaps be dropped?

Thanks,

Bart.

