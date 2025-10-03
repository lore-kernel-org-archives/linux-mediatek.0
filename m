Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD56CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 16:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ3d8Ffh/1LgjQ6iaj4lMPycIAt2rbfoQUM0RcZ4GA8=; b=eCkYaReIk0PcHmnl9QmAbAW727
	Y9Age/QAeiqw12vxE0vsZH6woDZtb1V6R++7U+lZkyrdpZc4Gq1psE1Y2MSjbQNzHh4ZuR1JRP5xp
	r95L0ZPpmoh2e51O74rg4zzB17K6BgR4VdEy1jFyocYBsquJXP/JrSbJLTkYDRCXGKCYbkNL7g7V1
	GMTirl+fGyMkU4CDP1h/FHDsilYSVDcH3rq1ayh2IBVxabvjEixvRitDZeyTtEMCQ18cSn7bOEOcw
	EpaiEE927qaQ2m4RoavElgSQoJCo9G6/8ITuSUG37G14JdvdN2ILpyqw2ieWL1VHr7qIr7IxH3q6O
	7NCgPxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4iRl-0000000CiN3-3gvR;
	Fri, 03 Oct 2025 16:15:53 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4iRj-0000000CiMh-157n
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 16:15:52 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cdYg81fD7zlschR;
	Fri,  3 Oct 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759508144; x=1762100145; bh=HQ3d8Ffh/1LgjQ6iaj4lMPyc
	IAt2rbfoQUM0RcZ4GA8=; b=ueEWVnXleyFOJg3eWN4HTF7lirvGSa30gW3VV5v6
	Hw5SMc/Y2OAgJ6em4olx8SeQ0ZnnWUenzURT5CTG01A9yEyHIYVg87Nu2LWQ/URz
	0iTOsr0tV7N6hXlcvsCLUkYTyNlhkJx7SfabRxiblXFPCe1K7iMUzyzaqR0FUVr7
	YuOyTYrj815urokiRIlBdOzqk1ao5+i+AHHxb69cS9oaT9pQOWf47zN5D1kcUTcT
	fLgOaDcHMd4UlgPO/pfqPCXGH+6KyvBEw3GFXkgNj313UTWXJCur3Zuqag5uyObx
	fIitvB3iQUyywgwe1LVE7m+iTMKX0RQjg/u4kZtro3TpkQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id o9fEHU-0j7zU; Fri,  3 Oct 2025 16:15:44 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cdYfp47KzzlnfwY;
	Fri,  3 Oct 2025 16:15:29 +0000 (UTC)
Message-ID: <3e673104-d36a-4128-bb5c-a71093eda419@acm.org>
Date: Fri, 3 Oct 2025 09:15:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix error handler host_sem issue
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, dan.carpenter@linaro.org
References: <20251003101115.3642410-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20251003101115.3642410-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_091551_387828_45B458AD 
X-CRM114-Status: GOOD (  11.49  )
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

On 10/3/25 3:10 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 8185a7791923..9b1207dede64 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6670,6 +6670,14 @@ static void ufshcd_err_handler(struct work_struct *work)
>   		 hba->saved_uic_err, hba->force_reset,
>   		 ufshcd_is_link_broken(hba) ? "; link is broken" : "");
>   
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
> @@ -6681,14 +6689,6 @@ static void ufshcd_err_handler(struct work_struct *work)
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

The purpose of hba->host_sem is to serialize power management
operations, error handling and sysfs callbacks. Hence, I think that
hba->host_sem should be held around the ufshcd_link_recovery() call
and hence that the code block that is moved by this patch should not
be moved.

Thanks,

Bart.

