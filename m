Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59340CAC5AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 21:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFWbszHu8MBzpN96Sywn313X2hqSg/usWGUMqwcobVc=; b=AFlfo3XmY1scHjgFTm8o3x0Oxd
	7lFEvjU+RdwWNm4vawACYA7dY8TVGyeOCwIdJH8xPb6ygyXIOtuHJrbCYMOuloHJaa7ULmrj1dlEu
	QZJIaCZidOb4EYUOPFfQCPPnGzTx6tkKgoz2tMcVef3EsY+8uKXoJtRmYKhqpq7jfCEMpphtCaUgj
	1wfxRJMrfIss5CNW7URtFV1SeBT9d02SIRo9yFCnKQssuE63JHKHTqv+HIkMo8kq0H8j2PokLYnYI
	b7ZIOwAjZ2Rs9OzuC6RiG6BN2fbpC/BZq87yVPp7ptARkZ2qJsA6cxgA12DXk2q5qVD7Eh35y5YtT
	FlhS1L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XRn-000000044GE-1rB5;
	Wed, 24 Sep 2025 21:54:47 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XRk-000000044Ft-3Dr6
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 21:54:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cX9cM6DWCzlgqVP;
	Wed, 24 Sep 2025 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758750880; x=1761342881; bh=cFWbszHu8MBzpN96Sywn313X
	2hqSg/usWGUMqwcobVc=; b=3XNXIU+O8ciCKTZOOrdapdb6aoU/bWLRz1MX/2Xr
	Bhi1H+qae9hXQkexxfbanXXRtXDswI4XQuk3s1NuP9ONh3vk71xQUFZRRe+i/V+C
	zFnunAildHyjSy9tNsj8gh+M2IiyqAHoWdlASPqLq3hJEJbODXNKdIqnMUTnYuh/
	CDpc7EFAcAASWCZj2E/Z4ME6tDRSH3wtKKYtdo7NqgX15M5fgULWNBM34dxl9aPP
	ruD/AR7exe3r/ver/74gLmFppUFyQJBLYAmsZA/bDxB197ko8Ehq7bojjew8IBKp
	wc3/5mIHawcOQR+3yKGtt5ABiBmC90XTNb/YZ/iIXEHmPg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MUGoqSbcgXKz; Wed, 24 Sep 2025 21:54:40 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cX9c35Nz6zlgqTv;
	Wed, 24 Sep 2025 21:54:26 +0000 (UTC)
Message-ID: <6f7b6f14-4d9f-4487-ba7f-51cbbeff1f55@acm.org>
Date: Wed, 24 Sep 2025 14:54:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Change MCQ interrupt enable flow
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250924091701.2982410-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250924091701.2982410-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_145444_884127_A426014B 
X-CRM114-Status: UNSURE (   7.82  )
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

On 9/24/25 2:16 AM, peter.wang@mediatek.com wrote:
> Move the MCQ interrupt enable process to
> ufshcd_mcq_make_queues_operational to ensure that interrupts
> are set correctly when making queues operational, similar to
> ufshcd_make_hba_operational. This change addresses the issue
> where ufshcd_mcq_make_queues_operational was not fully
> operational due to missing interrupt enablement.

A changelog is missing and I think that the patch description
should say that this change only affects host drivers that call
ufshcd_mcq_make_queues_operational() (MediaTek). Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

