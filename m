Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016B8CDD54F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 18:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1hkPjiAcjY9wOAoX0674Dr6Aw0zG2371dqlM9Wwe+E=; b=rpOyRRaxe+vZUYQAWWL6ohF8GL
	ScHZHtmucUA/Abcv4My/FDmqv9DcocCAWHfFRb+PDL3Ja5+5kYwFcUwg3GsyUC3vo9FMTtoFQ8Ro+
	J4yEbIVs36SLhFmTEytKP2JRVr6YlbbeIOo+6/h+MtTuYulYz3R3n9PxgCudVfE1VQvy2gn06Pi6a
	hmeuRLSTjFX2m59eiHlf+wiZFFuIDB+ZFsuZOO2NQ4XpI+up/k1bpvyEFxhv2xorTGdgVZRugI5Sn
	50gTPdMOb/FiUH2zuYHCFYp51j86FiSertBgHCjukvJy3Nv+avjn2nP7BOAHvWMcOPdnzlA7qFIK8
	f2wyI9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqzQe-00000008oWF-3Dlb;
	Wed, 18 Sep 2024 18:29:28 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqzQb-00000008oVP-0tXs
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Sep 2024 18:29:26 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X86cf00qrz6ClY9Q;
	Wed, 18 Sep 2024 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726684150; x=1729276151; bh=n1hkPjiAcjY9wOAoX0674Dr6
	Aw0zG2371dqlM9Wwe+E=; b=FeWKh0CS6b8lxHH+29DNP7yMc57kcF4LyQH/teCz
	3lFD32sH3dU67JWm5a4jQ2AX6TXi3jHwsOMQYFWVF9RW/pUsob+7blK19sVyjg9V
	kE5IOHoqUSDWXFOYH7ryrFHk4RbpremrUf+wOmPrXI3J/FXhc+r0Ccv9/qtHkFO3
	zws2pyLSvO2KookzuCBwKrpJ87OQfGJQcTeBA1mTlx88e02onNXvy9q09PP26DSV
	kO1ifqAGCyTfIVSzAIVZepXfPoz2sRR03doo9HBWlhF6+rUFnE57Klb5BQgwqIJe
	fih/nOUj6tODx+d++nlAQ8mrHTtOWTSFIEvkEphyUSEgFw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id dXTB5ufEFL7m; Wed, 18 Sep 2024 18:29:10 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X86cK4VsMz6ClY9N;
	Wed, 18 Sep 2024 18:29:05 +0000 (UTC)
Message-ID: <78c7fc74-81c2-40e4-b050-1d65dec96d0a@acm.org>
Date: Wed, 18 Sep 2024 11:29:03 -0700
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
 <46d8be04-10db-4de1-8a59-6cd402bcecb1@acm.org>
 <61a1678cad16dcb15f1e215ff1c47476666f0ee8.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <61a1678cad16dcb15f1e215ff1c47476666f0ee8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_112925_301835_14DAF910 
X-CRM114-Status: GOOD (  15.91  )
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

On 9/18/24 6:29 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Basically, this patch currently only needs to handle requeueing
> for the error handler abort.
> The approach for DBR mode and MCQ mode should be consistent.
> If receive an interrupt response (OCS:ABORTED or INVALID_OCS_VALUE),
> then set DID_REQUEUE. If there is no interrupt, it will also set
> SCSI DID_REQUEUE in ufshcd_err_handler through
> ufshcd_complete_requests
> with force_compl =3D true.

Reporting a completion for commands cleared by writing into the legacy
UTRLCLR register is not compliant with any version of the UFSHCI
standard. Reporting a completion for commands cleared by writing into
that register is problematic because it causes ufshcd_release_scsi_cmd()
to be called as follows:

ufshcd_sl_intr()
   ufshcd_transfer_req_compl()
     ufshcd_poll()
       __ufshcd_transfer_req_compl()
         ufshcd_compl_one_cqe()
           cmd->result =3D ...
           ufshcd_release_scsi_cmd()
           scsi_done()

Calling ufshcd_release_scsi_cmd() if a command has been cleared is
problematic because the SCSI core does not expect this. If=20
ufshcd_try_to_abort_task() clears a SCSI command,=20
ufshcd_release_scsi_cmd() must not be called until the SCSI core
decides to release the command. This is why I wrote in a previous mail
that I think that a quirk should be introduced to suppress the
completions generated by clearing a SCSI command.

> The more problematic part is with MCQ mode. To imitate the DBR
> approach, we just need to set DID_REQUEUE upon receiving an interrupt.
> Everything else remains the same. This would make things simpler.
>=20
> Moving forward, if we want to simplify things and we have also
> taken stock of the two or three scenarios where OCS: ABORTED occurs,
> do we even need a flag? Couldn't we just set DID_REQUEUE directly
> for OCS: ABORTED?
> What do you think?

How about making ufshcd_compl_one_cqe() skip entries with status
OCS_ABORTED? That would make ufshcd_compl_one_cqe() behave as the
SCSI core expects, namely not freeing any command resources if a
SCSI command is aborted successfully.

This approach may require further changes to ufshcd_abort_all().
In that function there are separate code paths for legacy and MCQ
mode. This is less than ideal. Would it be possible to combine
these code paths by removing the ufshcd_complete_requests() call
from ufshcd_abort_all() and by handling completions from inside
ufshcd_abort_one()?

Thanks,

Bart.

