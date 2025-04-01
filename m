Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACCFC3601A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Apr 2025 07:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Bo5bYwXAw1JSj4iMW3hbUB54GZbPf6jG4p5n2DtEMo=; b=IGzJjXFVKur4iqYKGQHvgeKMAF
	9A/3CF71fW2M7ELfaT/yA9YplVEZjEjos6dDkLlEjXFA0W68cJFfCRBKZDfS1FNPIsiEPmKR/e8vE
	vvfZeyKE6MQ6d/xhBnAaoYXKABx3tNJ8tm2bL8Nl4jtNa0/SBzGOQWfc5PeT/dpZMqiID6RCUMukq
	remPUgqBpwjSAe0/l04Y+v2eRhhhgSOEVlRibPj9IPiQns86td/5CWv/t3dR3CAL189kVt6EBAlwK
	WVZqObJSBshT2exP/Nroxf8ILKqDG+EfCWsRahEeEXTOHi9vrlOwM5v4Tp1D/H3whCWRieiH0zVVT
	G8OofdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWUu-00000002GFQ-2IfO;
	Tue, 01 Apr 2025 07:57:24 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWU3-00000002G9v-1VdW
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Apr 2025 07:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=/Bo5bYwXAw1JSj4iMW3hbUB54GZbPf6jG4p5n2DtEMo=;
	t=1743494190; x=1744703790; b=fXdKxB1WZp5n0cS7Uqq2qYrPtw6b+IuOs47Ad+oKv9cMTgi
	Em+/uvESTMr9EaIcN/Ablu5njQMNJw0csmsfBH3Vg9GAt5QDbQuVgbVUCak8A297hXWxAzsVFFPTc
	AYmcLTCS3ThqrENzRMyqn8RUUmOzv3bAxD3l0FKulCqVZAHqAuv+FH1LfRrzBDH9mzxLLxSAZxqTf
	7qdn/v6QXm9GIL/VbuKz6kAcxA60FL9Qkq8fHNOCIg7aE3qeqE8yB0k5Zxger54xOuT2PUqEs552m
	JFGMSgWzArWRAxVcnnG4N7PNUIhF1dgKpUToO9YrzIeMGjKNBpM45m821N2pjxUw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tzWTw-0000000C8U9-0sQN;
	Tue, 01 Apr 2025 09:56:24 +0200
Message-ID: <b9734a917c3a085f1fe1fc8d11acd36448370c64.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mt76: mt7925: add EHT preamble puncturing
From: Johannes Berg <johannes@sipsolutions.net>
To: Allan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=AE=B6=E5=81=89=29?=	
 <Allan.Wang@mediatek.com>, "nbd@nbd.name" <nbd@nbd.name>,
 "lorenzo@kernel.org"	 <lorenzo@kernel.org>
Cc: Leon Yen =?UTF-8?Q?=28=E9=A1=8F=E8=89=AF=E5=84=92=29?=	
 <Leon.Yen@mediatek.com>, Deren Wu
 =?UTF-8?Q?=28=E6=AD=A6=E5=BE=B7=E4=BB=81=29?=	 <Deren.Wu@mediatek.com>,
 Posh Sun =?UTF-8?Q?=28=E5=AD=AB=E7=91=9E=E5=BB=B7=29?=	
 <posh.sun@mediatek.com>, Eric-SY Chang
 =?UTF-8?Q?=28=E5=BC=B5=E6=9B=B8=E6=BA=90=29?=	
 <Eric-SY.Chang@mediatek.com>, Quan Zhou
 =?UTF-8?Q?=28=E5=91=A8=E5=85=A8=29?=	 <Quan.Zhou@mediatek.com>,
 "linux-wireless@vger.kernel.org"	 <linux-wireless@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 Mingyen Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=98=8E=E8=AB=BA=29?=	
 <Mingyen.Hsieh@mediatek.com>, Shayne Chen
 =?UTF-8?Q?=28=E9=99=B3=E8=BB=92=E4=B8=9E=29?=	 <Shayne.Chen@mediatek.com>,
 CH Yeh =?UTF-8?Q?=28=E8=91=89=E5=BF=97=E8=B1=AA=29?=	
 <ch.yeh@mediatek.com>, KM Lin =?UTF-8?Q?=28=E6=9E=97=E6=98=86=E6=B0=91=29?=
	 <km.lin@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>, Soul Huang
 =?UTF-8?Q?=28=E9=BB=83=E8=87=B3=E6=98=B6=29?=	 <Soul.Huang@mediatek.com>,
 Michael Lo =?UTF-8?Q?=28=E7=BE=85=E7=92=A7=E7=AB=A0=29?=	
 <Michael.Lo@mediatek.com>, Ryder Lee <Ryder.Lee@mediatek.com>, Robin Chiu
 =?UTF-8?Q?=28=E9=82=B1=E5=9C=8B=E6=BF=B1=29?=	 <robin.chiu@mediatek.com>
Date: Tue, 01 Apr 2025 09:56:21 +0200
In-Reply-To: <aa5c71fe08572f578f322a6ef9bb7727fe8f4023.camel@mediatek.com>
References: <20250331091747.2592021-1-allan.wang@mediatek.com>
		 <bb2c561c7b849dcf9c129520a28f8d5667e5bd8e.camel@sipsolutions.net>
	 <aa5c71fe08572f578f322a6ef9bb7727fe8f4023.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_005631_398063_26DC2696 
X-CRM114-Status: UNSURE (   5.73  )
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

On Tue, 2025-04-01 at 07:50 +0000, Allan Wang (=E7=8E=8B=E5=AE=B6=E5=81=89)=
 wrote:
>=20
> To compatible with firmware control, dscb present is required to 1
> while bitmap is non-zero, and 0 while bitmap is zero.

Sure, but ...

> > > +=C2=A0=C2=A0=C2=A0=C2=A0 req->eht_dis_sub_chan_bitmap =3D chandef->p=
unctured;
> >=20

that's an __le16 getting assigned from a u16?

johannes

