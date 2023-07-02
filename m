Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54716EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2KcurjAOTTdvjMdZhGqRO5IZlySMOTC6Ku8RN6GDqQ=; b=ITpOT2kvFYFI1Ec/UM7E5cGJrj
	47XtEo4Aur6JTj+2rll847pkGPxAUa6JJW9SJlmMCxjywldSnpfiLpDb955S4Lp6XAm2ez1R4kZFz
	3g63mqRFp0LfscTrLqPN3fdWAV1+91BOQLt4e/WQ3JSvr0SI2oWUDfkEarZjlPuuWGqrIjxxOa+bP
	Fec87IWuCQv5X3D7ZLSTO+STdeZm5YTnn1i9in789CSA3ePDsIaOR6yhKxoC11OhHSiPBCTZXDiFk
	Lom+F1ec+w9SdoxKYjpqeSg3l0ISNm95hXQwYLDutKVrofDDCAFx/2XKwz1E7A0Gz1o0Mxha5WztJ
	GJzXJW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtjV-007Vwk-2r;
	Sun, 02 Jul 2023 09:51:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtjS-007Vvw-2t;
	Sun, 02 Jul 2023 09:51:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3355360BF0;
	Sun,  2 Jul 2023 09:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3B2C433C9;
	Sun,  2 Jul 2023 09:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688291461;
	bh=hA6GlV1UqjmkA56DuucUvDkCtcQNNv7bBEGovbx1Fk4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EHOgdBeiA3+h8Az3K6UjBVhWp5QTq9FrIE+a86uLPwdLDKMeo9BlS03Z++CoAkg73
	 nMdHuJi9jrQPFdcXKs/k4/snsnift642l3rSzTt+1kw5EsoGbBjF8eJDgId53K2wSp
	 NfAU57nQF2LdQsYMLQK2cdcnIZmvLVrHZ7Rsiw2lPxyqPqmR5JaVBdC5WkKhqOgJan
	 6fM0LQyKLeviTYLlYk7kfzjA9zr1b0w/w1Hya139vMXVFJ9annTp6jd2OoCfMbZv23
	 YGE8fQzUF0o94LgoqgAKzy2nUnWknACoS1wRvccFgGLkSjWh6idsW9PLQwIZncTWY0
	 rGJ+hPHt36/Rg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so4246152e87.1;
        Sun, 02 Jul 2023 02:51:01 -0700 (PDT)
X-Gm-Message-State: AC+VfDxGTusDwPKxxg1V+5jMXyv0rawi4lFZwNB5PyJDnt5JMBdjTpmG
	DGJnYodaRXjj/cq5z8ASXu63BXX5erHNsex08A==
X-Google-Smtp-Source: ACHHUZ6L2kvXHzm79mMIeDZDgvuDYbbSjie/ZH4uVr+PSQ9kioutb93cROQeonW8J6th9h92WSPRzm6UmI0vRxIH6IE=
X-Received: by 2002:a05:6512:2828:b0:4f8:75d5:e14f with SMTP id
 cf40-20020a056512282800b004f875d5e14fmr3736142lfb.28.1688291459662; Sun, 02
 Jul 2023 02:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230630100321.1951138-1-jstephan@baylibre.com> <20230630100321.1951138-5-jstephan@baylibre.com>
In-Reply-To: <20230630100321.1951138-5-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 2 Jul 2023 17:50:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8z9YDrC6yJ80TUJQ6FmU6wQOdgGJ0eCN15gu0LYds0ig@mail.gmail.com>
Message-ID: <CAAOTY_8z9YDrC6yJ80TUJQ6FmU6wQOdgGJ0eCN15gu0LYds0ig@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
To: Julien Stephan <jstephan@baylibre.com>
Cc: Phi-bang Nguyen <pnguyen@baylibre.com>, Florian Sylvestre <fsylvestre@baylibre.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andy Hsieh <andy.hsieh@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, daoyuan huang <daoyuan.huang@mediatek.com>, 
	devicetree@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-media@vger.kernel.org, Louis Kuo <louis.kuo@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_025103_023820_EC95AA74 
X-CRM114-Status: GOOD (  17.28  )
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

Hi, Julien:

Julien Stephan <jstephan@baylibre.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=886:06=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
>
> This driver provides a path to bypass the SoC ISP so that image data
> coming from the SENINF can go directly into memory without any image
> processing. This allows the use of an external ISP.
>
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---

[snip]

> +
> +static irqreturn_t isp_irq_camsv30(int irq, void *data)
> +{
> +       struct mtk_cam_dev *cam_dev =3D (struct mtk_cam_dev *)data;
> +       struct mtk_cam_dev_buffer *buf;
> +       unsigned long flags =3D 0;
> +       unsigned int irq_status;
> +
> +       spin_lock_irqsave(&cam_dev->irqlock, flags);
> +
> +       irq_status =3D mtk_camsv30_read(cam_dev, CAMSV_INT_STATUS);
> +
> +       if (irq_status & INT_ST_MASK_CAMSV_ERR) {
> +               dev_err(cam_dev->dev, "irq error 0x%x\n",
> +                       (unsigned int)(irq_status & INT_ST_MASK_CAMSV_ERR=
));
> +       }
> +
> +       /* De-queue frame */
> +       if (irq_status & CAMSV_IRQ_PASS1_DON) {
> +               cam_dev->sequence++;
> +
> +               if (!cam_dev->is_dummy_used) {
> +                       buf =3D list_first_entry_or_null(&cam_dev->buf_li=
st,
> +                                                      struct mtk_cam_dev=
_buffer,
> +                                                      list);
> +                       if (buf) {
> +                               buf->v4l2_buf.sequence =3D cam_dev->seque=
nce;
> +                               buf->v4l2_buf.vb2_buf.timestamp =3D ktime=
_get_ns();
> +                               vb2_buffer_done(&buf->v4l2_buf.vb2_buf,
> +                                               VB2_BUF_STATE_DONE);
> +                               list_del(&buf->list);
> +                       }
> +               }
> +
> +               if (list_empty(&cam_dev->buf_list)) {
> +                       (*cam_dev->hw_functions->mtk_cam_update_buffers_a=
dd)
> +                                               (cam_dev, &cam_dev->dummy=
);

It's not necessary to use function pointer. Call
mtk_camsv30_update_buffers_add() directly.

Regards,
Chun-Kuang.

> +                       cam_dev->is_dummy_used =3D true;
> +               } else {
> +                       buf =3D list_first_entry_or_null(&cam_dev->buf_li=
st,
> +                                                      struct mtk_cam_dev=
_buffer,
> +                                                      list);
> +                       (*cam_dev->hw_functions->mtk_cam_update_buffers_a=
dd)
> +                                               (cam_dev, buf);
> +                       cam_dev->is_dummy_used =3D false;
> +               }
> +       }
> +
> +       spin_unlock_irqrestore(&cam_dev->irqlock, flags);
> +
> +       return IRQ_HANDLED;
> +}
> +

