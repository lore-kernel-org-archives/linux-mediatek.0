Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2E4C54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 18:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v8H02/p+h7m4CmqlIKrKtykqCVjLsK7inRmdiWHWcQ=; b=IiVLY8c6Yn/kA2Mt9Ypm0mDkq6
	CM9PsfSdOUeFTaZpoYemF0UkyhV6TSxp/YdiNrz2EyM+Ah7mzWGxHhJaWQnttOv5XhQcVuK36eWMw
	dGJz0jW7UyeKMP8Gtpu33dgwlJW3i1AEr4tQPNuhnoXd2EGrY+5bLfHMrPFoZG/19IzG3AQpYc1FL
	LcBjUgpqCFpeiDu5tzMAAPC5Zp+6Le3ZbE54Rbeilw6PuGGov8ygRtqCHg/ZXSlQioFFyNyb2wfiL
	CLTtpmKptqI9kcAEpAvyLAa9LpWlhvwe4qgQsRMJ2iGa8UsEM2gjHitpJmi5rP3UC5ejIviUjrvbZ
	6yZeLb9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rda1x-0000000Alkw-2ixo;
	Fri, 23 Feb 2024 18:12:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rda1a-0000000AlbD-072u;
	Fri, 23 Feb 2024 18:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708711886;
	bh=1qxPBgoeZ+hsrF8RaQxLAaC4qD/6Jd10T4AbwhndHzs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=aPGYsU3kgQdSGQVBhiy+gZPw7VXjuoPjhm2wQLwRvfMuVO3DmzJmvBboopWcVgwGl
	 wTOVNnzN3L9HxvirGnP/YQ8/7AhpbnOd9IaNDFTKJEBRuVv1ZyNloJEiTpbwFXH4do
	 C4DJhKEW6GZvd7ZVbkCojZ1mdXrKiETYEXQKNCVD+yEwpjXbsWZAKB8F8TgWOPadDd
	 52PUxgHPPVkqL2LjIpVJwj545dFl9kkXKOTORnMDoWcf5UuYb5XE8Iz8VxGh9xklX4
	 KjvGcqoIVIgJwZTHMofrLv8AqdL7yaE0Oc46xyz8rB9DOn6cslTPAPPvYU9d6xmTfK
	 PmmXYe06P0R/g==
Received: from nicolas-tpx395.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 57C37378000E;
	Fri, 23 Feb 2024 18:11:24 +0000 (UTC)
Message-ID: <680e74eb187926560c8f55b5b2ca064514b985b6.camel@collabora.com>
Subject: Re: [PATCH v3,1/2] media: mediatek: vcodec: adding lock to protect
 decoder context list
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 23 Feb 2024 13:11:20 -0500
In-Reply-To: <20240222092609.31382-2-yunfei.dong@mediatek.com>
References: <20240222092609.31382-1-yunfei.dong@mediatek.com>
	 <20240222092609.31382-2-yunfei.dong@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_101154_259636_001AAFFF 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Yunfei,

