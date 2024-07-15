Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E2CC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc6gbiGyEmsVnB1vPxC1tTwvIpD0gWXSMS/KS+dJzxA=; b=NPs/vf1eV/r5lIv/LaNTwoBFEd
	vr+4Dh+u9M9qBJ8iKAm5AZY3ifwSIdfswpCyKtkAiFm3NGMJ4VVDVPpuODjpq7jSto5LkoZrRpz60
	Fcpw5O/7KeU3/CtsNLKtEAeKTW3e3/c7XDEmMlSJvbYUHHKy8sfV/r/RC9BYcrUPDyNo6djjoCkKw
	ML6FuIQkla0qQdeibSyumTEFkBJgwhKG5Sv/KRI4lBgUkPVObkKFYsqcW/saq5xgjHhyO5AcneFVI
	xIRrep/jn6669DXyt2IOIxCJ7AouPAtr7KpSMt3tPBQiIfsqvaTVfGPUe6zPD/lWQictRdRUjpGJG
	JKxnbVWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPKx-00000007pn3-2p0I;
	Mon, 15 Jul 2024 17:18:07 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPKu-00000007pkZ-19to
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jul 2024 17:18:06 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WN86L5F5BzlgMVQ;
	Mon, 15 Jul 2024 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1721063877; x=1723655878; bh=Kc6gbiGyEmsVnB1vPxC1tTwv
	IpD0gWXSMS/KS+dJzxA=; b=F30Pq+UvVEfiLLMb5CzuwRCSNbWtz47LqN/b3x2a
	e4BBGHhsb+s7Hbyu7S/AcIZfp1zM5ibyynLqUK6p+zU5TUPSB2cmg+AEpgks5M0S
	wcKJB2JfczZZWjBpdHi5aJGYQoX7Z/w85MepNLb01JlGY4BuRrWYLMoJU2vcwBkD
	S4Qgqi7AqpfmRb1qGXK8SiEiIyfxovoqBaen5tVMOrDK2Q2Ut+NMoTdZEC+elq9i
	29j4SQc2cBcWGeDiVmASqr1q4zfHHUm7j24K3kxtcDp1SNlxTG7eLLMwecoohgly
	Itjq1KVdWyuJvK5vxQlw6gEBtitVwHXsTMrKJsFrmGEItg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id R5oPzZTHmg02; Mon, 15 Jul 2024 17:17:57 +0000 (UTC)
Received: from [IPV6:2a00:79e0:2e14:8:30c:88a5:456e:8b88] (unknown [104.135.204.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WN86C1jNwzlgMVL;
	Mon, 15 Jul 2024 17:17:55 +0000 (UTC)
Message-ID: <814b2e3f-3386-45b6-ba72-7a1143e57e33@acm.org>
Date: Mon, 15 Jul 2024 10:17:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix deadlock when rtc update
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com,
 huobean@gmail.com, stable@vger.kernel.org
References: <20240715063831.29792-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240715063831.29792-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_101804_381233_B513ED7A 
X-CRM114-Status: UNSURE (   7.23  )
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

On 7/14/24 11:38 PM, peter.wang@mediatek.com wrote:
> There is a deadlock when runtime suspend waits for the flush of RTC work,
> and the RTC work calls ufshcd_rpm_get_sync to wait for runtime resume.

The above description is too brief - a description of how the fix works
is missing. Please include a more detailed description in future
patches.

Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

