Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2984CAC59A
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Sep 2025 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8m/6ATPSbdiv4CxyuTQovzQUAjRChlNIC99GXk5+VB4=; b=wQhMItBb0ywV7+08vs2Fqjx+4y
	c8n4R1WX3zRy5IWSejVxi/JsDun1WSSPNcCMKe9KpmM8ikODQDVj0rRE7ksGKEad3/gAeqQ/G3r4y
	byymlvaLjf0iIDh1aHy7aj11P7LTf+VHxjHoHm7lqcW82JAYcnWhjqPpaqFl2Z2tITt6q9gEtvfZl
	aKLGWg6c7SfvZfps3IbTQJPn1i/J4cApd7z4jHIeTDqJieTzTTvp446YBgaHc/ns/yIemE8Zi/T11
	T5E0JUd0kJdskPtSUBVJTjXXnPDXHeTjb+qodsmYms1GpcXg/m+xeAQbRXmO9+L/u0IAwlz6AUnp1
	cTnzANFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziMW-000000043F0-2i5B;
	Fri, 19 Sep 2025 21:09:48 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziMU-000000043Dv-0tav
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Sep 2025 21:09:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cT4rn1GJfzm0ysv;
	Fri, 19 Sep 2025 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758316182; x=1760908183; bh=8m/6ATPSbdiv4CxyuTQovzQU
	AjRChlNIC99GXk5+VB4=; b=ubsYQwbbbagbqFuW5JkcT8pJwQpZtvdDgyo6hnhR
	1buyRNOUW8dC4esn+SfBTgHW6v2P9wK6u76q6ylzR5K5sFKTUJE7tx4dHxVK6joM
	vil/YyFC3vn+S7vZ4aTRp7fxx8/AGGuLtY/6ivogCphpkLp8VIuecgrk8NzwMq40
	iSKfr9s5dvhipDdeyu+lB3Z4p9bzvgDp/CJvAgSwx+3odoyzaVhOW9Xdt6tx2UtA
	mTcJOqkUpWzK1uAKtM/lPMC9HfzkXp11c6Ll2sv+5upfSywf+9c8ppqSBiNFu5ye
	JnAH6zhzaLLwH6CDnJ5fHQrJ+fjwKsRwB0JajnOrCSewrw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LtO7asyir2qE; Fri, 19 Sep 2025 21:09:42 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cT4rT0LbLzm0yVT;
	Fri, 19 Sep 2025 21:09:28 +0000 (UTC)
Message-ID: <3d2a98e0-03d3-4b7b-816c-581d77551598@acm.org>
Date: Fri, 19 Sep 2025 14:09:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Enable interrupts for MCQ
 mode
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
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-7-peter.wang@mediatek.com>
 <5ae6134f-6e41-4453-b11f-4e3eb92a1c04@acm.org>
 <beda693842394d162c95d5523eb90373fd975d3c.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <beda693842394d162c95d5523eb90373fd975d3c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_140946_331551_17F78909 
X-CRM114-Status: GOOD (  11.77  )
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

On 9/19/25 1:14 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2025-09-18 at 11:34 -0700, Bart Van Assche wrote:
>> Additionally, the above patch description doesn't make it clear what
>> makes the MediaTek driver different from other drivers and why only
>> the
>> MediaTek driver needs this change.
>=20
> This is a confidential design by MediaTek, so we are unable
> to share further details. We apologize for the inconvenience.

Having taken a closer look at this patch, the only reason I can think of
why interrupts are re-enabled from a .resume callback is a workaround
for a controller bug. Please consider adding a quirk and moving the code
that reenables interrupts into the UFSHCI core instead of exporting the
ufshcd_enable_intr() function. I'm concerned that exporting
ufshcd_enable_intr() would make the UFSHCI driver much harder to
maintain than necessary, especially if this would lead to concurrent
writes to the REG_INTERRUPT_ENABLE register.

Thanks,

Bart.

