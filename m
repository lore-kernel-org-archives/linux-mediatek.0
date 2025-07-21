Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAD3C87FC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cV0TLLVrWh45H8GiwU0Tx4lO+8zwZFzO8jqWulbiDMY=; b=bfdKx656upDry/2/vAVoNSweG/
	BPP2zCK88KobuvZprgNPN2/wk8/ZSekvTbnAX2t0A4e2QtB2UR9xHTI9ADzX+Fc++Sj5HyWnlFCBE
	qDt4neALieBttKcNpJThzSFxd+QkRd0JPo7gsKzEvSQQxvGPl7UTg6IUSkcG6SD+KtpJKdtgmqDnV
	/mrJlmwdQAzWp4ised69AhGt8MSwL90Rg4Kks3LbGd9Ue/S6Un8NtioXjUPIE3+DgEmdJUqm+MFNO
	/ALUJ6YCk3z4ZFXZQSV9vGpAEJwFLQt2CjAQT9R6b0yVAvNgNh5XAWn++gG/0SwR75VMsfcAtTeQc
	Jmwhv1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtnP-00000000F9r-2l3L;
	Mon, 21 Jul 2025 16:55:23 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udshK-000000006be-39GV
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 15:45:04 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bm4Tl4Y8rzm174y;
	Mon, 21 Jul 2025 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753112696; x=1755704697; bh=cV0TLLVrWh45H8GiwU0Tx4lO
	+8zwZFzO8jqWulbiDMY=; b=h72Wp3dMd8e7wXvYPGUvnwKgwmgEZjvFnWkJ/SYW
	n6WVtCCc68+6wSifCQgbUVfYd6DNBtLSTL99m9lFT+H2HJpPkmExzgHutgsm1cL3
	06H1ekyq1DGitoOWulaEkXQYjmVWUMgDZPygTfRFhl4Uq5jflmK1NGE0RVH1Vux1
	Qm1Owq+sZxHLxsGkVXR2DJQyaLgHUnwy8/O6GPMwwhCGT1X6cwa+9uTSgNrMHIpn
	zRG0SDnEWOuPY8rvR3gcuICcVp8VLuUAEC/Rn0UcN/xzP7J7kRsl4L0L/e46Hkcd
	rNm+2uOIp9nCK8FwtJXimOTL29yYCjCEx1jRlDe0Az25bQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id l6NqqqM_3-5p; Mon, 21 Jul 2025 15:44:56 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bm4TQ3Nqlzm0ySj;
	Mon, 21 Jul 2025 15:44:41 +0000 (UTC)
Message-ID: <37ef75af-70a4-4030-9bf7-0bae0f53f7d9@acm.org>
Date: Mon, 21 Jul 2025 08:44:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ufs: host: mediatek: Remove unnecessary boolean
 conversion and parentheses
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250721083626.1801668-1-peter.wang@mediatek.com>
 <20250721083626.1801668-2-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250721083626.1801668-2-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_084502_871447_CB6B2912 
X-CRM114-Status: UNSURE (   8.07  )
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

On 7/21/25 1:35 AM, peter.wang@mediatek.com wrote:
> The changes
> simplify the code by directly returning the result of bitwise operations
> without converting them to boolean values or using extra parentheses.

The code changes look good to me but the description of this patch does
not. The conversion from unsigned int to boolean still happens with
this patch applied. This patch converts an explicit conversion into an
implicit conversion.

Thanks,

Bart.

