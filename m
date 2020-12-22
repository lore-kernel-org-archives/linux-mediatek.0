Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6667C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 11:33:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8757423124
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 11:33:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8757423124
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XqQ7VtX7nOyu+qGAs9bIOPA3JaC/SQ08Z3JLHvOMJgU=; b=damqpGb8STl4+OixZW+nv1Q/t
	TkEHcYvSBMd//MiAg9Fm/ZH6P66i1tUnhbug3nfeDYXebMxVTuss9+NliQKyblpsxJJpQO4G28DS3
	5Ztm3b1NFI6c/1dUBAPNag0cJh8PQEHojUmFyV8NBWPkXzc4g9wIT2vdmcOB8vtPZbr2shjymUWoo
	SzO7w9i5CYuRKd+qWjIsec/U0aHHiPHEyrz+h1Ws1OncXGAyb29bAc9pJAUBwUH1PsG8s8OdSiPTb
	hKfqHPOI1y7UBrx+M2UcTYg5rxmJCYfose+PTMaMIwuYVtb46xE+fqBPUPLWISz6KhNVsXqDxsL8T
	uCHxPDTJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krfv2-00041Z-2s; Tue, 22 Dec 2020 11:33:32 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krfux-00040Z-9X
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 11:33:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608636808; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=E8HQMio4RsYHO6n1kGjpbJsWX+/FYy067JA+sAFufFU=;
 b=BYv1tD4szThyzmKiy+3ddyycE2zCfI7xnERjSIgnHnYdfCCCacbMCflTrOMV3YeBOuds84DL
 Vf5DaLs1RE+s7HVfiWV6r46MPCj3Aa4/glMi01kUXc6rhRx4+q1Ir1N/L5iO+lYeOkjzWc1x
 I9vAtNqyvA1hSMrYApc3f7rTyeQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe1d980cfe5dd67dbc164ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 11:33:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0D133C43461; Tue, 22 Dec 2020 11:33:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B1CD2C433CA;
 Tue, 22 Dec 2020 11:33:18 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Dec 2020 19:33:18 +0800
From: Can Guo <cang@codeaurora.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Fix possible power drain during system
 suspend
In-Reply-To: <20201222072905.32221-2-stanley.chu@mediatek.com>
References: <20201222072905.32221-1-stanley.chu@mediatek.com>
 <20201222072905.32221-2-stanley.chu@mediatek.com>
Message-ID: <66348e3c157ef48485f07d4b4043f01f@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_063328_982027_6CA2F753 
X-CRM114-Status: GOOD (  17.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-22 15:29, Stanley Chu wrote:
> Currently if device needs to do flush or BKOP operations,
> the device VCC power is kept during runtime-suspend period.
> 
> However, if system suspend is happening while device is
> runtime-suspended, such power may not be disabled successfully.
> 
> The reasons may be,
> 
> 1. If current PM level is the same as SPM level, device will
>    keep runtime-suspended by ufshcd_system_suspend().
> 
> 2. Flush recheck work may not be scheduled successfully
>    during system suspend period. If it can wake up the system,
>    this is also not the intention of the recheck work.
> 
> To fix this issue, simply runtime-resume the device if the flush
> is allowed during runtime suspend period. Flush capability will be
> disabled while leaving runtime suspend, and also not be allowed in
> system suspend period.
> 
> Fixes: 51dd905bd2f6 ("scsi: ufs: Fix WriteBooster flush during runtime 
> suspend")
> Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index e221add25a7e..9d61dc3eb842 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -8903,7 +8903,8 @@ int ufshcd_system_suspend(struct ufs_hba *hba)
>  	if ((ufs_get_pm_lvl_to_dev_pwr_mode(hba->spm_lvl) ==
>  	     hba->curr_dev_pwr_mode) &&
>  	    (ufs_get_pm_lvl_to_link_pwr_state(hba->spm_lvl) ==
> -	     hba->uic_link_state))
> +	     hba->uic_link_state) &&
> +	     !hba->dev_info.b_rpm_dev_flush_capable)
>  		goto out;
> 
>  	if (pm_runtime_suspended(hba->dev)) {

Reviewed-by: Can Guo <cang@codeaurora.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
