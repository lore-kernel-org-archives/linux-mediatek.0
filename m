Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54BFC30658
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 19:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=485Fk9bkb6KlofxU+R4jbvQ87vsY7/owh8sq1O1xVG0=; b=E6pq0mLvaF6dA4DtLF1yLIbXS6
	0vLnwXI+I00dIa8wf9LREvfIg/43vCB5RibNX3UQvstoWnUFmX1kZWnfP4+cDd3yTQK0sb0BrGCN9
	9wStQBt7wLmWEwaJLRTK/+9AMCzCMy+n0YV+rLKGhsEud0ERNU9Nth7JGT1RgqT7y3LNQ18PBhly3
	Jv2B7iVye/xiNckjWCRrTdhhLuhnXhOsMEEeqtXiZ5TAf62bJlyB5edUV0t1HwsSnM/Onh6GV1RYk
	EdEZeFp+lDWMuAcoxHhy3s2TxxYZJZXzD6nvGH2jt1ue9AA2Gwgd4vdpoYnNJ+5Pdd9y3ENIYohm6
	xz02RwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHFQ-0000000Ek0i-24He;
	Fri, 28 Jun 2024 19:27:04 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNHFO-0000000Ejzv-16FP
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 19:27:03 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4W9ln13zVjzlnNry;
	Fri, 28 Jun 2024 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719602816; x=1722194817; bh=485Fk9bkb6KlofxU+R4jbvQ8
	7vsY7/owh8sq1O1xVG0=; b=CSw6V+FnF1T9nPtu9cz4hErzJc5YB86TJltQ3YOL
	QepTaCdpERfk51mQKuWpzkI0Yhn3mGlTQIZITvY7vvyWhIue38OmdBJZVKEGbatz
	k5sUxj4AEaOB15PNMRmWx+aRoPqUOq4f3qa0o/l/CSRkU8Oz2ZqNwYzpiotZKE4+
	TDFjXaEFGcSZOrtgJ74fShgu9+50xxxVkRQMyysIqSJnN/Ah3y8wYosi7uoEaFuf
	PgbKKYBsKtzC/V/bgYh6xRp8d0Sx2uhNKoMbbLz8u5zEu/MawqFWQb3oq6ndI+KH
	6A61toxxEz/VrIek/4KPGykWsm2fge2q90ZeNJoxBowGRA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qVxaLc59fd0F; Fri, 28 Jun 2024 19:26:56 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4W9lmp29p4zlnQjf;
	Fri, 28 Jun 2024 19:26:49 +0000 (UTC)
Message-ID: <292a598b-6cc8-48b5-bf1f-17a27ba8c57a@acm.org>
Date: Fri, 28 Jun 2024 12:26:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ufs: core: fix ufshcd_abort_one racing issue
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
 <20240628070030.30929-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240628070030.30929-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_122702_343336_84A586D9 
X-CRM114-Status: UNSURE (   5.88  )
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
> When ufshcd_abort_one racing with complete ISR,
> the completed tag of request's mq_hctx pointer will set NULL by ISR.
> Same as previous patch race condition.
> Return success when request is completed by ISR beacuse ufshcd_abort_one
> dose't need do anything.

dose't -> doesn't. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

