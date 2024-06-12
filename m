Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363E3C27C77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onNKzjgA3bLnrhQ91DOWISsPRYS3ZKDz36/FANmYGs0=; b=tLtiIXuxkJfEMcPw5vGQLAJlCQ
	fMPeudDdJob1KRnV5H6+oXxyfgC4vZzs4Htb6P643qd0ZvZr/nS1vktdG+IwNIfFS2z4sQFVNMmA8
	ZdXOQ/KoFYCT64/Am9FiweQEBV/aSDNxyoZpIXTOB5W4GF3wrwkml4wGqExF1GcTqS+vg0ZKbgtk+
	i9VBzRfj41n/tI0NASqQFrAWvJOQ9fL4Png0xsp+MdM+g/20eKgTDrMjNEqniNUhfzydEK1tv/757
	Z6xsS507cnl2s3ulby2tymGPdNcGQmqu7oKosn4tcHUmrMdOGOuEXS0gaVudRH/v+VVoVcWc9x6av
	jnyzjD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHV3q-0000000E7ey-0Upl;
	Wed, 12 Jun 2024 20:59:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHV3l-0000000E7dP-2qAG;
	Wed, 12 Jun 2024 20:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718225945;
	bh=onNKzjgA3bLnrhQ91DOWISsPRYS3ZKDz36/FANmYGs0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Z6SruB8vNB2Y/DCbnrkLaXh5mzh2EQttTZ7L0+bm+N+eDH5MSkb20HkUQXyh6LOBI
	 9cavqK2YXc/0rKjRSMlWHPeBvck/f/qF+hj1iZVV7ekg8fGNMvwlJ+aG84l9aIMBV9
	 9fDyuaOLcmxPxCQW6mvwp8QUEP+jXIFfYV4TGk4pV5e7XacxMAUzqkwBlU6lPM/rGY
	 9WV4sfKLkd8js0+YWSMleBhIadlZFtTAUjKROa13xR57DO8TPUzpQaNDVf35WhsTJU
	 8+0uTUQg8SoOxLR1yp8jCc2B9DcdmvJWaRg3+OovviNW2RjT6XT5y1wU/WY2S+FIaM
	 yqeV0UiHFGt9w==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 207F4378020D;
	Wed, 12 Jun 2024 20:59:02 +0000 (UTC)
Message-ID: <03aca2439ac31ec01b24233384cc8c8d5179df02.camel@collabora.com>
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
Date: Wed, 12 Jun 2024 16:58:58 -0400
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
X-CRM114-CacheID: sfid-20240612_135910_204440_A32E9263 
X-CRM114-Status: GOOD (  22.69  )
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

Yes, as per this implementation, it seems you can flip from one mode to ano=
ther
even on the same instance.

Nicolas

>=20
> > Note that the discussion around this flag already took place in the ver=
y first
> > iteration of the serie, it was originally using a CID and that was a pr=
oposed
> > replacement from Hans.
>=20


