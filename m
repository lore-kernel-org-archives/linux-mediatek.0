Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5C5CA100F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 18:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynGvtr8Hk8lqE6fM2W7drPwjY+TAz4tWP7iL0AILI9U=; b=kdiQhy+jE33uhyIgdtQts9si4r
	NvHn9Y2pfyJDIFZCkfjsad9SypAd5guw/ut+IBz2Sxzt1AdmpDgKlJSCXC/MA2jm1RyOGrDmXTzlN
	KqiwPvIS6e1XcDHuK+kV/x4m9HVoIr0NBL+JKFm1V//KPDwboVa5foNZTXsCw/yu0r5sZMwMua3s2
	jISwNPz/ae32BtbsP/87xRJE6caUULdrB+Knc9QS/wgMztSb4ADAbmWiS4xTgdMXNuZqi/9MeOJmk
	zMqXTni4XLX6xFLtj5ve6F9KSdU4qqVjpYjncUE6PNZ1hiGvrlOifhz/QcIiqB+M6Oz+MLhU96Hcj
	emnw/CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lGy-0000000BFMX-3lhF;
	Mon, 22 Sep 2025 18:28:24 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0lGv-0000000BFLE-2H7u
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 18:28:22 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cVs704Y4dzm0yTG;
	Mon, 22 Sep 2025 18:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1758565689; x=1761157690; bh=ynGvtr8Hk8lqE6fM2W7drPwj
	Y+TAz4tWP7iL0AILI9U=; b=l2Mls1D8BqIqyJXVAkQqU2QfuYfBVL0osXDfZPxf
	k+5+1/X6tYeWgpkX3BL9i+ErV8HJMy5L94rVwUFqAMBZhfD8XtpguLCnS2ToH6le
	gVoAq702PMeThTvLT6DaxF2Y+N9meoTf7aXuR4STvS+Yk+KL7+DW2+yz+AkBAKQz
	e+e/QZhNUNZJCfXbfJYKyq7Pf0C9nPop2nyJF1poe1QJ41s4SBc6OlyWDPIDo/R/
	6pcoqBvRWQHfK+/Nb1KEHQ1fU27tUnCJ1rgy/lMieMmEzQlp1u4jvA7seiu/KAdz
	LTRbVUGZSHbfw8bOiS3zyPA4H1ntMBEe7RVvOelc7wa/4A==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 5KrV1a4zT8tf; Mon, 22 Sep 2025 18:28:09 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cVs6j5G9fzm0ySG;
	Mon, 22 Sep 2025 18:27:56 +0000 (UTC)
Message-ID: <59dd8d29-48e8-4f45-b9f8-2f67b3f316b5@acm.org>
Date: Mon, 22 Sep 2025 11:27:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] ufs: host: mediatek: Fix runtime suspend error
 deadlock
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
 <20250918104000.208856-2-peter.wang@mediatek.com>
 <80a31144-852f-4df5-802e-a8c5d04a298a@acm.org>
 <bdb6ee1402ae4c9ba8919011b1d8fcb9d984129f.camel@mediatek.com>
 <bc612c10-a4eb-41ab-b8e5-726d22935518@acm.org>
 <4f8d4f0c9efd24aa4448e6dda064b0633d253f2d.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <4f8d4f0c9efd24aa4448e6dda064b0633d253f2d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_112821_732458_44580B55 
X-CRM114-Status: GOOD (  14.79  )
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


On 9/22/25 1:37 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Okay, you prefer to check pm_op_in_progress before getting
> runtime PM, like below patch?
> If yes, I will remove this patch and check this in ufs core.
>=20
> @@ -6625,6 +6625,11 @@ static void ufshcd_err_handler(struct
> work_struct *work)
>          }
>          spin_unlock_irqrestore(hba->host->host_lock, flags);
>=20
> +       if (hba->pm_op_in_progress) {
> +               ufshcd_link_recovery(hba);
> +               return;
> +       }
> +
>          ufshcd_err_handling_prepare(hba);

Yes, the above change is what I prefer. Please note that I haven't
tested this change myself.
>>>> The UFSHCD_EH_IN_PROGRESS definition and also the
>>>> ufshcd_set_eh_in_progress() and ufshcd_clear_eh_in_progress()
>>>> definitions must remain in the UFS core private code. Please do
>>>> not
>>>> move
>>>> these definitions into the include/ufs/ufshcd.h header file.
>>>
>>> Do you think we should check ufshcd_eh_in_progress in
>>> __ufshcd_wl_suspend? I'm not sure, because we don't see this
>>> error on all UFS hosts =E2=80=94 the vendor suspend operations
>>> (ufshcd_vops_suspend) could be different.
>>
>> Why is auto-hibernation disabled during suspend? As far as I know the
>> UFSHCI standard allows to keep auto-hibernation enabled during
>> suspend.
>=20
> This is a limitation of MediaTek=E2=80=99s SoC.
> If auto-hibernate is triggered concurrently with manual
> hibernate, it may cause errors. Therefore, we disable
> auto-hibernate before issuing a manual hibernate command.

How about adding a comment that explains this?

Thanks,

Bart.

