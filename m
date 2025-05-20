Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92BEC3DA6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 20:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOpxo2nrCrAcfyxVcWSqYGBPoXDE0PWkTANOWymUEsg=; b=WWI/+I3I91fpYhZKx9nzTgmNjB
	jFJmbBFUz0y0G2wHD5/FdLsBD4/KiVuEHhKLfBDiYGBVaWcw+yq5UedAN80yyUaU4jTXLB6XRzDLN
	RLrl8MDTsMgRLnLUOdHy2chzv1dJW1p2qkPhEmTUxF32hXiQD7icbKVzr9qwTX2sr7EAjYd6QlCQV
	A+kIvUUCnn9oW5dzGnkLRkyZo0ltX2bgzNxLJyVbcra9Mk5fQIhKGpApCaHYIWnhNjpwPEBmaFkVS
	5T4xeWbn7lv/pDQzvP71iRLvh+bPGg9eFAKuHrTAKt0FkDJQ7op4K604Lo27zsXFxIRbFt81m0SCX
	FhMaapkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTR2-0000000E4MA-3Oex;
	Tue, 20 May 2025 20:19:36 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHTM5-0000000E3jr-0xS7;
	Tue, 20 May 2025 20:14:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b25P35f1Lzm0yTm;
	Tue, 20 May 2025 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747772052; x=1750364053; bh=cOpxo2nrCrAcfyxVcWSqYGBP
	oXDE0PWkTANOWymUEsg=; b=JilRvis5bHi/wZFe2m8v0w2+PC7/6DB4obj17Kof
	eHJhkGNfePOL3SeEPkt4wCM3egj8x/cenAPWf0pr6swtLJyfDo3ZylN4Q8VKyqcz
	u42nRNvgUTz9akwxiX9Zorv5vULTWgoO0GpxQxXzE6c7Y7JPOMEu2Go2nLow3BVG
	kxhNESxlZtGuHv5U3uj7TV01T3AyqFniJ30vueHTk40xnJ0ih3p5LPzA4z5vddMl
	OA80G3ECafKEgK10bCOb2UOdbxmV0dU54ksPzkyMwez+WlubKxpi4DF9reHIGAXe
	IywTpbcFGcI3oTBqnCHJJ12fV5W9vYLyOo+qZxrFgxRfIQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1yHhljgweE0s; Tue, 20 May 2025 20:14:12 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b25Nm3Ftpzm0ySm;
	Tue, 20 May 2025 20:13:59 +0000 (UTC)
Message-ID: <3ba29109-86d8-4bc1-8f2f-49fa2e56673e@acm.org>
Date: Tue, 20 May 2025 13:13:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] ufs: core: Add HID support
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tanghuan@vivo.com" <tanghuan@vivo.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "luhongfei@vivo.com" <luhongfei@vivo.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>,
 "wenxing.cheng@vivo.com" <wenxing.cheng@vivo.com>
References: <20250520094054.313-1-tanghuan@vivo.com>
 <ab468bb26dafca673d7ffca7dff519b7cf024cdc.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ab468bb26dafca673d7ffca7dff519b7cf024cdc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_131429_357061_25B4692A 
X-CRM114-Status: GOOD (  12.62  )
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

On 5/20/25 6:14 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> On Tue, 2025-05-20 at 17:40 +0800, Huan Tang wrote:
>> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
>> index 3e2097e65964..8ccd923a5761 100644
>> --- a/drivers/ufs/core/ufshcd.c
>> +++ b/drivers/ufs/core/ufshcd.c
>> @@ -8390,6 +8390,10 @@ static int ufs_get_device_desc(struct ufs_hba
>> *hba)
>>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->rtt_cap =3D desc_=
buf[DEVICE_DESC_PARAM_RTT_CAP];
>>=20
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->hid_sup =3D get_unalig=
ned_be32(desc_buf +
>> +                             =20
>> DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP) &
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UFS_DEV_HID_SUPPORT;
>> +
>>=20
>=20
> Could add the double negation (!!) ensures the value is exactly 0 or 1.
> dev_info->hid_sup =3D !!(get_unaligned_be32(desc_buf +
>              DEVICE_DESC_PARAM_EXT_UFS_FEATURE_SUP) &
>              UFS_DEV_HID_SUPPORT);

Hi Peter,

I do not agree that this change is required. ufs_dev_info.hid_sup has=20
type bool and hence the compiler will convert the result of the binary
and operation implicitly into a boolean value (0/1). From the C23
standard: "When any scalar value is converted to bool, the result is
false if the value is a zero (for arithmetic types), null (for pointer
types), or the scalar has type nullptr_t; otherwise, the result is
true."

A double negation does not occur elsewhere in the kernel if an integer
value is assigned to a boolean variable so I think that it shouldn't be
added here either.

Bart.

