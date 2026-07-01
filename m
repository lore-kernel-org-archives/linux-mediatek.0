Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E42C44502
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkYhl3CtbmJbats+wc7zDUgYg3p4SDBgKRAXiMc3XmQ=; b=NyTOLSpNohezl/zXNYglYGI8xq
	8L9416afpP0Eksq9xVuCK2Z4IZCBLIHnljj+FsNfKVbD5k1o/HYi61ElG0O38Tex5sdoCZ18pzqmn
	FUKgFUynxONmEKYGJt4oLEhQuqok1cpPWnWc5Qd3ess3DQF84JK3p4+UVqoPADZ1apyJti7vtYaus
	NjZSQ3vhif8Mp7BxEjDpxLJqOQCVJI1z/yNe8RgT+M5ZlwUkBYPgdqw4PT6BZPcnkwetnezFHP535
	xLDl2SlIJvZKOlp5pziiLmDnxFl1t14/bWs3PaSD76MWL0jhbd7SJ7jWnzzxFqXxb9TjDwFtoyYF2
	TynmGetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuVn-000000025EJ-0vAV;
	Wed, 01 Jul 2026 12:57:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuVm-000000025E3-01hy
	for linux-mediatek@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zkYhl3CtbmJbats+wc7zDUgYg3p4SDBgKRAXiMc3XmQ=; b=YKhtKIg88O1FK18pXzmykqJAWz
	VwZ3+ex58lj6QrB33cEnX4sgIk9piS8a7Tg3XxMhzGsNMA8PUOKXRiXrcd9guRqpwyjlURbut0zmN
	9Sd1WIJCpAAD2cUqKuBAZnhXQGfDyZGpYo21+kPK8A1fYQGK323AcKLXss725anj2W25XWkk/T0zE
	zbKmjV7gWT0/Ycdhd/frsdmOyhhi7lh5nNPRfKSaKklXJVIueKFKZDJCrNa9S3cFBnDHp81mwa8/T
	i6f+yNR07BCGAIt3nY6v1BKR8inYsKQN9Q8Jse1s7I2NXMFGH3/vfb0S123zth3y4OCLHX05v4MBM
	+QPS5XSA==;
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuVh-00000002n5B-1kdX
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Jul 2026 12:57:52 +0000
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 658361C62DE;
	Wed,  1 Jul 2026 12:57:43 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 322E920025;
	Wed,  1 Jul 2026 12:57:39 +0000 (UTC)
Date: Wed, 1 Jul 2026 08:57:40 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Peter Wang (=?UTF-8?B?546L5L+h5Y+L?=)" <peter.wang@mediatek.com>
Cc: "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>, "CC Chou (=?UTF-8?B?5ZGo5b+X5p2w?=)"
 <cc.chou@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "Chaotian Jing (=?UTF-8?B?5LqV5pyd?=
 =?UTF-8?B?5aSp?=)" <Chaotian.Jing@mediatek.com>, "Eddie Huang (
 =?UTF-8?B?6buD5pm65YKR?=)" <eddie.huang@mediatek.com>, "Qilin Tan (
 =?UTF-8?B?6LCt6bqS6bqf?=)" <Qilin.Tan@mediatek.com>, "Lin Gui (
 =?UTF-8?B?5qGC5p6X?=)" <Lin.Gui@mediatek.com>, "Yi-fan Peng (
 =?UTF-8?B?5b2t576/5Yeh?=)" <Yi-fan.Peng@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "Jiajie Hao (
 =?UTF-8?B?6YOd5Yqg6IqC?=)" <jiajie.hao@mediatek.com>, "Naomi Chu (
 =?UTF-8?B?5pyx6Kmg55Sw?=)" <Naomi.Chu@mediatek.com>, "Alice Chao (
 =?UTF-8?B?6LaZ54+u5Z2H?=)" <Alice.Chao@mediatek.com>, "Ed Tsai (
 =?UTF-8?B?6JSh5a6X6LuS?=)" <Ed.Tsai@mediatek.com>, wsd_upstream
 <wsd_upstream@mediatek.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "Chun-Hung Wu (
 =?UTF-8?B?5ber6ae/5a6P?=)" <Chun-hung.Wu@mediatek.com>, "Tun-yu Yu (
 =?UTF-8?B?5ri45pWm6IG/?=)" <Tun-yu.Yu@mediatek.com>
Subject: Re: [PATCH v3] ufs: core: add hba parameter to trace events
Message-ID: <20260701085740.218cf4d9@gandalf.local.home>
In-Reply-To: <e4c090a5b8402fe3db137d986f9a6639de73cc67.camel@mediatek.com>
References: <20250214083026.1177880-1-peter.wang@mediatek.com>
	<20260630165612.3e21b510@gandalf.local.home>
	<20260630174949.16a9d867@gandalf.local.home>
	<e4c090a5b8402fe3db137d986f9a6639de73cc67.camel@mediatek.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 322E920025
X-Stat-Signature: x4gaju9sut5o7zrucc5oguhexokm5rdk
X-Rspamd-Server: rspamout04
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/xreLa1BHmWb4rHSrAqeiMAemv580Qk8c=
X-HE-Tag: 1782910659-907956
X-HE-Meta: U2FsdGVkX18uy8au4Rgvq2R6ekNAy0sdc9mHg58V3h96aUiu9oQdJ2/1GCr5+z2r+5PpfLpBlBg7IRhUbQeou81TUk42Azl+X2S+Hkty9dWbxZJXyy6N8NggGIn1XLp2xLKWAPQRdrLL4upLNH/ViBJAAHDaNf1Q4Hd47iTapNl7J5CSubOReveK35FqfMZ0OBcViFip23edw6/DjxOR40ny15SkTkLs2pyFRbhRaogeSMlRypQQ7R2j+1RmrMgbCNMmx1cnUoE0wR+6+2JrXLjTcnAf0XpQEy96PopahgsYq/La/2evA5+vZhEEg6fCPQuAHoGW65zPW+4tnIianQzwFA+ax4sQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135749_754188_ACA6D283 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, 1 Jul 2026 06:11:37 +0000
Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) <peter.wang@mediatek.com> wrote:
=20
> However, I am curious: if the HBA is removed, implying that the=20
> storage would become unusable, might the system encounter an=20
> I/O hang or shutdown, potentially preventing its detection?=20
> Perhaps it's a theoretical issue that would not manifest=20
> in a real-world situation?

Note, it doesn't necessarily mean that the device itself was removed. The
issue is that a pointer to an allocated descriptor is saved in the ring buf=
fer.

Maybe once the device is created it will never go way. But what happens if
for some reason the descriptor is freed and reallocated? Now the old
descriptor pointer is still in the ring buffer.

What in the logic guarantees that the pointer will never be freed?

And lets say there is an issue and the hba is freed and you debug this by
dumping the trace buffer via ftrace_dump_on_oops. Now the dump itself may
crash and you don't have a way to debug what happened.

One other point that causes issues here. It makes user space tracing
useless. Try tracing this with "trace-cmd record". These events will not be
able to be parsed.

-- Steve


