Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0161C54798
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXH12Tos9R5LH3IGuLqHagwvQIUCehbeCr2Uw+9roXA=; b=3zUCWl/QgXVxF4hNxQxjmQz24a
	ay9yoHx50FBCj36DBHt80/htgASfx3ie2qNM3lnqf8SRzO6qsEpilxBAkz6mPUUjga/lyCdjh2U2Y
	4k5e+CWjMVEVhJ319hVaHW2Cqc0yE8/y1vYGGZ+hSuCZU/KfjvoLgAw/9/QLF7+7k9Qhpi6r6V0hE
	lDpcM+CYutBS9yPKOMXFW2o/LVjGRWgT5aOoftf+hmZ3aZVONG2BtPUKdEV/+xGG2z7iJhmo/5EeN
	p5+lrZDgL9EVO7KtAsWC0A6zhvlBLAeeQgoOb3iXVXJG+YW783+s/3aA9K7/OIzJAXbHAWGJ9yGHW
	FY87RZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revkV-00000004xZ8-3gDD;
	Tue, 27 Feb 2024 11:35:51 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revkR-00000004xWg-37WV
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Feb 2024 11:35:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e4560664b5so3435969b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709033746; x=1709638546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXH12Tos9R5LH3IGuLqHagwvQIUCehbeCr2Uw+9roXA=;
        b=Fafp1bBTSLcSbZcSzLtazSo92REZEd/7AdhAc8zcJ5ydWLLjBz8kMNUibPt+9tirH9
         DoXlpXnTsnWMlre5UI3D4zkc1xvtufA9jS5Rptx8VA8IcixePMSiCqU3V8eeeNf77g6U
         AVJfaqi7Vv/jryx2hbEVc6I1ee+FyAVe9wfEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033746; x=1709638546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXH12Tos9R5LH3IGuLqHagwvQIUCehbeCr2Uw+9roXA=;
        b=q9gXhnCfWLzYBi+vNRlcimRrOZmUwdJLsydZocsf6ldeKsLSuX5DSViRYJqhE567vk
         ky+soxBql0/2bU1hBRMc4XaqpwKskyICXvR6whrbyEQ43FXytmkcuG7h87cLHPGryfqG
         tGGZaGi32rp2U0kplcKvTIte32x4Q0u4Be30OKi1oB9m+OiEvxt5W7p/lO2qorqPa5ga
         GS3DjtrKkJ+FcTNYgZ3vxEMnKEt3hH/O0dtMo5okmnkTNdgYww1fuHjh5x5ohovCi/D3
         Li+KLvMpL4QdI0g5NJbQrdLXLY+ebE80PYUwlGzHvbq9eTCLdexiSfTDZZah/d84X7d7
         aYhg==
X-Forwarded-Encrypted: i=1; AJvYcCWO3Tf2+0NBsrGQ99+v1TVDRUU/uaKEbSFOiMPvCSN/dpOEWzWRDANsYq/73W1+gQyqOtSarvRajwAwCYVbW9YKbbaZIhCQcxAD7Ab1OC0Dmx5m
X-Gm-Message-State: AOJu0YzLr7Sjgh6R9aRiPcRIJ4T85/vE7hDhcqY6CVHbCIcQh0tcGLmc
	ghUUFY6z/7DP/DoCpmv98ykSO1cASz5UNxc+eMaGTvudFyuHaiRONEmcADvRufciTX2veqKxXxM
	BWA==
X-Google-Smtp-Source: AGHT+IE22OvTWJk+xJGz329pNfMM982+egnS0bjqymnIshED73JeLorPq8rE9grbUkhNA4q7rSVYqg==
X-Received: by 2002:a05:6a21:1394:b0:1a0:e17c:d771 with SMTP id oa20-20020a056a21139400b001a0e17cd771mr1826219pzb.7.1709033745676;
        Tue, 27 Feb 2024 03:35:45 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id g24-20020a170902fe1800b001db3bffd1a8sm1342228plj.42.2024.02.27.03.35.45
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 03:35:45 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6da9c834646so4127346b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Feb 2024 03:35:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUpWFh74ZHEDjSY8izzM5MLCgCjRIxXyKt0v076atpJhTjgvUmAx7fsfl9z42gQ4BiCHac7EPeaSejgCrJhK60CgHMx4FCw/DPPdQMAnKPe2zx
X-Received: by 2002:a05:6358:1298:b0:17b:6c3f:1c9a with SMTP id
 e24-20020a056358129800b0017b6c3f1c9amr7617829rwi.7.1709033723875; Tue, 27 Feb
 2024 03:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
 <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org> <c25638af-d40d-4dbc-a179-efb6f29c38aa@xs4all.nl>
