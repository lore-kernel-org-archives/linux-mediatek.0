Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B67CAC5AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbruSP7rTY8HLsD8zPBU4YUA1qQNLZSLfDKDdyydwSQ=; b=ZFP2CFlYX5vd1hpLqGqqsZ9S+8
	pH5eAlTCypOsj1JtuQkZCng+jlKVFcXvrSLDYTi59l/uxaBGQ3YnIsbZAtGhOWoFjFY1L1xXp/cxI
	k3Q7iPQIqcPhgjZgL41Ypw3zZx5loqnFkK62IckLQLbcBa1o9pMB/xy+A0aZqnQq9XAtqFqbXaUgU
	JT3Lm3PtsmQvrpHwsmLjbep8r7OTorWD5nEkNwlYm8HgKUHX0qdw84J82oEYAGF+IEGVPdgRFaRj1
	46QkG6sGwnPWVFjYdpz8Ghx/eZMWfOS4At922EdIjlqh9rNiChg9D1NlK6UCt5QFiof7e9H6F43b8
	Z17OJiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15YI-0000000EDUI-1110;
	Tue, 23 Sep 2025 16:07:38 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v15YF-0000000EDTX-08mI
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 16:07:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cWPyF6CCgzm0yVX;
	Tue, 23 Sep 2025 16:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758643650; x=1761235651; bh=zbruSP7rTY8HLsD8zPBU4YUA
	1qQNLZSLfDKDdyydwSQ=; b=Qpi7tVSNMRGbdpE68cf5HnEM+xqaPx8crt3tHpI8
	Un1gYwGMh0wykFD6zZaTTBQrVWTGlRyiho+3FU65ahZ77IKxYnj0k95OCri3XH+D
	HC/VcVmsXfPnw+w6yFXJjRioorYKhtFgDM6Hn6MMXor4ZJKcShmHkwGj3Z1pA8c8
	pXL8YzcIJ0GlNtYauxLS+W0l+IdVH/ZoCUtBSJcxAgw0Ne7pyXA3Zo5E26Y0/t3U
	wxXIfDtZQKNAT3pGYmxNFqAMAs0SU0wAZAJ7Z04WnTDeamqQhyphQAoZcxMQ0731
	jX1GgpO0aOMdIjTK1pYh7vflQgU9YlvTx/iyAEFZOTT2Iw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Tm3RX5dzHQSk; Tue, 23 Sep 2025 16:07:30 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cWPxn2PtTzm1743;
	Tue, 23 Sep 2025 16:07:07 +0000 (UTC)
Message-ID: <ecc17025-692d-45fe-97eb-9cc4c4ce7a06@acm.org>
Date: Tue, 23 Sep 2025 09:07:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix runtime suspend error deadlock
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250923082147.2491450-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250923082147.2491450-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_090735_159698_050B06C9 
X-CRM114-Status: GOOD (  14.96  )
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

On 9/23/25 1:20 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Resolve the deadlock issue during runtime suspend when an
> error triggers the error handler. Prevent the deadlock
> by checking pm_op_in_progress and performing a quick recovery.
> This approach ensures that the error handler does not wait
> indefinitely for runtime PM to resume, allowing runtime
> suspend to proceed smoothly.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> Suggested-by: Bart Van Assche <bvanassche@acm.org>
> Tested-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/ufs/core/ufshcd.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 88a0e9289ca6..0735bd5df1cc 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6681,6 +6681,11 @@ static void ufshcd_err_handler(struct work_struct *work)
>   	}
>   	spin_unlock_irqrestore(hba->host->host_lock, flags);
>   
> +	if (hba->pm_op_in_progress) {
> +		ufshcd_link_recovery(hba);
> +		return;
> +	}
> +
>   	ufshcd_err_handling_prepare(hba);
>   
>   	spin_lock_irqsave(hba->host->host_lock, flags);

Does this patch introduce a race condition? Can a power management
operation start after hba->pm_op_in_progress has been tested and before
ufshcd_err_handling_prepare() is called? Should the added code perhaps
be surrounded with ufshcd_rpm_get_noresume() and ufshcd_rpm_put()?

Thanks,

Bart.

