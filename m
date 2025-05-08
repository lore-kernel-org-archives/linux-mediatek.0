Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105FCC3ABBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 May 2025 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wgP8cTHyuHKbaDzZp/SsUfPN8fvBz396Y+2B7V1loY=; b=LVlxkOXBabEoxLXjUDMKBqmBB7
	NNOuCtfaMhAA8O/1zkCQSKJzKUnEK78s66eott7HOrXRBYzzT7j7IYomwDUDfQ1idshDruif2I3OE
	lRSBs+UeDwKtYTHvoBZ6TVAdNVjDHNGKRAD3PEQHNH2TlU5GYEwrPbAiPDH33YkfmdoMh2loDDDn+
	I7afoGiINzTtF+ovVbxANwnCgQ/Cd43Q2X3T8/UkwRuXX5dP7TMhe0vLRGAEQMGnr5f/ErxoHYs8m
	Sir0qrORFcZhvQ46HROyCiDQ5HRfP51Y4LZfGGOt18iPWo+CLKchDKgf5Nmqxk1yzGibQ8NTXXwHZ
	nfvKkPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD45I-00000001HhA-0Cym;
	Thu, 08 May 2025 16:26:56 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD33b-000000017Cr-0hGq
	for linux-mediatek@lists.infradead.org;
	Thu, 08 May 2025 15:21:08 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ZtbSK4pT3zltPsg;
	Thu,  8 May 2025 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746717662; x=1749309663; bh=5wgP8cTHyuHKbaDzZp/SsUfP
	N8fvBz396Y+2B7V1loY=; b=2vqXOL7vn7+uWd0H5sy1bgtiCGZR9tZTgF2q29GU
	gjaNKeNOaM2o/mC5nw0t0rM/XTHLAmKRJaM2Ahh+CaRNZ5lYaUYPO0w+FU/hBVXU
	eCeuLuxwQU5hcfzM/x9gmyigRx3PRt9ZW76x2CyMdtce6oSGSiMfow7Los+hEKuf
	cjCk/yBqs6IH4xOEHvJAefILXumYpb/0QPlNH8CJfRtMl1URezOca1iOiaBB1EUb
	n/Xep/IuCmRZTwImGa75IrksaHz7P8dxKyWhGfZFQEhMHI3t1iizzghgWN0nfNGD
	jlpbZpsY0AZT6I4JkegMX95YbLkNscqGGt5MklITuMq3zg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id IMnYJcsWsBHj; Thu,  8 May 2025 15:21:02 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ZtbRv1bRbzlvkT8;
	Thu,  8 May 2025 15:20:42 +0000 (UTC)
Message-ID: <b3fb4302-462d-4b92-a6cb-784000cd796c@acm.org>
Date: Thu, 8 May 2025 08:20:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: behavior change of hwq_id type and value
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com, quic_ziqichen@quicinc.com
References: <20250508091914.307944-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250508091914.307944-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_082107_291571_D10C613C 
X-CRM114-Status: UNSURE (   4.49  )
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

On 5/8/25 2:18 AM, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>

Patch descriptions, including the subject, should use the imperative
mood. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

