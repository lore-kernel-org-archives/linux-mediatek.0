Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4328C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi6EQ3Ahn62bMbJcMwKWnjyAI/cv78xLQF73J9lMcKs=; b=Emyza7xzOvfZn4oMtvrOonMXAM
	/81Lbgam0UzKJTfWrHQtILcwwxfskSLbXKO8T8jYeFwm6+mILbU1h5neDU8GuGAsUQY8yq9T/pC/J
	FZP7qW3mGWvqkWmhaveLAFdKi2POWChlK/MH3u9kOKSTaZ7/DAGWYr4KpnM4qqgs0mabgOVFSxW+U
	wU4u0iEKeD2oFEcWe0dI/7Z8KddU3it7km8I3oQZ3zUSCSPyQiV11buORRG7iNN4rJp3WtuLO7o5Q
	mGBY0xi1PxL1kfy5TlpewLyyHpBCBzGvyhJ4QeIQmeFiguMlIKErzqwnAKef5iwFVoNuTms3/RNSg
	l+KZFaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHEO-0000000Ejo3-3VvG;
	Fri, 28 Jun 2024 19:26:00 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHEL-0000000EjnJ-3GVZ
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 19:25:59 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W9lln0crgz6Cp2tZ;
	Fri, 28 Jun 2024 19:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719602750; x=1722194751; bh=Bi6EQ3Ahn62bMbJcMwKWnjyA
	I/cv78xLQF73J9lMcKs=; b=oLIeblI8LWMm/b79FMZiPYT2QwnUNcNQzRbM26tz
	FrWTD7lPjPU+2J07vVC+5lxXrSEorfbh3kC5kgNsC2XhPrh948P89MLaeaCskgzN
	Ny3paoHyzQznKfY8PsL16ajPd5RXOU2xT4pCvB57yBFhpzI+yDO9l8EZ+3r0JKGK
	03cDuOtqqEVSccZZEwm9KmPCzvpm3cNkfSBjj8RwRezpoBH6ndWX18sifez2KrCD
	pO6J2Vw35GCO+jv6yHVwDxWNvctguK5hZomwXByqajNWvIyFFu9zCZRDsD9ewqQp
	iHEi0A6gAv7h5cXs171dPOux+SSek25NPOAsNj+20FZnsw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LbY2I7nK4yfI; Fri, 28 Jun 2024 19:25:50 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W9llW6zpzz6Cnk90;
	Fri, 28 Jun 2024 19:25:43 +0000 (UTC)
Message-ID: <d6598130-0ca9-4908-9ccb-4836027ad75e@acm.org>
Date: Fri, 28 Jun 2024 12:25:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ufs: core: fix ufshcd_clear_cmd racing issue
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 stable@vger.kernel.org
References: <20240628070030.30929-1-peter.wang@mediatek.com>
 <20240628070030.30929-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240628070030.30929-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_122557_877076_11F5D215 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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

On 6/28/24 12:00 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When ufshcd_clear_cmd racing with complete ISR,
> the completed tag of request's mq_hctx pointer will set NULL by ISR.
> And ufshcd_clear_cmd call ufshcd_mcq_req_to_hwq will get NULL pointer KE.
> Return success when request is completed by ISR beacuse sq dosen't
> need cleanup.
> 
> The racing flow is:
> 
> Thread A
> ufshcd_err_handler					step 1
> 	ufshcd_try_to_abort_task
> 		ufshcd_cmd_inflight(true)		step 3
> 		ufshcd_clear_cmd
> 			...
> 			ufshcd_mcq_req_to_hwq
> 			blk_mq_unique_tag
> 				rq->mq_hctx->queue_num	step 5
> 
> Thread B
> ufs_mtk_mcq_intr(cq complete ISR)			step 2
> 	scsi_done
> 		...
> 		__blk_mq_free_request
> 			rq->mq_hctx = NULL;		step 4

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

