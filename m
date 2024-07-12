Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D372C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 17:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxNZGyOZRostHrNqtJBGwypYIErFbOvNA9+4kd+g8OQ=; b=oUzcc/RE9Xwsg+ag41+J/iiuOn
	xoiuJmrh88AvJ9W7SGDZrClWtSI1O73tLqMeyxcaK4nUzIKLF0mz168Rn/PGlOpOPCZ/322hctSp5
	v+xZl13yZVp2WJdQvz7FVCAcJwTJQBXEk2TIVxxEUmKTZE0teYrrdZihNLp1CcQfJkxrwOM0tfz2w
	4lg660BL1cl58Dp/+elHpmkx3e2W/e5392BYfjtrVwIV3f1kLlILDmVKn4ZBoj+ZZZctMH2ClBahz
	C/Of+T6PYfqQwHPPArKComE3u+fc7QCdBeNz8o8u5xMz3Qdmkq4MM5ccFqOpXqjVYb5V86AHpPqkd
	yjYZd+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSKId-00000000sWF-26A6;
	Fri, 12 Jul 2024 17:43:15 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSKIb-00000000sVr-2Qdi
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jul 2024 17:43:14 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WLJpn18lmzllBcv;
	Fri, 12 Jul 2024 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1720806188; x=1723398189; bh=hxNZGyOZRostHrNqtJBGwypY
	IErFbOvNA9+4kd+g8OQ=; b=LpmycdkEMZHtCXMaHclqeMbL/XwwxD1HBqaYiDsp
	dvyBCb2YWe2wAi3E1tuThHAlUUQLB8R0GjjOUWc04P6zdrGp/EVWwnkEoujOMfP5
	wRRS+Ng8zmTK/b21yesy2Z04AX1B2iXssutEwAQzmiKzey1wPgNp4xRVak0a9dlL
	sU/5Ji1zRcwOXt1e0yc1Yeum9CgMozqHqd/nH+4hd4oS/BN0P31rZ9xk50QassrF
	p0J53G9cuK1X6aBnG4MX+AsJ12AvdOise6Rx/BNEMTlYvibqk59qFRqevKPmfUFY
	I3tT2Rqknb2dyo9e4Up8L6QXhMQMuLGaP6shO4cYIMmXVg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Q_y74j0HpsJj; Fri, 12 Jul 2024 17:43:08 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WLJpZ5Rd6zll9b3;
	Fri, 12 Jul 2024 17:43:02 +0000 (UTC)
Message-ID: <3ce9d99e-bf29-4454-9681-1464a23dd909@acm.org>
Date: Fri, 12 Jul 2024 10:43:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: bypass quick recovery if need force reset
To: peter.wang@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
 eddie.huang@mediatek.com, naomi.chu@mediatek.com, chu.stanley@gmail.com
References: <20240712094506.11284-1-peter.wang@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240712094506.11284-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_104313_667407_54A20A49 
X-CRM114-Status: UNSURE (   4.71  )
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

On 7/12/24 2:45 AM, peter.wang@mediatek.com wrote:
> If force_reset is true, bypass quick recovery.
> This will shorten error recovery time.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

