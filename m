Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EF6C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOh0JiXTBiD+XxfR5ReLBEmoCXzQeXQhfGP6JGxjaMc=; b=PLJ1c+hqJ8MH+zz7FtvSgqI1yJ
	e+ntKTKGek3ZEx59NgJnIpAvVHSg1CZI3zXoYjoDATWunD3G9d3LZrwnNL7WgPq8Or3ibiQpfZXNn
	mTYbsCeQoU0uwjRtLV8M3dgDtQPlsOsNt8IKlJAp3UEXas1a4HxFhMDx00SMrschaKtYOpG7BCCiZ
	L8v34YlgC0hUc26CTIUAjCLe+65E6HS5kos11sfqUL+aDog0/SwMuTPpfJG9Rk1rn8eVNAEuwZa85
	HNlMxMR92gwLZM6DMlg5lPoUjDGjwudKiffbxK4xr0IHEJduaNc3CkPUpH+c2Yc6DG3RpiFZ72Qq4
	PFXnYLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7FQR-009Qkw-24;
	Thu, 08 Jun 2023 13:11:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7FQN-009QjX-1k;
	Thu, 08 Jun 2023 13:11:37 +0000
Received: from nicolas-tpx395.localdomain (unknown [IPv6:2606:6d00:11:5f2f::7a9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5A79A6606F0D;
	Thu,  8 Jun 2023 14:11:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686229891;
	bh=zmtOnMlEFWzULIW67hUUhdGF+BS4k1EslsAkPI/DEmc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=LrWW5pmF8qjTKuc+N8pn+UdbiqPmui3gbYOhq2jdsuVpV2kL3596+bCy1qL5atfxl
	 iAGyEpJpVLaJYaFr4inYVu0V0eJ8ung5RNWbUQkjPhcWTpSGrOUx9OQ+xMNtOd00Ov
	 II43H5BDfjQZmWvQKmn/zFCyHa/e512udU2bak5/2abZ6M5xriofFs7AliKiXbhGgu
	 JbjsItgBCGMBtoY8E1G0UhLFnXLgTNGH9PtBMVK+iWJiP3M1rbhrFf9+SUCx8FdCBE
	 4LNkWqQc8BhHYGB0iyTeVBhKxDTkmQ2znpcZbkA4Ecl0MVXam4WVxFkJv0paARi/KP
	 P/KUjEoR0u1WA==
Message-ID: <ac3f4becf89d909503caeb8a05883fc38afccd41.camel@collabora.com>
Subject: Re: [PATCH v2,04/10] media: mediatek: vcodec: remove the dependency
 of debug log
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=
 <Yunfei.Dong@mediatek.com>, "nhebert@chromium.org" <nhebert@chromium.org>, 
 "wenst@chromium.org" <wenst@chromium.org>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>,  "benjamin.gaignard@collabora.com"
 <benjamin.gaignard@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, "hverkuil-cisco@xs4all.nl"
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
Date: Thu, 08 Jun 2023 09:11:20 -0400
In-Reply-To: <6bb7e4b283332f1b76c1550347cb245a57eee90b.camel@mediatek.com>
References: <20230607084901.28021-1-yunfei.dong@mediatek.com>
	 <20230607084901.28021-5-yunfei.dong@mediatek.com>
	 <ad28c125d9efca1f7e422fffe42dd56cef66b349.camel@collabora.com>
	 <6bb7e4b283332f1b76c1550347cb245a57eee90b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_061135_883862_71F0AE3A 
X-CRM114-Status: GOOD (  27.37  )
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

Le jeudi 08 juin 2023 =C3=A0 07:27 +0000, Yunfei Dong (=E8=91=A3=E4=BA=91=
=E9=A3=9E) a =C3=A9crit=C2=A0:
> Hi Nicolas,
>=20
> Thanks for your review.
> On Wed, 2023-06-07 at 21:41 -0400, Nicolas Dufresne wrote:
> >  	=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi Yunfei,
> >=20
> > Le mercredi 07 juin 2023 =C3=A0 16:48 +0800, Yunfei Dong a =C3=A9crit :
> > > 'mtk_vcodec_debug' and 'mtk_vcodec_err' depends on 'mtk_vcodec_ctx'
> > > to get the index of each instance, using the index directly instead
> > > of with 'mtk_vcodec_ctx'.
> > >=20
> > > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > > ---
> > >  .../mediatek/vcodec/mtk_vcodec_util.h         |  26 ++-
> > >  .../vcodec/vdec/vdec_av1_req_lat_if.c         | 105 +++++++-----
> > >  .../mediatek/vcodec/vdec/vdec_h264_if.c       |  62 ++++---
> > >  .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  39 +++--
> > >  .../vcodec/vdec/vdec_h264_req_multi_if.c      |  80 +++++----
> > >  .../vcodec/vdec/vdec_hevc_req_multi_if.c      |  67 ++++----
> > >  .../mediatek/vcodec/vdec/vdec_vp8_if.c        |  54 ++++---
> > >  .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  46 +++---
> > >  .../mediatek/vcodec/vdec/vdec_vp9_if.c        | 152 ++++++++++--
> > ------
> > >  .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  84 ++++++----
> > >  .../platform/mediatek/vcodec/vdec_vpu_if.c    |  59 ++++---
> > >  .../mediatek/vcodec/venc/venc_h264_if.c       |  86 +++++-----
> > >  .../mediatek/vcodec/venc/venc_vp8_if.c        |  48 +++---
> > >  .../platform/mediatek/vcodec/venc_vpu_if.c    |  64 ++++----
> > >  14 files changed, 565 insertions(+), 407 deletions(-)
> > >=20
> > > diff --git
> > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > index ecb0bdf3a4f4..ddc12c3e2983 100644
> > > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
> > > @@ -31,9 +31,8 @@ struct mtk_vcodec_dev;
> > >  #define mtk_v4l2_err(fmt, args...)                \
> > >  pr_err("[MTK_V4L2][ERROR] " fmt "\n", ##args)
> > > =20
> > > -#define mtk_vcodec_err(h, fmt, args...)\
> > > -pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n",\
> > > -       ((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
> > > +#define mtk_vcodec_err(plat_dev, inst_id, fmt,
> > args...)                                 \
> > > +dev_err(&(plat_dev)->dev, "[MTK_VCODEC][ERROR][%d]: " fmt "\n",
> > inst_id, ##args)
> > > =20
> > >  #if defined(CONFIG_DEBUG_FS)
> > >  extern int mtk_v4l2_dbg_level;
> > > @@ -46,27 +45,24 @@ extern int mtk_vcodec_dbg;
> > >   __func__, __LINE__, ##args);        \
> > >  } while (0)
> > > =20
> > > -#define mtk_vcodec_debug(h, fmt, args...)                      \
> > > -do {                      \
> > > -if (mtk_vcodec_dbg)                      \
> > > -dev_dbg(&(((struct mtk_vcodec_ctx *)(h)->ctx)->dev->plat_dev-
> > > dev),   \
> > > -"[MTK_VCODEC][%d]: %s, %d " fmt "\n",                         \
> > > -((struct mtk_vcodec_ctx *)(h)->ctx)->id,                      \
> > > -__func__, __LINE__, ##args);                                  \
> > > +#define mtk_vcodec_debug(plat_dev, inst_id, fmt,
> > args...)                               \
> > > +do
> > {                                                                   =
=20
> >         \
> > > +if
> > (mtk_vcodec_dbg)                                                    =
=20
> > \
> > > +dev_dbg(&(plat_dev)->dev, "[MTK_VCODEC][%d]: %s, %d " fmt "\n", \
> >=20
> > At least in this patch, you systematically pass plat_dev as
> > <something>->ctx->dev->plat_dev, which is quite long and verbose, any
> > reason we
> > can't just pass that <something> here ? We can follow the same
> > structure path
> > for both encoder/decoder ?
> >=20
>=20
> In order to separate encode and decoder, need to define two different
> struct mtk_vcodec_dec_ctx and struct mtk_vcodec_enc_ctx.
>=20
> struct mtk_vcodec_ctx won't be used again, need to use platform device
> to print dev_dbg and dev_err.
>=20
> encoder and decoder using the same interface to print log message.

Just a reminder, I'm just making suggestions, there is no strict action req=
uired
here other then a discussion to try and make the logging a bit more light.

My points was that C macros don't care about types, so if you keep the path=
 to
the platform device the same (ctx->dev->plat_dev), you could just pass the =
ctx
as argument. What I don't know though myself, is if this is actually feasib=
le in
all code path, but considering you had access to the instance previously, I
thought it should.

regards,
Nicolas

>=20
> Best Regards,
> Yunfei Dong
> > > +inst_id, __func__, __LINE__, ##args);                   \
> > >  } while (0)
> > >  #else
> > >  #define mtk_v4l2_debug(level, fmt, args...) pr_debug(fmt, ##args)
> > > =20
> > > -#define mtk_vcodec_debug(h, fmt, args...)\
> > > -pr_debug("[MTK_VCODEC][%d]: " fmt "\n",\
> >=20
> ...snip...


