Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CBAEF8FF0
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvSeYwvnuK2yOnn+j2vRgJRxBnSIUqMPQi+va4FgXEg=; b=RvgZEeWI9bkZY6cCtqWW1V4UEr
	XbOt/EEHPc/WVWytdyCGTprTJB+oeLCuqAog2TuOicEdUCIqF+UJ60FkktPxRN0A/xudmcV8oo0Br
	dAedLnWM7mCuhDA+4QXd0VtDRnoT0dOin8/GHtQzVY4Zo5Lr6jVzg5anW9CUr0287WFXwvTd3RnLE
	lNYITPr2BKynn2aDEYRLdEU14bX5Tq71dnR7AKQkQHxH4V5DKITIlhBGh6JeWJ2QL4y3fWIj569D5
	oDc6PnYQNvdNlDeQ5CZwZCfw49deCkp0rGFSWotu9FpE0Hql2KWnUBUoK/JJLzBha5fonOL6RQioh
	5TUKTfBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnRz-0000000HR27-0J7K;
	Wed, 04 Mar 2026 14:43:47 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnRw-0000000HR1U-133i
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 14:43:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fQwQk6lqJzlh1T1;
	Wed,  4 Mar 2026 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772635417; x=1775227418; bh=xvSeYwvnuK2yOnn+j2vRgJRx
	BnSIUqMPQi+va4FgXEg=; b=i8RxD4DEwBTTe7Kn0ZvmN47xkLDi9ETlv58zbtJT
	TMyhk2KK1PBcPUNs/is2c96wWwHCYaRuKL9NaXHd+wrSnliJ99fll/dK9kuTrysF
	RL15/osNMEtbbfjFrRxerz/CsA24+OqwtpsN5+qkT8lxT9MuoCUciOR0sHBXlFLs
	CShj4fYtXXzIuWKz5uqmZ6N5TRVjh+GAigt1GBhGnVKVsH9N1SUPCiq76HEg2OVK
	YpODqmOw0DqrENabf2BpDxP15IIQvPpg2Svmw2YhwfyWPoQF6IdTDnvoAUCKsQoB
	LmgWSSeT9Ie2gGM41T2lN8uHmcnG95Hp5C9qXnPhdOeR5w==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9wVX-3bOPgFa; Wed,  4 Mar 2026 14:43:37 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fQwQX2HyNzlfpMC;
	Wed,  4 Mar 2026 14:43:32 +0000 (UTC)
Message-ID: <ab2de228-47f0-40b0-b586-c970a9c0652a@acm.org>
Date: Wed, 4 Mar 2026 08:43:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Avoid IRQ thread wakeup during active UIC
 command
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260304071346.1391315-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260304071346.1391315-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_064344_327735_C1E6DF46 
X-CRM114-Status: UNSURE (   6.11  )
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

On 3/4/26 1:12 AM, peter.wang@mediatek.com wrote:
> Only return IRQ_WAKE_THREAD when MCQ and ESI are not enabled
> and no UIC command is active. Since the default UIC command
> timeout is 500ms, handling IRQs in a thread during an active UIC
> command can easily lead to timeouts due to delayed processing.

A context switch takes somewhere between 1 and 10 microseconds.
That is several orders of magnitude below the UIC command timeout.
Something else must be causing the observed UIC timeouts.

Thanks,

Bart.

