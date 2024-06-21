Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B08C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTSYU1kVl3DHsDxZJ1sFGUFl6eT3l25ACbywCEAlgjY=; b=zilpQcyZGwYBc/nET0Wc0xtUzu
	N6jtW+awK6NhxNqCOig6h93a+gzMX4PW+cIppVeyoiVL+CF0Uo7PQYFe6EFWHbqaradFCnddMfV/b
	QJ8XohyMYZQBt46e5QNZttGhHDxt63OthuG+knhTP594B9hFunGXzMV1zRUSLU6150fivKdN40vfM
	PBI1H+BLbZqVA3Y353hw2KF1p9Qb76uE58vqqIu/3zNNb3Q4TVX+btykTRnS3Nu5sj1nOfwPwSTYJ
	rCqhZSiEFKp8QWCLbpxwKqXxwM68bQYksPlnwJLFOHG8zO8TvMbAYNnQPmL2aoQwyQUfuwO9lz/xN
	ss7dZCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhrt-0000000A4xu-3RYR;
	Fri, 21 Jun 2024 17:16:09 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKhrq-0000000A4vJ-1PSC
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jun 2024 17:16:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W5PC76sHTz6CmR09;
	Fri, 21 Jun 2024 17:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1718990156; x=1721582157; bh=YTSYU1kVl3DHsDxZJ1sFGUFl
	6eT3l25ACbywCEAlgjY=; b=KHjo8jDZvMKzGX650RHj4ZkZFQPqfylxn/Xkb4Uf
	K8SdxKMcfagBl+ZYpxcJR05QjnWJjOoEjklm2iD5E+r+qf+52ZrQTk3bPw/srhRn
	bOLLtdS1SqsF/DD8wIMfHDu6QIlzdCDv3uoRdhvbQef+pSgpMfKjFT6qIUz4oYyA
	jnK3FzkcB7x+aTWjWjEyCGbT0aTGUIIheFVgOaonujmAUHj8+NQoYKP6sRT38wrG
	sm18qeYcHivI9b3Y1PbJajmLo8EQoVknbmbVedCXNTKrxk8E0XnRHdCeL0+T5Q1w
	RfK629DFkBJXV0z8fwwatnQQlDy82ZtzB7bvj7pPAwPHjA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id aXwJpsBMQqyY; Fri, 21 Jun 2024 17:15:56 +0000 (UTC)
Received: from [192.168.137.167] (29.sub-174-194-195.myvzw.com [174.194.195.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W5PBw6Dj9z6CmR07;
	Fri, 21 Jun 2024 17:15:52 +0000 (UTC)
Message-ID: <4ad91e15-f1f9-40cc-b45a-4eed2932a72c@acm.org>
Date: Fri, 21 Jun 2024 10:15:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix ufshcd_abort_all racing issue
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240621113051.29523-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240621113051.29523-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_101606_662234_36758DA9 
X-CRM114-Status: GOOD (  12.86  )
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

On 6/21/24 4:30 AM, peter.wang@mediatek.com wrote:
 > [ ... ]

Fixes: and Cc: stable tags are missing from this patch. Please add
these.

> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 8944548c30fa..3b2e5bcb08a7 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -512,8 +512,9 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
>   		return -ETIMEDOUT;
>   
>   	if (task_tag != hba->nutrs - UFSHCD_NUM_RESERVED) {
> -		if (!cmd)
> -			return -EINVAL;
> +		/* Should return 0 if cmd is already complete by irq */
> +		if (!cmd || !ufshcd_cmd_inflight(cmd))
> +			return 0;
>   		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(cmd));
>   	} else {
>   		hwq = hba->dev_cmd_queue;

This code change reduces the race window but does not eliminate it since
no locks are held around this code path.

Additionally, are you sure that this change is necessary? I don't think
that ufshcd_err_handler() calls ufshcd_mcq_sq_cleanup().

Thanks,

Bart.

