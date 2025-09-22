Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C04CA100F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 19:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MdfpopTAiplTc+bMW6TYSnnTjInQckH9Ox5vVYd/k8=; b=ROn7mjzOvtg5HW56bMlAOjJiG5
	M5WeRtIXpjlLOvVkEFbCJX5j4OrSdRk+kgfCnNw9nBwVtew2sEJA6gzsN112FaiexfB48R2RgG88b
	ggaCwdEUu7lNSZKOIvY05xrNydgFblsSQe3O/x4PzduS5Z0WZWB02i59jW7f+fCjjV/Dv+0ON9KwZ
	5heYoidojTn28V9/JOklf97JhlrcfVOXJAjl8dZZjiPZzppTvPwR2E0lT3B+gDqJXKxYcAKFggQdc
	6znt5CUzi5eoa7GCVAdx4/xcnrhkFNdpn52DDA1/8njHYOLDdh5WlpqjFY1sMOF/ySNEMW+7v/j1E
	0GMOmW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0m6Y-0000000BLBe-1XEz;
	Mon, 22 Sep 2025 19:21:42 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0m6W-0000000BLBH-03Hp
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 19:21:41 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cVtJf0ddJzm0yVL;
	Mon, 22 Sep 2025 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758568894; x=1761160895; bh=9MdfpopTAiplTc+bMW6TYSnn
	TjInQckH9Ox5vVYd/k8=; b=vrVe8D1n5EBOmmrKhgs+sh1C0ptutGBA76WTEImn
	E2ZIDIxQuQ9n1bkzXK1nJGX1ylbPmU0FsKYn1mRtLjdvjKE4Wcs12JD800mmm7uz
	AhEM9fmnC5W+s5Z6NNNg1pkOjKd/tTjno01PcoS4G4APA9u3yijS1wESMpljD1Nz
	SCvW2wxrC0qc/m75jXevIiD6jkDX2k5+YGYXU59grBR2j00nj7spZVpN8qc/ioTJ
	5MPH51dIoa3Cto/lkCtHZOftxnfmSEXzhhNLvwIDyFhPtqRfm63CEX2tiQnrdNd1
	HcsW7eDY0hUNRMr0B1/H6GR9QkWBuRaz4//ZX+3K/9hjQA==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id HIPEVabmwtRe; Mon, 22 Sep 2025 19:21:34 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cVtJL6RqBzm0yVD;
	Mon, 22 Sep 2025 19:21:22 +0000 (UTC)
Message-ID: <1be6c436-203e-4d6b-b457-290922d15687@acm.org>
Date: Mon, 22 Sep 2025 12:21:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/10] ufs: host: mediatek: Correct clock scaling with
 PM QoS flow
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
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
 =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>
References: <20250918104000.208856-1-peter.wang@mediatek.com>
 <20250918104000.208856-3-peter.wang@mediatek.com>
 <02338932-b3e9-458a-ac24-41b4f29eb514@acm.org>
 <21a451c752709cd9c1a3e18568c18f384bb77a05.camel@mediatek.com>
 <ba381e9a-4cb5-45df-9fe0-3d370a84429d@acm.org>
 <c5ffcc850a222b23d1b0ba93c9f28521ff2fedf3.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c5ffcc850a222b23d1b0ba93c9f28521ff2fedf3.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_122140_212401_956755C5 
X-CRM114-Status: GOOD (  10.17  )
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

On 9/22/25 1:39 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> However, after resume, pm_qos is not re-acquired if it was released
> during the previous suspend. Therefore, if we set the gear to a high
> value for performance, this could be impacted. But in the UFS core,
> the gear should be set to low during suspend, so there is no need to
> re-acquire pm_qos after resume.

Hi Peter,

Thanks for the clarification, this is appreciated.

However, the following is not yet clear to me:
(1) Why this change is necessary.
(2) Why this change has been implemented in the MediaTek driver instead
     of the UFS core.

Thanks,

Bart.


