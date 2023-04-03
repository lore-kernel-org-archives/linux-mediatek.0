Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABFCC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 03:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao+Wahp/GhQ288GMqvqm/MI/NAwzoqzmMWGCLJxE248=; b=NXW4lJ8Y4+EHs5rjpPaGKlfhme
	DBH5u4EfNz6TEw+9IDx2IaNKAHYa98D3ujD/a8quuRhOx75dkKYpaM7HfIF9CingutJW+gA09mFYL
	S9ttLZh5C15/4cwl3Uz2rkCd4JdtpJwxcjgb6jHYxjXlzAdw3SI82dPSTgtr/oCCD3uPlj6r3wvja
	zAhJRveq8ek++JPFRaieT4LM2/i5GqEzt2zpP6pcJUQ1HPeg77Dgh7aqVPbCLgK79vrb0UJ9SBEyQ
	E61Mr0SXR0jbGYmPNq4Nmt2LVzKqQWfnAS+C42jPrqAPnbNLhI448x3aPqDtmyxr/D9jI3SS+aqxe
	i7SA4JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBCM-00E4Lk-2F;
	Mon, 03 Apr 2023 03:49:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjBCI-00E4LB-2I;
	Mon, 03 Apr 2023 03:49:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C2E661269;
	Mon,  3 Apr 2023 03:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5349C4339B;
	Mon,  3 Apr 2023 03:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680493773;
	bh=RxJpHw73hoGYorA2r+/CTCYjP7eAFX8nWAp6L6EMV0U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iKAIkzypTgu9giAoG6xU625fzG6AtvfoUTOHL+BUadnxUw5ztNmcinq/2G9tBoKI1
	 bdDPzNoGUxpiVzoJZPe/CjVG+ef4+MWcBLicmuFflNSI5a9aIVtTxyqT4M0zPI2j1x
	 hhkn3LxRHyHnnOETQFC4Y6sb0pswPHo+sEUVap12xmtERgA7xFB+c0HGD41FTBqDFn
	 Ci+qcN2lG5l6l/0/D72MbRY0JPVJXdjWNKxbQAXuVXabf46fyP4ApYEW2EdntCUfLq
	 HKeU8O++/qS7E3SahhL2FpCahDG7OiKqDg6mFehsNLBHNySwbIYaOzEkQXijPr9G9x
	 cYrYcxi0QWEWw==
Received: by mail-lj1-f178.google.com with SMTP id e9so13639190ljq.4;
        Sun, 02 Apr 2023 20:49:33 -0700 (PDT)
X-Gm-Message-State: AAQBX9eEfvc0tyDjzkQiX3G/kizysVH7dXUqEGSzrJ+mBEzqNgXMbVDZ
	joWpcUVGo8rjhpmJTZUoXNmmy0bvxvNkIFnvgg==
X-Google-Smtp-Source: AKy350Y5F5clcljoaW1Uvm+lBYJtHhVmDtJb1H1qxvqqXq2CY6nnIt8Wpo4MqvAB7LhXxOGMUlAHESfrdkS7yH+3xyg=
X-Received: by 2002:a2e:7017:0:b0:295:bb34:9c2 with SMTP id
 l23-20020a2e7017000000b00295bb3409c2mr10369981ljc.10.1680493771688; Sun, 02
 Apr 2023 20:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <1680072203-10394-1-git-send-email-xinlei.lee@mediatek.com>
In-Reply-To: <1680072203-10394-1-git-send-email-xinlei.lee@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Apr 2023 11:49:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-bgkkqnfshmdNz-NP7TqdqE9Qdf-PyEOc6iANPmY+bRw@mail.gmail.com>
Message-ID: <CAAOTY_-bgkkqnfshmdNz-NP7TqdqE9Qdf-PyEOc6iANPmY+bRw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: change the aux retries times when
 receiving AUX_DEFER
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
	daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_204934_833295_9C3294DD 
X-CRM114-Status: GOOD (  18.99  )
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

Hi, Xinlei:

<xinlei.lee@mediatek.com> =E6=96=BC 2023=E5=B9=B43=E6=9C=8829=E6=97=A5 =E9=
=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=882:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> From: Xinlei Lee <xinlei.lee@mediatek.com>
>
> DP 1.4a Section 2.8.7.1.5.6.1:
> A DP Source device shall retry at least seven times upon receiving
> AUX_DEFER before giving up the AUX transaction.
>
> The drm_dp_i2c_do_msg() function in the drm_dp_helper.c file will
> judge the status of the msg->reply parameter passed to aux_transfer
> ange-the-aux-retries-times-when-re.patchfor different processing.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 1f94fcc144d3..767b71da31a4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -806,10 +806,9 @@ static int mtk_dp_aux_wait_for_completion(struct mtk=
_dp *mtk_dp, bool is_read)
>  }
>
>  static int mtk_dp_aux_do_transfer(struct mtk_dp *mtk_dp, bool is_read, u=
8 cmd,
> -                                 u32 addr, u8 *buf, size_t length)
> +                                 u32 addr, u8 *buf, size_t length, u8 *r=
eply_cmd)
>  {
>         int ret;
> -       u32 reply_cmd;
>
>         if (is_read && (length > DP_AUX_MAX_PAYLOAD_BYTES ||
>                         (cmd =3D=3D DP_AUX_NATIVE_READ && !length)))
> @@ -841,10 +840,10 @@ static int mtk_dp_aux_do_transfer(struct mtk_dp *mt=
k_dp, bool is_read, u8 cmd,
>         /* Wait for feedback from sink device. */
>         ret =3D mtk_dp_aux_wait_for_completion(mtk_dp, is_read);
>
> -       reply_cmd =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
> -                   AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
> +       *reply_cmd =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3624) &
> +                    AUX_RX_REPLY_COMMAND_AUX_TX_P0_MASK;
>
> -       if (ret || reply_cmd) {
> +       if (ret) {
>                 u32 phy_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_P0_3628=
) &
>                                  AUX_RX_PHY_STATE_AUX_TX_P0_MASK;
>                 if (phy_status !=3D AUX_RX_PHY_STATE_AUX_TX_P0_RX_IDLE) {
> @@ -2070,7 +2069,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                 ret =3D mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
>                                              msg->address + accessed_byte=
s,
>                                              msg->buffer + accessed_bytes=
,
> -                                            to_access);
> +                                            to_access, &msg->reply);
>
>                 if (ret) {
>                         drm_info(mtk_dp->drm_dev,
> @@ -2080,7 +2079,6 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_au=
x *mtk_aux,
>                 accessed_bytes +=3D to_access;
>         } while (accessed_bytes < msg->size);
>
> -       msg->reply =3D DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;

In your description, you just mention the retry count is 7 times, but
you does not mention you should change the reply. Why you modify this?
And where is the 7 times retry?

Regards,
Chun-Kuang.

>         return msg->size;
>  err:
>         msg->reply =3D DP_AUX_NATIVE_REPLY_NACK | DP_AUX_I2C_REPLY_NACK;
> --
> 2.18.0
>

