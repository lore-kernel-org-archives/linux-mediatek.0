Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062DFC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVPPyqXvcrLrLZkFGDKTMwif7sSyOkiS3MMJrazKcNQ=; b=figqGhI/RnHkJEaWG6zswOXpmy
	jYyjgB3zOJMF5rSX9kYk9kGfPYKEJ01gKPebpCMuMra0v7VFb9jfkPMsdd0l2ADLZ2cSu+AUTM0/j
	1v1mxUcK655lUGADU4np0Yhv9DMOANBrjnqia6KGj9GfBR0wPX98+naPntqd5uDCBTb8v5C6aVsXt
	u7Aff0EXuZmuhM+xIuKWPJVAhz6buwKxUrtX4LP0cuv7T57uwctVdNy5EbeumddEtUrbeQPbPHyix
	FsV6y9ScTZq6A4oIS0lSqGroE/MU5shQuAsEw7xDRZpBid9IKEfaw662SL9fbKlmztdcZdKf5HWse
	Q44rOa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX3C-0000000HXPo-2nDu;
	Fri, 23 Aug 2024 16:22:10 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shX38-0000000HXNJ-1DKp
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:22:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Wr51p113dzlgVnK;
	Fri, 23 Aug 2024 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724430121; x=1727022122; bh=uVPPyqXvcrLrLZkFGDKTMwif
	7sSyOkiS3MMJrazKcNQ=; b=OJ2HSjTzBQ3UdkJT3fgwC00rTm7eT4z3ZePq7o8w
	oCA9TaZdQYelszCgG8nM93nYGxx82KPJ9CmOC+Bao7o8IbUUZwWOp9kPOgnXHGVq
	Qisv6h8a2MK5MQO6E2o78cDhwftrnTz69BeO0JASKLWfogWlW/9n5xdmjNUPCafn
	KOTo0rFJy4s57IfpxIB17yHQKDZ0ApO/8pRNPJ6LQI+uaVt3btClWf/W42eqhjw0
	nMpdS1J2Sw1XJmh3V0hN5ffuOOpIcu2CiADD9S7RpsroMJ8IDqahfwmshwUmUA5m
	xl3ojRwfha+ofy4/lWpuQVMjvftBkP370TyKibQeQrm06Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id k8NigCZLvUK4; Fri, 23 Aug 2024 16:22:01 +0000 (UTC)
Received: from [172.20.20.20] (unknown [98.51.0.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Wr51b3Bk1zlgVnF;
	Fri, 23 Aug 2024 16:21:55 +0000 (UTC)
Message-ID: <ab24891e-f7a6-4185-9235-ffdc13c88f53@acm.org>
Date: Fri, 23 Aug 2024 09:21:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ufs: core: force reset after mcq abort all
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240823100707.6699-1-peter.wang@mediatek.com>
 <20240823100707.6699-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240823100707.6699-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_092206_366537_39D07C11 
X-CRM114-Status: UNSURE (   5.21  )
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

On 8/23/24 3:07 AM, peter.wang@mediatek.com wrote:
> In mcq mode gerneal case, cq (head/tail) poniter is same as
> sq pointer (head/tail) if the hwq is empty.

poniter -> pointer

Thanks,

Bart.

