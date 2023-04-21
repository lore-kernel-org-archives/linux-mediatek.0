Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C70C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dfyv5FN7xF6QzY/YKdeFbK9UZIryP5DcTEQcPzQtdzY=; b=CH01jDIObxaI04AcqiUgVvpFNQ
	+K6mkwn0FqEwJ0YhEcS9R2cnN3dc+NxXFJibkhk7sNji6Y2Rs52f+ylfoRZ0M+5bjsVZR8dltjmt2
	sdOujHjDlhOMq5Biz5nGaPqRkPKwgvLZs87vdo2Ku7Nb6s/EB/9/WFRXNXhEmkCh0xHg8V/ysBigd
	ekw4RVfu8QO7V8GO37Wv/+T/KVFPysk+ZZAi+h9cypOhUTcr4N5Hsl8j79sXbLO6vK0pdvJfnbga+
	fqm2w9xUL1r9b8m88RooUxHRkKa5988DAUN7sddwKRPJDLpoSluY5LDWTFhOAo2J2GeqrrG+H9RLo
	0I3wU3nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppx1v-00BmHO-1y;
	Fri, 21 Apr 2023 20:06:51 +0000
Received: from mail-pf1-f170.google.com ([209.85.210.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppx1r-00BmGd-1A;
	Fri, 21 Apr 2023 20:06:48 +0000
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso2200109b3a.2;
        Fri, 21 Apr 2023 13:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682107606; x=1684699606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dfyv5FN7xF6QzY/YKdeFbK9UZIryP5DcTEQcPzQtdzY=;
        b=GNR4VBD7rjwA1eoPY9Jjcnt7LXkXDMLQjWXsBza4iyKU/pDQCvqCcJ+ygb5/Wx9UI4
         kUwpK5EcS/721+8QAVA9lwWhDeGRAb6Hf+ND78pHLUETxDgxnAD9za0bmXnAde2G4ERH
         rElZAUIef/fb/NS/awVzq4qiQG4gkNuHiYlNTSXYl5lZGJ8fWxSFBTB9Y+209fwXy5u7
         gdfmDkFwHsCKd9E7wkUtKk43nB7KOiTPxoZ2judueG2TeKexV+4zI4Iwf/dxGbo9e/KJ
         FQqHPzpJihfT7XsLKWZPBlta0M1srlgVS+0MfruAebO73AeQu1GtXOLeZsboX39S32TA
         Acow==
X-Gm-Message-State: AAQBX9fi5FJn0xkJw0Y8RYsX7wMKEeCKwfZKQRWwAYG1nWUPbnfjKjwb
	tUCDUU/VOAOPYPsklazfdf8=
X-Google-Smtp-Source: AKy350ZXdc4qGBNAbdHsNqr7fR3Yeo/NPEkEskreo/KMkEW84H+StzQOr19IbrV3KCX8h/loRQwoLw==
X-Received: by 2002:a05:6a00:2e8f:b0:626:1523:b10d with SMTP id fd15-20020a056a002e8f00b006261523b10dmr7418054pfb.4.1682107606102;
        Fri, 21 Apr 2023 13:06:46 -0700 (PDT)
Received: from [192.168.3.219] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id l6-20020a656806000000b0051b71e8f633sm2956011pgt.92.2023.04.21.13.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:06:45 -0700 (PDT)
Message-ID: <fd67589e-58a4-3f5a-cc49-528bb70fd4e7@acm.org>
Date: Fri, 21 Apr 2023 13:06:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 3/5] scsi: ufs: core: Fix mcq nr_hw_queues
Content-Language: en-US
To: Po-Wen Kao <powen.kao@mediatek.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 stanley.chu@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com, cc.chou@mediatek.com, eddie.huang@mediatek.com,
 mason.zhang@mediatek.com, chaotian.jing@mediatek.com, jiajie.hao@mediatek.com
References: <20230307065448.15279-1-powen.kao@mediatek.com>
 <20230307065448.15279-4-powen.kao@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230307065448.15279-4-powen.kao@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_130647_421470_ED44FC86 
X-CRM114-Status: GOOD (  16.10  )
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

On 3/6/23 22:54, Po-Wen Kao wrote:
> Since MAXQ is 0 based value, add one to obtain number of hardware queue.
> 
> Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
> Reviewed-by: Bean Huo <beanhuo@micron.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
> ---
>   drivers/ufs/core/ufs-mcq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index a39746b2a8be..c7b807f58dca 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -150,7 +150,8 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>   	u32 hba_maxq, rem, tot_queues;
>   	struct Scsi_Host *host = hba->host;
>   
> -	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
> +	/* maxq is 0 based value */
> +	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1;
>   
>   	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
>   			rw_queues;

Please resend this patch.

Thanks,

Bart.

