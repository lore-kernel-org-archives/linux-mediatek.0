Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D8BEB26F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvDSLzhqfBnDBJx1xAR+BW2sz49JtwEz8GcVsJZBELM=; b=mWC9kBnOirv+WfLJYhO3yb3VnZ
	b307iTNPPFHXg00C1ufEKZsLGcb/nWJflWYwiOas/t+qD+rZ4egw3TBVTAg8DsnLU7iFZErtaGwI+
	0yjaydoLPDT3U6h9onRm277jvo0BznVcEZWyHRsM3H0o4elxRSe5XnfGako1tiwxvW7smNKtz0P8F
	Z7aVdsekfAZf4Tk2xkUUnDlIntEJBx4VXbROSE5xoXX0xfHkYou+etHexzG4uaaWNTzACRrXJwvdP
	e2gdoRdoK+q83VmFerfKslfde7dqNSRgmESrR3lVH/lxCyVmtj+k9O1ZDdPIqpWX+ZoKGiGI2tZ6V
	O1dS5JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsfx-0000000HP3z-2kSw;
	Tue, 10 Feb 2026 18:41:29 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsfu-0000000HP3W-3zNS
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 18:41:28 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4f9Vl91T09zlfl6P;
	Tue, 10 Feb 2026 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1770748882; x=1773340883; bh=GvDSLzhqfBnDBJx1xAR+BW2s
	z49JtwEz8GcVsJZBELM=; b=jWXF9ghgA3XfZ70rSx1Sz/9RGKoa+NK6zvNqEdZV
	WrKWTOTZayjbUKJtd0/Y+UWwoOgzLBZO9uhSf7CUIetMNhamLQk8/NIpCFtyHLUu
	XLmfXLRkMugY+BiLyCo0Z0LECWpngllRlQY1OzIfsasYIS3qxMEbNoQAtZOp8mFa
	jLstRoFo5gjpbrPiMctdD8bfwag7xaiIWIZ6ilF4Ur28kroyFW37PCYk+Jne8p84
	0Gz1ei4jKyHKs41agjrlNgdqMaUPK0USgGjkUxNdOSmNnwGmvUu8SD/5iIxpljkC
	usdz6JmwgoxAP4sUVHkZvwHdjI7akf4/TgvuaLk/rDEPOA==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PKYxIdbrF1ip; Tue, 10 Feb 2026 18:41:22 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4f9Vl13krZzlfvpH;
	Tue, 10 Feb 2026 18:41:17 +0000 (UTC)
Message-ID: <fbf4c8e9-bf51-4607-be30-8c3ba2af3d86@acm.org>
Date: Tue, 10 Feb 2026 10:41:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: support UFSHCI 4.1 CQ entry tag
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@sandisk.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com
References: <20260210071834.1837878-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260210071834.1837878-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_104127_008390_2E9E8555 
X-CRM114-Status: UNSURE (   4.63  )
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

On 2/9/26 11:17 PM, peter.wang@mediatek.com wrote:
> The UFSHCI 4.1 specification introduces a new completion queue(CQ)
> entry format, allowing the tag to be obtained directly.
Reviewed-by: Bart Van Assche <bvanassche@acm.org>

