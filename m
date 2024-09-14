Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F734C021A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Sep 2024 16:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIr2YQ+Z3fnuhX48pp6i/fQEJqiBrCDPJT+nV4erRtE=; b=EWrI7I2+YkDY5daJ0mjTE2p3g+
	pNKMeppRwArzmT/tA02S0jIcvXPlB7u9SuWlWl5G8Jk5sG8/LQFndjOCnSUFA+XBR25mZagXqy3YK
	PjkOY0XiTWWpkO8vk66tDQNz4APZOrPiTSv0JdPZvjKcsGCEZUPh23JZD0ED0HGS3bviMqVhoreQW
	O/tEWu3f6NYIGWTjk8lUCFNbIVt/RuHN/bsixs/6HNAWm256zNRyjZ0simM1Pdg/3aPOHglzrV2SZ
	IqT+sePZG6cLyiPE9km+ZYU6UCFsQBZEhmXxEAZVRnrStgByAmToV83WjPp8tVV1pw4kmh4528spD
	Ked4H4UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spVPQ-00000000vIf-06Ev;
	Sat, 14 Sep 2024 16:14:04 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spVPN-00000000vIG-2I9U
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Sep 2024 16:14:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X5bpH2VfWz6ClSq5;
	Sat, 14 Sep 2024 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726330432; x=1728922433; bh=jIr2YQ+Z3fnuhX48pp6i/fQE
	JqiBrCDPJT+nV4erRtE=; b=UQR5Ec7W0uh9BO6WmwwVbx1oD6MEFeyWqVJ7FE4m
	UkZV/K/isyv3jZFd5o5lWP+jrpC/RtUnlVF9PfMp6ZhvnFyTSbIvOSZZwqSBErij
	xGlD1IeWLHpu37cGvZmTZCtOMRTEQB9ycd0BwHEPoNOe7moQIpVE5xErge7CLUZ6
	qU2D97W8hcPPEezA6Yb/aWmcxI+02GcFWDjFqYlv/OMNAQeQAvwW4rKDDOcOzeBU
	TkbrMJgZUARrArBGyByLS8SyI45dd1MiUQPG8Qq8XcNf0RtChC5/Ut6Ab1Z7k8UI
	tEhLO2fJHAiRlJeUnNUdja9gnW7NiYFoo6cK2snTRqqIXg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 4NfNGd6eRWrA; Sat, 14 Sep 2024 16:13:52 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X5bp443s3z6CmM5x;
	Sat, 14 Sep 2024 16:13:48 +0000 (UTC)
Message-ID: <9ed20622-c228-499f-80d9-23760e79af1c@acm.org>
Date: Sat, 14 Sep 2024 09:13:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] ufs: core: requeue aborted request
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240910073035.25974-1-peter.wang@mediatek.com>
 <20240910073035.25974-3-peter.wang@mediatek.com>
 <e42abf07-ba6b-4301-8717-8d5b01d56640@acm.org>
 <04e392c00986ac798e881dcd347ff5045cf61708.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <04e392c00986ac798e881dcd347ff5045cf61708.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240914_091401_629887_A034E040 
X-CRM114-Status: UNSURE (   7.08  )
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

On 9/10/24 11:03 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> This statement is not quite accurate becasue in UFSHIC2.1, SDB mode
> specification already have OCS: ABORTED (0x6) define.

I think I found why that status code is defined in the UFSHCI 2.1
standard. From the UFS 2.0 standard: "TASK ABORTED - This status shall
be returned when a command is aborted by a command or task management
function on another I_T nexus and the Control mode page TAS bit is set
to one. Since in UFS there is only one I_T nexus and TAS bit is zero
TASK ABORTED status codes will never occur."

Bart.


