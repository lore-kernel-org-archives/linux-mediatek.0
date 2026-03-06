Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0CDFCB61E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 16:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUMcn21fRpVvqrGOqfVjdpLc64MmlG9YmMC8WmKCo+Y=; b=NUn6HgNHrWwjaoRAw/9/YLiheN
	tn2QWADkptD6XIg/sJ7Yum95N2xdiC/+9e0J4utbgG5VTIehl+IulnsGFj6XICtB9Bs+ETkfJ6cBH
	U5THO581atucjGdXkDjqZb4edIW/6iLxi+WfMBLa7DkpS+AyjiG8/Bw+mormDyiPU0SEKQAgDIBYG
	0sdjEYddl9oPmGZfvMYQp9OpWj7t6V53CVhAJUSegBimZRU6rg1x9wmiXh7YwRW/7ykTB21LJrrOj
	gerdfGLTFIskwB6NNkwRLAHYfNnbm+Mpy2txXcFcIaW4/mAbnPiPo1MHUmXr1+vb/w+HTNIyqnPFm
	cB4ALBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY8U-00000004Aq1-1hmv;
	Fri, 06 Mar 2026 16:34:46 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyY8S-00000004Ape-0vqX
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 16:34:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fSBnv1zDbz1XMFjb;
	Fri,  6 Mar 2026 16:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772814875; x=1775406876; bh=eUMcn21fRpVvqrGOqfVjdpLc
	64MmlG9YmMC8WmKCo+Y=; b=eVHUZDn7dDf6ss9LzktVwxMu+tMRj0UG7vAENGxq
	U3RSfYM7mcFpqdh9g1tO7EqK6CNTwzsj5H+Oa9CaBtUjV0xktg1v8QdYRzYg+OIZ
	FpIeEfoKCX867X0T3EfpgL9EuGWXiDV1w+4Ye1VIRnHQ9gAnFLTz4aBSQ62vf8CC
	vq9ki44dAtUWy+p01XlLZGN9NGhC0NDCxd8aqvCvM7jPuNCoTPB3u5EwAPw5MwPS
	XC82JA+XzvhhnMEyFSbrcUpwszflJ7e1P6SmItkFTOXupB41SPU2dMXocQ9Il0kB
	bLq1pLeRj+I9cnqhHvRWEupDlPqfSrKVVp91G2E+34DSYg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id uFYceNCoOJXC; Fri,  6 Mar 2026 16:34:35 +0000 (UTC)
Received: from [10.96.36.50] (unknown [12.131.83.251])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fSBnd6ylmz1XM0p2;
	Fri,  6 Mar 2026 16:34:29 +0000 (UTC)
Message-ID: <048e761a-0fed-43f7-a194-f804b9b08918@acm.org>
Date: Fri, 6 Mar 2026 10:34:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260306054419.3816557-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_083444_307228_7413CD82 
X-CRM114-Status: GOOD (  10.32  )
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

On 3/5/26 11:43 PM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 9908375b2f98..6554e1db3343 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -7200,8 +7200,12 @@ static irqreturn_t ufshcd_intr(int irq, void *__hba)
>   	struct ufs_hba *hba = __hba;
>   	u32 intr_status, enabled_intr_status;
>   
> -	/* Move interrupt handling to thread when MCQ & ESI are not enabled */
> -	if (!hba->mcq_enabled || !hba->mcq_esi_enabled)
> +	/*
> +	 * Handle interrupt in thread if MCQ or ESI is disabled,
> +	 * and no active UIC command.
> +	 */
> +	if ((!hba->mcq_enabled || !hba->mcq_esi_enabled) &&
> +	    !hba->active_uic_cmd)
>   		return IRQ_WAKE_THREAD;
>   
>   	intr_status = ufshcd_readl(hba, REG_INTERRUPT_STATUS);

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

