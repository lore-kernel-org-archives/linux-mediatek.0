Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1B4C3ABBF
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 May 2025 19:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MevCUtC29kmg79Osqbp+iLHaV5bIefjb1T+Q1ufLpCI=; b=RwjrRxszKF4/mTw571gD7CwvnP
	i6EiswblaDZTBnvGHdhRZDroIlwwxRt2pd6+9DXwtKzaZ4ibk94ULU2w+JdGRh3V+uxIGUo0cfQQy
	nUD69AZMGlRYeXBw4IwyaGZ+/1y3g66m7cdpPnQfGgXt7SyVq7TUxrVarY7U3zXAAva3sMvw7ttEr
	PDl/d1i6El77aajVVVw86xccLnEYPKa2xzuWVUauWMznD+/QJ+fPtZTg448LH0VyZU1mHCHlknDmp
	4tpkiwmkzriXMumm+K/tbg/MIC/TyT1BE6eKxdp0KYnclr59Wmhec5inUG//JaeVc/xjFz4qTSdNj
	yXZFUMFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkQd-0000000GZr2-2lkw;
	Wed, 07 May 2025 19:27:39 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCkQW-0000000GZjl-1oTq
	for linux-mediatek@lists.infradead.org;
	Wed, 07 May 2025 19:27:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4Zt4yv2T13zm0yTm;
	Wed,  7 May 2025 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1746646035; x=1749238036; bh=MevCUtC29kmg79Osqbp+iLHa
	V5bIefjb1T+Q1ufLpCI=; b=pMTCjJd4UP3qHHqV5FR4Dd3wbLC20/Do4ZF3qgu6
	i5Mm+C44DLrlXtwuOiJz1JpwZWRFo6joSytrhNucbIdRj5cuhvoj9DQFWA595Wgi
	6o0Pbg4kv/hMOFWvr0Tlx9vbJ1AEEhO1090Sv/Y/AX76RJnx60EiwMn9QAMHy5Sd
	Q1itCsQmZ1TRBjxblO/upiI93JYb3HPKKh+k11StpAR9rIpVbKaTY2+8L3YCPDTw
	MLqgdb3qsl4IIYo6uzBpj7r+1l/kQFISbxyqTU2F+A8BawNFmn05RQs1wbW5AfhT
	oE9E9E+984O0/GoAfAOJHxfQG2d4yVFSZBfETdpYdCITOQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id JAJxBvassQb1; Wed,  7 May 2025 19:27:15 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4Zt4yT3vTKzm0yTR;
	Wed,  7 May 2025 19:26:55 +0000 (UTC)
Message-ID: <95235015-270d-451e-989c-9fddcbfcb97e@acm.org>
Date: Wed, 7 May 2025 12:26:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: fix hwq_id type and value
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>
Cc: =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?=
 <Lin.Gui@mediatek.com>, =?UTF-8?B?WWktZmFuIFBlbmcgKOW9ree+v+WHoSk=?=
 <Yi-fan.Peng@mediatek.com>, =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?=
 <jiajie.hao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?=
 <Alice.Chao@mediatek.com>, =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?=
 <Ed.Tsai@mediatek.com>, wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>
References: <20250506124038.4071609-1-peter.wang@mediatek.com>
 <04fc1549-0fa6-4956-b522-df5fbc26100c@acm.org>
 <6c9e983154ff8d9b4a1e63eb503e8b147303eb68.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <6c9e983154ff8d9b4a1e63eb503e8b147303eb68.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_122732_558990_F78EB55B 
X-CRM114-Status: GOOD (  16.36  )
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

On 5/6/25 9:03 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Whether it is necessary or not depends on how we define 'necessary.'
> If the criterion is simply to avoid errors, then indeed, this patch
> is not necessary. However, if we are addressing the warning caused
> by incorrect behavior (assigning int to u32), then it is necessary
> to fix it. After all, we shouldn't just be satisfied with avoiding
> errors, we should strive to make the Linux kernel as perfect as
> possible, shouldn't we?

Errors? Which errors? Using -1 instead of UINT_MAX is common in C code.
Assigning variables of signed integer type to unsigned variables is also
widespread. Using %d to format a negative number, although dubious, is
also common in C code. Several years ago gcc warned about using %d to
format unsigned integers. That warning was disabled again because there
is too much existing code that follows this practice.

> Additionally, there are many ways to determine whether MCQ is enabled,
> including reading the host capability or checking hba->mcq_enabled,
> etc.
> Moreover, MCQ is not a feature that trun on and off at runtime.
> It is at the end of the UFS initialization that the status of MCQ
> is determined, so it shouldn't be necessary to rely on this to
> determine whether MCQ is enabled, right?

If you want to proceed with this patch, please make it clear in the
patch description that this patch is a behavior change and not a bug
fix.

Thanks,

Bart.

