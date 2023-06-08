Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C616C7EE37
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 15:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIOUbvMCK/DdfzuwH+vEERtUVJGFEPXnn5OqPJONDeA=; b=McXHB9ZikbvrkFlyskUS4uo6uY
	sCVSbqpp3e72n16OHYBkUyBePgGFzn1aSTeiB2DkONF5fMxve9upOyhiMMIcl3s7HPF+LVXa8oFbf
	Wk7ScGtBqn2hLPvj18JpDmgqKl5tQ6rC3tzZrT24vcpswW9nPQi9DhxaYiZQCZ91fujG6/C7YRXII
	DpeUaJarSpotr8rjAr17TL/ZmN0DJO2JnObm7IoW+ZyNZDpuyyai0k0Vo2NSrZcYEC/Q9/CwAqitd
	IpcavxXqkFjeaN+F33Dc2ipFqUz3A4lwfqz+u9RjtSPhz/2Yeuy5Lsa75qm+krk5x1kFhxLgwvKR+
	5PDXwucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HO9-009igK-16;
	Thu, 08 Jun 2023 15:17:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7HO5-009ie3-1v;
	Thu, 08 Jun 2023 15:17:23 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:11:5f2f::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 56C736606F1E;
	Thu,  8 Jun 2023 16:17:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686237437;
	bh=BsKr6pTB4WtQzThWbg3iTFCfYASAdKgF1gPPCt/Ibe4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=CrYsILkq0irO3iD7CPmezhqtl+j8biD9yk1zh5nw6zApzaFKi42h2bOgvn4oNJbp3
	 8IZzGYwZ3rw9DrydP1Ij+JU09n9HXoR+Auyule9uEnV3WdcGQK368RkN55w4MxfbJi
	 2cglp48KizX866etgackMMXGttMdBmJP0Jiogw7pxRLOxlccywHPbrj4sGnMmMpapw
	 CXsYK+6CuLYIZoq1qp6Y8y1Sa2vSHRPYX7pUIHVP6VRlSdQbNIaG28dYz91rbD1eFa
	 xfyL04zye7Lhlz2XA2gZRgc4FhUtzg6QHWDaBZlq7cVnlh9B0bm8/0YlJnn7mxAsVj
	 9cf70VSHMCKUQ==
Message-ID: <e1e00e3207784f48b6adc9c3b6ec48f57795228d.camel@collabora.com>
Subject: Re: [PATCH v2,04/10] media: mediatek: vcodec: remove the dependency
 of debug log
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
 <Yunfei.Dong@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "wenst@chromium.org" <wenst@chromium.org>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>,  "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>, "hverkuil-cisco@xs4all.nl"
 <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>, "stevecho@chromium.org"
 <stevecho@chromium.org>,  "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@chromium.org"
 <hsinyi@chromium.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Date: Thu, 08 Jun 2023 11:17:07 -0400
In-Reply-To: <925956db-9001-7a4f-700e-c84220103201@collabora.com>
References: <20230607084901.28021-1-yunfei.dong@mediatek.com>
	 <20230607084901.28021-5-yunfei.dong@mediatek.com>
	 <ad28c125d9efca1f7e422fffe42dd56cef66b349.camel@collabora.com>
	 <6bb7e4b283332f1b76c1550347cb245a57eee90b.camel@mediatek.com>
	 <ac3f4becf89d909503caeb8a05883fc38afccd41.camel@collabora.com>
	 <925956db-9001-7a4f-700e-c84220103201@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_081721_926672_4C0EA3E5 
X-CRM114-Status: GOOD (  34.70  )
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

