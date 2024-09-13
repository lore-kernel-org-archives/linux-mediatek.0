Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF54EEEC17
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqyDQIoqZjQ2fEbsTKhOiFFnqZZY5hTOfZg9GgG1tyQ=; b=gVTcQPJIOIg2AHz7pvNehxiZF9
	bJcnPKu744QaWqxR3XvDEF8MQzSa7L9ESVVdPzuQwy4Hbut0Nd94gdWxVkn2HbYRW5+gud8Vn57tb
	baZvXCsBswbElyECinYYdNCTnzBSdrs7yT5vD6ak+RUSh5teTn//kumuKUkVK3lVtpB6w0Vs7hF4X
	Z8tUS6oFoC5SpodbF1eulJIkonZrKHmYzF6LfjuHBy9qNuDejXCTPimv544vdNKOxNx8B9JD24YdP
	MNhDQ0DpBlvCA5UbTg9VseoVUKqE3kwfWiWyWDxEIvWz4egf2Q0oZtLNP6dJ25kUYWW/w0LtsZFd4
	fIa5cJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spAIj-0000000GhKi-0vwR;
	Fri, 13 Sep 2024 17:41:45 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spAIf-0000000GhKK-3kHS
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 17:41:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X51nx1CHfz6ClY9v;
	Fri, 13 Sep 2024 17:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726249292; x=1728841293; bh=xqyDQIoqZjQ2fEbsTKhOiFFn
	qZZY5hTOfZg9GgG1tyQ=; b=AatjiUj2NlM3NO69WMmWLryosaRyL6sPhQIFWG6n
	RMFdM6KJA2CbWS0o3qda86OPVmNHcFWrW7fd8iLaB1WoiDOIgTWnSWT1GlkLW36e
	YcRNonztC87ZocwB8RFYXUE+xwhViBd+nOlVFGK9Or2nKC6sNggVSqhzgdjzWFnn
	2SSABOPCCOVFYLl1P+WMrQl/jChUAHk2iZy9U4ajc02Jte6dTsdcWUo7+mJ0Mrdy
	NDIrXqpuEN5ShhHB/VVRa0OXszpdmiQ5PXaAUkOYrU61cIXV7Dw3YGE2KvzezpA/
	dKbdQ1IkDjog0PaQjJ2Q1VG/QU7yrbRW/pYa3bK/s612dw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lhkbSclY8FRY; Fri, 13 Sep 2024 17:41:32 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X51nh3RLbz6ClY9t;
	Fri, 13 Sep 2024 17:41:28 +0000 (UTC)
Message-ID: <46d8be04-10db-4de1-8a59-6cd402bcecb1@acm.org>
Date: Fri, 13 Sep 2024 10:41:27 -0700
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
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
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
 <858c4b6b-fcbc-4d51-8641-051aeda387c5@acm.org>
 <524e9da9196cc0acf497ff87eba3a8043b780332.camel@mediatek.com>
 <6203d7c9-b33c-4bf1-aca3-5fc8ba5636b9@acm.org>
 <6fc025d7ffb9d702a117381fb5da318b40a24246.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <6fc025d7ffb9d702a117381fb5da318b40a24246.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_104141_987357_C29B783C 
X-CRM114-Status: GOOD (  11.60  )
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

On 9/13/24 12:10 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Because the MediaTek UFS controller uses UTRLCLR to clear
> commands and fills OCS with ABORTED.
>=20
> Regarding the specification of UTRCS:
> This bit is set to '1' by the host controller upon one of the
> following:
> 	Overall command Status (OCS) of the completed command is not
> 	equal to 'SUCCESS' even if its UTRD Interrupt bit set to '0'
>=20
> So, MediaTek host controller will send interrupt in this case.

Hi Peter,

Thank you for having shared this information. Please consider
introducing a quirk for ignoring completions triggered by clearing
a command, e.g. as follows (there may be better approaches):
* In ufshcd_clear_cmd(), before a command is cleared, initialize
   the completion that will be used for waiting for the completion
   interrupt. After a command has been cleared, call
   wait_for_completion_timeout().
* In ufshcd_compl_one_cqe(), check whether the completion is the
   result of a command being cleared. If so, call complete() instead
   of executing the regular completion code.

Thanks,

Bart.

