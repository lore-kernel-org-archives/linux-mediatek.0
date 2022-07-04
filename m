Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1806FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9VUTqT8jtPeb0C0cZOXnDlZWIIuVk1iTONIrVGroBF8=; b=vod/F/IT0fwe7KvomqBCZT1nuV
	GgZ0EPPTrsITsifGjoj8E6h7A0WcEMx1VMqLPFxHvClv2U8MNZ1PIRIaJG66WuS4vIB7n7GXCPYbF
	xZjUbDv12RcMsy7xEN+mc1zcg5G4tUzuDORXIgjFA5n6+wB69Z2bnP8jHsSkLSbKicy+TlrRIapW7
	rSxIeo65cwKzBRQDnZq/Umr6wLQl4jtK1QDzzejLpOZNOkxzbziuC2s1v9Tf/a8HBR5xyu5cc35YU
	JcOQTBjqkWII8iWYijj2T4UZm7kQjo+/7iUuXBZ2j/tCABeFDiDj9LZlip06gKg6hYGV9cEdM9Syj
	DzFv9qmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8RKB-00AqiT-Os; Mon, 04 Jul 2022 19:01:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8RK8-00Aqde-Mt
	for linux-mediatek@lists.infradead.org; Mon, 04 Jul 2022 19:01:34 +0000
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F40E660199B;
	Mon,  4 Jul 2022 20:01:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656961288;
	bh=/KVtNYhy5rVIVxZXV9AtclYPaAVRmD/X6xEoREFhDP4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FEyz6NyCNJscR2IV9AFOqZou35TJr0a/CHp1iqyGiHZ+SotFssuVZve4vxpR/kfBS
	 /+gLohLwwdoME6Rmy2sgh5La8Gnn+PzjKS0/+b2sK9GxZygSeRFn0PX02EnJ4A29wO
	 RzB7FYGI+V9zYVs82TAv1VRHbRMB5exo6bmtyP4fJFUnK6CmPnMZGQjbEx9FaC2jjq
	 duXcgLkqHtDh9hV3Nqly3tYYFkEdmmn9BfgTJODRM9BV7/0w8WSHUNrCUd29YyKOnN
	 rWvI/hFVnbXH8bbyLID+l7PkKwmZTDv1zT9HcSV+Pi/DqBb1+mQsC8vmWPsd3HDaEC
	 ar/8tGoBDxRlA==
Message-ID: <52c9cf205a6b107175225733e4bff0d29c9d86c1.camel@collabora.com>
Subject: Re: [PATCH 0/6] media: mediatek-vcodec: Fix capability fields again
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>
Date: Mon, 04 Jul 2022 15:01:17 -0400
In-Reply-To: <CAGXv+5Hrc6RageAu1YMBCA22r0kz+-C+9qO=qdDEmn_QhSCB3w@mail.gmail.com>
References: <20220701105237.932332-1-wenst@chromium.org>
	 <e601a375-cc80-40cd-9791-e44e9d37cec0@email.android.com>
	 <CAGXv+5Hrc6RageAu1YMBCA22r0kz+-C+9qO=qdDEmn_QhSCB3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_120132_925523_591F41E3 
X-CRM114-Status: GOOD (  29.78  )
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

Le vendredi 01 juillet 2022 =C3=A0 21:10 +0800, Chen-Yu Tsai a =C3=A9crit=
=C2=A0:
> On Fri, Jul 1, 2022 at 8:45 PM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >=20
> > Hi Chen,
> >=20
> > Le 1 juill. 2022 06 h 52, Chen-Yu Tsai <wenst@chromium.org> a =C3=A9cri=
t :
> >=20
> > Hi everyone,
> >=20
> > The previous round of changes to the mtk-vcodec driver's returned
> > capabilities caused some issues for ChromeOS. In particular, the
> > ChromeOS stateless video decoder uses the "Driver Name" field to
> > match a video device to its media device. As the field was only
> > changed for the video device and not the media device, a match
> > could no longer be found.
> >=20
> >=20
> > This match is not specified in the spec. If you feel like it should, pe=
rhaps consider specifying it first. To me it's nice if they match, but it's=
 for now just cosmetic.
>=20
> Right. Even for cosmetic reasons I think my changes make sense though.
> Fixing the matching is another thing.
>=20
> > Though this requires some discussion, as userland is expected to enumer=
ate the media device and find the video device by walking the topology. Thi=
s is the only specified way to match both.
>=20
> AFAICT, v4l2-ctl does similar matching, though by bus_info. Maybe it's
> out of convenience?

bus_info has indeed been used a lot in the past, it will be more reliable t=
hen
"driver name" matching. Using topology remains the recommended identificati=
on
method.

>=20
> ChenYu
>=20
> >=20
> >=20
> > While fixing this, I found that the current info used for the fields
> > don't make a lot of sense, and tried to fix them in this series.
> >=20
> > Patch 1 reverts the driver name field change. It also makes it
> > explicit that the field really should match the driver name.
> >=20
> > Patch 2 changes the value for the card name, making it a free form
> > string that includes the SoC model.
> >=20
> > Patch 3 removes setting the bus_info field, instead using the default
> > value derived from the underlying |struct device| as set by the V4L2
> > core.
> >=20
> > Patches 4 through 6 do the same as 1 through 3 respectively, but for
> > the encoder side.
> >=20
> > This series is based on next-20220701, and was tested on mainline on
> > MT8183 Juniper, and on ChromeOS v5.10, on which we have a whole bunch
> > of backports pending, on MT8195 Tomato.
> >=20
> > Please have a look.
> >=20
> >=20
> > Thanks
> > ChenYu
> >=20
> > Chen-Yu Tsai (6):
> >   media: mediatek: vcodec: Revert driver name change in decoder
> >     capabilities
> >   media: mediatek: vcodec: Use meaningful decoder card name including
> >     chip name
> >   media: mediatek: vcodec: Use default bus_info for decoder capability
> >   media: mediatek: vcodec: Revert driver name change in encoder
> >     capabilities
> >   media: mediatek: vcodec: Use meaningful encoder card name including
> >     chip name
> >   media: mediatek: vcodec: Use default bus_info for encoder capability
> >=20
> > drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 ++++---
> > drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
> > drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 7 ++++---
> > 3 files changed, 9 insertions(+), 6 deletions(-)
> >=20
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog
> >=20
> >=20


