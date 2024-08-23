Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C75C5321D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rg5eyOwxNiG+PX9AoHJo/afzOMXnjg8jta0yJK0fqtI=; b=4XNTHI7h5W04H+yYw1wWXUQVcO
	fzrQ0LDPFfRRKZ6stpOoPadZdglPgke/aI9s8uaRiIAzn010DmqYaASv/0LS1089Yqz+X6bSuK/Hr
	Xwo53jGiwXnv3z/l+YKeOJmEn75mZ1E8gOuQP1VLzG+kS09WUN0SGsh6MSyuSwrsTpnk62gbBlFLG
	gqvE17x4JNN2rzrR+Qn5uZslfybCLievNBnsI0AJ8orPyUuauvBqL7ulgFUGVglx/XLoxQ1KppH9Y
	TcHE42Wf9RjTJG00npkS3tOj5gQ9SBMl5beoh85mRPDBE7lPjAiUpcsG+x+XOfz/2BSf4S2+rZECj
	2xTUi5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX28-0000000HX0k-0HUZ;
	Fri, 23 Aug 2024 16:21:04 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX1p-0000000HWun-45q3
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:20:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Wr50C3N80zlgVnK;
	Fri, 23 Aug 2024 16:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724430037; x=1727022038; bh=Rg5eyOwxNiG+PX9AoHJo/afz
	OMXnjg8jta0yJK0fqtI=; b=s5zo7d1bB/qegI6rBCiT0AjK7sOzRDHyrR+B47VH
	ddjqGp6VIrT5jUCdSzEMxoUgo9VZRKW9YdOiJYsfmoJeSVGDRH1Xqbnz7d26BJ5r
	A5dNKplZF/vlormqL2K42hH94Es9MCiei9Uz4kcOa5qEfNa1qy6Icd0PRwWeaUXp
	TRZrxMKGI1KcOwg0S3hpg7ijcd7bct/+xx7yaslSXGjbsfr7LwAvLomIdW/r0ZRk
	5+W8DPn5Oh+PHZMmn4QtGHBcciZCegwOW4eaAjlg6rmjNiAk7anlUqHwu3lQq3xH
	m/oUGJbOhj7BVJGKUEwePqdLTt6hyimx34+vjqh2VzpU4w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id x-1rNW4qNJrD; Fri, 23 Aug 2024 16:20:37 +0000 (UTC)
Received: from [172.20.20.20] (unknown [98.51.0.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Wr4zz3YT1zlgVnF;
	Fri, 23 Aug 2024 16:20:31 +0000 (UTC)
Message-ID: <c5906668-1110-4ecc-9249-32e92502dd13@acm.org>
Date: Fri, 23 Aug 2024 09:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ufs: core: complete scsi command after release
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 stable@vger.kernel.org
References: <20240823100707.6699-1-peter.wang@mediatek.com>
 <20240823100707.6699-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240823100707.6699-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092046_069771_8D4EFA4F 
X-CRM114-Status: GOOD (  10.70  )
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

On 8/23/24 3:07 AM, peter.wang@mediatek.com wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 0b3d0c8e0dda..4bcd4e5b62bd 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6482,8 +6482,12 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
>   		if (!hwq)
>   			return 0;
>   		spin_lock_irqsave(&hwq->cq_lock, flags);
> -		if (ufshcd_cmd_inflight(lrbp->cmd))
> +		if (ufshcd_cmd_inflight(lrbp->cmd)) {
> +			struct scsi_cmnd *cmd = lrbp->cmd;
> +			set_host_byte(cmd, DID_REQUEUE);
>   			ufshcd_release_scsi_cmd(hba, lrbp);
> +			scsi_done(cmd);
> +		}
>   		spin_unlock_irqrestore(&hwq->cq_lock, flags);
>   	}

Hmm ... isn't the ufshcd_complete_requests() call in ufshcd_abort_all()
expected to complete these commands? Can the above change lead to
scsi_done() being called twice, something that is not allowed?

Bart.


