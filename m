Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D81DC48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 17:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TJDpiQS0mzwh7myIO+xWtjFUw057mz9Kw5WxBUdIdQ=; b=i37gvj7aUyAOiEXrj39u26x5ti
	SJsoxiKHzlpULnPp+D23bZYdb8qyaDK77reBLebsolZ/RhMBoMixrsuLLk8WI7CRg/K+VEu6T0tDa
	ELZmJbxOXbIDGNYPgk4nsBEFncE+0U4ghg//gYJVdyhiBRoy9yUvgjlgkBm88jEamAN7LnbTTT4UE
	6xbsn0IS+vyLglLQLHHPjvUIevwD3LfnBC/U9W6234jpnXxeDZIGpWkzlWJMg+U7+f3YqBsj3LrXf
	OFt7ngdVFPHQpYiWaSHbrhqlVooBP+NnrQ+NXiAPuhE+X23i/pfqmHmlQJyhE4pydnjbHOEriufLo
	gM25Rwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reets-000000020pM-2ak1;
	Mon, 26 Feb 2024 17:36:24 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reetp-000000020nY-1150
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 17:36:22 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7810827e54eso269671385a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968979; x=1709573779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TJDpiQS0mzwh7myIO+xWtjFUw057mz9Kw5WxBUdIdQ=;
        b=kbatbZAIBXsPROn0t4X1zcFM69k+zq1MYR4Vw8QEjCfaVUTrnbWOzu4VCDHQlYMYJB
         1qeewf6cEE+h7Gf3qvn/KyhDklBdk0xA///GrAo1ntTmJKrGDN57Ft8ihIk1ZUtbnbLq
         SOl4CSmxacQSQDqs7mXAgNzDK9x/zm68hLtv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968979; x=1709573779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TJDpiQS0mzwh7myIO+xWtjFUw057mz9Kw5WxBUdIdQ=;
        b=KVcN3iFdYK5UQ76Llx7ldo1Wgonh+GGunos9HT0+1CKtvUViBPJlCKJ9J2gYSLCVMY
         vKg8UH1/rejUuzHoIL16KHHOQIgiv7za5mbTbNlTZhbL5p22hzFENSdeCLfsLZZfAFcZ
         MDWVw9hNo9rdAn06ihW0/RucKFP+NFGJoTtw1NuSoadtNHleJMcr5yqDMuVBqcaYNKl3
         b45qeoM/QMzD0cxuJt5FZ4iXaYkUPdjLZEUzx00wEaUgkd9eqmRVJirTo8XlpfNVbA+h
         apv67UkquP9fnk/uTAvHmV2K8/JUX3qzFyUKXP4zEQMaeeIJynZJt2WwFB65JLRvekPR
         oexQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9BvfWNwZ/T0OX/dWh7kcY4oK+ETapglwWU/vt/8XVfGWukLFoe3q6gg+TtFsjjBh+IrjtDpTb/8tU0WCUdGAlRQOYgM3B1wIJ6GgKfMQ9IdV/
X-Gm-Message-State: AOJu0YwuVCA+xBnwMmk2kH3Vl57gA/nDkuj3CBuxPziXzGW6aopkpvBG
	xemSIuCGGlle+03QeoWteZc3FK0MfaFHJNdt1GMEqaNfE/oU2lD8u2+p68sKuqqNcbTrqGvVkDk
	=
X-Google-Smtp-Source: AGHT+IE1SrOW3EIhJrvvCxLl9qECQH6W2ClsZPlZ25oyo/ygp2lDNgKSnd9CPSL7FsdfjbLVRaY+jA==
X-Received: by 2002:ae9:e117:0:b0:787:a901:ecb4 with SMTP id g23-20020ae9e117000000b00787a901ecb4mr7439891qkm.71.1708968978800;
        Mon, 26 Feb 2024 09:36:18 -0800 (PST)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a204300b00787ad324b83sm2668616qka.120.2024.02.26.09.36.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:36:17 -0800 (PST)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68f748cdc8bso15604926d6.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:36:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXASHZcPUofzvUaSKkORJF8NjKBSIaU2b876AnxyQSKwByrx6kiuY4iKAxTrjtCl16KhejJkzPCwqN+Uln3t874muCblRPnJotVw8ONPlM+GTQr
