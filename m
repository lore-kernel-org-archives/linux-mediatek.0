Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9D1CCD185
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQn3yzZWC6sxo+FYotqQ1NhjzqFQnqAHBXE4GMEzjig=; b=Luv2XVQSOt0P6+XAHb/VKjIpWT
	TvvdpWP83+mg/lcwWnVLzeVSw4Yk5+K5yYjuuAMJQSwDB0xJTZRjVkZgIT3CdFBYhEpfLYW8pFra8
	tcTbM6kIKvauQxVcxjY1bwczaBiMJn1cX6tZu80vk/FuzbbmUyrA4w31DEinND4Q1RhUD2TBmuzXT
	3aNi8aSAFXSQGZLrwRJThKwVpZceJvWEpExYv369HndCiatXYzJtmhi4wCqECMpD2+wavJCYsfNZf
	7KgrvztGx4Ffi2H6J+O/xzxcN615GVvhPtYYu0NupUVGzs9kpv6SoAsBiJb3k7U1Fr4Q3p/kGErIM
	c03odgdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93vl-00000002CBd-1XTk;
	Wed, 15 Oct 2025 16:00:49 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93vi-00000002C8v-0wAi
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 16:00:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cmwm15QFxzm16lH;
	Wed, 15 Oct 2025 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760544030; x=1763136031; bh=qQn3yzZWC6sxo+FYotqQ1Nhj
	zqFQnqAHBXE4GMEzjig=; b=N55wDaDr5XGb8eD/yHqk+lSGIcm/mycO1yN4u1Gm
	bktYIr+1ztlyzsBt9ZNcrOlWJdDoLQE/gQvzfSVlry9LhlP8xXcTzbTPAT5Ct06p
	htGFpxQ0AOjrWrLAm6NZHxiO9sJEkQbiGVAvOqMhV52S8URcVAHj+jgv92NIOd+4
	ioWNT7cyaDlqyMlXKbt57wM3tR95c3NomxXmvawk3XkYPo08G47FogwmCEMKxnlQ
	vfpgPB/o+tbyfr2aQxwAakLfKVxMZuE9hUVFYPI1vHNtl+tW+9H2w8GNSheNe/Ii
	pstvPgus9PODvYgELoLeFowFep2ZJX3hYx0zCdgbtRu/Zw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vdeQQY-RmWgi; Wed, 15 Oct 2025 16:00:30 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cmwll4VhYzm16lF;
	Wed, 15 Oct 2025 16:00:18 +0000 (UTC)
Message-ID: <fa118df9-0b9f-496e-abf9-bf608b9e361b@acm.org>
Date: Wed, 15 Oct 2025 09:00:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ufs: core: support dumping CQ entry in MCQ Mode
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
 <Chun-hung.Wu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?=
 <Lin.Gui@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>
References: <20251014131758.270324-1-peter.wang@mediatek.com>
 <20251014131758.270324-3-peter.wang@mediatek.com>
 <4c47f800-0536-452a-b64b-d177fa306418@acm.org>
 <b9a9157e09cde6ea17f9a0f36a4ad11fcbcf0b0b.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <b9a9157e09cde6ea17f9a0f36a4ad11fcbcf0b0b.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090046_333985_BDB81771 
X-CRM114-Status: UNSURE (   5.27  )
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


On 10/14/25 11:14 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Or are you suggesting that we dump the CQE directly in
> ufshcd_transfer_rsp_status()?

Yes, that's what I'm suggesting.

Thanks,

Bart.

