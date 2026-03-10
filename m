Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58551FD4F0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i1WnQlulk5+h/fVZtviCyMDuoShu+IDNA1sgxDyDVcc=; b=F5IZTL2bZNONfyKY+lc5rglIDZ
	p28hmMTjubyqbQKyf5MDdXja+HNJk6/frofbtpnbxkfhxmxrG+YdMDfutt3nFsKLRkU3Td1WCthMn
	sdv8dZTCtqQgULhyYZLU3AYzu5an2uC0LM2Am3QECGiN/jCndfZ5ha7DExcgs06cx/abrRnhSlfBc
	ZtysmS3wA1BJ1bgjp0Dm58Zdoxi63L1QKybp8TBfPXotOwuUmmDgjrD67tVnuFebSr4ifuJLrxOdY
	jztWTMS36uws8CljehiTMp5zKvgi3coMV8TfuGJul01ZT2rwf8boWxOdtC7qwnFKa8nGc6bBEtxk7
	31R9bAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0175-0000000A0Vg-1n7M;
	Tue, 10 Mar 2026 17:43:23 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0173-0000000A0Un-0v1U;
	Tue, 10 Mar 2026 17:43:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fVh7C2vfxz1XM5kD;
	Tue, 10 Mar 2026 17:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773164593; x=1775756594; bh=i1WnQlulk5+h/fVZtviCyMDu
	oShu+IDNA1sgxDyDVcc=; b=tzyIO8rqapXsA1jVegCXlqS5rpes7rfKPHxVPnzo
	erERWxDzaeVkgcntugBSXMp1g1g0z8Yr8YCHx6Q+TbFPvphugqqnYdatI7qHVRfU
	+ucXhsVbz4HSqYS1/0jLBzSX1dIOS6w0tTj35oSyeq8zS2c3z7h8yIlpmPLC8N31
	i10royHxuuVZa5dDxkdbQAbH/PSJzAu6LHqRcFoeYc59/nBbZLDdZRrfbCnecwme
	FSO2qs0/cCz/b1YqAfZZQkBA75JbovjLxyOZTDE6aRbASQrCHxDxtAxqeyVz7kKG
	eFmfK0XGr29ilVpz6YJZaZr+tojI2uuyvTGU7KSI7hGb8A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 83yIVxWhxkc3; Tue, 10 Mar 2026 17:43:13 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fVh714YWZz1XM6JT;
	Tue, 10 Mar 2026 17:43:09 +0000 (UTC)
Message-ID: <fd64c25d-12aa-49b2-b95e-d6c640096b41@acm.org>
Date: Tue, 10 Mar 2026 10:43:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ufs: host: mediatek: Add VCC on delay for
 stability
To: ed.tsai@mediatek.com, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 alice.chao@mediatek.com, naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
 linux-scsi@vger.kernel.org
References: <20260310005230.4001904-2-ed.tsai@mediatek.com>
 <20260310005230.4001904-6-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260310005230.4001904-6-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_104321_303954_B6259B0A 
X-CRM114-Status: UNSURE (   6.16  )
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

On 3/9/26 5:52 PM, ed.tsai@mediatek.com wrote:
> Introduce a delay after enabling UFS5 VCC for MT6995 to ensure
> voltage stability before refclk activation.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

