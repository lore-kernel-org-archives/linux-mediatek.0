Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B3FC3ABCB
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 May 2025 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkNeTzwzChBPxnTQM5+0U/fFA9+o13xiapopYsinHT0=; b=zRLc9WEsbEuGGkEnkCeWBBaDLh
	SAKEMmZBqTu3Z2F7mp4P4YiQ1NDZgtXydc86Zk4+2idC/YsQCqUUbqMkuw2RXEAfkRCFQqHr2iIxl
	E+2BlPAuab80AfmX9IGi4QWuWBh+b3wraqL8DfBCOB/1jPCiqcLY8VP0O0hrD4yctAAIL+64al0ub
	Il1euBsskjNfLlXH222x3aRJSAY248EgOZyzwcC1IKDCS8Fi7hpRtkbCE+V6Wu3Z5B1ZbyEmgywRz
	jIDXJlZqGrK2x1sW/LOfA0uLh8i0GHDGOV8i/3abMDocsm5nEA1uRbH7BbH7+++ZbKYqm0Q/Ij9Hu
	iVSwZ4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbfn-0000000AqZt-2Iif;
	Mon, 12 May 2025 22:30:59 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEbXS-0000000Apm9-1Fw5
	for linux-mediatek@lists.infradead.org;
	Mon, 12 May 2025 22:22:23 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZxDcK0Vw7zm0yTL;
	Mon, 12 May 2025 22:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747088525; x=1749680526; bh=bkNeTzwzChBPxnTQM5+0U/fF
	A9+o13xiapopYsinHT0=; b=wbryJAuRaHD3jtgIM+x3oAW5wVdXqTEudLBMx6GW
	l6iFrcgvkb4F1nZrJKg+NoPrjwWyVRjDEO7bQdBfd8FeKt3hYC21MMyXB8iYo4s2
	l701r5iz4ox5SpgzR494TN1GU08hH/Zas4KDF7ugqWpLWNmXshVYZbQrgzibuT6e
	HKXkN4lBFnwZUWlh5uj6t/71LSI/hafADSTHzYsEQ11mvH4u+XfIFnYa8NVHhsAs
	xrx6mgAO40yysbLvTteqkLTa4aZoldV/pmRfSJDQzoC0ai780Kk7mYeyVFBhaxqL
	nFZ+DVVvfYRQ1+35GSmekv74SeF1gmd8sFaa3jUZqn3yMw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id W43GxB88FXig; Mon, 12 May 2025 22:22:05 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZxDc00wnQzm0pK6;
	Mon, 12 May 2025 22:21:50 +0000 (UTC)
Message-ID: <a399d7d5-7829-42d6-84d8-d0956d07f8f0@acm.org>
Date: Mon, 12 May 2025 15:21:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: support updating device command timeout
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250510080345.595798-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250510080345.595798-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_152222_415241_5DF0E0FF 
X-CRM114-Status: UNSURE (   7.16  )
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

On 5/10/25 1:01 AM, peter.wang@mediatek.com wrote:
> The default device command timeout remains 1.5 seconds,
> but platform drivers can override it if needed.
> 
> Some UFS device commands may timeout due to being blocked
> by regular SCSI write commands. Therefore, the maximun timeout
> needs to be extended to 30 seconds, matching the SCSI write
> command timeout. And for error injection purposes, set the
> minimum value to 1 ms.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