In-Reply-To: <c25638af-d40d-4dbc-a179-efb6f29c38aa@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 27 Feb 2024 12:35:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
Message-ID: <CANiDSCsMVR7gqzwrhPCWb7dQcezWbcHxkPNLZJrW=TWaAn+kXA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_033547_842885_3B307D3D 
X-CRM114-Status: GOOD (  29.07  )
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

Hi Hans

On Tue, 27 Feb 2024 at 12:17, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Ricardo,
>
> First of all, note the typo in theo subject line: vcodedc -> vcodec.
>
> There is also a similar (but not identical!) patch from Arnd:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20240224121059.18=
06691-1-arnd@kernel.org/
>
> That patch and yours share the change to common/mtk_vcodec_fw_vpu.c but o=
therwise
> they are different, which is a bit odd.
>
> Can you take a look at Arnd's patch and see if you need to incorporate hi=
s changes
> into your patch?

We went separate paths :), I tried to make everything const (and
therefore the remoteproc changes) and he removed the const.

His patch looks good to me. Shall I resend the series without this
patch or you can ignore 3/3 and take 1 and 2?

Thanks!

>
> Regards,
>
>         Hans
>
> On 26/02/2024 18:32, Ricardo Ribalda wrote:
> > Building with LLVM=3D1 throws the following warning:
> > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32=
: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsign=
ed int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned =
int, void *)') converts to incompatible function type [-Wcast-function-type=
-strict]
> >
> > Constify the types to avoid the warning.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c          | 12 ++++=
++------
> >  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h    |  2 +-
> >  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 10 +---=
------
> >  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  2 +-
> >  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c |  2 +-
> >  drivers/remoteproc/mtk_scp.c                                 |  4 ++--
> >  include/linux/remoteproc/mtk_scp.h                           |  2 +-
> >  include/linux/rpmsg/mtk_rpmsg.h                              |  2 +-
> >  8 files changed, 14 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/driv=
ers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > index 49fc2e9d45dd5..c4f1c49b9d52a 100644
> > --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> > @@ -77,10 +77,10 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vp=
u)
> >               dma_free_wc(dev, vpu->config_size, vpu->config, vpu->conf=
ig_addr);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
> > +static void mdp_vpu_ipi_handle_init_ack(const void *data, unsigned int=
 len,
> >                                       void *priv)
> >  {
> > -     struct mdp_ipi_init_msg *msg =3D (struct mdp_ipi_init_msg *)data;
> > +     const struct mdp_ipi_init_msg *msg =3D data;
> >       struct mdp_vpu_dev *vpu =3D
> >               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> >
> > @@ -91,10 +91,10 @@ static void mdp_vpu_ipi_handle_init_ack(void *data,=
 unsigned int len,
> >       complete(&vpu->ipi_acked);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len=
,
> > +static void mdp_vpu_ipi_handle_deinit_ack(const void *data, unsigned i=
nt len,
> >                                         void *priv)
> >  {
> > -     struct mdp_ipi_deinit_msg *msg =3D (struct mdp_ipi_deinit_msg *)d=
ata;
> > +     const struct mdp_ipi_deinit_msg *msg =3D data;
> >       struct mdp_vpu_dev *vpu =3D
> >               (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
> >
> > @@ -102,10 +102,10 @@ static void mdp_vpu_ipi_handle_deinit_ack(void *d=
ata, unsigned int len,
> >       complete(&vpu->ipi_acked);
> >  }
> >
> > -static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
> > +static void mdp_vpu_ipi_handle_frame_ack(const void *data, unsigned in=
t len,
> >                                        void *priv)
> >  {
> > -     struct img_sw_addr *addr =3D (struct img_sw_addr *)data;
> > +     const struct img_sw_addr *addr =3D data;
> >       struct img_ipi_frameparam *param =3D
> >               (struct img_ipi_frameparam *)(unsigned long)addr->va;
> >       struct mdp_vpu_dev *vpu =3D
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w.h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > index 300363a40158c..2561b99c95871 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> > @@ -23,7 +23,7 @@ enum mtk_vcodec_fw_use {
> >
> >  struct mtk_vcodec_fw;
> >
> > -typedef void (*mtk_vcodec_ipi_handler) (void *data,
> > +typedef void (*mtk_vcodec_ipi_handler) (const void *data,
> >       unsigned int len, void *priv);
> >
> >  struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec=
_fw_type type,
> > diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_f=
w_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > index 9f6e4b59455da..4c34344dc7dcb 100644
> > --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> > @@ -29,15 +29,7 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mt=
k_vcodec_fw *fw, int id,
> >                                          mtk_vcodec_ipi_handler handler=
,
> >                                          const char *name, void *priv)
> >  {
> > -     /*
> > -      * The handler we receive takes a void * as its first argument. W=
e
> > -      * cannot change this because it needs to be passed down to the r=
proc
> > -      * subsystem when SCP is used. VPU takes a const argument, which =
is
> > -      * more constrained, so the conversion below is safe.
> > -      */
> > -     ipi_handler_t handler_const =3D (ipi_handler_t)handler;
> > -
> > -     return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
> > +     return vpu_ipi_register(fw->pdev, id, handler, name, priv);
> >  }
> >
> >  static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, v=
oid *buf,
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > index 82e57ae983d55..a840dd2a48d0e 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> > @@ -97,7 +97,7 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_d=
ec_dev *dec_dev, struct vde
> >   * This function runs in interrupt context and it means there's an IPI=
 MSG
> >   * from VPU.
> >   */
> > -static void vpu_dec_ipi_handler(void *data, unsigned int len, void *pr=
iv)
> > +static void vpu_dec_ipi_handler(const void *data, unsigned int len, vo=
id *priv)
> >  {
> >       struct mtk_vcodec_dec_dev *dec_dev;
> >       const struct vdec_vpu_ipi_ack *msg =3D data;
> > diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if=
.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > index 84ad1cc6ad171..ea0c4a281d1a1 100644
> > --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> > @@ -57,7 +57,7 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_e=
nc_dev *enc_dev, struct ven
> >       return ret;
> >  }
> >
> > -static void vpu_enc_ipi_handler(void *data, unsigned int len, void *pr=
iv)
> > +static void vpu_enc_ipi_handler(const void *data, unsigned int len, vo=
id *priv)
> >  {
> >       struct mtk_vcodec_enc_dev *enc_dev;
> >       const struct venc_vpu_ipi_msg_common *msg =3D data;
> > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.=
c
> > index a35409eda0cf2..b508136b416a8 100644
> > --- a/drivers/remoteproc/mtk_scp.c
> > +++ b/drivers/remoteproc/mtk_scp.c
> > @@ -78,10 +78,10 @@ static void scp_wdt_handler(struct mtk_scp *scp, u3=
2 scp_to_host)
> >               rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
> >  }
> >
> > -static void scp_init_ipi_handler(void *data, unsigned int len, void *p=
riv)
> > +static void scp_init_ipi_handler(const void *data, unsigned int len, v=
oid *priv)
> >  {
> >       struct mtk_scp *scp =3D priv;
> > -     struct scp_run *run =3D data;
> > +     const struct scp_run *run =3D data;
> >
> >       scp->run.signaled =3D run->signaled;
> >       strscpy(scp->run.fw_ver, run->fw_ver, SCP_FW_VER_LEN);
> > diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remotep=
roc/mtk_scp.h
> > index 7c2b7cc9fe6c1..84e579940b8e5 100644
> > --- a/include/linux/remoteproc/mtk_scp.h
> > +++ b/include/linux/remoteproc/mtk_scp.h
> > @@ -8,7 +8,7 @@
> >
> >  #include <linux/platform_device.h>
> >
> > -typedef void (*scp_ipi_handler_t) (void *data,
> > +typedef void (*scp_ipi_handler_t) (const void *data,
> >                                  unsigned int len,
> >                                  void *priv);
> >  struct mtk_scp;
> > diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_=
rpmsg.h
> > index 363b60178040b..9d67507471fba 100644
> > --- a/include/linux/rpmsg/mtk_rpmsg.h
> > +++ b/include/linux/rpmsg/mtk_rpmsg.h
> > @@ -9,7 +9,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/remoteproc.h>
> >
> > -typedef void (*ipi_handler_t)(void *data, unsigned int len, void *priv=
);
> > +typedef void (*ipi_handler_t)(const void *data, unsigned int len, void=
 *priv);
> >
> >  /*
> >   * struct mtk_rpmsg_info - IPI functions tied to the rpmsg device.
> >
>


--=20
Ricardo Ribalda

