Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6321CC07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 06:03:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20A3A61166
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 06:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20A3A61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lTVuegrBPZT++kFqc5SQgFpxivQY9ETK/AooF20JRE=; b=eljMbLgyJbS/O0
	qPAINxde3D/4HiWbUHUG/OCkHSXFGidnwVZLg3UGc8HGsEzvG9+VmQsttisRQlzZ/5vHfGwKQW6RK
	vKgRQyfMsIO2Y1bjnccnYVsiE3mbHg7hicaOkQjqZ9JUjKuox6CC2ND3W1y9WNK9IWsTTyN3BqHKc
	pt2hb9zlS8OZXZAGLvo4f+dYaeWMnW02JJL5XbbGMYghYckyqsP+vmPgpB3cD0j2ZqgJV7pV0CCvz
	00DeXO+Es2DqpaHVbNrttz+EX/cGXh/pLzQkfvaFT+aQ5WQkUikXxuqbJpwrG9jcjDttwbRroQEpx
	I7+fpwmNs9ODaDTav/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5iqh-00BwmJ-SX; Tue, 20 Jul 2021 06:03:23 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5iqU-00BwkD-K1
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 06:03:12 +0000
Received: by mail-il1-x135.google.com with SMTP id p3so18184400ilg.8
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Jul 2021 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86QVHJVxOCndQaXxHRwaOxxcq7eMK28HT05PxvcoBYI=;
 b=bu4dAUXhDfU3dlbFBsoThBblvvUC91XDro9V2evK/M12RqO1wW4gp88UdAm/F2rtFC
 Q/1ToZcP/0N8Nvxc65pfwLiL5UsrZuJIsOZIglgaGTuSjDq2XEYJy8yhmbnivp59FXrO
 5dgDFoUDO3t/Gm2bavuKXttbdx1eZLMxFrMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86QVHJVxOCndQaXxHRwaOxxcq7eMK28HT05PxvcoBYI=;
 b=qAdIk369UTEgUHTQ4FDxYwq/EyHc0vcDdnBhsqmkC2kFKjMTIEqN+ug/jOUVoVqMZV
 0Lhqk8WywTCwsY3y11uq+1ETa+/H3GWaqBhqHFGAIHYEb7QZgkNMB4Fops8IheEZRvFo
 XUWf32cTquEw8RzPn2A+oN2zXlZmbuwuzEpaGOANj7xqnLpCnfYZLdHWjljHBXtvvbih
 PXXkKEEwcj3BkQMIyDLoS0pJRE2Dlmmnk5j80TYMNzmbzIqNfSf89wP3KGpyWwO8z2o7
 vU2T/R2RUmxPeEfrAWrNYgokgMH2YxcAIXPLd4vsQ3oPsXpo0kNycLhaaf7JhoAWzJaB
 sDMg==
X-Gm-Message-State: AOAM531QhHDCuMyBzpG/aAmcgxRstPAurKedEXb4SJCx6iJ5r0EizYSv
 jDmPwy9etGthwHRmtwmep6xP5E22Dw2i1DdBeflDuA==
X-Google-Smtp-Source: ABdhPJwFk6YVkmc9gpzvQzRgdkNx/5Ot14DkNuPE+cqjEdJYOOoLrPx04nhKCCVAgpn8DccUvt9FPHZ2ECPmqkXRtQk=
X-Received: by 2002:a92:d305:: with SMTP id x5mr20209347ila.150.1626760989584; 
 Mon, 19 Jul 2021 23:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <1626760277-5733-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626760277-5733-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626760277-5733-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 20 Jul 2021 14:02:43 +0800
Message-ID: <CAJMQK-jK0WRgU47YZ8+Jdt50y2CnkUjHKT2C+xfTvgst9bTmTg@mail.gmail.com>
Subject: Re: [PATCH v3] Fixes: a6b7c98afdca(drm/mediatek: add
 mtk_dither_set_common() function)
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_230310_716915_4FD8B9C6 
X-CRM114-Status: GOOD (  16.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 20, 2021 at 1:51 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> dither 6 setting is missed in a6b7c98afdca
> bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
> bit 2 is rdither_en(Enables running order dithering), need disable
>

Fixes tag should be here, and the title of this patch should be the
same as v2: drm/mediatek: add dither 6 setting

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 99cbf44..7dd8e05 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -26,6 +26,7 @@
>  #define DISP_OD_CFG                            0x0020
>  #define DISP_OD_SIZE                           0x0030
>  #define DISP_DITHER_5                          0x0114
> +#define DISP_DITHER_6                          0x0118
>  #define DISP_DITHER_7                          0x011c
>  #define DISP_DITHER_15                         0x013c
>  #define DISP_DITHER_16                         0x0140
> @@ -135,6 +136,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
>
>         if (bpc >= MTK_MIN_BPC) {
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> +               mtk_ddp_write(cmdq_pkt, 0x3002, cmdq_reg, regs, DISP_DITHER_6);
>                 mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
>                 mtk_ddp_write(cmdq_pkt,
>                               DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> --
> 1.8.1.1.dirty
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
