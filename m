Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02242F3C9AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 16:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imNE9LSqxAsXf0PLioI06r2rMiKPpRxbdmCSUWVbDuA=; b=tVr68341hFM76UhcxWOgrPQ0oY
	AjkIynb9XylvN42rmwTUEenl80y+h1d+dQ7l6DWitHJJLEE9UL8ZH6ALzLLSMmHVU4XnqHBh3bNTm
	/XLWQvcL+tATWuZ9eanFbW19OB+xEc0ovDz/z9ibyHnlBNzMU4SIG+sBR+qsRPstYirrFjW8LvcXr
	qHtpEhdpt//ixgXipHsCJZXY7YZ9Rw7FKxPTODjgQilJYDUXfCp2GyoYKzYxw8+h35skrDgRDPYn0
	DPh2FpWoH19+47Yk6IkmUV1pN+9eiOpAfADqFvh+Eul+ib1N8gDh0mppUGQmjvosPwJKzYDXhvd4h
	SuqRLkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvcQ-00000002QUP-01ay;
	Tue, 24 Feb 2026 16:50:42 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvcO-00000002QU1-204u
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 16:50:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fL3cv6wzwz1XM6Jk;
	Tue, 24 Feb 2026 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1771951837; x=1774543838; bh=imNE9LSqxAsXf0PLioI06r2r
	MiKPpRxbdmCSUWVbDuA=; b=3RBnv0phPFNDUzCthEXChpqF8rH0l7CNU4FQIbOW
	Qk47J8ay4XZpxAR9dhCwpMjCVioTNqbqNRXuf5f8y44kuBlQ7HXzMJCRyK5YZhWd
	qXhD5gb9zn/GlcFu6PHyawNuQFICxeRhjbroML2/vF3qaB9ZiVO7Z52fadbpPpXp
	KEeYX3PDlcEZp8bSUzWC7SuZUl1xuLgNMRSGSxNChY/AhcUdfxg4XAUhVwHJYRqm
	aK5wXjROXOX+tRqGMRTgKE/6fdQSsRZuIon059AeC1Q0yeWZEDn4kftEzjJBI/bb
	4aciFV5U2e3abltohAAVI7hsLnRjAdIubSJjzIru24Lhjw==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id alVYFKGJ_EM7; Tue, 24 Feb 2026 16:50:37 +0000 (UTC)
Received: from [172.20.150.38] (unknown [4.28.11.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fL3cl66qzz1XM6J7;
	Tue, 24 Feb 2026 16:50:31 +0000 (UTC)
Message-ID: <2d37bfc1-fb1b-4bf9-9195-fa02f73c029f@acm.org>
Date: Tue, 24 Feb 2026 08:50:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix possible NULL pointer dereference in
 ufshcd_add_command_trace()
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260223065657.2432447-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260223065657.2432447-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_085040_536093_5DB9B7D9 
X-CRM114-Status: UNSURE (   5.24  )
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

On 2/22/26 10:56 PM, peter.wang@mediatek.com wrote:
> Kernel log excerpt:
> [ ... ]
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Bug fixes should have a Fixes: tag. Once that tag has been added, feel
free to add:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


