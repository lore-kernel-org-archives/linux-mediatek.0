Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A4BEEE266
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTOsC91kloUZyZyFxUUv7fuFod8x7DnECYaKtYuXhk4=; b=JiYLtruZvNUv9IqnXTcMAmdSt9
	IIOc5pPENBOuGSb7p6dQ5Ag2myMRqHUxrHyIdPwJubhpmCsy+4mekXDpSdnJhxu6/RV/4h14Rk8C+
	UnANTKuG4zIZnbgiLp+Q7i+Im8jykVAyzbDv0nsBkobw7u6XG5Qhx+g4dpODSjsy1CPQ2E0uOPlX4
	S+HaS9PdhTWb7IatuhI2monMGTgMMNBv6dUVxXLmGmwpvpBBS9jFCm1mNlvLRRNTRhUVzCcOhfpeo
	fNv8TSqmJM76hxRequjgA3wF38p5KikKvltjHiBlniFetGGSOwx9ncOWBiDwiGhEuoo5vdhpzLl3E
	bjxb2GRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sor6i-0000000EGGf-2DyX;
	Thu, 12 Sep 2024 21:12:04 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sor6f-0000000EGGE-2XeI
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 21:12:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4VW51T8rzlgMVW;
	Thu, 12 Sep 2024 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726175512; x=1728767513; bh=GTOsC91kloUZyZyFxUUv7fuF
	od8x7DnECYaKtYuXhk4=; b=mK4oX0p/RdYS+DRyXfiZRpOOVJ8VS36r+DKp7W1M
	XtFqAJI3VyDmjjHh/byUaYVhYwbr/0ezHMfUR/2dcQvAELxfn9BcCiqn+kzzNFoP
	vozQiXvNDc7Iko+5E0ADHXdfzX1uK3Sh1H9RUIjycUOK3zWzv8lP+TbkkjAqWPUo
	lYCd3yDGzsBFRQdduh1G+8usahdfxW5pDAOnevPTiEVDidTUCPLygtU7wacSL+ut
	B7Du1Nqy2HnKLGAyVfZqwmFEkp72S/iqjadOjCeRx+1spzoXP+jj6CCXaHlXjMi6
	v8M+AuuxfDh5p5RtABx/4LfqH3wZ/LtOAk1vSCP7K++/IA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iOblTJxy53mX; Thu, 12 Sep 2024 21:11:52 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4VVq6LBTzlgMVN;
	Thu, 12 Sep 2024 21:11:47 +0000 (UTC)
Message-ID: <cad4804b-2102-4c95-9387-a63ff847cf21@acm.org>
Date: Thu, 12 Sep 2024 14:11:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] ufs: core: requeue aborted request
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
 =?UTF-8?B?RWQgVHNhaSAo6JSh5a6X6LuSKQ==?= <Ed.Tsai@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240911095622.19225-1-peter.wang@mediatek.com>
 <20240911095622.19225-3-peter.wang@mediatek.com>
 <55d2cca5-0e30-4734-aa25-d5f5cdfbfd93@acm.org>
 <d3306f9d2b88c5b6ae8d2104041e5c941898dee5.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <d3306f9d2b88c5b6ae8d2104041e5c941898dee5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_141201_684260_B637561C 
X-CRM114-Status: GOOD (  20.29  )
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

On 9/12/24 6:49 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Wed, 2024-09-11 at 12:37 -0700, Bart Van Assche wrote:
[ ... ]
> So at this time, the device will not have a corresponding
> response coming back. The host controller will automatically
> fill in the response for the corresponding command based on
> the results of SQ cleanup (MCQ) or UTRLCLR (DBR, mediatek),
> with the COS content being ABORTED by interrupt.

I don't think so. In SDB mode, writing into the UTRLCLR register does
NOT cause the ABORTED status to be written into the OCS field. Even if
there would be UFSHCI controllers that do this, the UFSHCI specification
does not require this behavior and hence the UFS driver should not
assume this behavior.

>> The above change will cause lrbp->abort_initiated_by_eh to be set not
>> only if the UFS error handler decides to abort a command but also if
>> the
>> SCSI core decides to abort a command. I think this is wrong.
>=20
> Sorry, I might have missed something, but I didn't see
> scsi abort (ufshcd_abort) calling ufshcd_set_eh_in_progress.
> So, during a SCSI abort, ufshcd_eh_in_progress(hba)
> should return false and not set this flag, right?

I think you are right so please ignore my comment above.

> Additionally, SCSI abort (ufshcd_abort) will have different
> return values for MCQ mode and DBR mode when the device
> does not respond with a response.
> MCQ mode will receivce OCS_ABORTED (nullify)
> 	case OCS_ABORTED:
> 		result |=3D DID_ABORT << 16;
> 		break;

No. ufshcd_abort() submits an abort TMF and the OCS status is not
modified if the abort TMF succeeds.

> But DBR mode, OCS won't change, it is 0x0F
> 	case OCS_INVALID_COMMAND_STATUS:
> 		result |=3D DID_REQUEUE << 16;
> 		break;
> In this case, should we also return DID_ABORT for DBR mode?

The above code comes from ufshcd_transfer_rsp_status(), isn't it?
ufshcd_transfer_rsp_status() should not be called if the SCSI core
aborts a SCSI command (ufshcd_abort()). It is not allowed to call
scsi_done() from a SCSI abort handler like ufshcd_abort(). SCSI
abort handlers must return SUCCESS, FAILED or FAST_IO_FAIL and let
the SCSI core decide whether to complete or whether to resubmit the
SCSI command.

Thanks,

Bart.

