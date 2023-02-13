Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00A4C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPqEjWQmVdVsPqCHjQ6KQTtRmaxlbsWrGrdFABEQqLo=; b=FDqeMdw4gWZgkql+DJfWic80Rw
	z4AK39WuCfH4CjgA+PAFdzPY5h/8SbvrqUqa6nJOB5fupZwgZO7Lufprtz3qMkndPnX3h2N4LlCTw
	MvAuugclJ/9KeFvcHfktq7vWX0cxT22KozLKJyTrMJT4VhEnu5mvRzx8jjyCTgyJrNVf62kVF6Uak
	JVwQT5rx96NKmLfA7qL4UAOFmpHyHi3jUPdR687gVhCvBORG8lq1JOT4Nr983pPFAtAgz544ANBsu
	dgqk2cQs9IvOVXe6lIuFR3rtdD0NKKq44lB0vjjLPib++6P6cWy0F4pQqCa3nJoa8fvRZeLeWWzXj
	LPGJyqwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYZZ-00EktI-Nu; Mon, 13 Feb 2023 13:08:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYZW-00Eksf-CI
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 13:08:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA9D56102E;
	Mon, 13 Feb 2023 13:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08D95C433EF;
	Mon, 13 Feb 2023 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676293721;
	bh=qPqEjWQmVdVsPqCHjQ6KQTtRmaxlbsWrGrdFABEQqLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZomLdiUZ1sjCer0lOEGjL7mUxYoM8CbPkXlP/REgTROVbl+NN8cK1VGG8c+zRdBHv
	 XcZEpbgbeqjo0nrjsU8VKzaKZcoDFuL90Sb6eNVu5syyiKN1ZjGXamSmXhTgZeUl4J
	 E8Zi4mi4RuW8tllFzRB3QVyk3qNSWUNV9Qc4IMTRGNYisJmNnp7NnnEnWpTGso27xS
	 CPe/KdkKh0L1J/CeBEWUcApeWa6T2T+CC6xPrZjTVMK6Aa2lCz1IxfoMCut4/IGIzE
	 CiZHSdaIh+BgXYd4cIKzF0wzD9a6htwFE4JO4zI90wB4McoukSU3bLwy7XfsHxtP7w
	 IKRjJjaPYljpw==
From: Kalle Valo <kvalo@kernel.org>
To: =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>
Cc: =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?= <Evelyn.Tsai@mediatek.com>,
  "linux-mediatek\@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,  =?utf-8?B?TGVvbiBZZW4gKOmhj+iJrw==?=
 =?utf-8?B?5YSSKQ==?= <Leon.Yen@mediatek.com>,  =?utf-8?B?U2hheW5lIENoZW4g?=
 =?utf-8?B?KOmZs+i7kuS4nik=?= <Shayne.Chen@mediatek.com>,  "nbd\@nbd.name"
 <nbd@nbd.name>,  "lorenzo\@kernel.org" <lorenzo@kernel.org>,
  =?utf-8?B?U3RlbGxhIENoYW5nICjlvLXmm4nkvakp?= <Stella.Chang@mediatek.com>,
  Sean Wang <Sean.Wang@mediatek.com>,  =?utf-8?B?S00gTGluICjmnpfmmIbmsJEp?=
 <km.lin@mediatek.com>,  =?utf-8?B?U291bCBIdWFuZyAo6buD6Iez5pi2KQ==?=
 <Soul.Huang@mediatek.com>,  =?utf-8?B?WU4gQ2hlbiAo6Zmz5b2l5a+nKQ==?=
 <YN.Chen@mediatek.com>,  =?utf-8?B?UG9zaCBTdW4gKOWtq+eRnuW7tyk=?=
 <posh.sun@mediatek.com>,  =?utf-8?Q?Eric-SY_Chang_=28=E5=BC=B5=E6=9B=B8?=
 =?utf-8?Q?=E6=BA=90=29?= <Eric-SY.Chang@mediatek.com>,  =?utf-8?B?Q0gg?=
 =?utf-8?B?WWVoICjokYnlv5fosaop?= <ch.yeh@mediatek.com>,  =?utf-8?B?Um9i?=
 =?utf-8?B?aW4gQ2hpdSAo6YKx5ZyL5r+xKQ==?= <robin.chiu@mediatek.com>,  Ryder
 Lee <Ryder.Lee@mediatek.com>,  "linux-wireless\@vger.kernel.org"
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: mt76: support ww power config in dts node
References: <70b8acb74fef12b10a74501cccd20e0c12f3f134.1675348583.git.deren.wu@mediatek.com>
	<87cz6k7b59.fsf@kernel.org>
	<56d3c87227c07caaa92b6b7d4e85b26e780b3a23.camel@mediatek.com>
Date: Mon, 13 Feb 2023 15:08:31 +0200
In-Reply-To: <56d3c87227c07caaa92b6b7d4e85b26e780b3a23.camel@mediatek.com>
	("Deren Wu \=\?utf-8\?B\?KOatpuW+t+S7gSkiJ3M\=\?\= message of "Wed, 8 Feb 2023
 10:04:43 +0000")
Message-ID: <87bklx67cg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_050842_496247_47144079 
X-CRM114-Status: GOOD (  13.14  )
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

"Deren Wu (=E6=AD=A6=E5=BE=B7=E4=BB=81)" <Deren.Wu@mediatek.com> writes:

> Hi Kalle,
>
> On Wed, 2023-02-08 at 11:35 +0200, Kalle Valo wrote:
>> Deren Wu <deren.wu@mediatek.com> writes:
>>=20
>> > support new node for WW regulatory domain
>>=20
>> The commit log doesn't really explain much. What does this patch do
>> exactly?
>>=20
> In STA mode, if the host stays in ww regulatory doamin ("00"),
> NL80211_DFS_UNSET would be set to driver. In such case, mt76 cannot
> find out the proper dts node to limit power settings. We apply this
> patch to have a proper power mapping for ww domain.

Ok. In the future, please always this kind of information to the commit
log. One vague phrase is not a proper commit log, more info about that
in the wiki below.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

