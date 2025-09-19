Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D10CAC592
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Sep 2025 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehmo0zVpsScCNwYSk35hKBqCz+aSYotg0zAVgDcga6U=; b=py2lELzb3ZLpnUDAUDz0VAX6VL
	2+FDL2NYqfAecyxMIlLLSS/I4JhnEYaHxkczpC7Npz2DPfpzqx6timJMvXYY0V9CPfOXtV1oqedNs
	04I9ZsaNRXBqaraSja4PZAt0CGUtA5YruWKgLdFTUq3MkKzkq9aRT/9fm3lYsRvRGU37d9L3PYbQV
	o+mhZ8LCeh8YCkN6xbi1Rs9/wkjVei4gd23pGwJArdfh4m6GJdD4STuzyY7V1koRxtoatAhiGhrza
	r5p4Bjwu46Ip4ceFAhovNJJ6M9dlWFL/pFtvQ5gORdpaJFk3mmnwFOEHPxZJ/17QxOO7r71+0RqAk
	s1YJewvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziG2-000000042XN-07W6;
	Fri, 19 Sep 2025 21:03:06 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziG0-000000042Wq-2VzM
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Sep 2025 21:03:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cT4j34gnfzlgqy3;
	Fri, 19 Sep 2025 21:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758315780; x=1760907781; bh=ehmo0zVpsScCNwYSk35hKBqC
	z+aSYotg0zAVgDcga6U=; b=psgjlYXi6XyLUlF5wGplfA2yNWAPmFRPFzgHvQBp
	ZMlRtBhTLSLMlQArNonkSLFSRHLQHliv4q1+tQXp6FHiB7fwrx7NE14fcc/TDe8K
	GWkStKe1eQBJ3AGBGmIbNGNih+aJciqMxVPZSwGV8zSyC4Doa5X5ZOqv70k4b/Yg
	id3UgnNx+UseFMHnpZIeKdOrheyefq1HAF4T2LsaKZujZNSDeOVyFka70sGwqYyN
	Cj7nQKOL8vZrSdZHusXcncq9ggjqqtFTfbeiTASAnXDHPstKSpV+l05W/ohnoSR9
	c+OEcTE4be6slXYQt4xI2WcS7o9WUIu+Xoz7ijCTtsySPw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id pO4KjVvECtoX; Fri, 19 Sep 2025 21:03:00 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cT4hm2w7Yzlgqxm;
	Fri, 19 Sep 2025 21:02:47 +0000 (UTC)
Message-ID: <ba381e9a-4cb5-45df-9fe0-3d370a84429d@acm.org>
Date: Fri, 19 Sep 2025 14:02:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] ufs: host: mediatek: Correct clock scaling with
 PM QoS flow
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
 <20250918104000.208856-3-peter.wang@mediatek.com>
 <02338932-b3e9-458a-ac24-41b4f29eb514@acm.org>
 <21a451c752709cd9c1a3e18568c18f384bb77a05.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <21a451c752709cd9c1a3e18568c18f384bb77a05.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_140304_713735_33DAEF04 
X-CRM114-Status: GOOD (  14.78  )
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

On 9/19/25 1:11 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Thu, 2025-09-18 at 11:30 -0700, Bart Van Assche wrote:
>> On 9/18/25 3:36 AM, peter.wang@mediatek.com=C2=A0wrote:
>> > Correct clock scaling with PM QoS during suspend and resume.
>> > Ensure PM QoS is released during suspend if scaling up and
>> > re-applied after resume. This prevents performance issues
>> > and maintains proper power management.
>>=20
>> Is this issue related in any way to the MediaTek UFS host driver? If
>> not, please change this patch into a patch for the UFS core driver
>> such
>> that this issue is fixed for all UFS host drivers at once.
>
> Yes, this is a MediaTek-specific test which disables clock scaling
> and keeps the power mode in high gear.
> So, I don't think this patch should be applied to the ufshcd core.

Hmm ... it is not clear to me why this change is specific to MediaTek
host controllers. Please move the code changes in this patch from the
MediaTek driver into the UFSHCI driver core.

Additionally, why is this change necessary? Suspend and resume should
happen quickly. Does removing CPU latency QoS requests during suspend
and resume really save power? Has the power impact of this patch been
measured?

Thanks,

Bart.

