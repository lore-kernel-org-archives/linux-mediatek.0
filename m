Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA4BC02198
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERJOKrkPTqG54cRHxFMcIcDN+46bus5YIHhkbkRGCME=; b=Lf8GB94BWtIu//cR8yx3Zm7/ZW
	CJry8R1T+bjpbwAZL/qQhfqW8PgeuVQ8jBMOFuPaEK2ssY7rnIKMiZXu6xhXWaRkKlsYCrWFNvdDv
	YszAuhl0BaayrZJSr4HX9Yk43zJv+wmrUm9C4Xz9cCDoco7TqonAxpBWl6yg/8sJEB5zmXQqtn57V
	n9AfLbIqenGF7r2HNTyzGx1FP27pKxfRDE+Fg/ZumwbVAaV8L2Ba+DZ1i0qmOzly9F4N73zsxsL59
	sh3DVVMBaMpeQ+Nh90aNcj8o5+kOKHle8lVbJmDqt/UZNY9skhXSuAZKAJ/rQJUixPkIF58vIXiQG
	pI3Fw9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizkk-0000000FliF-0s1z;
	Fri, 14 Feb 2025 17:45:26 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizEy-0000000Fe3x-1a6t
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Feb 2025 17:12:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Yvds31cl9z6ClRNk;
	Fri, 14 Feb 2025 17:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1739553140; x=1742145141; bh=ERJOKrkPTqG54cRHxFMcIcDN
	+46bus5YIHhkbkRGCME=; b=TYlKQLtBnPAVn5caFBR+Ja8IFEAJ5csNKWk/2hBz
	Yt8jk7sukLgZpop4H9I9vAVUFkJ2juTQ5sTmqyUVTWUUv9Sm359f4kvrlN3kP7o+
	R5pINrQfZJob0l0mkdpeYgFHPMqBhZKVNir6codEGOoq/xybcl0rw6ZzIM51AYCC
	AtmZ5P1ORM1F3X5qgYIS/KzOWLOQVV03a5Yl1NuK0T2cTQ5AutVnVheUfev2tKCX
	T2K7hrNzrrl/SwfHOiHSnF6DU+9efgbscN/0vkbSeGxS7yIzcBrH/D8nFl2sI8eq
	n/xeXgb7Qi7XWTos0TaQd0ubeaFhLw1Xa3OAkud3qCktbw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id d-mvZBhj0FZx; Fri, 14 Feb 2025 17:12:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Yvdrs683Vz6Ckh6m;
	Fri, 14 Feb 2025 17:12:13 +0000 (UTC)
Message-ID: <88680b95-97b8-41aa-a39b-b1d03f93669b@acm.org>
Date: Fri, 14 Feb 2025 09:12:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ufs: core: add hba parameter to trace events
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250214083026.1177880-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250214083026.1177880-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_091236_420036_E8C88B97 
X-CRM114-Status: UNSURE (   4.91  )
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

On 2/14/25 12:29 AM, peter.wang@mediatek.com wrote:
> Included the ufs_hba structure as a parameter in various trace events
> to provide more context and improve debugging capabilities.
> Also remove dev_name which can replace by dev_name(hba->dev).

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

