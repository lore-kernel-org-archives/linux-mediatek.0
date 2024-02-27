Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9B1C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1EveZVEiSMMMB6fnTuGZVP/gmbDHNaPcEtW3gx8n28=; b=BQoeEeTfBZAdhUSzyLX5mNOppC
	/KgR06t6E+v2gpn+LHoD1uqNFx0oZ5vn9SveAiE7HUwsNbWDIqbQqXi7hhCczlDjaHhoHpOStCCSu
	5ycu6byPCv8reQON3AY1HEQygQdRbYoHycVUF97wO/QhxVTeTjcPk8OaESNyvmYZLu8Mxn/mkQXMc
	CgV9xhVieOXFjAtvsrqJcx/C9xrwbGy2PapsI8+BBPlsOtgEiCFzktLDVrgZf8go4H4LCY9N42c5G
	rcJucxqmy5VqIOX/hj9PZYsrUzCcPGZPkqeQ5h8tF39YhO9d7qq4iXNzW6dCiGOxifYOHggTg3inS
	kurNeKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revnO-00000004xwD-37zp;
	Tue, 27 Feb 2024 11:38:50 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1revnK-00000004xuW-3lGB;
	Tue, 27 Feb 2024 11:38:48 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-4cb26623dc1so752857e0c.2;
        Tue, 27 Feb 2024 03:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709033924; x=1709638724; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1EveZVEiSMMMB6fnTuGZVP/gmbDHNaPcEtW3gx8n28=;
        b=UBURMxz7C1ujZeRci57Zfflc4+hkEZVduaNRPzdtFeyivelc6jwFmGFDlvVhsbT8aK
         2iyrxnhrCLPDF6uQlyqRlwt9UFvpYndZSoWW/VEWdNacxiuwuo/+HnCBZr12xGM2ojMf
         hQkiAxxdnqtJ1VlqhSjT6XE1CD+a0JKm3z6/dzoPLbRil33PXNLiE5e769HMxfFsAlAR
         bfTkGOTbTue6AInLjrTLlZARTIQZTlHIgg12/aSP+KUhNVlDpFxq5OTIVyLMrrgpTVjz
         HbHQ62gKlUMmib0Wt60zHcBy3QRy3iZuPFqDzJ35Dsbhq1+knSUTOLKOCrEb7MNbau6H
         g3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033924; x=1709638724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1EveZVEiSMMMB6fnTuGZVP/gmbDHNaPcEtW3gx8n28=;
        b=ZS41cVPNU3nNm2ryh4xU/mqIiZt7u18h4SS+g41OlHC5GhZG1MBTZVQsGP5mzRmYnf
         Ub3ueQEj8n3yl1/V7R+kMwk4izNEzjLFpask3yWQE1X49RrsBq1qK9bGTkgMJAOuydH9
         KJXAxmTPd2jW6uSyklumV6uUcWqFXNpLHR9Qkya3uFRfMEv8wls9ulnGXn6AOa29lait
         tduTWJVZ5TG0LbvsEHrkrIFa2nsX/ICs4iRvvJf5jt/QQBQaYLW/PoySPK9rlSXepOmc
         mXq6l8N03FBvxSXOCC3l3X8KiGFn/I8PGyCy9JrdM3pihqXG0Xv11YT+03c2Ylptfy+R
         jPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU94CBBnxc6ST3vQiwsCQfRu0g9Dw5Gx07R90CxzjPQrO7Wx7TLiSctFJwEPBJFtaXYaN4LkJ39tfWZpgbXqHcx7kgvl7VP3XKCFLswP8YQSQLgyUddgHtVWYqvSqV4L1mEovdYo6ngRGRsChih5mP6JnznMzy01mY=
X-Gm-Message-State: AOJu0Yyu9pwzSIFfYWtW5fSsfPuyKPzlgM4nQgeBL8Z8kAneQb08ZCz8
	Ds7YFNvJYskx6VbTxKOIXibx8VPCwqpxTwuDSSFCPKWfNAlRE+dwABodQBHssPgE8GuD/U/YQdr
	TcN6nzXB4KC8bDrkXGfSwOnDc4iY=
