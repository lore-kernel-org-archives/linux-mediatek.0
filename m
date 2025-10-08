Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EB4CCD183
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 16:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBop869ILNKe1Vs0yODLOvFnk6j0t2FjwHWSyU4Spbw=; b=neEgf5DxzgXhHJRc5fi/k8VwAo
	QP8uPM2/pX6K78WsRrDPB58X79IRrmcR61ZwLpurIw0+RHaaNoJTkD4326MSLBJJCGdDNq3YJn2IP
	ctdToAnATaLEE7YFobKSADylCpP2TUmDp3ZAeEPLUe/9dBW+HZKkF5Oaq3P6pGQSvESqAR2tkeLvn
	XYR65ngBIEF3T3jBJx9Qct/q6a3ZN/l9h1fqdYgYM/H/q0rdqDflKJ50OV4iRBJTlaOAlWlQ1UMPB
	xWVD3wFmulea2vwxFnOII4jkzWEuKXnKc8BUHUv/DR/cNuS+mTiO62bZK34/zWepB0KO2P26N+XpF
	Uc5Sxsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wpv-00000004Hb3-3TPQ;
	Wed, 08 Oct 2025 16:16:19 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Wps-00000004HZw-3hLj
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 16:16:18 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4chdRM4Mrlzm0ytD;
	Wed,  8 Oct 2025 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759940172; x=1762532173; bh=kBop869ILNKe1Vs0yODLOvFn
	k6j0t2FjwHWSyU4Spbw=; b=k8ZsGfUfn6xjR9f0L4rLvgW0G/60DXx24UxCQ0bg
	3MVfdQLh1RK3lQivHEYCGCGol2R6/0YM3KVG6q1OHNCaN0MuTXDCsg3kc/RiDov8
	PqEcvtb4I/5lVTuLwgp9gKxHGRyy6eb/tcn1W9s+wLyI41iMNPd6/2FzOW+kzw0V
	2dKFd3kG8Z6WDzHlbMEvjYWusBtugzdH6airnDAYy2dmXwOlfAc/q5KErO+mjsRo
	FY/+7yGdNsMsnaGQanqQSu1y62CezKv2ojcteiFN2QO1Wks6ohHxdafKR9L6P/OH
	GMaGv0UyYnN/Py7DrCVnKUgzS+31Qh4Gl6qyMj1zvmWTgA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id eAKCqr_Msxv8; Wed,  8 Oct 2025 16:16:12 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4chdR44rrXzm16kk;
	Wed,  8 Oct 2025 16:15:59 +0000 (UTC)
Message-ID: <c1f86c8b-3a09-4fed-9c7e-fdb26a4cbfdb@acm.org>
Date: Wed, 8 Oct 2025 09:15:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Enhance UFS Mediatek Driver
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?=
 <Chun-hung.Wu@mediatek.com>, =?UTF-8?B?WWktZmFuIFBlbmcgKOW9ree+v+WHoSk=?=
 <Yi-fan.Peng@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>
References: <20250924094527.2992256-1-peter.wang@mediatek.com>
 <e818d9ef6f5625de02330a6a92a2ab2b77229c87.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <e818d9ef6f5625de02330a6a92a2ab2b77229c87.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_091617_002755_B4FFB9FD 
X-CRM114-Status: UNSURE (   5.68  )
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

On 10/8/25 12:31 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Just a gentle ping to consider merging this patch series.

We are in the middle of the merge window. Please rebase, retest and
repost this patch series after the merge window has closed (next
Monday?).

Thanks,

Bart.

