Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6108C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dB9MOCe0cf8l6ipE8DChK4N8ZfvEUu5NP9jC9BYNT1E=; b=2nAKHdkog/boDGIv0sBKX1NIpz
	EYRDTJtYRMb0qxtHnTVtgDvG1a/rE4h4IfS7u9/B5kwZfM7AWwIsZbvPcFQkgjGXxQ4uS+AsKsfYG
	SIexhHr8resOBSuL15ns76QvgpkCI26XpQqKpOD82iS+Ye/ExqDL5qjU/vvWVAxfUOWJB3nZSeb1W
	2fb6LYs2c5vatGxF7A+UmNHuZH+NT3ryUXw+OeRU+xvOSUysjaO9kuN2u42PhE96ObJFChv8FpRu+
	M3Ca6909+ijFYk37dTRyER/dELv4kuIetP53CdPNMkN1dZXXU/z9yDb2XffCbtLzu6YAaCTOPATwf
	hQukXmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA9UW-005FNF-2J; Wed, 19 Jan 2022 11:51:04 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA9UG-005FHp-Io; Wed, 19 Jan 2022 11:50:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D56AC1F41B72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642593047;
 bh=ZDXusnKss3SgqSE9L3JA19reKc+Pw1Zd9j8G4yPKtAI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=M4+gNzJ15og4zljTpYBotnMchN5cQKChFRvyR5ASSshs9VUJKYR4YdkLx7uQ3uRoS
 zeRPLhF29Nuptro6qDkxhyi4wMoIUpJTA/vBhyf8aJW9iBfsD5/bXEUw8AXdiS/bi6
 0nxlSzGQfoFrFLpQau6wq+7AfabYS3bLGrlTZBuJS5Oc18J4+UBMKB0nTGVgBlQ7Vb
 PDrq6q6fSNbEg1QwwON2yrMsVbTZO0uwmK8ZJrYpak9ARwwUxHDBZRt95bcU0D0Npx
 N+ivniF1PUxR8E6ohCrSiWgTy7+lspqYvMLCR0zUtiZ5nWAg7AMyL9fMOhWVL6I1uf
 ybUE0eJPjwHTg==
Subject: Re: [PATCH v5, 15/15] media: mtk-vcodec: support stateless VP9
 decoding
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220117094001.20049-1-yunfei.dong@mediatek.com>
 <20220117094001.20049-16-yunfei.dong@mediatek.com>
 <275affff-12d9-4659-e900-aa9c306e6701@collabora.com>
