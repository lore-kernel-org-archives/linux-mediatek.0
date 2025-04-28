Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED7CC369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=; b=I2Lr+ydrQGO/gvKDca/Wu3H7+h
	tQIElJVmDkkH6LHKZ8mJ93r/d36jTTYpCpMJjFhjvA+G8M6qLpUq+pb7B7PovhCPnBobtut59i1Ee
	ll5OL3tIF11OUGqTfLz/2ShsA7rBzGpjSV5VlC5my66QVj9hFc+Ql/G+V4ys64SVxHBhsMsNkWL26
	F10+782p3ozOlrYW/orjGlSknmFTiJ/4RpVi/T1mbw+AEYWzteCnNRU4/Enq34fQeEEOwgXub6+8B
	O6q9iNUBl77Tm59Ok4f2OyBEPN7x4ZYePh4eVAPEa5m7lnjf3WqFxtBEPjel8am708Ok+MHYhHfwW
	UtYhegLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VW2-00000007WLi-11nK;
	Mon, 28 Apr 2025 20:55:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VUL-00000007W3t-3yU6
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 20:54:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c33e4fdb8so56821355ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873645; x=1746478445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=E8hKiuPO2QdODKZbYH/dZJ8smzlZ5LhneojEzgRRDjDuvjbh6A8+TO0phztI9xeo2U
         NVUvlgn7cQZPb8JuKLLU3H1d91UaYSBXEJ7Fg7HoXZOhmaY1P4zg4waKbFdFOay8NIdG
         bSQs3CDienDx59O7C5fOAviYV5EDzAZTWn63s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873645; x=1746478445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=aHMb0N5XXHkyytTZhdKGezknE5RM7KXxZsOOrBCH/AUxovlolk1eR+RWO8ntr+WNUK
         Hrr3wujJ9EWs5UC5swNc/WbqXJZK0EQk9w4ckII2merMpi/4eiV5a24sHQbrMyAht0cp
         Bp6aB1HSsO+Jqi68qMnxWkNc1P3IKiFt0oduFj+TqlUdUEk9suZhXab14r2ljyX3q/Bn
         PsQ+U71RApBrIPE3666Ze7w8ZAT4yyrSf8zO5oP42tjvBwKQ2ryijs++RE/uuTER/3RS
         R5upW2IWUHtu+WvKYFzmrtidaOLV8l78b3r3YR6OlLipLsgj38Qt40df4bxKDhjhrKXZ
         oTNA==
X-Forwarded-Encrypted: i=1; AJvYcCUS67lbb/baSPolmnwSoEZM4FNnjHLvKKOa27cnzo/pwdu/S6dSxkJqguB54X4DWknfIhTFAjxWA0Z2DlRucA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhOCLCkEGl9ZdL++4v19kq1U0nZM1JHH8VCMXLM1QxdF+xIh5G
	sOgcdNopU9Hc/3ijeSd7HErjZHn64twTItDs9LCLNI8bJyZOzz8+x4zD0N2PcYdJPgxlxvTkQ7I
	=
X-Gm-Gg: ASbGncsK4XcxSOVoFblPi0auxbuZGWlWYxOXmOdrLq5TAAUvnAdcXB/bX2y5fPfVuFP
	q7Bo7fty4KeSPRuPg0p7WLL/fkQoBM5RZ5dxS83UstGIKg3oSFIUBKURKhhGwcG4ab56ywqZTZR
	8/0fwCkpMB96THlXZyVKlmHElaS7AKqFnZezL28D1MBc0wFZ28c4xINvu7OvZozbGpbW9scKoJo
	CMh+ykishPuIQd+EZLrDIBVNyYfmrJGs9Im9A1hyTvJKSC9OX6LnwIeilYw+QyjnCFMMXYN+kRu
	jb6HX+irHDp9/VIAevwjR/g2My6CUQMPs2+FZdNGLA+T2DTKQc3R3zbyiExjs/y1iFfTzj7JU7r
	+WNbSTCgYP+ZX3zBQHHU=
X-Google-Smtp-Source: AGHT+IHrs2/ZBLt0rceQ6gRPv5rTxiJwws+cRd9EIm2Ov929YU+Qw9+CI0l/+L9SlgDbOST7em6HLw==
X-Received: by 2002:a17:903:2a90:b0:220:d79f:60f1 with SMTP id d9443c01a7336-22de6066d53mr13211345ad.42.1745873645373;
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com. [209.85.215.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102868sm88289115ad.164.2025.04.28.13.54.04
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b07d607dc83so4653535a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWdShDrpODY2BHzuPKBV10ZdmcNbF590v+zO2haw3d+1h/A03XxK3hmet02p5xRmGuZdWxdMqzGMDpLwq3hA==@lists.infradead.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135406_003074_9D656E78 
X-CRM114-Status: GOOD (  12.50  )
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

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.

