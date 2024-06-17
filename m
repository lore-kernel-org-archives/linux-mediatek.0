Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F0DC2BB85
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5lIlh24w/7FwO/6OIqNCbRFzX0ceZn2KO7/Zmyd8ug=; b=TxZvuG39dAizQU8Efx+LJroyTD
	GKe51tYZsFjQZElRkubfBRMHFVQfQZbrlc7cAqFlY859oRZoCMxYdYVJVcE9Jhh1SMEI7VhhGvZDt
	HdUwYFEQNanw45QtYq3CL0xev9gaW3Po/SIkrNk0gz4K9N5rc0n1SMleXCl4kBfdYTSZFofUFAbzI
	MncTwalL29ORsMVfYLNv/mVvI/8sXqhH0524PMKMM/TtT56E6s0aic3wLxYfXSF8/aOW/zzpoU81M
	pl2g84qyt8jJ0c9ErgTUalATQ5Pc1xx56FPDCDUi2cpXx2scAkk4ZjCGlijTTVgi9UHdLOcJp63VN
	KgMmwUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHcP-0000000CIfM-47za;
	Mon, 17 Jun 2024 19:02:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJHcM-0000000CIe4-2eZs;
	Mon, 17 Jun 2024 19:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718650932;
	bh=l5lIlh24w/7FwO/6OIqNCbRFzX0ceZn2KO7/Zmyd8ug=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Tbujqd+d46Gq8FvOkcgagCQtfYodA49/eOrhDP+tU72lZVY3/EyCC8v0iU4IEl70P
	 1UQ8cgmRVuWZ2Hrp3Zy5/z7PiEIliCWrpvdPDZi8ZMozcquKAKGfI/v+0RZZcq+Fx5
	 ftEG4CnRYO6dNTXDB2+HeaNjeer/m7giujB4OyTHwWg1WO2NLBk5K0WuykL31bHGuQ
	 FaaUy/v0Xq8xMFtLyLE5jB/eRwmE3GhF4St9+vPVta8FdRPMRdSgjN7ziZ8AUZmT7H
	 275qt4CkmuYb45aW9b44MtA0PnQmyRct5rGK3tmIEyAQwvyHJxLr5ZLOP/R58Cs1Vf
	 8QarUl26tyKqA==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3496F3780F7F;
	Mon, 17 Jun 2024 19:02:08 +0000 (UTC)
Message-ID: <7e4236cd59d1af009e23aabbd2c96735cbb379b3.camel@collabora.com>
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomasz Figa <tfiga@chromium.org>, Yunfei Dong
 <yunfei.dong@mediatek.com>,  Jeffrey Kardatzke <jkardatzke@google.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado" <nfraprado@collabora.com>, 
 Nathan Hebert <nhebert@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
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
Date: Mon, 17 Jun 2024 15:02:05 -0400
In-Reply-To: <20240612202507.GT28989@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
	 <20240516122102.16379-5-yunfei.dong@mediatek.com>
	 <20240522111622.GA31185@pendragon.ideasonboard.com>
	 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
	 <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
	 <20240612202507.GT28989@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_120214_876565_5C844012 
X-CRM114-Status: GOOD (  21.82  )
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

Le mercredi 12 juin 2024 =C3=A0 23:25 +0300, Laurent Pinchart a =C3=A9crit=
=C2=A0:
> On Wed, Jun 12, 2024 at 03:43:58PM -0400, Nicolas Dufresne wrote:
> > Le mercredi 12 juin 2024 =C3=A0 13:37 +0900, Tomasz Figa a =C3=A9crit=
=C2=A0:
> > > > Why is this flag needed ? Given that the usage model requires the V=
4L2
> > > > device to be a dma buf importer, why would userspace set the
> > > > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > > > buffer to the device ?
> > >=20
> > > Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> > > actually useful to tell the driver the queue is operating in restrict=
ed
> > > (aka secure) mode.
> > >=20
> > > I suppose we could handle that at the time of a first QBUF, but that
> > > would make the driver initialization and validation quite a bit of pa=
in.
> > > So I'd say that the design being proposed here makes things simpler a=
nd
> > > more clear, even if it doesn't add any extra functionality.
> >=20
> > There is few more reasons I notice in previous series (haven't read the=
 latest):
> >=20
> > - The driver needs to communicate through the OPTEE rather then SCP and=
 some
> > communication are needed just to figure-out things like supported profi=
le/level
> > resolutions etc.
> > - The driver needs to allocate auxiliary buffers in secure heap too, al=
location
> > at runtime are not the best
>=20
> Will the same driver support both modes on the same system ?

I believe so, yes.

>=20
> > Note that the discussion around this flag already took place in the ver=
y first
> > iteration of the serie, it was originally using a CID and that was a pr=
oposed
> > replacement from Hans.
>=20


