Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60274C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 16:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HplzPwWU10JoGw3qjp6VwHGceUCH163ka0Sx0GfFyUI=; b=gDeNxfbhiNUSukt43x52QHWECM
	ri5Kdq7ePK9EjXFB3GvdV18KbJ/o+IJfdVG4F/EmXLyXyWqEp0jX8XSbPTXq+0KvLA9xU0rNcQcLs
	FWOwCK1+012OMKX2o+0upVybGUUSM3xFcZFefFVkpYlVJgGcbeDyIdBndM38ma8EHqcJbAx60O+Hf
	hhn/otUpMWfzpM2tewrgQONAihwZkOgh3o/VGltn+s8r2QidtWSkIws8oCrIFU26S5uCMZeYML3Hs
	ZUUYKosheIol7wu0KnOY5I81UmPYOKtrhiJHhk7ZToSki4MWxP6frJ5RHdB3V0PVCqGUiBtY50MRh
	y/UgoObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRFI-0000000AbtY-0uDu;
	Thu, 17 Jul 2025 16:14:08 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQhz-0000000AWcZ-3Vxh
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 15:39:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bjcYT3T5lzm1747;
	Thu, 17 Jul 2025 15:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752766778; x=1755358779; bh=HplzPwWU10JoGw3qjp6VwHGc
	eUCH163ka0Sx0GfFyUI=; b=F2LuUvA9d6YXxyMbanxsq9G+4bLSjy5nhKkbQr2V
	r6Z6EV/fb5tlj8CQOw/dNmnGybpsghZqUzyS4oFCIYh9QUFOyop6m//0Vc7eFxSr
	RSg3ga/cw0YANuObsYsF0s3YzlQbybPwIWxN0I/XfhVgNJpQTvNzNNO+yhpgw0hm
	3CUeWO8i2AIB/DXPLKeLDiXFzYbdwntTA2JaEwxxbqUpY/maj4Xnx96xWw5+Dwup
	F5dsihTchXBg2ERq2vr/8R2oNTrNevvcA1Tg0BW5Mb0DnzVeNxKE+jfk+0sarclP
	BtulegVSe5zLdZ+0tlegFSTpfu+H7itvGI6Ut3sGaeSTsw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id X3mBwEfRxMCA; Thu, 17 Jul 2025 15:39:38 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bjcXy0gw0zm174q;
	Thu, 17 Jul 2025 15:39:12 +0000 (UTC)
Message-ID: <e736dd60-377a-49b6-9ea3-efb1ca5ea787@acm.org>
Date: Thu, 17 Jul 2025 08:39:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Set IRQ affinity policy for
 MCQ mode
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
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-7-peter.wang@mediatek.com>
 <9de567ee-f908-41a3-bcb7-7f54ebb17f55@acm.org>
 <32415970794cf74750d8e10383f738208ec7d91a.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <32415970794cf74750d8e10383f738208ec7d91a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_083943_944409_D9DBC379 
X-CRM114-Status: UNSURE (   7.44  )
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


On 7/16/25 11:54 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> As far as I understand, This depends on the situation. By default,
> Linux automatically distributes IRQs across CPUs, which is
> sufficient for most systems. However, in certain high-performance or
> special-use cases (such as for network cards or storage devices),
> manually setting IRQ affinity can improve performance or reduce
> latency.

Hi Peter,

It would be great if it could be explained in the patch description why
the IRQ affinity changes happen from kernel space instead of from user
space.

Thanks,

Bart.