X-Google-Smtp-Source: AGHT+IFY5rIW4R7AnsOo+2KkC+7Q4PqHRUzXLysCU3Xts5MAHbKEy5X0OQfVK+hv44PSmKVkOQ8vOWnw8p15f/5mIVs=
X-Received: by 2002:a1f:ca47:0:b0:4c9:b8a8:78d4 with SMTP id
 a68-20020a1fca47000000b004c9b8a878d4mr7019527vkg.3.1709033924366; Tue, 27 Feb
 2024 03:38:44 -0800 (PST)
MIME-Version: 1.0
References: <20240224121059.1806691-1-arnd@kernel.org>
In-Reply-To: <20240224121059.1806691-1-arnd@kernel.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 27 Feb 2024 12:38:26 +0100
Message-ID: <CAPybu_2JoNfr158FXqYGUV=JuTW8i85XM6cf7K40_xZe9m2qyg@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: avoid -Wcast-function-type-strict
 warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Alexandre Courbot <acourbot@chromium.org>, 
	Pi-Hsun Shih <pihsun@chromium.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_033846_962213_841B3FD2 
X-CRM114-Status: GOOD (  24.97  )
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

Hi Arnd

Thanks for the patch

On Sat, Feb 24, 2024 at 1:11=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The ipi handler here tries hard to maintain const-ness of its argument,
> but by doing that causes a warning about function type casts:

I worked on the same issue, but in instead of removing the const, I
tried to constify everything:
https://patchwork.linuxtv.org/project/linux-media/patch/20240226-fix-clang-=
warnings-v2-3-fa1bc931d17e@chromium.org/

My main goal is to remove the warning, so any patch is OK for me ;)

>
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: =
error: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned i=
nt, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int,=
 void *)') converts to incompatible function type [-Werror,-Wcast-function-=
type-strict]
>    38 |         ipi_handler_t handler_const =3D (ipi_handler_t)handler;
>       |                                       ^~~~~~~~~~~~~~~~~~~~~~
>
> Remove the hack and just use a non-const argument.
>
> Fixes: bf1d556ad4e0 ("media: mtk-vcodec: abstract firmware interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c      |  2 +-
>  .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c         | 10 +---------
>  drivers/media/platform/mediatek/vpu/mtk_vpu.c          |  2 +-
>  drivers/media/platform/mediatek/vpu/mtk_vpu.h          |  2 +-
>  4 files changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c b/drivers/=
media/platform/mediatek/mdp/mtk_mdp_vpu.c
> index b065ccd06914..378a1cba0144 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c
> @@ -26,7 +26,7 @@ static void mtk_mdp_vpu_handle_init_ack(const struct md=
p_ipi_comm_ack *msg)
>         vpu->inst_addr =3D msg->vpu_inst_addr;
>  }
>
> -static void mtk_mdp_vpu_ipi_handler(const void *data, unsigned int len,
> +static void mtk_mdp_vpu_ipi_handler(void *data, unsigned int len,
>                                     void *priv)
>  {
>         const struct mdp_ipi_comm_ack *msg =3D data;
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_=
vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 9f6e4b59455d..4c34344dc7dc 100644
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
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 7243604a82a5..724ae7c2ab3b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -635,7 +635,7 @@ int vpu_load_firmware(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(vpu_load_firmware);
>
> -static void vpu_init_ipi_handler(const void *data, unsigned int len, voi=
d *priv)
> +static void vpu_init_ipi_handler(void *data, unsigned int len, void *pri=
v)
>  {
>         struct mtk_vpu *vpu =3D priv;
>         const struct vpu_run *run =3D data;
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index a56053ff135a..da05f3e74081 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -17,7 +17,7 @@
>   * VPU interfaces with other blocks by share memory and interrupt.
>   */
>
> -typedef void (*ipi_handler_t) (const void *data,
> +typedef void (*ipi_handler_t) (void *data,
>                                unsigned int len,
>                                void *priv);
>
> --
> 2.39.2
>
>


--=20
Ricardo Ribalda

