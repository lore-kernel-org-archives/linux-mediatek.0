Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07BBECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhGz1o6DQnzxBuA3jBt10TbR2anRakqtBYrmL8Gd4kc=; b=zKkiK3Lh6lwxL+DuMxOzx+wSmq
	0nVDvF2SQuCo7xUhCvVCt7gzNbtjYRQhLouCNj+cNZCnFIvi0/YBfyu20twEB6efm59/+vyrJZ3ie
	8Xi8jMEYwUH886c/unjNPaG1gvk5enkYiSad+C9XdqOcagxJh7nQFZEQ4sFqdmIZdVDUazK0JIgeP
	Q9j80W6MXwpenVfDF60rQt0mIz4fhiQcWE0tFH3ktWRX/KuyNnbJrQa8xPBi3OwnnNERrTpImZvAi
	mlszXCzdDMIg1INGDmU+V2H+OzK8vHfJJ2eEcyxkq7MZkyhOcLQJNMOV3o343HqCfwruUGJK1Jsf5
	3vIRCXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhMA-00000002gTA-23Io;
	Mon, 09 Sep 2024 16:35:14 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhM6-00000002gSa-42ig
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 16:35:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X2XW22bNtz6ClbFf;
	Mon,  9 Sep 2024 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725899699; x=1728491700; bh=rhGz1o6DQnzxBuA3jBt10TbR
	2anRakqtBYrmL8Gd4kc=; b=uG/RojT6jz5IlNwuYFUZmtUatb+JLEYE6yhFRQ37
	xk2kvuPeI0ccPf9bLCpPhYpEwGSOMN/peD20A9f+gSjhQ2FVaY6vOXj7gikS9Q8D
	4dvCmLRafT/602JO2gbtJL5f8T7BaGcbZX6nrzLQaZNx4fJ6Y7fpQ8qjDG3BxRGt
	KFUkogOOHPvqsho1zKArWqz2Cnq5FPRQZ15uZMB3LR0Sy2kDwKdXzX5eZdHySih4
	QkeaAl2nmgGEtoeVaG11QLc9gXc/dpd9kW09zQqHEorf40nVmNy9CU3CjkuUeaxC
	hrO3oyd0X1bWvh2fWnJr3OAW6QAHWl0+buUWn8ZUuJTmwQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iHK1D7E3_mxJ; Mon,  9 Sep 2024 16:34:59 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X2XVk0qcwz6ClbFZ;
	Mon,  9 Sep 2024 16:34:53 +0000 (UTC)
Message-ID: <c4d22b9c-2554-4871-94dc-3dae4bd62a5a@acm.org>
Date: Mon, 9 Sep 2024 09:34:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ufs: core: requeue aborted request
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20240909082100.24019-1-peter.wang@mediatek.com>
 <20240909082100.24019-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240909082100.24019-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_093511_061537_1E020549 
X-CRM114-Status: GOOD (  17.69  )
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

On 9/9/24 1:21 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 3903947dbed1..1f57ebf24a39 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -642,6 +642,7 @@ static bool ufshcd_mcq_sqe_search(struct ufs_hba *hba,
>   		match = le64_to_cpu(utrd->command_desc_base_addr) & CQE_UCD_BA;
>   		if (addr == match) {
>   			ufshcd_mcq_nullify_sqe(utrd);
> +			lrbp->abort_initiated_by_err = true;
>   			ret = true;
>   			goto out;
>   		}

As mentioned before, I think that this change is wrong. Setting
lrbp->abort_initiated_by_err affects the value of scsi_cmnd::result.
This member variable is ignored for aborted commands. Although the
above change does not affect the SCSI error handler, I think it should
be left out because it will confuse anyone who reads the UFS driver code
and who has not followed this discussion.

> @@ -7561,6 +7552,16 @@ int ufshcd_try_to_abort_task(struct ufs_hba *hba, int tag)
>   		goto out;
>   	}
>   
> +	/*
> +	 * When the host software receives a "FUNCTION COMPLETE", set flag
> +	 * to requeue command after receive response with OCS_ABORTED
> +	 * SDB mode: UTRLCLR Task Management response which means a Transfer
> +	 *           Request was aborted.
> +	 * MCQ mode: Host will post to CQ with OCS_ABORTED after SQ cleanup
> +	 */
> +	if (!err)
> +		lrbp->abort_initiated_by_err = true;

Please add a comment that explains that the purpose of this code is to 
requeue commands aborted by ufshcd_abort_all().

> + * @abort_initiated_by_err: abort initiated by error

The member variable name and also the explanation of this member
variable are incomprehensible to me.

Thanks,

Bart.