Le jeudi 08 juin 2023 =C3=A0 16:06 +0200, AngeloGioacchino Del Regno a =C3=
=A9crit=C2=A0:
> Il 08/06/23 15:11, Nicolas Dufresne ha scritto:
> > Le jeudi 08 juin 2023 =C3=A0 07:27 +0000, Yunfei Dong (=E8=91=A3=E4=BA=
=91=E9=A3=9E) a =C3=A9crit=C2=A0:
> > > Hi Nicolas,
> > >=20
> > > Thanks for your review.
> > > On Wed, 2023-06-07 at 21:41 -0400, Nicolas Dufresne wrote:
> > > >   =09
> > > > External email : Please do not click links or open attachments unti=
l
> > > > you have verified the sender or the content.
> > > >   Hi Yunfei,
> > > >=20
> > > > Le mercredi 07 juin 2023 =C3=A0 16:48 +0800, Yunfei Dong a =C3=A9cr=
it :
> > > > > 'mtk_vcodec_debug' and 'mtk_vcodec_err' depends on 'mtk_vcodec_ct=
x'
> > > > > to get the index of each instance, using the index directly inste=
ad
> > > > > of with 'mtk_vcodec_ctx'.
> > > > >=20
> > > > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > > > ---
> > > > >   .../mediatek/vcodec/mtk_vcodec_util.h         |  26 ++-
> > > > >   .../vcodec/vdec/vdec_av1_req_lat_if.c         | 105 +++++++----=
-
> > > > >   .../mediatek/vcodec/vdec/vdec_h264_if.c       |  62 ++++---
> > > > >   .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  39 +++--
> > > > >   .../vcodec/vdec/vdec_h264_req_multi_if.c      |  80 +++++----
> > > > >   .../vcodec/vdec/vdec_hevc_req_multi_if.c      |  67 ++++----
> > > > >   .../mediatek/vcodec/vdec/vdec_vp8_if.c        |  54 ++++---
> > > > >   .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  46 +++---
> > > > >   .../mediatek/vcodec/vdec/vdec_vp9_if.c        | 152 ++++++++++-=
-
> > > > ------
> > > > >   .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  84 ++++++----
> > > > >   .../platform/mediatek/vcodec/vdec_vpu_if.c    |  59 ++++---
> > > > >   .../mediatek/vcodec/venc/venc_h264_if.c       |  86 +++++-----
> > > > >   .../mediatek/vcodec/venc/venc_vp8_if.c        |  48 +++---
> > > > >   .../platform/mediatek/vcodec/venc_vpu_if.c    |  64 ++++----
> > > > >   14 files changed, 565 insertions(+), 407 deletions(-)
> > > > >=20
> > > > > diff --git
> > > > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > > > index ecb0bdf3a4f4..ddc12c3e2983 100644
> > > > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > > > @@ -31,9 +31,8 @@ struct mtk_vcodec_dev;
> > > > >   #define mtk_v4l2_err(fmt, args...)                \
> > > > >   pr_err("[MTK_V4L2][ERROR] " fmt "\n", ##args)
> > > > >  =20
> > > > > -#define mtk_vcodec_err(h, fmt, args...)\
> > > > > -pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n",\
> > > > > -       ((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
> > > > > +#define mtk_vcodec_err(plat_dev, inst_id, fmt,
> > > > args...)                                 \
> > > > > +dev_err(&(plat_dev)->dev, "[MTK_VCODEC][ERROR][%d]: " fmt "\n",
> > > > inst_id, ##args)
> > > > >  =20
> > > > >   #if defined(CONFIG_DEBUG_FS)
> > > > >   extern int mtk_v4l2_dbg_level;
> > > > > @@ -46,27 +45,24 @@ extern int mtk_vcodec_dbg;
> > > > >    __func__, __LINE__, ##args);        \
> > > > >   } while (0)
> > > > >  =20
> > > > > -#define mtk_vcodec_debug(h, fmt, args...)                      \
> > > > > -do {                      \
> > > > > -if (mtk_vcodec_dbg)                      \
> > > > > -dev_dbg(&(((struct mtk_vcodec_ctx *)(h)->ctx)->dev->plat_dev-
> > > > > dev),   \
> > > > > -"[MTK_VCODEC][%d]: %s, %d " fmt "\n",                         \
> > > > > -((struct mtk_vcodec_ctx *)(h)->ctx)->id,                      \
> > > > > -__func__, __LINE__, ##args);                                  \
> > > > > +#define mtk_vcodec_debug(plat_dev, inst_id, fmt,
> > > > args...)                               \
> > > > > +do
> > > > {
> > > >          \
> > > > > +if
> > > > (mtk_vcodec_dbg)
> > > > \
> > > > > +dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: %s, %d " fmt "\n", =
\
> > > >=20
> > > > At least in this patch, you systematically pass plat_dev as
> > > > <something>->ctx->dev->plat_dev, which is quite long and verbose, a=
ny
> > > > reason we
> > > > can't just pass that <something> here ? We can follow the same
> > > > structure path
> > > > for both encoder/decoder ?
> > > >=20
> > >=20
> > > In order to separate encode and decoder, need to define two different
> > > struct mtk_vcodec_dec_ctx and struct mtk_vcodec_enc_ctx.
> > >=20
> > > struct mtk_vcodec_ctx won't be used again, need to use platform devic=
e
> > > to print dev_dbg and dev_err.
> > >=20
> > > encoder and decoder using the same interface to print log message.
> >=20
> > Just a reminder, I'm just making suggestions, there is no strict action=
 required
> > here other then a discussion to try and make the logging a bit more lig=
ht.
> >=20
> > My points was that C macros don't care about types, so if you keep the =
path to
> > the platform device the same (ctx->dev->plat_dev), you could just pass =
the ctx
> > as argument. What I don't know though myself, is if this is actually fe=
asible in
> > all code path, but considering you had access to the instance previousl=
y, I
> > thought it should.
> >=20
>=20
> One macro used to access two different structures?
>=20
> Please, no.

Its up to you. I do think this is an empty statement. Still believe we avoi=
d
this code "deterioration". One can always be creative to workaround your
concerns.

	struct base_ctx {
		struct dev dev;
	}

	struct enc_ctx=C2=A0{
		struct base_ctx;
		...
	}

	struct src_ctx {
		...
	}

But this is in no way more safe then a naming convention, this is macro cal=
ls,
its not typed.

Nicolas

>=20
> Regards,
> Angelo
>=20
> > regards,
> > Nicolas
> >=20
> > >=20
> > > Best Regards,
> > > Yunfei Dong
> > > > > +inst_id, __func__, __LINE__, ##args);                   \
> > > > >   } while (0)
> > > > >   #else
> > > > >   #define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##arg=
s)
> > > > >  =20
> > > > > -#define mtk_vcodec_debug(h, fmt, args...)\
> > > > > -pr_debug("[MTK_VCODEC][%d]: " fmt "\n",\
> > > >=20
> > > ...snip...
> >=20
>=20


