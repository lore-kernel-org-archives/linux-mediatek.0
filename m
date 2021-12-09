Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C3CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0VOTJ1NS7dhLTQv6p2J3T5pSEpEtv94brD9Jr2F7mA=; b=w6hi/FNuF9UTTR
	vxCZZDHjr0Qj4I2CMvJTYWIRKXaBjYLVrfJ4NX0II9zrjdiWJDIXzqhAqZXWktcxq0jH+1FZ4OPRT
	RS0sPHgVdOGwMTfVO41n3EQ0UvPp4KYyFe0xyETkPB0Ea1yen30tNzj9d6sTYIGJTdHaarvn5RiCD
	leVpqg1VQ0IYAbBQ/0ST4tY0ivIfNZNgvhpY/rucIiJrDCwkqNEZ+8TWQBmzdk0nVw970humE/grD
	k2u/zmozC10F1izKM0wkuB2sc9iOs8V4T3/RHY6rNKSPRHrBfS1tV5OazNtGIwWJMWhoLMstnb3ib
	xb/704jETIGdWr+/50wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvCwU-00F51n-Gr; Thu, 09 Dec 2021 06:30:10 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvCwH-00F4zs-VO
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 06:29:59 +0000
Received: by mail-io1-xd29.google.com with SMTP id m9so5542447iop.0
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 22:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q8iVKmula6kup2FggoACJYgOZKL5qkbL208e7B7YSZ0=;
 b=lIsVrGsHT/UrtLfGXyU57lgKV3+kffBBbS8DOnD4PJqXXM+TcoGFb8Aa7vvsW3mFj7
 GcILKQXBND1a2zNPqau8LY8JYlD9v1p/XyNrCvwquWQKTgZge72zMANLefatUAVOCUqS
 ShKC5y65hWZ2c6w6o5LRBc2TX71bQ8XZHklFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q8iVKmula6kup2FggoACJYgOZKL5qkbL208e7B7YSZ0=;
 b=1i7+IY//E1u6diT2NaAOQULgzKE/vtUeT7q/nplYHq7sknCtY0/7E36yMByyigjvVW
 mWuRFzJc/gf1Fol2B63rtqzRGEd2D123mYmIDkxjxuIkj9wgyTVKaUr4OsQfl25zj2We
 1tQzVB/CKhUDdFo2l+3ys01H3OrX5KFYymI0ScMv6Ki6WTMTkLhu0TVtzM9yRpR5+yPb
 xhhNMMtekx6jxG0//yAe0Y9WuyEIRQJrHanr/etARE8NfV08IsWPe0eKz5fRaeFEUZKR
 0r9PKyUXAWGofy5gkDMQbxh7Grta9IoQGRHT5QJIEEWCQ8WBZvKsKk2VKBHSstzPNnsz
 8+xQ==
X-Gm-Message-State: AOAM532YSb85dwLe3ip1RXKIHUjJRrq/F/dXmE4+dBIJRZUoJ3lDVZis
 HcZ0XglQKhom6hsVLyv4PB6UJteJGFZ/8xzvo1kScg==
X-Google-Smtp-Source: ABdhPJz1ziC9jdN583VzYZiyMCss/621HPuZKoxSvszO++lZ7FQD6vUcUIB1z0a0HEZnAytrVVflJqwOW8m4dTCGqDg=
X-Received: by 2002:a6b:2bc3:: with SMTP id
 r186mr12772991ior.167.1639031396270; 
 Wed, 08 Dec 2021 22:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
In-Reply-To: <20211110130623.20553-8-granquet@baylibre.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 9 Dec 2021 14:29:30 +0800
Message-ID: <CAJMQK-gGE78qZoR92d8OH6_vTzBR5ry04nKGS22Dw48vAo7+AA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_222958_044695_CE0C744E 
X-CRM114-Status: GOOD (  25.79  )
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

On Wed, Nov 10, 2021 at 9:08 PM Guillaume Ranquet <granquet@baylibre.com> wrote:
>
> From: Markus Schneider-Pargmann <msp@baylibre.com>
>
> This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> according phy driver mediatek-dp-phy.
>
> It supports both functional units on the mt8195, the embedded
> DisplayPort as well as the external DisplayPort units. It offers
> hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> to 4 lanes.
>
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so that
> both can work with the same register range. The phy driver sets device
> data that is read by the parent to get the phy device that can be used
> to control the phy properties.
>
> This driver is based on an initial version by
> Jason-JH.Lin <jason-jh.lin@mediatek.com>.
>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---


<snip>

> +static int mtk_dp_probe(struct platform_device *pdev)
> +{
> +       struct mtk_dp *mtk_dp;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +       int irq_num = 0;
> +       struct drm_panel *panel = NULL;
> +
> +       mtk_dp = devm_kzalloc(dev, sizeof(*mtk_dp), GFP_KERNEL);
> +       if (!mtk_dp)
> +               return -ENOMEM;
> +
> +       mtk_dp->dev = dev;
> +
> +       irq_num = platform_get_irq(pdev, 0);
> +       if (irq_num < 0) {
> +               dev_err(dev, "failed to request dp irq resource\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel,
> +                                         &mtk_dp->next_bridge);
> +       if (ret == -ENODEV) {
> +               dev_info(
> +                       dev,
> +                       "No panel connected in devicetree, continuing as external DP\n");
> +               mtk_dp->next_bridge = NULL;
> +       } else if (ret) {
> +               dev_err(dev, "Failed to find panel or bridge: %d\n", ret);

Hi,

We're seeing
[    0.424599] mediatek-drm-dp 1c500000.edp_tx: Failed to find panel
or bridge: -517

It's probably better to use dev_err_probe here.

Thanks

> +               return ret;
> +       }
> +
> +       if (panel) {
> +               mtk_dp->next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +               if (IS_ERR(mtk_dp->next_bridge)) {
> +                       ret = PTR_ERR(mtk_dp->next_bridge);
> +                       dev_err(dev, "Failed to create bridge: %d\n", ret);
> +                       return -EPROBE_DEFER;
> +               }
> +       }


<snip>

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
