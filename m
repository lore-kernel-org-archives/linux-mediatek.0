Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDACBC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LH5wofgpP06SaS1NINtpQAjRntdG7K+g6Cs88ljhldA=; b=yB4J+P2Zn0K9kxVnBYFQH3UG1l
	ebthzIwD+6PwBM2Ti08pGACJpdJcHUUGeltgdaCSmGrq9AkypRs+xJkfn6DJ45BeGUZf6fQbPSvo/
	oJFnI4VjcKZC4DKzZ+qtYnJeIeA6a9ZD9r/lnyWLzF3USxs+QhuWaUqfQFUqMZsmkHyRoSuisKF/j
	IkuwF4i3CIXSD7yywqGjQong+D+h9znwYLQNOg4i8I0bWzMdrsW36tCi3ehAHjPaqAslMOiQ+mESE
	yLXsP4sC9+44fxAUpUQfwza8krQ+Y7uQK7D3U/DLIlygDscj0HEzuhF0MjwLVNJ0/zt5s+aht8ISb
	fctLtmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWDn-00000007iyN-1zXo;
	Wed, 26 Jun 2024 17:14:15 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWDk-00000007ix0-1nYl
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 17:14:14 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W8Swf1SzJz6CmR09;
	Wed, 26 Jun 2024 17:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719422042; x=1722014043; bh=LH5wofgpP06SaS1NINtpQAjR
	ntdG7K+g6Cs88ljhldA=; b=QS26SJeDo06eLUcncDLpb99KAC7PyVmsbslxSJWb
	9OzGV4zJgr9iH8h8i8Inm6DA38KmqmKrcf1ycjBsWYaCZuLlRTkMHnByFF3ishkI
	bVfE6skugC7CB8Joqxsl2S7nW4WmTCHNnV52uU8og1BGJgAlGJBimKdyhyEI7CtE
	MJzYiiW4ZFLrJdMer3ehR9F5pRkeULaXo3tEh2/I5GzX2+uWdzg7ulkBqCpzoXn9
	JINdrAdtSjbR8yqDaptGmozUgjjtvesLDWZ99SKkGH4ElAI+PUh4q4DGSxtFgc9D
	XJGFI6TRJByrDbWzna92MjXKAzn9HzHk8rwLN6cO2EG3qw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id O6DclUcoxkQf; Wed, 26 Jun 2024 17:14:02 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W8SwS5jmbz6CmR5y;
	Wed, 26 Jun 2024 17:14:00 +0000 (UTC)
Message-ID: <b5ee63bb-4db9-47fc-9b09-1fde0447f6f8@acm.org>
Date: Wed, 26 Jun 2024 10:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ufs: core: fix ufshcd_abort_all racing issue
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20240624121158.21354-1-peter.wang@mediatek.com>
 <eec48c95-aa1c-4f07-a1f3-fdc3e124f30e@acm.org>
 <4c4d10aae216e0b6925445b0317e55a3dd0ce629.camel@mediatek.com>
 <795a89bb-12eb-4ac8-93df-6ec5173fb679@acm.org>
 <0e1e0c0a4303f53a50a95aa0672311015ddeaee2.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <0e1e0c0a4303f53a50a95aa0672311015ddeaee2.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_101412_644404_4DE4D6C7 
X-CRM114-Status: UNSURE (   7.37  )
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

On 6/25/24 8:56 PM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> Sorry I have not explain root-cause clearly.
> I will add more clear root-cause analyze next version.
>=20
> And it is not an invalid pointer is passed to blk_mq_unique_tag(),
> I means blk_mq_unique_tag function try access null pointer.
> It is differnt and cause misunderstanding.
>=20
> The null pinter blk_mq_unique_tag try access is:
> rq->mq_hctx(NULL)->queue_num.
>=20
> The racing flow is:
>=20
> Thread A
> ufshcd_err_handler					step 1
> 	ufshcd_cmd_inflight(true)			step 3
> 	ufshcd_mcq_req_to_hwq
> 		blk_mq_unique_tag
> 			rq->mq_hctx->queue_num		step 5
>=20
> Thread B			=09
> ufs_mtk_mcq_intr(cq complete ISR)			step 2
> 	scsi_done					=09
> 		...
> 		__blk_mq_free_request
> 			rq->mq_hctx =3D NULL;		step 4

How about surrounding the blk_mq_unique_tag() call with
atomic_inc_not_zero(&req->ref) / atomic_dec(&req->ref)?

Thanks,

Bart.