Message-ID: <eaf4f649-89fc-77ff-dab1-2c837cd8c877@collabora.com>
Date: Wed, 19 Jan 2022 12:50:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <275affff-12d9-4659-e900-aa9c306e6701@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_035048_912082_905F59BB 
X-CRM114-Status: GOOD (  28.30  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 19/01/22 12:28, AngeloGioacchino Del Regno ha scritto:
> Il 17/01/22 10:40, Yunfei Dong ha scritto:
>> Add support for VP9 decoding using the stateless API,
>> as supported by MT8192. And the drivers is lat and core architecture.
>>
>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>> Signed-off-by: George Sun <george.sun@mediatek.com>
>> ---
>> =A0 drivers/media/platform/mtk-vcodec/Makefile=A0=A0=A0 |=A0=A0=A0 1 +
>> =A0 .../mtk-vcodec/mtk_vcodec_dec_stateless.c=A0=A0=A0=A0 |=A0=A0 26 +-
>> =A0 .../platform/mtk-vcodec/mtk_vcodec_drv.h=A0=A0=A0=A0=A0 |=A0=A0=A0 1=
 +
>> =A0 .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c=A0=A0=A0=A0 | 1973 +++++++=
++++++++++
>> =A0 .../media/platform/mtk-vcodec/vdec_drv_if.c=A0=A0 |=A0=A0=A0 4 +
>> =A0 .../media/platform/mtk-vcodec/vdec_drv_if.h=A0=A0 |=A0=A0=A0 1 +
>> =A0 6 files changed, 2003 insertions(+), 3 deletions(-)
>> =A0 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_r=
eq_lat_if.c
>>
> =

> Hello Yunfei,
> this driver is based on an older version of the VP9 stateless decoder uAP=
I,
> hence this is not applicable upstream.
> =

> The latest linux-next tag (as of today) already contains the new and
> accepted code; can you please rebase over that one?
> =

> Thanks,
> Angelo

While finishing a rebase, I had time to do a fast port of this patch; in ho=
pes
to spare you some time, I'm giving you my (fast) take at this.

Feel free to use it as you wish!


 From 5f329ad271c94bf82d2dd12075372159466c28f9 Mon Sep 17 00:00:00 2001

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Date: Wed, 19 Jan 2022 12:45:18 +0100

Subject: [PATCH] media: mtk-vcodec: Port VP9 stateless driver to upstream u=
API



This driver was written based on an old VP9 uAPI, but that code

changed over time: port this over the newest, and upstream accepted,

VP9 uAPI.



Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

---

  .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |  2 +-

  .../mtk-vcodec/vdec/vdec_vp9_req_lat_if.c     | 29 +++++++------------

  2 files changed, 12 insertions(+), 19 deletions(-)



diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c =

b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

index 26fd97d867e9..7f4baa39bf6c 100644

--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c

@@ -94,7 +94,7 @@ static const struct mtk_stateless_control =

mtk_stateless_controls[] =3D {

  	},

  	{

  		.cfg =3D {

-			.id =3D V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS,

+			.id =3D V4L2_CID_STATELESS_VP9_FRAME,

  			},

  		.codec_type =3D V4L2_PIX_FMT_VP9_FRAME,

  	},

diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c =

b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

index 92cd39f00840..8caf4f28db29 100644

--- a/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

+++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_vp9_req_lat_if.c

@@ -711,7 +711,7 @@ static int vdec_vp9_slice_setup_lat_from_src_buf(struct =

vdec_vp9_slice_instance



  static void vdec_vp9_slice_setup_hdr(struct vdec_vp9_slice_instance *inst=
ance,

  				     struct vdec_vp9_slice_uncompressed_header *uh,

-				     struct v4l2_ctrl_vp9_frame_decode_params *hdr)

+				     struct v4l2_ctrl_vp9_frame *hdr)

  {

  	int i;



@@ -749,13 +749,13 @@ static void vdec_vp9_slice_setup_hdr(struct =

vdec_vp9_slice_instance *instance,

  	 * - LAST_FRAME =3D 1,

  	 * - GOLDEN_FRAME =3D 2,

  	 * - ALTREF_FRAME =3D 3,

-	 * ref_frame_sign_biases[INTRA_FRAME] is always 0

+	 * ref_frame_sign_bias[INTRA_FRAME] is always 0

  	 * and VDA only passes another 3 directions

  	 */

  	uh->ref_frame_sign_bias[0] =3D 0;

  	for (i =3D 0; i < 3; i++)

  		uh->ref_frame_sign_bias[i + 1] =3D

-			!!(hdr->ref_frame_sign_biases & (1 << i));

+			!!(hdr->ref_frame_sign_bias & (1 << i));

  	uh->allow_high_precision_mv =3D HDR_FLAG(ALLOW_HIGH_PREC_MV);

  	uh->interpolation_filter =3D hdr->interpolation_filter;

  	uh->refresh_frame_context =3D HDR_FLAG(REFRESH_FRAME_CTX);

@@ -772,7 +772,7 @@ static void vdec_vp9_slice_setup_hdr(struct =

vdec_vp9_slice_instance *instance,



  static void vdec_vp9_slice_setup_frame_ctx(struct vdec_vp9_slice_instance=
 *instance,

  					   struct vdec_vp9_slice_uncompressed_header *uh,

-					   struct v4l2_ctrl_vp9_frame_decode_params *hdr)

+					   struct v4l2_ctrl_vp9_frame *hdr)

  {

  	int error_resilient_mode;

  	int reset_frame_context;

@@ -857,7 +857,7 @@ static void vdec_vp9_slice_setup_segmentation(struct =

vdec_vp9_slice_uncompressed

  }



  static int vdec_vp9_slice_setup_tile(struct vdec_vp9_slice_vsi *vsi,

-				     struct v4l2_ctrl_vp9_frame_decode_params *hdr)

+				     struct v4l2_ctrl_vp9_frame *hdr)

  {

  	unsigned int rows_log2;

  	unsigned int cols_log2;

@@ -909,19 +909,10 @@ static void vdec_vp9_slice_setup_state(struct =

vdec_vp9_slice_vsi *vsi)

  	memset(&vsi->state, 0, sizeof(vsi->state));

  }



-static void vdec_vp9_slice_setup_ref_idx(struct vdec_vp9_slice_pfc *pfc,

-					 struct v4l2_ctrl_vp9_frame_decode_params *hdr)

-{

-	int i;

-

-	for (i =3D 0; i < 3; i++)

-		pfc->ref_idx[i] =3D hdr->refs[i];

-}

-

  static int vdec_vp9_slice_setup_pfc(struct vdec_vp9_slice_instance *insta=
nce,

  				    struct vdec_vp9_slice_pfc *pfc)

  {

-	struct v4l2_ctrl_vp9_frame_decode_params *hdr;

+	struct v4l2_ctrl_vp9_frame *hdr;

  	struct vdec_vp9_slice_uncompressed_header *uh;

  	struct v4l2_ctrl *hdr_ctrl;

  	struct vdec_vp9_slice_vsi *vsi;

@@ -929,7 +920,7 @@ static int vdec_vp9_slice_setup_pfc(struct =

vdec_vp9_slice_instance *instance,



  	/* frame header */

  	hdr_ctrl =3D v4l2_ctrl_find(&instance->ctx->ctrl_hdl,

-				  V4L2_CID_MPEG_VIDEO_VP9_FRAME_DECODE_PARAMS);

+				  V4L2_CID_STATELESS_VP9_FRAME);

  	if (!hdr_ctrl || !hdr_ctrl->p_cur.p)

  		return -EINVAL;



@@ -949,7 +940,9 @@ static int vdec_vp9_slice_setup_pfc(struct =

vdec_vp9_slice_instance *instance,

  	vdec_vp9_slice_setup_state(vsi);



  	/* core stage needs buffer index to get ref y/c ... */

-	vdec_vp9_slice_setup_ref_idx(pfc, hdr);

+	pfc->ref_idx[0] =3D hdr->last_frame_ts;

+	pfc->ref_idx[1] =3D hdr->golden_frame_ts;

+	pfc->ref_idx[2] =3D hdr->alt_frame_ts;



  	pfc->seq =3D instance->seq;

  	instance->seq++;

@@ -1789,7 +1782,7 @@ static void vdec_vp9_slice_get_crop_info(struct =

vdec_vp9_slice_instance *instanc

  			 cr->left, cr->top, cr->width, cr->height);

  }



-static int vdec_vp9_slice_get_param(void *h_vdec, vdec_get_param_type type=
, void *out)

+static int vdec_vp9_slice_get_param(void *h_vdec, enum vdec_get_param_type=
 type, =

void *out)

  {

  	struct vdec_vp9_slice_instance *instance =3D h_vdec;



-- =


2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
