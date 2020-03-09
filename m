Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395B5C18E5A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 07:49:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EFA420675
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 07:49:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UCMjw5+G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jq7oN9z+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EFA420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ctu8L4vge/UGDk1o8Ki8EqtRAoGlVn0rNl5bHJpRaDM=; b=UCMjw5+GT/pkGD
	SoO7m8F25XtL3S4Ql8V5BnagsJ/XZBz6DLXa7C5neMIG3yqz2SBLPgN6eW6XfzFLJH1ew8IU5LQbn
	1npRhIUxPFXQYa5QKMJUPqXPvYO0ORLc32/Hq++gXnMCkQXNLhWL4cQdEnpSlQ9Zfhy4JKnPFPv89
	6vXbrp/gozS7njbt6dbGLHQKpd+qH9tZEspFtU2EbkxDA4jJi8+18l6IXqKXEwd9P7y079RyRZ+Ti
	joaXOEKaOfL25mimQTlbSh7PkKZg60PVln1IpDli/SAwR/BfbOLS4e+bHpePLQOq3pbpibtEIglvw
	3LPVlLzUg+34s169MHdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBDAb-0001ou-Rp; Mon, 09 Mar 2020 07:49:49 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBDAZ-0001nU-G5
 for linux-mediatek@lists.infradead.org; Mon, 09 Mar 2020 07:49:48 +0000
Received: by mail-ed1-x544.google.com with SMTP id m25so10885647edq.8
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Mar 2020 00:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tGvHVL+X8ENX8ZlFkJ4aTUiRtrm/fcY3/mfmmVzMIbM=;
 b=Jq7oN9z+T3yHMHlBWmtg/oPw3NMpUuf+HHE/AEB6ve19jbPtvt5AEZ3WDPvkS0xNRJ
 TxPi+1T+CforxzUbaOpceljyeEB1qThb+1+7Yv5FETpD/6MLNoUiLzGPTdjvfyt2N7yA
 204omxFy4IXZZH2/4KFT1X0Gv3NC+THh/SuOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tGvHVL+X8ENX8ZlFkJ4aTUiRtrm/fcY3/mfmmVzMIbM=;
 b=tlrMIdHg4DY3qXbGHC4AbZdbRay2+fYMBE6EXd6iHfJTad2SaE5aEWh/NKv4LYwgjn
 j/eNg1L8PQ+/zv7wUq0G7EbXW2+oTeA+TxWJoU6I2wqeyfzAARUT57Tf9EgQ1tULSX0U
 10LPo52e0jTYSyeHpU/DbACEQpNPaBkWRg4ggO4ge5NXHSSr0qP4kV6dblr2ZIRm7LAT
 Wg2IYobBB6LKq9/egvuVKlYUd8SRNMA9v/1utMbzWni4F8diO9nUYYIw1r06tj8K2Cye
 g/kAdnUuHAGWBjBH0PpiPRphdf8PTxxn99CB3hZLShpA4eG2ty6+3AQpcWzF7mkC5eKg
 8+uQ==
X-Gm-Message-State: ANhLgQ2M6uWSnOaG7o+NGDWixrTrlJrSwZE1r3u4wSSFnOqTuMBUMuo9
 R1ApsiA6pugWP5d4MKkxzM0cvO50CdCPgOgoguvAdA==
X-Google-Smtp-Source: ADFU+vunIbfF7cF+cg/5HQCVkQIHDO6ScLBXRU/yTPevJyjOidbI5t2wOJVf0V1aAGYL0Qe0suR5rmu4QLvHq6Gpl3U=
X-Received: by 2002:a17:907:2154:: with SMTP id
 rk20mr13348435ejb.322.1583740177890; 
 Mon, 09 Mar 2020 00:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <1583735298-19266-1-git-send-email-allen.chen@ite.com.tw>
 <1583735298-19266-4-git-send-email-allen.chen@ite.com.tw>
In-Reply-To: <1583735298-19266-4-git-send-email-allen.chen@ite.com.tw>
From: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 9 Mar 2020 15:49:01 +0800
Message-ID: <CANdKZ0cB-nWR75RcpAet+UDj6t+QXi1rjF3jMiM6_+awhZzAOg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: add it6505 driver
To: allen <allen.chen@ite.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_004947_537398_0D88745B 
X-CRM114-Status: GOOD (  14.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Jitao Shi <jitao.shi@mediatek.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Yilun Lin <yllin@google.com>, David Airlie <airlied@linux.ie>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi allen,

On Mon, Mar 9, 2020 at 2:32 PM allen <allen.chen@ite.com.tw> wrote:
>
> From: Allen Chen <allen.chen@ite.com.tw>
>
> This adds support for the iTE IT6505.
> This device can convert DPI signal to DP output.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Yilun Lin <yllin@google.com>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig      |   11 +-
>  drivers/gpu/drm/bridge/Makefile     |    6 +-
>  drivers/gpu/drm/bridge/ite-it6505.c | 3022 +++++++++++++++++++++++++++++++++++
>  3 files changed, 3035 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/drm/bridge/ite-it6505.c
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index aaed234..ff81681 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -38,8 +38,15 @@ config DRM_DISPLAY_CONNECTOR
>           on ARM-based platforms. Saying Y here when this driver is not needed
>           will not cause any issue.
>
> -config DRM_LVDS_CODEC
> -       tristate "Transparent LVDS encoders and decoders support"
> +config DRM_ITE_IT6505
> +       tristate "ITE IT6505 DP bridge"
> +       depends on OF
> +       select DRM_KMS_HELPER
> +       help
> +         ITE IT6505 DP bridge chip driver.
> +
> +config DRM_LVDS_ENCODER
> +       tristate "Transparent parallel to LVDS encoder support"
>         depends on OF
>         select DRM_KMS_HELPER
>         select DRM_PANEL_BRIDGE
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 6fb062b..e6c80ab 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,7 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> -obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
> -obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
> +obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
> +obj-$(CONFIG_DRM_GENERIC_GPIO_MUX) += generic-gpio-mux.o
> +obj-$(CONFIG_DRM_ITE_IT6505) += ite-it6505.o
> +obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) += parade-ps8622.o

There are unrelated changes to it6505 in the Makefile and Kconfig,
please remove them.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