Le jeudi 22 f=C3=A9vrier 2024 =C3=A0 17:26 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The ctx_list will be deleted when scp getting unexpected behavior, then t=
he
> ctx_list->next will be NULL, the kernel driver maybe access NULL pointer =
in
> function vpu_dec_ipi_handler when going through each context, then reboot=
.
>=20
> Need to add lock to protect the ctx_list to make sure the ctx_list->next =
isn't
> NULL pointer.
>=20
> Hardware name: Google juniper sku16 board (DT)
> pstate: 20400005 (nzCv daif +PAN -UAO -TCO BTYPE=3D--)
> pc : vpu_dec_ipi_handler+0x58/0x1f8 [mtk_vcodec_dec]
> lr : scp_ipi_handler+0xd0/0x194 [mtk_scp]
> sp : ffffffc0131dbbd0
> x29: ffffffc0131dbbd0 x28: 0000000000000000
> x27: ffffff9bb277f348 x26: ffffff9bb242ad00
> x25: ffffffd2d440d3b8 x24: ffffffd2a13ff1d4
> x23: ffffff9bb7fe85a0 x22: ffffffc0133fbdb0
> x21: 0000000000000010 x20: ffffff9b050ea328
> x19: ffffffc0131dbc08 x18: 0000000000001000
> x17: 0000000000000000 x16: ffffffd2d461c6e0
> x15: 0000000000000242 x14: 000000000000018f
> x13: 000000000000004d x12: 0000000000000000
> x11: 0000000000000001 x10: fffffffffffffff0
> x9 : ffffff9bb6e793a8 x8 : 0000000000000000
> x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000040 x4 : fffffffffffffff0
> x3 : 0000000000000020 x2 : ffffff9bb6e79080
> x1 : 0000000000000010 x0 : ffffffc0131dbc08
> Call trace:
> vpu_dec_ipi_handler+0x58/0x1f8 [mtk_vcodec_dec (HASH:6c3f 2)]
> scp_ipi_handler+0xd0/0x194 [mtk_scp (HASH:7046 3)]
> mt8183_scp_irq_handler+0x44/0x88 [mtk_scp (HASH:7046 3)]
> scp_irq_handler+0x48/0x90 [mtk_scp (HASH:7046 3)]
> irq_thread_fn+0x38/0x94
> irq_thread+0x100/0x1c0
> kthread+0x140/0x1fc
> ret_from_fork+0x10/0x30
> Code: 54000088 f94ca50a eb14015f 54000060 (f9400108)
> ---[ end trace ace43ce36cbd5c93 ]---
> Kernel panic - not syncing: Oops: Fatal exception
> SMP: stopping secondary CPUs
> Kernel Offset: 0x12c4000000 from 0xffffffc010000000
> PHYS_OFFSET: 0xffffffe580000000
> CPU features: 0x08240002,2188200c
> Memory Limit: none
>=20
> Fixes: 655b86e52eac ("media: mediatek: vcodec: Fix possible invalid memor=
y access for decoder")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

I've been experiencing this crasher recently, so nice to see you found the
problem.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 4 ++--
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c    | 5 +++++
>  .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h    | 2 ++
>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c | 2 ++
>  4 files changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 9f6e4b59455da..9a11a2c248045 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -58,12 +58,12 @@ static void mtk_vcodec_vpu_reset_dec_handler(void *pr=
iv)
> =20
>  	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
> =20
> -	mutex_lock(&dev->dev_mutex);
> +	mutex_lock(&dev->dev_ctx_lock);
>  	list_for_each_entry(ctx, &dev->ctx_list, list) {
>  		ctx->state =3D MTK_STATE_ABORT;
>  		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx-=
>id);
>  	}
> -	mutex_unlock(&dev->dev_mutex);
> +	mutex_unlock(&dev->dev_ctx_lock);
>  }
> =20
>  static void mtk_vcodec_vpu_reset_enc_handler(void *priv)
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index ad9b68380692f..d69c9fe2af6f3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -267,7 +267,9 @@ static int fops_vcodec_open(struct file *file)
> =20
>  	ctx->dev->vdec_pdata->init_vdec_params(ctx);
> =20
> +	mutex_lock(&dev->dev_ctx_lock);
>  	list_add(&ctx->list, &dev->ctx_list);
> +	mutex_unlock(&dev->dev_ctx_lock);
>  	mtk_vcodec_dbgfs_create(ctx);
> =20
>  	mutex_unlock(&dev->dev_mutex);
> @@ -310,7 +312,9 @@ static int fops_vcodec_release(struct file *file)
>  	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> =20
>  	mtk_vcodec_dbgfs_remove(dev, ctx->id);
> +	mutex_lock(&dev->dev_ctx_lock);
>  	list_del_init(&ctx->list);
> +	mutex_unlock(&dev->dev_ctx_lock);
>  	kfree(ctx);
>  	mutex_unlock(&dev->dev_mutex);
>  	return 0;
> @@ -403,6 +407,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
>  	for (i =3D 0; i < MTK_VDEC_HW_MAX; i++)
>  		mutex_init(&dev->dec_mutex[i]);
>  	mutex_init(&dev->dev_mutex);
> +	mutex_init(&dev->dev_ctx_lock);
>  	spin_lock_init(&dev->irqlock);
> =20
>  	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 849b89dd205c2..85b2c0d3d8bcd 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -241,6 +241,7 @@ struct mtk_vcodec_dec_ctx {
>   *
>   * @dec_mutex: decoder hardware lock
>   * @dev_mutex: video_device lock
> + * @dev_ctx_lock: the lock of context list
>   * @decode_workqueue: decode work queue
>   *
>   * @irqlock: protect data access by irq handler and work thread
> @@ -282,6 +283,7 @@ struct mtk_vcodec_dec_dev {
>  	/* decoder hardware mutex lock */
>  	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
>  	struct mutex dev_mutex;
> +	struct mutex dev_ctx_lock;
>  	struct workqueue_struct *decode_workqueue;
> =20
>  	spinlock_t irqlock;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c=
 b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> index 82e57ae983d55..da6be556727bb 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.c
> @@ -77,12 +77,14 @@ static bool vpu_dec_check_ap_inst(struct mtk_vcodec_d=
ec_dev *dec_dev, struct vde
>  	struct mtk_vcodec_dec_ctx *ctx;
>  	int ret =3D false;
> =20
> +	mutex_lock(&dec_dev->dev_ctx_lock);
>  	list_for_each_entry(ctx, &dec_dev->ctx_list, list) {
>  		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst =3D=3D vpu) {
>  			ret =3D true;
>  			break;
>  		}
>  	}
> +	mutex_unlock(&dec_dev->dev_ctx_lock);
> =20
>  	return ret;
>  }


