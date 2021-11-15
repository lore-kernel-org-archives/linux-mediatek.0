Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04129C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 19:50:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE44861B32
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 19:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE44861B32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=acm.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxO59u/hEi7I95LZwKAZGH5x2gDo1PGjGRaJMa0jUIc=; b=kUZ64pnmYoAvIAd6iP1tyWUi/h
	/DBQnd9naVjwlqrRpOTd2MsiPrHK6dDSTRbgVzCbvk2q2byBOlxRa366a+Jdevu+GYKZrxZRZSwsl
	lv/xYXp7jSYgOSwGRfc6HR6wXdu1b00BnR2ZBFqvC8XpjftgQKfj6xEaTRVNrFA6srk0T0ACeujAv
	PJa3aryEEJbUF87SgR4IrqbVEoSCm8QE7ucbUwrSj4H1dVmBuU+U1dYad0pSIx1pgJC90s0MghIJD
	6mNyKm6c+0kUTuTUepTmbrkvXdP1aPQsvjNw1brYmU4Ri2+RIniEjbLoM4lsEtR7LWuaqxSrQm2Ho
	vd82xs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmhz8-00GxUD-UC; Mon, 15 Nov 2021 19:49:46 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmhz6-00GxTu-Ns
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 19:49:46 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so519348pjj.0
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Nov 2021 11:49:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vFKzuQlU2ExoKG36bibN1FnGyNO3yT/Oc3goa7vHiN8=;
 b=fIAPBHsQ2ID6rHdhZY0jkf9uVVTRSzUMCcejPdcEP1AOSggkgSm3R1SSog1CnU76Ig
 VanAONiQV5lmxRVYtQMYEuK/serzStPcEQl3kva3nR0co/Q1x/HqEYsgA8VRZZVV0IcQ
 yCYEciBRoHsndTyT2wjn6/71JmddOQ2HrRK4NDObimacHiom099lDvR3QVrOtGKHP8Hf
 FsdRLsq/LwiLYE80spS+gKpgx7abinnt2PyiPpw8baVW4tke9pP9yvdGqkgjgNtCnCVc
 CCTapuTtvgklsvaYVhAZSePnrGAa1adIT0+ot81HrLgFSmhHL4CTXVOM5qOZRjbcVPmW
 JzFg==
X-Gm-Message-State: AOAM533jfv9vtxwrFwX+4etnovhc2V4gjTHRJmkQxa9sS0L5QQeQCyaM
 kr6c2A6X5hFhvdFiOdsZGBU=
X-Google-Smtp-Source: ABdhPJymuIuJ56AkZaBpJS6NC3I8OklnJtNhtbZ1ojRWxKu86YizEaReWhp5MoEduuANO2WXrV9hvA==
X-Received: by 2002:a17:90b:33cf:: with SMTP id
 lk15mr1360061pjb.85.1637005784020; 
 Mon, 15 Nov 2021 11:49:44 -0800 (PST)
Received: from bvanassche-linux.mtv.corp.google.com
 ([2620:15c:211:201:c779:caf7:7b7f:3ecd])
 by smtp.gmail.com with ESMTPSA id m184sm12250356pga.61.2021.11.15.11.49.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 11:49:43 -0800 (PST)
Subject: Re: [PATCH v1] scsi: ufs: fix tm cmd timeout/ISR racing issue
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 jonathan.hsu@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 mikebi@micron.com
References: <20211111094939.14991-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <08cff383-d944-56f3-e61e-ad6fdf4bb885@acm.org>
Date: Mon, 15 Nov 2021 11:49:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111094939.14991-1-peter.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_114944_815765_C4C90DDA 
X-CRM114-Status: GOOD (  19.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/11/21 1:49 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When tmc 100 ms timeout and recevied tmc complete ISR concurrently,
> Bug happen because complete NULL poiner and KE.
> Fix this racing issue by check NULL and use host_lock protect.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/scsi/ufs/ufshcd.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 5c6a58a666d2..6821ceb6783e 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -6442,7 +6442,8 @@ static irqreturn_t ufshcd_tmc_handler(struct ufs_hba *hba)
>   		struct request *req = hba->tmf_rqs[tag];
>   		struct completion *c = req->end_io_data;
>   
> -		complete(c);
> +		if (c)
> +			complete(c);
>   		ret = IRQ_HANDLED;
>   	}
>   	spin_unlock_irqrestore(hba->host->host_lock, flags);
> @@ -6597,7 +6598,10 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba,
>   		 * Make sure that ufshcd_compl_tm() does not trigger a
>   		 * use-after-free.
>   		 */
> +		spin_lock_irqsave(hba->host->host_lock, flags);
>   		req->end_io_data = NULL;
> +		spin_unlock_irqrestore(hba->host->host_lock, flags);
> +
>   		ufshcd_add_tm_upiu_trace(hba, task_tag, UFS_TM_ERR);
>   		dev_err(hba->dev, "%s: task management cmd 0x%.2x timed-out\n",
>   				__func__, tm_function);

Isn't this already addressed by Adrian Hunter's patches? See also
https://lore.kernel.org/linux-scsi/20211108064815.569494-1-adrian.hunter@intel.com/

Thanks,

Bart.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
