Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357F2CAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 19:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KozXruKm7lFqaqzgkvNBpdg0ovKEsne8HGqAmEpHiE=; b=HOVCijg4uO7YSSxhwusmoAYTm6
	cbFBKRCg/4Padt3qM7St9dnw262U/Jn8k2EHm7zQCfZQyPf6ZQg+ACEg68Eif61Y/zQb9X34JP8Gb
	PyDXqdnqRHiCQ8hImbdAsypmA7dEnBGEsz8h5fdwvGNspmuJkMscvyYXsiWnOJ2HwMKaPOby09fRC
	yNq0b5hlToQRCXAbooVeGB4Pe0PHe9whGT+1dPI5AghyW3u7Bw/tsJkuOm9TQgs2TMHIjVGSJIm7E
	ia4gZDzTWGGUdNGqw7euc++aEQN882nxRb5lQnjuVIzmLeBDF/WFIFxMxDe+/T7pePjRSZYUCDksu
	CZip0c1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mBy-0000000BLT6-0aV7;
	Mon, 22 Sep 2025 19:27:18 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0mBu-0000000BLSS-2x31
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 19:27:16 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cVtR444lszlgqVk;
	Mon, 22 Sep 2025 19:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758569229; x=1761161230; bh=3KozXruKm7lFqaqzgkvNBpdg
	0ovKEsne8HGqAmEpHiE=; b=jJZ6NM1FVliKCUvGf9CDHYwI77y0hhKgMUXVuxiX
	s78bFRIMvXS01r3z/leQ3Tx7rNbJdSjxSyHoOtLMKC66Zlq5i5fcEeeGhzoBcUHA
	pKNU/Ro89AmSP2QPVAOjbjqmI61G7eOejg5n4/Qq4aWKVhbd06VbF218PIpEEi7Y
	8uQqUYhBNS5eHwEpwdjQtskWQQ02P8G7HM/zbOqkUlMIeZgNtxzSGt9yJaxI7B6r
	sL8rIbcb/eqK9qIFF+Yzd57sTeEmSiPIODZAV97XX+jp/pYpVwRS7rUDkDdaO1Fh
	D8i9Nm5YUczFhI7m3tD8IA1J7+qOGtek0J45GtP+igqK+g==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ytCXrncB2Man; Mon, 22 Sep 2025 19:27:09 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cVtQp3gJjzlgqTp;
	Mon, 22 Sep 2025 19:26:57 +0000 (UTC)
Message-ID: <f60146c1-e0bf-40dd-adb1-95fe8884c550@acm.org>
Date: Mon, 22 Sep 2025 12:26:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/10] ufs: host: mediatek: Enable interrupts for MCQ
 mode
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
 <20250918104000.208856-7-peter.wang@mediatek.com>
 <5ae6134f-6e41-4453-b11f-4e3eb92a1c04@acm.org>
 <beda693842394d162c95d5523eb90373fd975d3c.camel@mediatek.com>
 <3d2a98e0-03d3-4b7b-816c-581d77551598@acm.org>
 <9b09e799df468f2fe33bd9acab6d2487d0539e7e.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <9b09e799df468f2fe33bd9acab6d2487d0539e7e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_122714_908471_70424024 
X-CRM114-Status: UNSURE (   9.64  )
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

On 9/22/25 1:41 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> So, maybe re-enabling MCQ IRQs the same way as legacy IRQs
> in ufshcd_make_hba_operational would be better.
> What do you think? like below patch
>=20
> @@ -355,9 +355,15 @@ EXPORT_SYMBOL_GPL(ufshcd_mcq_poll_cqe_lock);
>   void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
>   {
>          struct ufs_hw_queue *hwq;
> +       u32 intrs;
>          u16 qsize;
>          int i;
>=20
> +       intrs =3D UFSHCD_ENABLE_MCQ_INTRS;
> +       if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_INTR)
> +               intrs &=3D ~MCQ_CQ_EVENT_STATUS;
> +       ufshcd_enable_intr(hba, intrs);
> +
>          for (i =3D 0; i < hba->nr_hw_queues; i++) {

Thanks, this looks better to me.

If an ufshcd_enable_intr() call is added in=20
ufshcd_mcq_make_queues_operational(), shouldn't the ufshcd_enable_intr()
call be removed from ufshcd_config_mcq()?

Thanks,

Bart.

