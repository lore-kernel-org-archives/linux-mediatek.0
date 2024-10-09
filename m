Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B3CEE345
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o486qkRTmFm5kVHy1JFWCG8uhHdivrYKhy+8m8fzBiA=; b=Nlv6m3Mk9cu6frTZn4Py3so6zB
	KY7E4bbtYkr8yMjyFloJmpSOsYdLikDcBDnUcKg6b72ENPnjwOjeZeFTEcclTxkSmcqxkTZGoZeoL
	IApap8YgF4i0PiTLROtHPArikaL9rRVOuaWnwwU/yydW9V5JR1SPAoFyyqQkD5aHr19JSXQRBimuR
	dW0fdqly043oDhHHMbuNYv3Gfk/bhJ2UEtm5oCyOV5YYxfIZqbPi8O7racgFXV64GqXynGk9lF3IG
	GCYtBc5wPAFMLRygHKEbClAM4VO9q6FOE772iHPDzHrVEOywC1J50XGYx6mgRhLJzlG4wQnqO5SeV
	3YhXSJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syd69-0000000Abqc-3xG7;
	Wed, 09 Oct 2024 20:15:54 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syayK-0000000AImV-0oxM
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 17:59:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XP0yg24gHz6ClL9C;
	Wed,  9 Oct 2024 17:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728496772; x=1731088773; bh=o486qkRTmFm5kVHy1JFWCG8u
	hHdivrYKhy+8m8fzBiA=; b=eIitQHSqyGw4bY2PL95rCyvMkA/zfDDa5a3oySod
	iTjXK53q8kKqdC99N0Q/5oFDtvT50Y8gaACyFLXDFK8nKEN4+y+PQ/SHa5U2SEBj
	a5tzviaH01H+6kNF+E4opRFwmuvaDHPQ/G13hNTs1KWfww/CZBfBWhgjIaksItTO
	rklH7uhTYMT7tzbJj8LuwSqtIzQ/fmhhgcNu9ZKmucgqQxp+Te/zW+4zKLWYnG0W
	F5/p7EXmFkymy0mRwv/1wKowcEH/M7GcaZZY9zGWd6RRX0qZprbmwiTVRaqdYE3L
	rvC8Vf7lQonO8oTSamsjgd9Vt7ixYLlTIyRR1QhVkr21mA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vSbDe1On-c5q; Wed,  9 Oct 2024 17:59:32 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XP0yQ5kLyz6ClL99;
	Wed,  9 Oct 2024 17:59:26 +0000 (UTC)
Message-ID: <53e04d93-63ff-456f-8bfa-8c68a136f580@acm.org>
Date: Wed, 9 Oct 2024 10:59:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] ufs: core: requeue aborted request
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
 quic_nguyenb@quicinc.com, stable@vger.kernel.org
References: <20241001091917.6917-1-peter.wang@mediatek.com>
 <20241001091917.6917-3-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241001091917.6917-3-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_105940_348704_FDBBEB18 
X-CRM114-Status: UNSURE (   7.50  )
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

On 10/1/24 2:19 AM, peter.wang@mediatek.com wrote:
> After the SQ cleanup fix, the CQ will receive a response with
> the corresponding tag marked as OCS: ABORTED. To align with
> the behavior of Legacy SDB mode, the handling of OCS: ABORTED
> has been changed to match that of OCS_INVALID_COMMAND_STATUS
> (SDB), with both returning a SCSI result of DID_REQUEUE.
> 
> Furthermore, the workaround implemented before the SQ cleanup
> fix can be removed.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

