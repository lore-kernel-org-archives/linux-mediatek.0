Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6620CEE339
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEjKSaHSNCKm/+HZANouJ5ncq3RxDhZ3EMf1Ca1m3Pw=; b=iQ3TjuyFMZvhv8RGDGJ2Gq7sd2
	2Zpfyx/KLMglDhBooIDEUgHPXVzxEF+3InhqjoGPn/U/OxHK1PhaGCkPukgT+WvlGRIEXthRuioxv
	qnU2SlTkkopVxPwbqGN+r+1M1R9I3W+3Q4Y/sfqtVcEzmuDG9w/655+SKBEI15rNKXNz6okToxQsT
	fA0AuD+sE9da4z9k4BPWSYCrlYPYu0j5BQG3vFdfj84D2TydfjIT4atvjKtY+ahJjCu3uH3SlhQmI
	/9Z3XlAypaiAh1dNz/6ZJDcy+6fw7Jwc8cahIFn/jE/9rqBro2aKpPRSFxGpfP8UXJSL97bCMlZq6
	jIzJ8PTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syb5G-0000000AKXF-1zTT;
	Wed, 09 Oct 2024 18:06:50 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syb5E-0000000AKWa-1NuT
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 18:06:49 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XP16v67D2zlgTWK;
	Wed,  9 Oct 2024 18:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1728497205; x=1731089206; bh=QEjKSaHSNCKm/+HZANouJ5nc
	q3RxDhZ3EMf1Ca1m3Pw=; b=pTZRbc/qt82EvjhujBbidisx3hEVdfHJaFtXSFcO
	SatxTU64GofelH1IbmuSWaaDYIjBEU1PKM8+TqC9HNbePDHEJYn2bFaxgIgDcZ8m
	Py1cmPnnBn1+h/zkz+o8ktuBrnaPziDEeATaupN+d45I4azcEDSEhEAyig7cNcl9
	MCSjht68MpDFeGFPd0Dwxp7LArOm0R/eE4dFPW+tqxBrRuqYhJwKaqa5lDKXwEwQ
	I0UX/TxZnAVOM9sg4nLMd1A1FP99uii/a5jQMnFzYWM1wG68NszKUnXxttOm0Aa8
	em/cZ1i9t1wjLy59adbP6b4iqILp43vy8zSxcvUIhulACA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xT4ZtiAud590; Wed,  9 Oct 2024 18:06:45 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XP16r3GSqzlgTWG;
	Wed,  9 Oct 2024 18:06:44 +0000 (UTC)
Message-ID: <11c15e60-4d4c-46c3-b3e0-e1c4497378a2@acm.org>
Date: Wed, 9 Oct 2024 11:06:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] ufs: core: requeue aborted request
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20241001091917.6917-1-peter.wang@mediatek.com>
 <20241001091917.6917-3-peter.wang@mediatek.com>
 <6aba27a2-d59b-4226-806b-4442cc26c419@acm.org>
 <69a77b95da27fa53104ee74ecae4e7da2d1547cf.camel@mediatek.com>
 <e6e93ff1-cba1-45a9-b4b6-7dcbd7fca862@acm.org>
 <8c463196860b71f26bddad0e7e8be6aacd470109.camel@mediatek.com>
 <a02c83eb-d057-48cc-9735-770928a2a0a1@acm.org>
 <bb9280de1a6dde857f0f3fe8c784bd71653a5ec4.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <bb9280de1a6dde857f0f3fe8c784bd71653a5ec4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_110648_409913_DE5D9435 
X-CRM114-Status: GOOD (  10.85  )
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


On 10/8/24 7:17 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Yes, this patch is only for MCQ mode, because only MCQ mode
> receives OCS: ABORTED, right? This patch doesn't modify
> any of the Legacy mode flows, does it?

Agreed. What I mentioned in my email is an existing bug in the legacy
flow for ufshcd_abort_all().

> Furthermore, even if there is an issue with Legacy mode, it
> should be addressed by a separate patch, not by this one, which is
> intended to resolve the MCQ mode issue. We shouldn't mix two
> different issues together, don't you agree?

Let's proceed with this patch series and let's address what I brought
up in my email separately.

With the current approach for error handling in the UFS driver, anyone
who wants to verify or modify ufshcd_try_to_abort_task() has to consider
all possible interleavings of ufshcd_try_to_abort_task() and the
completion path (ufshcd_compl_one_cqe()). That's an unnecessary burden
on UFS driver contributors. Additionally, this is error-prone. This
applies to both modes (legacy and MCQ). I know of reports of sporadic
crashes in legacy mode related to UFS error handling. I'm wondering
whether these are perhaps the result of the issue I mentioned in a
previous email. Anyway, I will look further into this myself as soon as
I have the time.

Thanks,

Bart.

