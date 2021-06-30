Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB43FC11F67
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 00:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD7561D5D
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 00:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD7561D5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NaJFFFnOoxVaHw7Nzx452pwN4TCL+3vx0tS7VbZOfI=; b=CbxA0a4gRPpOJg
	coRrVPHRJRQ8kLIi1/O+aM9lEJibv4SSNUwesE5dvwiFN7gprl6odiAflzPxjYAGTajWYsIOnlXtj
	kQO6iesgavfGLI+0xxGzGLBplt67c8yLJ9hocrBzYvsMPpR2OjwRRvptuhLGO5NR93StLzM6EWdxK
	v3kudFaqRRjeYzVX9U7PJHMoGl6IVc9CEHTjcYlrr8rAXk++a/UclSv+JpBYfew4n6GPKBQmDHocZ
	Ua+skg6IcR2w/uXKfcWrRp+i9ALcniOelsf00beluICmfrV9tAWJOEniH9Z2hKB3o2VSuKAVe7EzI
	HIECalkC1FBihG1tLOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyODc-00CKz3-Ew; Wed, 30 Jun 2021 00:36:44 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyODZ-00CKxF-Me
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 00:36:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id h15so1638371lfv.12
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 17:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
 b=PfDwdfd658Y+9K8gvsYqLkb06cvO9vPX5vmZFKpgJfEU1JV8IJOHOPB/fT9gQgKia4
 CkwaR7y+3Y3sRHa1Ei3aG16+gGPQ8ellOWAofRnxXTxEphjDYqv1CvVWGiY1H2QyxJlO
 LNN65ZIV4H4+qPr/vzxELakfbfrYCNxdUuw8FlW01wdyTO9QgR55wE2WFhtmfVqmraX1
 6dsMXQqqoSbmasHFViuFkp9x9AiAQBLFBuy8aCFxO5dfncSXXyX55TVezt+pCUhXsQ8J
 9lI0d6qy92Ma9mvUYjuBxQjQw4ace0MWZURMPTZr0T5fK/9N6n3m5y70GsyXUxOFlmCr
 SukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jtVW5NMocB6oVI0WMovmBROwRBfdKl6IUOMqibW9evQ=;
 b=YjaaQ6z4zcuAUYU9CgFtVquApILS0pBY1T4F52yF1L0ibFRFhTOx0vSzNGZiIejRpr
 GFevVNFk/LoAL+RUc4rtIw4H0p8ElL1M5zPFJAUiKueFnKVGctY7pDDZ+C7AE6H9+dWk
 3vItrBFTlVqfW3DmaPqFVy3X6DuuoxReqOQWDB9LDJZg4K32GBtrEZYG/PpIXrYQN4Hp
 CMcugVJn9337C1CVJ7UYR26ZwpS1gRRxD/sW1FQLgmPv3jb5gbXVXUZc7qOGESz0kRCu
 Rw93zawjZy3GsSlHxHkWv1R3vIlu4dEL8Tq0VfuwmaYVx2d+d3upJeMKUPHPy5ZvReuB
 TKZA==
X-Gm-Message-State: AOAM533sh7dZ+TBtiWkfYI6iD+CrKrp5bhSblmTxIVMlKk2PcIOAmQ4S
 O3D6re/uFtHUwCXlP/0TUpGwiMolRLOIY15X4dl9Kw==
X-Google-Smtp-Source: ABdhPJz8oylr1QBk4wbq+S09hbJVugu5jPx8c6IPCGHmiauvztZvUu2BOO8drcRIghnbm2IY/6t/MC8MygbdQHfkED4=
X-Received: by 2002:a05:6512:3c9f:: with SMTP id
 h31mr15414133lfv.465.1625013399992; 
 Tue, 29 Jun 2021 17:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
In-Reply-To: <20210629074703.v2.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Jun 2021 02:36:28 +0200
Message-ID: <CACRpkdbRjg1PMMWPc_5fW+PKG4SQGkaesK4++MHUWTw0MdMkxg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
 features
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Inki Dae <inki.dae@samsung.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Pi-Hsun Shih <pihsun@chromium.org>, Rajendra Nayak <rnayak@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@google.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Xin Ji <xji@analogixsemi.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, 
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 MSM <linux-arm-msm@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_173641_770122_C0EC54FA 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 29, 2021 at 1:47 AM Nicolas Boichat <drinkcat@chromium.org> wrote:

> Many of the DSI flags have names opposite to their actual effects,
> e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> be disabled. Fix this by including _NO_ in the flag names, e.g.
> MIPI_DSI_MODE_NO_EOT_PACKET.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
