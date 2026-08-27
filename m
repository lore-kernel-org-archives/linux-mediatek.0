Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F70C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=; b=yLNDbLaHgPBTiP9Fy9a8lsZLEO
	kgml/6PYVm+yJjaEFoqjtYwSM7qV9xHTxWMoadFKLqQ3V+mQQ7TcZngtqQRdJJeHmj1jLZHXEQxb8
	LxuCzx/Y3RPN3Vm9Y+XYS6bN8DnH5U6MJ3rD3XaBgCgt+1EdpQ7Ra9WrMhQRTCCSgC8ojeWnCmSy9
	6sgyKjdUcyY1vX5ip4j5NlwZ0yAxTGpgddLQ60sK086sB9auKL7hpvWM9BmlPacmW6mjAFWb4Y9Pq
	Ijc1ZTHYwcAYVXLrSYDfritL+JHFMLR2b6lI7dD8wOPDp0uaelRYl08d/j36mDIwiQvTJAVJLq9QQ
	O4wUS3Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzctS-00000004Jc5-2anF;
	Thu, 27 Aug 2026 16:23:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzctP-00000004JbN-3VHj
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 16:23:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so4165176a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787847833; x=1788452633; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=W5XDDL/ryPbTzgyObe4kiSJIUPtjhFzwQklkJjmh6zkwDyjzwluQ5frc9M6xKH/iNd
         pCF289dOAq5tKvXlQOrZ6mEpcASwDIWwQFpSsfiAgUNZnam/jEk+ttiHOGfGLAoUbEV1
         AysdtI9+mqWR8SyQ4pl4zQBPGoIYLyB5YyUxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847833; x=1788452633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=W1kuJx4+JKobY7j+hicI1Nv+lNej1LsSZadwfkLIgSqZ03fVhG4nvc8rtqOlZ5gD6H
         cthkBJPPgPvIK0ONdVzuYOsLYhW5qSP+lbcu0CEUcZOAQqigCxLdwHCeloTXTO5HxqsG
         jC9YYzrlv6dYtG8D4WrVkJ/lzuQztIut7p/lGsJfycvyEQ2DOB+9OjXD0q1R4Gk4mwfe
         CGvnfexqvXKJlahz0aHcHDbglNQlY/4GVU3FqdgUQRxKMgYwnNuOQBQQAsAS4KAKo/xM
         0Q78fl2MCpujRmaLV7oKHr3XcTEc8FYC64mQqnZ1hQU0RXbkwC1kd7QUvoA/NizoT09m
         tvRA==
X-Forwarded-Encrypted: i=1; AHgh+RpFhigiq4nIUNNzfYCpKXXlDj8NXOENUdv3qCR5qDrioJn5EPp2JvKLFT61WV3pPMP4d/3NWyjP/xqEKzrA0Q==@lists.infradead.org
X-Gm-Message-State: AFuF++ndEYuRJxTEGLbNtau8P2IuB8wUkVOwII2iShljDigP7g0WDHnC
	hnaRInRMCTMhWnoHzIvp5P9yPTQ3giEU/f/OTxhiBnip9eZxXE+pa8Po/vXEKyiXWBSJpgkftPK
	zUQYDtQ==
X-Gm-Gg: AR+sD10AhUhLWcSju2NVhyVa79252S1f1bAfgomWITU9wqwF5CfumZLgu+n6uXDCFaO
	1WG2h3nBc9UIkW31lm6fiZdqOXaTeuWp3CokJPFe17XmQqmx6BZuXaHXN0332CyElw5vphfZBAP
	mlBXr3SMh72+dhEFxUePxUvAnv/9mMyXsClMl8X0Otq53Frv+0mojIqlCOgPbgYYe4JJygrm15D
	XjJaNcjTjYw+H+I8B5nv/rYNuSCwwu83HB2xiuzAn2CJniyQZnlQza6iI3j6A6qypxrSqTmDXI2
	IE744IAzjNM6kjnNgNWwP0VOtKS0VhYayBk6qCRODa2EXMvzbTBozGYkb8sUcGcP6V1I87AtseD
	6/rI7rliNg0ealj+OTrpeeDp2dlVOuID/0y0tOfEUT8x82se9t3mItDu3I+wZRPsJwefzA+k4dx
	H2w6dxrVPG+NVvR+uoyX1rzt1lqDaUWwRRx7yJ1/gT+C/F6eh0ZhPs1KHZlm8SdiRfvWnYIldZs
	DmENcKKAPgJLir9huL00FAxY1g=
X-Received: by 2002:a17:907:3d0c:b0:c25:37e2:2d3b with SMTP id a640c23a62f3a-c2537e230c6mr608620766b.10.1787847833173;
        Thu, 27 Aug 2026 09:23:53 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2553ee6b3csm5521466b.61.2026.08.27.09.23.50
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:23:52 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4815bce4652so12128f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 09:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrH+lWpynEy8JRWzMFeXsbhCeSby2h4eSBs2X22l10300nZUX9rIGpYaCEIU0N6hYPk+oqeU9gmEPZx8zVqLA==@lists.infradead.org
X-Received: by 2002:a5d:64c2:0:b0:482:e10e:58df with SMTP id
 ffacd0b85a97d-482e26d51e8mr23348728f8f.21.1787847829596; Thu, 27 Aug 2026
 09:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:23:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
X-Gm-Features: AcwNN1Uxl8vA8-7oT2LAyO-KpGAM6LbpIr9SieIL_bb_C2KnJR44V7-XxhJsCE0
Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092355_919349_2A48FDE3 
X-CRM114-Status: GOOD (  10.71  )
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

Hi,

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver uses the drm_panel_bridge API and not the drm_panel API so it
> should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Which exact "drm_panel_bridge" API does it use? I don't see any...
Certainly it's highly likely that the next bridge in the chain is a
panel, but there are no API calls that I see. Maybe the scripts got
confused because the variable name didn't get updated in commit
5486eac81004 ("drm/bridge: parade-ps8640: switch to
devm_drm_of_get_bridge") ?

-Doug

