Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998CBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 18:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+q6n80AI/p5yu9Dywj66FNMpbfZPHnd7kd9qY/cbMFk=; b=jTUbs4xp4QzQ5tbS06/PodGRk9
	IF0zFdDpGZkbQKArjTwbn6Odxet6EsnJR9HgTNtpsYLGdejMGkMDJfjgCT74S1N7T1621nBZ1K93/
	JTTuYVQKOC4dsgGbS70cfP0eSOBEO8MNYM2cDCMERQ8sHCOu01d1ylCiNAqa0tTvVQAEg6p8ReWov
	hmc5uQQUHSBo1RzqJwVJxhqte2/S/4zOFBNL8Ge/QTD6dqdqeqqRHxCwvYYFJVNlThbXZdmSfPoo9
	VGnLMPV2wGykToPUfzYci6vbxXphGSU24b4diqSfVhCySC0wPHrsSRip+EvV0qJcWI2acj9c6whm8
	0DY9jhew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3iSd-00ATQ8-HY; Fri, 09 Dec 2022 18:51:03 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3iST-00ATFP-Md; Fri, 09 Dec 2022 18:50:55 +0000
Received: by mail-pf1-f171.google.com with SMTP id c13so4337262pfp.5;
        Fri, 09 Dec 2022 10:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+q6n80AI/p5yu9Dywj66FNMpbfZPHnd7kd9qY/cbMFk=;
        b=0RKCkg824esFXtfV/rQkxOR3HCjEIa0qRwMMO2T6Di1BtwWIQusk8Z+miix6Pg1bF6
         dM7H4utw6cJtOX3fUFJAh1/DxVHGmajoXIudgIQTJRiqxBppDC0ntzBM9WlS90v7PEVv
         kpe3EfZrRjVsVKHWbLsPT85OGJKy4AF2ywSMv9o46axyTyDCB8cKvaBqlC1doK/38wnX
         q1OMgNt9WhcNX9FnGCUr9LlCvdSF7S7UpOMffZozX+Fo1kzTFzT/les3mt2c/xOL9BIr
         oiQtxltE0un+LNOSf8Nj+bYqyaX07uZqyp/Vir3TWsKcIh+WmiXIFRS/EXkF7A7zb9mt
         2mbg==
X-Gm-Message-State: ANoB5plTZmBx8kOTfh7lIG7IuLx6u18dQ+9qyQ7S3As8hHZX4EP9ruH6
	FW0mr4zV34pm78g/Lab8dJg=
X-Google-Smtp-Source: AA0mqf7ioBFgGmxkLMOXkzgWz2cpnnogR2IwP0DGXq3yGgDbL4gF9Gp76dBdoZ3pXK2AacI3Cm3rbg==
X-Received: by 2002:aa7:8298:0:b0:56d:5de0:111b with SMTP id s24-20020aa78298000000b0056d5de0111bmr6875047pfm.33.1670611850939;
        Fri, 09 Dec 2022 10:50:50 -0800 (PST)
Received: from ?IPV6:2620:15c:211:201:5c4e:b71f:9cdc:e100? ([2620:15c:211:201:5c4e:b71f:9cdc:e100])
        by smtp.gmail.com with ESMTPSA id y29-20020aa79e1d000000b00573eb4a9a66sm1553974pfq.2.2022.12.09.10.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 10:50:50 -0800 (PST)
Message-ID: <d53f0b3e-a831-ed1e-9a8e-3c6902a81fdf@acm.org>
Date: Fri, 9 Dec 2022 10:50:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 1/1] scsi: ufs: core: fix device management cmd timeout
 flow
Content-Language: en-US
To: Mason Zhang <mason.zhang@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Jinyoung Choi <j-young.choi@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Peter Wang <peter.wang@mediatek.com>, Peng Zhou <peng.zhou@mediatek.com>,
 wsd_upstream@mediatek.com
References: <20221209101321.30671-1-mason.zhang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20221209101321.30671-1-mason.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_105053_766432_22D1ADB6 
X-CRM114-Status: GOOD (  14.48  )
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

On 12/9/22 02:13, Mason Zhang wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index b1f59a5fe632..6fe51b8d41f9 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -2979,35 +2979,31 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
>   		err = -ETIMEDOUT;
>   		dev_dbg(hba->dev, "%s: dev_cmd request timedout, tag %d\n",
>   			__func__, lrbp->task_tag);
> -		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0) {
> +		if (ufshcd_clear_cmds(hba, 1U << lrbp->task_tag) == 0)
>   			/* successfully cleared the command, retry if needed */
>   			err = -EAGAIN;
> +		/*
> +		 * in case of an error, after clearing the doorbell,
> +		 * we also need to clear the task tag bit from the
> +		 * outstanding_reqs variable.
> +		 */
> +		spin_lock_irqsave(&hba->outstanding_lock, flags);
> +		pending = test_bit(lrbp->task_tag,
> +				   &hba->outstanding_reqs);
> +		if (pending) {
> +			hba->dev_cmd.complete = NULL;
> +			__clear_bit(lrbp->task_tag,
> +				    &hba->outstanding_reqs);
> +		}
> +		spin_unlock_irqrestore(&hba->outstanding_lock, flags);

This patch causes the 'task_tag' bit to be cleared from outstanding_reqs 
even if ufshcd_clear_cmds() failed. I think that's wrong.

Bart.

