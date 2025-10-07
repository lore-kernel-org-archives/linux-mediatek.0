Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06380CCA476
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Oct 2025 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQNyooeb8PCAg5e+0bbJFfEQJXv6CAdR0t4TfXT0YTs=; b=fehwAHER4GJ9KAAMBJmJwNBwru
	0/HN25DNkNWfvPqwyYIeHVuE7sJRBLlDY4e3YUlKuIa04j5GX7uOikFrDWPrZPlaxoRiZkREI4AVi
	LR27KoLSQGVjxnTUx6mYQlCFu8vWYp+2Sw2azhqysZNPXiUlzVwHPhRxW4fbn6eXpS8a2G2azB198
	wUWYe7YF64xWzZYF5LtWAdZ9g8oY+o5EYQLEXV4e9WKp2E/b/cOybmyPJQ+Ixn84HRpjdbnwKvT0G
	mWr+xShUgXlpvyfwADyXPKrBQWGAzXPjgildLsttpxmcIqMBzChMvUff3RiudmOAxF2c2Fg24iaQa
	6RDpgMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AW2-00000002OvA-2vzz;
	Tue, 07 Oct 2025 16:26:18 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6AW0-00000002Ote-1Wsw
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Oct 2025 16:26:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4ch1jK5L70zlgqV5;
	Tue,  7 Oct 2025 16:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1759854369; x=1762446370; bh=YQNyooeb8PCAg5e+0bbJFfEQ
	JXv6CAdR0t4TfXT0YTs=; b=bn+mu7tiaZ1zRY5af1MxZ/Fo56aVTyLPr3rbyzG5
	8gXSGp3e4QdbjH/WGU2ZJQ3Ihye1H1L7aNmyNMoOY6o3vLz9na/08fOS1M40WWEd
	LeQHrFsNBXr855mX5EYoJnVW5CKIh01W5GLUsY4y6K5U5DB2W7ebM8msSOWHP2Hx
	ZRWtrg2hDETOfPb6r4+nmTLgTkZkFG/B4iOfXcOiOQCTXr7+y3Ujh1vu46/8VhmK
	x1cIRfirsK9M4oyetHAeyfeDT1MFeCbZikrOesRDCFJbnSDX4LGhxK5yf4HW1dAr
	51tleB+7tOyXd/vR/7XNAW1X8g/AnoGHVfnWVma6WtTG2A==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CachnIUdpLdd; Tue,  7 Oct 2025 16:26:09 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4ch1hy08rLzlgqV6;
	Tue,  7 Oct 2025 16:25:52 +0000 (UTC)
Message-ID: <68b362fb-b07d-463a-98bc-b0061524b0f1@acm.org>
Date: Tue, 7 Oct 2025 09:25:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ufs: core: Fix error handler host_sem issue
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>
Cc: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
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
References: <20251003101115.3642410-1-peter.wang@mediatek.com>
 <3e673104-d36a-4128-bb5c-a71093eda419@acm.org>
 <c5c8293b093a7d8f03fc8b25059b5566214a8c06.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c5c8293b093a7d8f03fc8b25059b5566214a8c06.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_092616_480795_4A4B7148 
X-CRM114-Status: UNSURE (   8.88  )
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

On 10/7/25 12:01 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> No, if we take host_sem before checking pm_op_in_progress,
> it may cause a deadlock. Consider this case:
>=20
> ufshcd_wl_suspend
> =E2=80=83down(&hba->host_sem);
> =E2=80=83__ufshcd_wl_suspend =3D> may trigger ufshcd_err_handler
> =E2=80=83=E2=80=83ufshcd_execute_start_stop =3D> stuck here waiting for
> ufshcd_err_handler to finish
>=20
> ufshcd_err_handler
> =E2=80=83down(&hba->host_sem); =3D> stuck here

Hi Peter,

Please add a comment above the new ufshcd_rpm_get_noresume() call that
explains the above. I think it would be good to have the above
information in the UFS host controller driver source code.

Thanks,

Bart.

