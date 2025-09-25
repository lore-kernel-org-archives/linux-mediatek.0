Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA7BCAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNJavTQjkknopqd0oPAIQcXO5xoI8oxuPjMPorcG+Ao=; b=xsDNNKtrhPx8h0MI7BQwvaaNk+
	IudTe7NEJIvQwpIXoDiRoGWYEtX7mh5e50cgoA2gPf3OwD1LIOyQNUvrvGqE5TB88VP+JMXpOOh//
	pDP96BCnBt70++/42ow845A///jwYOQ/XPFWrx4JA3lWTxOP7oYmQ+i5dTpL+/kLvuJOkY6p87ek0
	PftotHox+87taN86cJ9AgCVhyluQqeBVVOht9jAL7FkdKeBeQwVplxEpRNKe3E7N1UPuUhx3a4WAZ
	77yNw3DsvKonIYKGFXvK6CBWQ7oEzONB3o5yE9/Qixrh6TjzfKyuzSXDcFgt+oCIvmZ2q7j/2Fc5Q
	xX/gtyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oDX-0000000ApNW-1g1V;
	Thu, 25 Sep 2025 15:49:11 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oDU-0000000ApKV-49es
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 15:49:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cXdS355M5zm0pJw;
	Thu, 25 Sep 2025 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758815344; x=1761407345; bh=JNJavTQjkknopqd0oPAIQcXO
	5xoI8oxuPjMPorcG+Ao=; b=1+JeKSWibrZVfErAUN4XyEsWCpGAEg2a4lkCqwj8
	OIyNgYY/ZSQALymCf7APRcppZqUWvXto9WdTvGAkRAjDxA5yqWMWKqppnOcN8p4P
	d29Ek/gMvhnLzC87fSJZX6ahQVCka2ITVQg0QY/jadcxqwIswgJjWm6hPFYzE/8A
	Lf2354m905SgoF6n1IkJpjwP8OCK2Id12/mKgPoyx4bMUr3rJhTRZin0GjdS0xpT
	ZOyU6410BB5xNx8IdgIeSm+rnK2++eFqIJp05cnHaGouAHveZcBJTndJDyvFvC1C
	dpRsU1tzuU7CmUEIoUv929DKDzdDvtbHDqgnPrZLXfHYVg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id QXziTda_FYE4; Thu, 25 Sep 2025 15:49:04 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cXdRk626fzm0djt;
	Thu, 25 Sep 2025 15:48:49 +0000 (UTC)
Message-ID: <81e6af29-eb75-4149-8fbc-7e726fdd2acc@acm.org>
Date: Thu, 25 Sep 2025 08:48:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: Fix runtime suspend error deadlock
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250925102420.3553715-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250925102420.3553715-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_084909_118284_762CD695 
X-CRM114-Status: UNSURE (   5.56  )
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

On 9/25/25 3:22 AM, peter.wang@mediatek.com wrote:
> Tested-by: Bart Van Assche <bvanassche@acm.org>

Did I ever claim that I tested this patch? I think the Tested-by tag
should be removed.

Anyway, since this patch looks good to me:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

