Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD611CFA464
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 20:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGZNZ2BEBqO2PQX0Ox1H5dzxZcADvb4w3SzhgMbYpks=; b=CidSFJVEGndZIm7A3qYm4QkuNz
	0ajsVEjy5j7F9HJGIJl1G0JpQ9Zs6oZyrHdBsN668EgTbelLPbOXfy2Wj8aM2a/EP2TNN3csx0WK2
	Vdb6JcZtNT9bMZRmTwE2pk0S8ON0zydtBJw9jANi3uD+LWKSIwubUekMTG2V0ywIiwRWZO0wGIx2w
	faRTY4htuI1+dXkmJVMW2a7p4YMXXCyOVoRCLtiFCG8UNbrPEpr+6+l3a5JGJjWSPAXYyZkoYNPAX
	I60VHKVyloEFJb9MvQ02hIUoE4akJkFSlDhevog3YIFaixTxpeNEZe6ZSOK0gWIXXLEN3OQB64l1Z
	z9ftaMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3hh7-0000000FmjV-3H9o;
	Wed, 23 Oct 2024 20:11:01 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h7o-0000000Fhfu-2YY7
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Oct 2024 19:34:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XYfPT0CMDz6ClY8x;
	Wed, 23 Oct 2024 19:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1729712052; x=1732304053; bh=UGZNZ2BEBqO2PQX0Ox1H5dzx
	ZcADvb4w3SzhgMbYpks=; b=nGEVIbuC1gcaUni7Fn93l2J36pDTnraKOmMNXw18
	bGY7GBjekfxniPcbjAeC4fFzlMBaoNcmplRA/LgN72zZM8R208C/Xr+B23UV5zVV
	S5BcnJXLg1beukAiT3JdMgnDe7VmKkEhBbFiGGXqWfAX25MoeMLuoveLZ7PS9Ivq
	q5JXmw4mt4p0EBXMsJi5+PipZd6Fyfd0WY6G+ijJh3F07zkORnLypI4IpXLeT3Kt
	Ad4Hl+l0ahKvI5A5l9C+voDUh+Fi6O/fczbJDUqPszKYP7HJnagtJkncWCsSChnB
	vlysbViqf2bgBcU1sbPKagtu/v7fWJW3U7/8++m1fRqc2Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 9ptD4NLkaz8m; Wed, 23 Oct 2024 19:34:12 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XYfPG4mn0z6ClY9V;
	Wed, 23 Oct 2024 19:34:10 +0000 (UTC)
Message-ID: <9805c64f-70ab-4693-aa49-b3659ebb38be@acm.org>
Date: Wed, 23 Oct 2024 12:34:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix another deadlock when rtc update
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com, beanhuo@micron.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, stable@vger.kernel.org
References: <20241023131904.9749-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241023131904.9749-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_123432_709470_04AD0811 
X-CRM114-Status: UNSURE (   9.19  )
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


On 10/23/24 6:19 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> When ufshcd_rtc_work calls ufshcd_rpm_put_sync and the pm's
> usage_count is 0, it will enter the runtime suspend callback.
> However, the runtime suspend callback will wait to flush
> ufshcd_rtc_work, causing a deadlock.
> Replacing ufshcd_rpm_put_sync with ufshcd_rpm_put can avoid
> the deadlock.
> 
> Fixes: 6bf999e0eb41 ("scsi: ufs: core: Add UFS RTC support")
> Cc: <stable@vger.kernel.org> 6.11.x
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

No blank lines in the tags section please. Additionally, a hash sign
(#) is missing between "<stable@vger.kernel.org>" and "6.11.x".
Otherwise this patch looks good to me. Hence:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

