Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1358CAC59A
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Sep 2025 21:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJnkRVItrHYeZT5j+XOWub8vQDdOE/cSEXzXQKdsjVQ=; b=rVhfSEBn+rVCwtIWA3eKMgelru
	Nqj5tVWpkdGGpDe86ZKgVz7mmcvLXuODwIvkEaZaXMTEko9rP45QbRfEnbyQiI8bZXRGO2lJBvkrB
	0RzwinhnB6FmLKuikhOO8BNCsvrL7cvZyomDC8WFIZk12GHMhlD2HDnjXmJWQtZE7GaXkyz54g690
	G30e5+LnmOgd0babVFhNW7ibjd6rmQzYz2Hg03XhzRphRefeOz14eYIJ77PHZcCtRSDme71mtox0G
	POdJqzHSl4cGi/jD+Q63IJ9UtuloQyEReW73hmy1Z/aCOQeDyQuHjsxf/ksOaRi7JlpL5JrkgXYPx
	avSiTADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziNt-000000043jf-0jnK;
	Fri, 19 Sep 2025 21:11:13 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziNr-000000043i6-0AOY
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Sep 2025 21:11:12 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cT4tQ20Xhzm0ysv;
	Fri, 19 Sep 2025 21:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758316267; x=1760908268; bh=ZJnkRVItrHYeZT5j+XOWub8v
	QDdOE/cSEXzXQKdsjVQ=; b=fSuxF7zU3h9Juow5YX1LA/fUzFegc3iiyjon3CW0
	vQs2JhiD1vS/590D6kWfzKJijEAdkq+i+wjcgLWpPn8XRPhukV+DilGDpuGthlO3
	KvxsuaJ5LKW9pqnyaZtPXH3pK0S0N0DqW4Omlle6BKxc7iIIazN9rfyESrpxLwaF
	PEAbHiI6kv4W2s8YfMjJRRL7jevAVCTrWmS4FVOm5F7gEuSb6XtwP95v+fAoagEA
	zKaE7RY2RD9UEI0uU2g2H5iSj+xW/yCb5vxFcz4uKO5E2hbl4k3Mar3qn2yAfFpf
	j3UTcwmhzIm7PbLUtjm57R/DwCcHS0WN+p1RnJFtFEZhWQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iLi1iDk2A3mY; Fri, 19 Sep 2025 21:11:07 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cT4t540Kczm1748;
	Fri, 19 Sep 2025 21:10:52 +0000 (UTC)
Message-ID: <b9eb48b1-f6fd-4b32-8e0b-b7434f17b0ee@acm.org>
Date: Fri, 19 Sep 2025 14:10:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/10] ufs: host: mediatek: Fix shutdown/suspend race
 condition
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
 <20250918104000.208856-8-peter.wang@mediatek.com>
 <6f4f954d-64fe-461e-9c65-6630b0409710@acm.org>
 <e91b0fc0894eb249b853e149f2f889668c3d2e9f.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <e91b0fc0894eb249b853e149f2f889668c3d2e9f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_141111_143819_68EA1D8F 
X-CRM114-Status: UNSURE (   7.00  )
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

On 9/19/25 1:15 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> By the way, could I know the reason why you want to
> remove ufshcd_is_user_access_allowed?

The name of that function is longer than its implementation.
Hence, code readability will probably improve if calls to that
function are replaced with the body of that function.

Thanks,

Bart.

