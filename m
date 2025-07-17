Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A9C83F38
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81N1PUV291vvj+MO7dmGD1k0lnguDaB3fIl3SdntRhU=; b=0nNTAJ/Vt/P2Tt6HvfRs4envJ3
	ngIr9st3A8txQQPwmQIZ9zqRRhR9O9kxvSucoT3AmBJ8P8IdnPBXjAtAPFGSgfPS8ezVxXhKdboio
	fMdDzDjzlhMpNNwxDcTH+iTj3ktfqHWuHn83V/1mRFEMCo9V4uclAL3YO2Yi5rBWB/JgfA/bfmPTb
	RIPb2phKF0/OfZU+Mm6S9HXTmCWptoMxAD8XvEy5OvEN2B0MmPAby6qT/x/AKFAYXvCPgec/DTnLZ
	AbPN58yR8cKOnjFQq+/oXKUGVojPuoKPy841Q7OJhFFCoNeCWA0dQrzb1GkeD8tg8X10xtcGSwTug
	4e3dpxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRCs-0000000AbTf-3CFe;
	Thu, 17 Jul 2025 16:11:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQeo-0000000AWHF-3Wp2
	for linux-mediatek@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=81N1PUV291vvj+MO7dmGD1k0lnguDaB3fIl3SdntRhU=; b=jDonqw0pjLs406vxeTej7v1r4e
	cERgiLmIxDRSkFa7o+kKx+0q2kqhxWQwM96ZRY2JxBU/5oBiJdj5nK+22pqu73mGiZ7wHwTlRcQm2
	y+vvx2mARsG7z/qkaCBfK34umNsqlR6Zwsej+w6BfuWWKNnrC6QWdShJ8wRqJ7JvvtWcrvbbze9hi
	RhMtdVPHnJ7TRK+OkW8DH9FOvOVtGfsh7fGqIKBTZAM6S8BtNiigYHAuFGvN7G5BLoEyoDnNhcjNr
	2w8acSPVSTVmMWjBtddC1GDrl2BX/vwHDpn/DDUX2+IZFmI4g1C3MwrxhvDNCedl/UFoL8pXGpgyn
	oSSAMt6A==;
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQel-0000000AJ6w-2kRq
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Jul 2025 15:36:25 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4bjcTN6rZDzm174b;
	Thu, 17 Jul 2025 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1752766565; x=1755358566; bh=81N1PUV291vvj+MO7dmGD1k0
	lnguDaB3fIl3SdntRhU=; b=Es9hyuBk4aPHyw/qMCw4yweSzmKucgk0jvZzl0sC
	mgwoVJ0sPlALlvOmWiDA4UPsLU+M9lcUFN9z7f0ubRGDEEo25ud8NbZs0brmTVr4
	2eF6TNRX/kt1sEKu1/iC3gnzjuS8OzCbFXeTNTJEF8CWO9aK3xTKzSM4Gsg0hrkf
	9RDo7RdMHLUYMMFlLdDNt5D+PXeJqgO2M7NTf4A5yTipHKdOpb8Xr2QS58td+zwj
	8CdaxBEypd/CCsGjyeVicj1gE7uUEL+8piQE3fBwMd2GdciwdlFPoHLVviagGdSh
	sA6Zn/Bqes2J4SA7VYro93VkYm1tQP+2nPe0TU3YIfvy9A==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0ocfl1ONZf6O; Thu, 17 Jul 2025 15:36:05 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4bjcT32V6Mzm1744;
	Thu, 17 Jul 2025 15:35:50 +0000 (UTC)
Message-ID: <3a0d5a4f-f689-44e8-9f01-f6eb8187805c@acm.org>
Date: Thu, 17 Jul 2025 08:35:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/10] ufs: host: mediatek: Change return type to bool
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
References: <20250716062830.3712487-1-peter.wang@mediatek.com>
 <20250716062830.3712487-2-peter.wang@mediatek.com>
 <f3679ca4-9c77-43cb-a0eb-a4915f0f2c3d@acm.org>
 <c82877e4d1c1f8f7bb39d0ad7dccd4cbec0c91bd.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <c82877e4d1c1f8f7bb39d0ad7dccd4cbec0c91bd.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_163623_902504_58856345 
X-CRM114-Status: UNSURE (   4.35  )
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

On 7/16/25 11:37 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Or do you suggest removing all the previous usages instead?

That would be appreciated!

Thanks,

Bart.

