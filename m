Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F46C35FFA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 17:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vnKqjR9JwiMkcJdLBO0YQ2PXhwRkyodQC5yK8DhOnu0=; b=LIOo4TjW4gX2SzgUimRiNwhXdU
	UXyMQvmrCLq5I899Yht2LsNNWU37s9mnujc21kz1q8vSOEtB9eokGyH/MrOELXA1c+FRyFrru7fcx
	dbMHMIWIsuYMYGH5gh9IYZBDxbY3cufg2L9LCy5E2D7ndMsJoniTx+BwnnN6Gs6WpcIHq4EgSctUB
	adFsKiNFn6HO0bU+9u7Uca6sOut4CPOI3RWBW/ApHIivJWcHOGaDuOf/eG28cY8FnaSYRAEpHFq1P
	5mOJN4tLCzo/aw1jY+IaiDtBcHLE+0SHENe9509K0bTbB3JPOl6LTCe+9w7UMKSOqevakZAHSiuht
	1Ixrgnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxW0-00000009kmD-0LQN;
	Wed, 19 Mar 2025 17:47:40 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuxUI-00000009kYY-0BeY;
	Wed, 19 Mar 2025 17:45:55 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4ZHx2D5z5Zzm1HcY;
	Wed, 19 Mar 2025 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1742406337; x=1744998338; bh=vnKqjR9JwiMkcJdLBO0YQ2PX
	hwRkyodQC5yK8DhOnu0=; b=pSw89JlpU9tpPTNFBo2dWkCShpP7Kdkv0x2OlbXg
	HRGpQDEdMhkapBtR1Pqszi2sh5urUanYLjBfU7U+IYyGr8jBPdnMM4HOEo5D5KRZ
	qFECApPjBmKD2Lg4JsAx+ZSv4NO7WUNNwKKrckRlbPhpcnGeDgBqYeOuuWtJKsQ7
	uBQ2/OOVoDK4/NixKNeZqAEgNd1C4iiKzncuNFrxajLHSkd3mYxRcnswnyaZUOe9
	oEA2FjDBsWrDoD6s4IiFKWa8Za9ErwqNlG81dRNQtl7zgIeT/cCaTwwWmTLw/r6c
	u1l4BcVnlHJ5J6rXZc3UtfH7zArz2tDs0dHRtCHMk+91KQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kLNnn_BtxJA1; Wed, 19 Mar 2025 17:45:37 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4ZHx1t3WPMzm0XCB;
	Wed, 19 Mar 2025 17:45:21 +0000 (UTC)
Message-ID: <d82ce6c4-ae17-4ac6-9bb9-59759f8a185d@acm.org>
Date: Wed, 19 Mar 2025 10:45:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] scsi: ufs: core: add device level exception
 support
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 "minwoo.im@samsung.com" <minwoo.im@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "beanhuo@micron.com" <beanhuo@micron.com>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "quic_ziqichen@quicinc.com" <quic_ziqichen@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "keosung.park@samsung.com" <keosung.park@samsung.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <6109425449ac4d18249ce7254e4fa1252138a94a.1742369183.git.quic_nguyenb@quicinc.com>
 <61570104d58cef22716fefe459c0c45670108aad.camel@mediatek.com>
 <9cf88cda-cf9c-9dbd-d586-5463ce2a0cfc@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <9cf88cda-cf9c-9dbd-d586-5463ce2a0cfc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_104554_169798_5127F954 
X-CRM114-Status: UNSURE (   9.26  )
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

On 3/19/25 2:01 AM, Bao D. Nguyen wrote:
> On 3/19/2025 12:56 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
>> Could use atomic_t for counter protect?
>
> Are you suggesting to convert the dev_lvl_exception_count type from u32=
=20
> to atomic_t type? Because the value of dev_lvl_exception_count is=20
> returned to the user space via the device_lvl_exception_count_show()=20
> using the sysfs_emit() function, keeping the dev_lvl_exception_count as=
=20
> u32 data type probably works better in terms of the format.

I like the suggestion to use atomic_t. atomic_read() can be used in the
sysfs show method.

Thanks,

Bart.