X-Received: by 2002:a05:6214:1c8a:b0:68f:5fce:66f1 with SMTP id
 ib10-20020a0562141c8a00b0068f5fce66f1mr8157094qvb.46.1708968976685; Mon, 26
 Feb 2024 09:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org> <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-3-fa1bc931d17e@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 18:35:59 +0100
X-Gmail-Original-Message-ID: <CANiDSCtvLkWJ=-DgnAGFmHSuXy_ZCcgxfccQQ3cK_6y+WkML6A@mail.gmail.com>
Message-ID: <CANiDSCtvLkWJ=-DgnAGFmHSuXy_ZCcgxfccQQ3cK_6y+WkML6A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] media: mediatek: vcodedc: Fix Wcast-function-type-strict
 warnings
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	nfraprado@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_093621_301696_20EA908C 
X-CRM114-Status: GOOD (  23.06  )
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

Hi

On Mon, 26 Feb 2024 at 18:32, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Building with LLVM=3D1 throws the following warning:
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: =
warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned=
 int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned in=
t, void *)') converts to incompatible function type [-Wcast-function-type-s=
trict]
>
> Constify the types to avoid the warning.

Please note that this has only been compile tested.


>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c          | 12 ++++++=
------
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h    |  2 +-
>  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 10 +-----=
----
>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c |  2 +-
>  drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c |  2 +-
>  drivers/remoteproc/mtk_scp.c                                 |  4 ++--
>  include/linux/remoteproc/mtk_scp.h                           |  2 +-
>  include/linux/rpmsg/mtk_rpmsg.h                              |  2 +-
>  8 files changed, 14 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/driver=
s/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> index 49fc2e9d45dd5..c4f1c49b9d52a 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
> @@ -77,10 +77,10 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
>                 dma_free_wc(dev, vpu->config_size, vpu->config, vpu->conf=
ig_addr);
>  }
>
> -static void mdp_vpu_ipi_handle_init_ack(void *data, unsigned int len,
> +static void mdp_vpu_ipi_handle_init_ack(const void *data, unsigned int l=
en,
>                                         void *priv)
>  {
> -       struct mdp_ipi_init_msg *msg =3D (struct mdp_ipi_init_msg *)data;
> +       const struct mdp_ipi_init_msg *msg =3D data;
>         struct mdp_vpu_dev *vpu =3D
>                 (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
>
> @@ -91,10 +91,10 @@ static void mdp_vpu_ipi_handle_init_ack(void *data, u=
nsigned int len,
>         complete(&vpu->ipi_acked);
>  }
>
> -static void mdp_vpu_ipi_handle_deinit_ack(void *data, unsigned int len,
> +static void mdp_vpu_ipi_handle_deinit_ack(const void *data, unsigned int=
 len,
>                                           void *priv)
>  {
> -       struct mdp_ipi_deinit_msg *msg =3D (struct mdp_ipi_deinit_msg *)d=
ata;
> +       const struct mdp_ipi_deinit_msg *msg =3D data;
>         struct mdp_vpu_dev *vpu =3D
>                 (struct mdp_vpu_dev *)(unsigned long)msg->drv_data;
>
> @@ -102,10 +102,10 @@ static void mdp_vpu_ipi_handle_deinit_ack(void *dat=
a, unsigned int len,
>         complete(&vpu->ipi_acked);
>  }
>
> -static void mdp_vpu_ipi_handle_frame_ack(void *data, unsigned int len,
> +static void mdp_vpu_ipi_handle_frame_ack(const void *data, unsigned int =
len,
>                                          void *priv)
>  {
> -       struct img_sw_addr *addr =3D (struct img_sw_addr *)data;
> +       const struct img_sw_addr *addr =3D data;
>         struct img_ipi_frameparam *param =3D
>                 (struct img_ipi_frameparam *)(unsigned long)addr->va;
>         struct mdp_vpu_dev *vpu =3D
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index 300363a40158c..2561b99c95871 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -23,7 +23,7 @@ enum mtk_vcodec_fw_use {
>
>  struct mtk_vcodec_fw;
>
> -typedef void (*mtk_vcodec_ipi_handler) (void *data,
> +typedef void (*mtk_vcodec_ipi_handler) (const void *data,
>         unsigned int len, void *priv);
>
>  struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vcodec_f=
w_type type,
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 9f6e4b59455da..4c34344dc7dcb 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -29,15 +29,7 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_=
vcodec_fw *fw, int id,
>                                            mtk_vcodec_ipi_handler handler=
,
>                                            const char *name, void *priv)
>  {
> -       /*
> -        * The handler we receive takes a void * as its first argument. W=
e
> -        * cannot change this because it needs to be passed down to the r=
proc
> -        * subsystem when SCP is used. VPU takes a const argument, which =
is
> -        * more constrained, so the conversion below is safe.
> -        */
> -       ipi_handler_t handler_const =3D (ipi_handler_t)handler;
> -
> -       return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
> +       return vpu_ipi_register(fw->pdev, id, handler, name, priv);
>  }
>
>  static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, voi=
d *buf,
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82e57ae983d55..a840dd2a48d0e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -97,7 +97,7 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_dec=
_dev *dec_dev, struct vde
>   * This function runs in interrupt context and it means there's an IPI M=
SG
>   * from VPU.
>   */
> -static void vpu_dec_ipi_handler(void *data, unsigned int len, void *priv=
)
> +static void vpu_dec_ipi_handler(const void *data, unsigned int len, void=
 *priv)
>  {
>         struct mtk_vcodec_dec_dev *dec_dev;
>         const struct vdec_vpu_ipi_ack *msg =3D data;
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> index 84ad1cc6ad171..ea0c4a281d1a1 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
> @@ -57,7 +57,7 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc=
_dev *enc_dev, struct ven
>         return ret;
>  }
>
> -static void vpu_enc_ipi_handler(void *data, unsigned int len, void *priv=
)
> +static void vpu_enc_ipi_handler(const void *data, unsigned int len, void=
 *priv)
>  {
>         struct mtk_vcodec_enc_dev *enc_dev;
>         const struct venc_vpu_ipi_msg_common *msg =3D data;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index a35409eda0cf2..b508136b416a8 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -78,10 +78,10 @@ static void scp_wdt_handler(struct mtk_scp *scp, u32 =
scp_to_host)
>                 rproc_report_crash(scp_node->rproc, RPROC_WATCHDOG);
>  }
>
> -static void scp_init_ipi_handler(void *data, unsigned int len, void *pri=
v)
> +static void scp_init_ipi_handler(const void *data, unsigned int len, voi=
d *priv)
>  {
>         struct mtk_scp *scp =3D priv;
> -       struct scp_run *run =3D data;
> +       const struct scp_run *run =3D data;
>
>         scp->run.signaled =3D run->signaled;
>         strscpy(scp->run.fw_ver, run->fw_ver, SCP_FW_VER_LEN);
> diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remotepro=
c/mtk_scp.h
> index 7c2b7cc9fe6c1..84e579940b8e5 100644
> --- a/include/linux/remoteproc/mtk_scp.h
> +++ b/include/linux/remoteproc/mtk_scp.h
> @@ -8,7 +8,7 @@
>
>  #include <linux/platform_device.h>
>
> -typedef void (*scp_ipi_handler_t) (void *data,
> +typedef void (*scp_ipi_handler_t) (const void *data,
>                                    unsigned int len,
>                                    void *priv);
>  struct mtk_scp;
> diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rp=
msg.h
> index 363b60178040b..9d67507471fba 100644
> --- a/include/linux/rpmsg/mtk_rpmsg.h
> +++ b/include/linux/rpmsg/mtk_rpmsg.h
> @@ -9,7 +9,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
>
> -typedef void (*ipi_handler_t)(void *data, unsigned int len, void *priv);
> +typedef void (*ipi_handler_t)(const void *data, unsigned int len, void *=
priv);
>
>  /*
>   * struct mtk_rpmsg_info - IPI functions tied to the rpmsg device.
>
> --
> 2.44.0.rc0.258.g7320e95886-goog
>


--=20
Ricardo Ribalda

