Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1F2E7109A
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+oNZNK0XdjRL1qDfy6VTGyZlo5uW17/8FO5Qfepexc=; b=HpWczmbWmYIR0nOp8b7WW7d/0U
	aC2HKrfBLJgX5SaRrQrUCwgsjBEDFT5YSe6qBD6IkqTxB+mXq+8JqHNnSqGgGr3DCLF+IjqY+ajju
	rF1SGU/6wZBpqSHUourTiuxGLUjtHFIyB5GsoEzLONeSTwEFVg1H2M+u2dn7fNtxJJ+2/GqTooIZG
	ep6v6GAWDJlQPrt43TQkwscxm6emSiwiFSzQmpNSbbaxlQN1Pk0ZmcyHZsIDwys84QxwVSX+LJKqH
	HOvKY7yueXHSiTtH/cWAGgMM84b7M5BicmRGZKJ1/Cf/zRFfZkJj5xrMXW/Aqj9hU54NumEHx5kZM
	AuRVlYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjN37-006ZxD-2E;
	Thu, 21 Sep 2023 17:01:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLtK-006RZh-1B;
	Thu, 21 Sep 2023 15:46:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4+oNZNK0XdjRL1qDfy6VTGyZlo5uW17/8FO5Qfepexc=; b=PV1Tc4j5H6fZM8617l/tJHR4nx
	4BoeX017qmkmL2tvUhDjC/8vB45Ci7+lUWHWqacCzwY7Tce7bsLi8YIAPezw8RLqJBxzJ1wUdpzFF
	KBwa+KxHWMHgETZa0YmEWAZClCA37YFi7kZpnx5o0+vDH91aFifJC+HLTQoef11t7PUDz24PzczdT
	bv0AVpoYZw9y/9RYIxaeyWGINQgct6+uqkUsPbhxV6awXGk/9d1zaRP5FViSbSInPE/kW+rVxHoW7
	k7urgJIiuX/9erfA8q0SepMQqUfIjuUHbUJ2YuD7a98X715ttq4/f44IC4VBY44+w/9fSAkGBuv+P
	/w75wJog==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjLtE-00FUEn-1G;
	Thu, 21 Sep 2023 15:46:57 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:15:bae9::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8589D660731D;
	Thu, 21 Sep 2023 16:46:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695311211;
	bh=qmLDWY/AuDZBwTiEH6bdhLx9MgWdAsDslzLfx3DOK4A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AAgC+As4Cy0TIyhqMYWvMkMILzrYGP2tdMFpvtrvDNPf0KcxzcZjzMOSK4Rq+GWMQ
	 EIpWb+TvGWirRWMOZCnECZJb8onvByXZBGwfeB6ZhIC0oO7BjgjViiHxqwDixdY78Z
	 K42MnJB5KJsEJ7fPabAtJvrBf8vDCD1DZ6xRKVOKXgDp7Ecy6k7Slj/HvSyvE2VWMK
	 QntErYDk3VwsgkkGUd4sx9fDC1P8XVhFchzQ+LnlHzDVJAEldAUAFC1OeR/4l+Gdi4
	 F7SL1J42s1DO+HX9UVMY1uNhlaX6g2/4RjNBE3XNQIveR7GF+dQxCVD4Z0bz0/rViQ
	 EvIPcMHnu1ptg==
Message-ID: <c7cd83c49a9226e72c272365653dc8b998b6adcb.camel@collabora.com>
Subject: Re: [PATCH 12/14] media: medkatek: vcodec: set secure mode to
 decoder driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>, Hans Verkuil
	 <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
 <Yunfei.Dong@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "frkoenig@chromium.org"
 <frkoenig@chromium.org>, "stevecho@chromium.org" <stevecho@chromium.org>, 
 "wenst@chromium.org" <wenst@chromium.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 21 Sep 2023 11:46:40 -0400
In-Reply-To: <CA+ddPcPbox=mknpmDkwfYTfDMca49wU10SNF3mJspYu=5T64FQ@mail.gmail.com>
References: <20230911125936.10648-1-yunfei.dong@mediatek.com>
	 <20230911125936.10648-13-yunfei.dong@mediatek.com>
	 <1df3e79b84933dda0313d0d9719220dbc06c9022.camel@collabora.com>
	 <d4cedcb0-32ed-495d-a8cd-a635d5105824@xs4all.nl>
	 <5307203d79c0d90cc742a315bb161fa796b9960f.camel@mediatek.com>
	 <bafc37e8-96e8-41c0-b805-c6477f0d7c4a@xs4all.nl>
	 <CA+ddPcN6EaFERC60_Z_-ZmWzqyUEwxiDCZwt_U6Y-gpaAu76tA@mail.gmail.com>
	 <ff7aa575-c820-4dfa-853f-77438b8b149a@xs4all.nl>
	 <b7d661637eacbda3e83d192b1126fc3970c4f50d.camel@collabora.com>
	 <c3d14f64-bf04-46b9-ac7b-af7ef9014335@xs4all.nl>
	 <CA+ddPcPbox=mknpmDkwfYTfDMca49wU10SNF3mJspYu=5T64FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_164654_231996_1A894F49 
X-CRM114-Status: GOOD (  20.34  )
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

Le mercredi 20 septembre 2023 =C3=A0 11:20 -0700, Jeffrey Kardatzke a =C3=
=A9crit=C2=A0:
> > >=20
> > > Also, regarding MTK, these are stateless decoders. I think it would b=
e nice to
> > > show use example code that can properly parse the un-encrypted header=
, pass the
> > > data to the decryptor and decode. There is a bit of mechanic in there=
 that lacks
> > > clarification, a reference implementation would clearly help. Finally=
, does this
> > > platform offers some clearkey implementation (or other alternative) s=
o we can do
> > > validation and regression testing? It would be very unfortunate to ad=
d feature
> > > upstream that can only be tested by proprietary CDM software.
> >=20
>=20
> It would be possible to use this with clearkey w/ some additional work
> on our end. If this is then part of the public ChromiumOS build, would
> that be satisfactory? (the TEE would have some binary blob components
> like firmware does though)

From my point of view, this would fully cover my concern. To clarify this
concern, the  decryption into secure memory currently only ever take place =
in
proprietary code that implements the protection (Widewine CDM). With clear =
key,
we can have an open source CDM (made for testing purpose) so that we don't =
have
to have hidden code to test the entire pipeline. So appart from the TEE
firmware, which is just a firmware like all the others, we could have open
source tests in kernelCI and other CI, and we could extend these test to
eventually support other vendors.

Note that currently, with other proposal, one could allocate and fill a nor=
mal
buffer, and "secure" that buffer to test the CODECs and display, but on thi=
s
specific architecture, with the limitation on the number of secure regions,=
 this
feature isn't available.

Alternatives to this end-to-end solution, we could consider a TA (Trusted
Application) that simply copy data from a untrusted chunk of memory into a
trusted chunk of memory. That seems like a cross-platform solution. It woul=
d be
even better if this get standardized in TEEs for course (or at least requir=
ed
with all secure memory implementation). Then copying from untrusted to trus=
ted
could easily become an ioctl generic to all TEE drivers. That to me would b=
e
equally acceptable, and perhaps easier to use.

Nicolas=20

