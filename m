Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E09C27C77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+FtYBDXnbweDOL4R19ZV1/NNhwH5Y4Lp4FSBLIU0eI=; b=cUBeXPzVpB5AZBmT7kUisJTUo0
	ef8WuweqM7iAKkoHJR7XsY257aIOiH3DbxskZ1IaYz+p1AvLUnut/ui03GzEgHKmKtPGkODMClUA8
	ELBjEt5ngXjJKtHVMJDZ8yZE5WhnCU8UzI5f6zm20mY3XQyFRyHzGkMEtQqYf8frB5xfsITk3OJYo
	yCVayzaNoeqqRCWFsKBjGNHyS4rGP4ShdO6y5h9xWFWWPx75Wg22TSr5gB11ckzPBPBuVToKd+eWy
	gyd3Vn9zuiL2O/l7rKMIJyuvBX6gK3pU7u383cQanPiCN7I2eM+CYXN9VCemph7pscRf6wW+xwSZ4
	7tHmCt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHTtE-0000000Dvag-3fUK;
	Wed, 12 Jun 2024 19:44:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHTtA-0000000DvZS-3nBo;
	Wed, 12 Jun 2024 19:44:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718221445;
	bh=O+FtYBDXnbweDOL4R19ZV1/NNhwH5Y4Lp4FSBLIU0eI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JIGHAZj2aQD8Hf9VwrqLKLytT4dBeSTIJBFXagatR7vdFUsPH/EF9pjdUJUUfrXbt
	 wqAbkemqdxjfLNrKrzo2anATw1gMq5x59nVVJM9ZY5FRIKfpQmAXV0kpPctLDPLTP1
	 XtlIewrROieob8JRnMLmwbglgi0JhIjgfuSeA4C3IH9vFvQu+dGxgkrMiTFxO6jMKS
	 3krRYoi7ipn9fU8f3IkM/GnM/O5BSMPNNWdzVIUveQXL0SplP78uVA+B8WtPoNv4jt
	 m10m9kBwO+tBXqGEaAsWX9nmoPup8osFQUJsYEIa0xMafS+8UQx1Q3V9YAZ/mJaaWr
	 0CZWeoEVqskVQ==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9AEA378065F;
	Wed, 12 Jun 2024 19:44:01 +0000 (UTC)
Message-ID: <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Jeffrey Kardatzke
 <jkardatzke@google.com>, =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"
 <nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Hans
 Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu
 Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,  Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
 <daniel@ffwll.ch>,  Steve Cho <stevecho@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, John
 Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Wed, 12 Jun 2024 15:43:58 -0400
In-Reply-To: <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-5-yunfei.dong@mediatek.com>
	 <20240522111622.GA31185@pendragon.ideasonboard.com>
	 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_124409_130487_912557DD 
X-CRM114-Status: GOOD (  16.13  )
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

Hi,

Le mercredi 12 juin 2024 =C3=A0 13:37 +0900, Tomasz Figa a =C3=A9crit=C2=A0=
:
> > Why is this flag needed ? Given that the usage model requires the V4L2
> > device to be a dma buf importer, why would userspace set the
> > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > buffer to the device ?
>=20
> Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> actually useful to tell the driver the queue is operating in restricted
> (aka secure) mode.
>=20
> I suppose we could handle that at the time of a first QBUF, but that
> would make the driver initialization and validation quite a bit of pain.
> So I'd say that the design being proposed here makes things simpler and
> more clear, even if it doesn't add any extra functionality.

There is few more reasons I notice in previous series (haven't read the lat=
est):

- The driver needs to communicate through the OPTEE rather then SCP and som=
e
communication are needed just to figure-out things like supported profile/l=
evel
resolutions etc.
- The driver needs to allocate auxiliary buffers in secure heap too, alloca=
tion
at runtime are not the best

Note that the discussion around this flag already took place in the very fi=
rst
iteration of the serie, it was originally using a CID and that was a propos=
ed
replacement from Hans.

regards,
Nicolas

