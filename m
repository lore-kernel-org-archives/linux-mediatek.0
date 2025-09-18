Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FD4CAC59A
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Sep 2025 18:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7H7huVJz682pZBEWdQDRF47IMjQgtvG2iWmmNpI9NY=; b=PAGIlECgkZDxMUu7VH/CyM/g9J
	IRogKG20S/XAoKAJDRjMFpitRLGFhXdo+uWRoyV6OLloOi4Y0iF1F68RNAkpcdfLe3RZh6TthYLBD
	Obeld8E7REICWNJoS8fpFO7Wm/ofAVjU5AySClweGXR4ACnHeucaJ7m2C4d+q/WoXU09+3fBQ66GK
	HdtssRXD+ahI0ztVJybXHcbCmV+qaWruvdSlwhBDfP2pjf66qApYB//voeh2NJ1s9byTdtY4bT0zv
	fbsKMS/Pj+kkenmxRNlcvEbn4ENcUzhcgW9PbPlP4GDBQlWg2mXM+jtQNpYqtDOprGx72wL8fp+FG
	GKZHIF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJSc-00000000sPR-3by1;
	Thu, 18 Sep 2025 18:34:26 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJSa-00000000sP2-02Ts
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Sep 2025 18:34:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cSPRz0RrfzlgqVk;
	Thu, 18 Sep 2025 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758220460; x=1760812461; bh=z7H7huVJz682pZBEWdQDRF47
	IMjQgtvG2iWmmNpI9NY=; b=Bq7mpJ7+FzlCaAsiD1kbuTSsUaUnWj3T4bJ2QrI+
	l9YWIGOmB19yc8Ik5YdqpTa6FQD+iilo2WxD+urmtrGgYvU+Vya21i0pYnKMqCMb
	KDCy5tIZG6ekklUkkuSAZkEse2M+5xRQVytbSNd/mGkDgEb/OaM3V+wrWrCD12Yx
	actggJ4V2vXrCnHXkcMZh3+ch8bzZ+orNfKs1Z05EbBJC1ZILrQdYwJSKMp2VnCq
	wObF8JCu22SFWifeCAUn9BdEjYJv+TwpsXa5J6IMEKekZWTxbOzmKuY9FtnVcTCc
	IA6N9/oj4s+Il3UT0g/y+CNnEFkVsQ91WQWN57T0gUtUnQ==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CWBThPgueKXh; Thu, 18 Sep 2025 18:34:20 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cSPRh4GgbzlgqyC;
	Thu, 18 Sep 2025 18:34:07 +0000 (UTC)
Message-ID: <5ae6134f-6e41-4453-b11f-4e3eb92a1c04@acm.org>
Date: Thu, 18 Sep 2025 11:34:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Enable interrupts for MCQ
 mode
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 yi-fan.peng@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
 tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, naomi.chu@mediatek.com,
 ed.tsai@mediatek.com
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-7-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250918104000.208856-7-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_113424_125276_A0CC72AC 
X-CRM114-Status: UNSURE (   8.64  )
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

On 9/18/25 3:36 AM, peter.wang@mediatek.com wrote:
> Enable interrupts in MCQ mode before making the host
> operational in the UFS Mediatek driver. This ensures proper
> handling of task request completions and error conditions.

All interrupt enable / disable code should occur in the UFS core driver.
Please do not add any code in host drivers that manipulates the
interrupt status.

Additionally, the above patch description doesn't make it clear what
makes the MediaTek driver different from other drivers and why only the
MediaTek driver needs this change.

Thanks,

Bart.

