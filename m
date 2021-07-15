Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E4DC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 10:29:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30E306128D
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 10:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30E306128D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBcgkU+rOt9XjW4xRasjrMeImGweZ7fIX1RFs3TUrps=; b=vDb00BNhOZVR5m
	sKwyFD3wbKA7gnl8uPCkkcYepUhymsNoy2HKyO6g/a93BYLzm4rrMEBO5gkxZvDtOFMvbIUmtmSBA
	pXrk6v2i/tDGUmJZP6AUYi1AEAdmKPCPIxmYOvavhsuUjoOe2KWwL8x61TFvG+y7rYDFDir7bxEb6
	uFh2haN8AHMOFVuh0+IfCzwhkDFJvS04+SbNdRBXZdfO9PyF1Kd2Hb1jSl3+i3GmstQN0gX/82Kuf
	Nsgi6bCDBkQfywa9LW6XBwdsKi1Yl9lm+E4piU617SJWCqyo8AODaoxZ0AVH+D7htlJVEUBij04Pj
	lZ1TwZSoHTkDTqLGKb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ycY-000RM1-QJ; Thu, 15 Jul 2021 10:29:34 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ycL-000RJX-5b
 for linux-mediatek@lists.infradead.org; Thu, 15 Jul 2021 10:29:22 +0000
Received: by mail-io1-xd34.google.com with SMTP id k11so5829926ioa.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Jul 2021 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyAUEtVezo404CIhWOUhgzbjRjPd8h5hzpJdBeSKQTA=;
 b=MgSlsyn3Nhbd3AUpNvhT2NNSOEuryc1QPty6/CeUj7ZT/L8YGN9vfY/5WhcT8oFpLq
 +ZzDbI1DcXeY1bi612mypZhwKG1kbXlZuvQJEuYfkNWtHqrj196LtO9j93x2Xlo8GWk/
 P2pJZFPwBtHM27073EVY13e4IEJ+71ppA5W2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyAUEtVezo404CIhWOUhgzbjRjPd8h5hzpJdBeSKQTA=;
 b=eJ4GwNUtOtevhkF5JlTIAcxdiEjXxzk/W665h2kwly7m6S6x58F8rUT51sBdWBY+Ty
 45MP1TFO8VKWmgQfHyizl7Vg58RdS2EQ9lN9E2LnreBYInioyRkgcRnDcf8sn9n6MxJX
 DJqmlga0iPEfpoeKkUIEIBJGaTrrkSugqBlpCIH6j1i6hed2Xah8NCVCXSksT3S1SaJA
 HIJ9EijOqbcAEEGx1DG9cQxQyi74Cf3s2Vtd1WE9VhjpGntig6OAWYpgA4rJdPJvOwXo
 cQ/bhhx/55iSs7SRi13/ge802PngsL6ZM3Gr9TO2XxKlrbc/0/mn/727F0aSVS6jsbyi
 klPg==
X-Gm-Message-State: AOAM533Oi3MblR3Cgyb+SEwNrUPfSsHDO7+vyU7Zesx2VTH+cf7N26DV
 LGxRmvdTIukFsF8YQP8KArMuf/Sqg0zX3v/aUhblFg==
X-Google-Smtp-Source: ABdhPJw2mxWU+xXAkJO3mI+OX6znH1/i0GZ7cnWBtNO+Lv/xTP1hKsZ7ryl5bIuMk2imtrZIb2VbdDupmxJUEhRymko=
X-Received: by 2002:a02:cce6:: with SMTP id l6mr3377311jaq.114.1626344959355; 
 Thu, 15 Jul 2021 03:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210712080736.116435-1-linux@fw-web.de>
In-Reply-To: <20210712080736.116435-1-linux@fw-web.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 15 Jul 2021 18:28:53 +0800
Message-ID: <CAJMQK-i9cGUUXLDr95nCghLd6jmR0tmdPv_PiyN1gC1+JD-2Mw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dpi: fix NULL dereference in
 mtk_dpi_bridge_atomic_check
To: Frank Wunderlich <linux@fw-web.de>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, 
 Frank Wunderlich <frank-w@public-files.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_032921_279446_4133C1B1 
X-CRM114-Status: GOOD (  18.58  )
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

On Mon, Jul 12, 2021 at 4:08 PM Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> bridge->driver_private is not set (NULL) so use bridge_to_dpi(bridge)
> like it's done in bridge_atomic_get_output_bus_fmts
>
> Fixes: ec8747c52434 ("drm/mediatek: dpi: Add bus format negotiation")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

Tested on a mt8183 device.


> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index bced555648b0..a2eca1f66984 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -605,7 +605,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
>                                        struct drm_crtc_state *crtc_state,
>                                        struct drm_connector_state *conn_state)
>  {
> -       struct mtk_dpi *dpi = bridge->driver_private;
> +       struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>         unsigned int out_bus_format;
>
>         out_bus_format = bridge_state->output_bus_cfg.format;
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
