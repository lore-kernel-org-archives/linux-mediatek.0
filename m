Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D36C3ABBC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 May 2025 20:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oEjLAJ5MJCR9DXyM0kDJC2DJT9WpoekiwyCg7+L54VM=; b=WENzvvSfBB4yKLooTsUoGOSpW3
	uxnqoi6BNAP/xe5RxZIeqVsAsbEtEfy/Ir87ds+wTUozGAxRAwC0auvPw5Jd2TQHO8aznD34pJnsr
	nRM4OrkoSW/wmUUQ55nUVzvegp0OB9j6S2KmmD9h01wHQcZQZKqsTmNvXCR0hCV0uGIQL5PALF+7M
	WKcsrJ4LXMk+goOzv9EBcsIWzv2/6gOfE94EuB7rMw/dNNcSdTYYvv9agJP9x986iO2pheF+BiKEs
	amCEFxQ/DjmuU0eJXKxAu9Jg81A0obKi6CBOEJ9wbrQKsMNNcYSj8bmZWsncyDYpbYxGuIL6lsLmH
	VIA/XB/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCObE-0000000DKWC-44uE;
	Tue, 06 May 2025 20:09:09 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKxF-0000000CdrG-2w1g
	for linux-mediatek@lists.infradead.org;
	Tue, 06 May 2025 16:15:39 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZsNlw5NBWzlvBXp;
	Tue,  6 May 2025 16:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746548120; x=1749140121; bh=oEjLAJ5MJCR9DXyM0kDJC2DJ
	T9WpoekiwyCg7+L54VM=; b=NbQlOyCH1zKMZNJ2xEg57lzteu1dW07WpzdiUOgP
	CtxlrnVRj8P3LL4VXMP9JXD5JSu/uw84jetEEm1EJFWtZPslsdNRa7TNWlUvb9Dl
	CQ9OB7m72raomLLBa37CxkTl0NttuVArdb+VBqZmdMTKMMXTyzmslD1i49ox0yTE
	0PCFtKhL2YwWvRWYiD680Gjq03CCiIlovHObuOA4PoWQSQjT0YFKqCHWRslyIw9f
	NyX9Ai7KO7MxT9H9BeQYfc3O5dnjdMoo8yxUnEmQpGYrlHkFCq2GxpvCKnfvx+Oy
	hgHNDhBsxLT1kgnpIHBhw/4wlE/HHwxjQ+6qlnHIIyT8Ow==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LiH4KEfXhywU; Tue,  6 May 2025 16:15:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZsNlX3lBgzlvBXV;
	Tue,  6 May 2025 16:15:03 +0000 (UTC)
Message-ID: <04fc1549-0fa6-4956-b522-df5fbc26100c@acm.org>
Date: Tue, 6 May 2025 09:15:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix hwq_id type and value
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, quic_ziqichen@quicinc.com, stable@vger.kernel.org
References: <20250506124038.4071609-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250506124038.4071609-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_091537_817951_30919C20 
X-CRM114-Status: GOOD (  17.89  )
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

On 5/6/25 5:39 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Because the member id of struct ufs_hw_queue is u32 (hwq->id) and
> the trace entry hwq_id is also u32, the type should be changed to u32.
> If mcq is not supported, SDB mode only supports one hardware queue,
> for which setting the hwq_id to 0 is more suitable.
> 
> Fixes: 4a52338bf288 ("scsi: ufs: core: Add trace event for MCQ")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>   drivers/ufs/core/ufshcd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 7735421e3991..14e4cfbcb9eb 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -432,7 +432,7 @@ static void ufshcd_add_command_trace(struct ufs_hba *hba, unsigned int tag,
>   	u8 opcode = 0, group_id = 0;
>   	u32 doorbell = 0;
>   	u32 intr;
> -	int hwq_id = -1;
> +	u32 hwq_id = 0;
>   	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
>   	struct scsi_cmnd *cmd = lrbp->cmd;
>   	struct request *rq = scsi_cmd_to_rq(cmd);

Is this change really necessary? I like the current behavior because it
makes it easy to figure out whether or not MCQ has been enabled. Even if
others would agree with this change, I think that the "Fixes:" and "Cc:
stable" tags are overkill because I don't see this as a bug fix but
rather as a behavior change that is not a bug fix.

Thanks,

Bart.

