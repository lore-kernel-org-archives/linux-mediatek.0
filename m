Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DDDCCA470
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rd0nIlpZ+c+jqQhytSxBweToi9xbglU2yopC9Vl/e+o=; b=KVroec0NwLufSxKw1KYPGsyI3J
	FGitfoR7tWd0b0zMV+d3ktLShkLmcUCWE0Xsk5VpSySKaPlRUeK0F2KQkgb4xxnvQVakRjOQmkeDw
	svczzxeMCsbKWBNLP0zZ+vuUDsXbE5zqEJ4+YKSj+zR4K6b19/IK2tRRB581t3W3+ttBwsYFgVOFJ
	XAkZPbnU/Kqi2Jq1cWxr4vo9HGSEWPyI+QCNaJep9lmfHDo/kJFCVz6Hb8ROasFKyBM/3gRqAClob
	fTfnt7rBWg51ykBFzFmGp/T0nHndrIDWqtuzgIohXK0Hz4VSju4j4TaI/67+RYG6A/zXiQrm5gqqF
	Q4IMDnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YEY-00000004OrG-20hJ;
	Wed, 08 Oct 2025 17:45:50 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6YEV-00000004Oqk-1c9k
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 17:45:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4chgQf1Q1lzlgqVj;
	Wed,  8 Oct 2025 17:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759945542; x=1762537543; bh=rd0nIlpZ+c+jqQhytSxBweTo
	i9xbglU2yopC9Vl/e+o=; b=NjVaD6tBll4DdmwwF3esq736GrGTFvDfwa/YuQ1w
	RN5THCsBJR604ZA8Gon3q7hWJbNNTpWcqA8gNOphBE8jIYNAFp0j6rYLBzJGHLXN
	oMYfEdCbx3TS0fqrAthGK8WBkU4++QzPAd6T4HPC7dTcQA7XJ9JxLf5ov/Hi6AKN
	AuIyoDeGJqp3PMmBnazh8Pw9efzHf0vmW+9Yo/jYxePV9W5f09lZ2HeP70aLVMG4
	P/Oca6iYIzOOGvS5X6/VFJtm3jXjKBgEXPgY0W/UZL4ZUE9rEp/BIpQSH4+QcICE
	A3mN8EvrjjWKXinbuRcsC14VEcztoHI3EnFUQi2ocOz/wA==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LJHjrfKlQtI0; Wed,  8 Oct 2025 17:45:42 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4chgQH4wXZzlh3sY;
	Wed,  8 Oct 2025 17:45:26 +0000 (UTC)
Message-ID: <95e34475-0248-4c79-aedc-2922debcc9f2@acm.org>
Date: Wed, 8 Oct 2025 10:45:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Fix error handler host_sem issue
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
 naomi.chu@mediatek.com, ed.tsai@mediatek.com, dan.carpenter@linaro.org
References: <20251008065651.1589614-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251008065651.1589614-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_104547_521107_D31983B5 
X-CRM114-Status: GOOD (  16.94  )
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

On 10/7/25 11:55 PM, peter.wang@mediatek.com wrote:
> Fix the issue where host_sem is not released due to a new return
> patch in commit f966e02ae521. Check pm_op_in_progress before
> acquiring hba->host_sem to prevent deadlocks and ensure proper
> resource management during error handling. Add comment for
> use ufshcd_rpm_get_noresume() to safely perform link recovery
> without interfering with ongoing PM operations.
> 
> Fixes: f966e02ae521 ("scsi: ufs: core: Fix runtime suspend error deadlock")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 8185a7791923..ff7a3d60b11d 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6670,6 +6670,20 @@ static void ufshcd_err_handler(struct work_struct *work)
>   		 hba->saved_uic_err, hba->force_reset,
>   		 ufshcd_is_link_broken(hba) ? "; link is broken" : "");
>   
> +	/*
> +	 * Use ufshcd_rpm_get_noresume() here to safely perform link recovery
> +	 * even if an error occurs during runtime suspend or runtime resume.
> +	 * This avoids potential deadlocks that could happen if we tried to
> +	 * resume the device while a PM operation is already in progress.
> +	 */
> +	ufshcd_rpm_get_noresume(hba);
> +	if (hba->pm_op_in_progress) {
> +		ufshcd_link_recovery(hba);
> +		ufshcd_rpm_put(hba);
> +		return;
> +	}
> +	ufshcd_rpm_put(hba);
> +
>   	down(&hba->host_sem);
>   	spin_lock_irqsave(hba->host->host_lock, flags);
>   	if (ufshcd_err_handling_should_stop(hba)) {
> @@ -6681,14 +6695,6 @@ static void ufshcd_err_handler(struct work_struct *work)
>   	}
>   	spin_unlock_irqrestore(hba->host->host_lock, flags);
>   
> -	ufshcd_rpm_get_noresume(hba);
> -	if (hba->pm_op_in_progress) {
> -		ufshcd_link_recovery(hba);
> -		ufshcd_rpm_put(hba);
> -		return;
> -	}
> -	ufshcd_rpm_put(hba);
> -
>   	ufshcd_err_handling_prepare(hba);
>   
>   	spin_lock_irqsave(hba->host->host_lock, flags);

Thanks!

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


