Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE70CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3Fn0DiLqZBZx/Wn08nGpoiQ7ur/I7xHuyP6dZ9gpLs=; b=nG2/sgD2mNedru59mkC0/nQ4kP
	v+fzMQcTtP/xypUUCVkqajhde3h4Pr3S8ePQXyAN5hDHzff8BITb7Fxg28OQR10fcJk8tHE2Agy5p
	JLsdEkanJZOHLNi97lUh3yC8DTzAdfpgZSRZrYrsVNW7wAYKashOil1VTKJQZpzzHmjZsouMWGhSW
	V1IgvVxVjvTyXD13qEFXbV1BGp/97Scc6Ciz62WXmHKGKWSu4n8LdFJsxZ25Dgb/vmXE5MT8tLKZP
	iFzRF18OZIFsDIBcm8Cz+e8yUi/UV7kUgxICzCMgFeXp1H5o1RIkAn+DBQlmsM2yWSls49cJJ7a5B
	fTlsHcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stBLU-00000003A9w-1xRV;
	Tue, 24 Sep 2024 19:37:12 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stBLR-00000003A4p-2Jii
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 19:37:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XCqqr1Nkcz6ClY9Z;
	Tue, 24 Sep 2024 19:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727206609; x=1729798610; bh=p3Fn0DiLqZBZx/Wn08nGpoiQ
	7ur/I7xHuyP6dZ9gpLs=; b=rLtHIAxFCGzBjKo8BT2UXNsRETVOHjwlxXV6xB5C
	q64VDh3WbaYokkl3MprmQFWqYCJseVu5PQV91zKDg+SWMp3XtGX66jOpdnltDDMg
	DNuaWPtCph6OypkL4H8sPgT05MdgkPK/cylLjFFtOCb4vMqHRPHcQc4HaPlP69kc
	mOSOrRnZ7W7bW2ZNjGwAiSHMrORoCWRHP/N7/Py5bOsckWO5VA+duDUsUpeq6a3R
	vaNdovK/FtIKjqwVM5pgiWB/FfSoAghIUDAMXiu+iH981JQ+OViMigN7JpXzgC2n
	o5ghBQpNpHZ6IeHyB2FmGJd0Qa60eA8KR8d0Fq7+7pvqyQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Dr4ojz5uoCJp; Tue, 24 Sep 2024 19:36:49 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XCqqf1LcPz6ClY9X;
	Tue, 24 Sep 2024 19:36:45 +0000 (UTC)
Message-ID: <fb02d4c2-bb0b-4d26-8d6c-f76f309679a1@acm.org>
Date: Tue, 24 Sep 2024 12:36:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] ufs: core: add a quirk for MediaTek SDB mode
 aborted
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240923080344.19084-1-peter.wang@mediatek.com>
 <20240923080344.19084-4-peter.wang@mediatek.com>
 <ce42d310-2a23-453f-bd14-71eeaf9f5664@acm.org>
 <e0cb5defb8894ea8fb058c617e9de3d3cfa9763f.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <e0cb5defb8894ea8fb058c617e9de3d3cfa9763f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_123709_626083_0E3D1647 
X-CRM114-Status: UNSURE (   7.38  )
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

On 9/24/24 1:51 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Is there any corner case that I might have overlooked?

Maybe I misunderstood how MediaTek controllers work. Anyway, if a
MediaTek controller reports the completion status OCS_ABORTED, is
there any chance that this status will be reported after
ufshcd_release_scsi_cmd() has been called? Is there any chance that
the controller writing OCS_ABORTED into the status field will race
with the host software overwriting that status field while submitting
a new command?

Thanks,

Bart.


