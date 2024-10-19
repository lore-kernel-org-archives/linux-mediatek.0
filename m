Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B63D3C919
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j8gEdaXjCgYvssEU5IyYldyfPJ7EgCEc7AKiV0Wplo=; b=tHwZ8mfjPYMjRNgK5pEihIMYD4
	JJRm+UxIZ101v1iSdfON3M2Tto1O1VccrTBJg++RwmTb/O0Cl5FxIolXzejBeH0bumH5f4vXCUTl3
	6waY2Gv7niKgTmUMb4B7QgBDfwtnz2x0JbgVxbClp1A1+Hgd6GC07JQzeH6EDajD55unElaaCHht4
	VzTwijBJYKnO7Jo3KyuWotcNdVNwCGKlf5ASHorxCpPyl8Cmqi3GhgIYtPpqjrez+HxCkOveYqLHg
	24iNmO1dxQhzN6E71Tn3OEtYyJFvpA/JXp0YnZZ2Ukg0ogh/ofBMekJi5ywAewz8xoP2BixjyIkgV
	vG4Jw1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Aup-00000003T85-0Voh;
	Sat, 19 Oct 2024 14:58:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2AtK-00000003Sqc-00lc
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Oct 2024 14:57:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so33613161fa.0
        for <linux-mediatek@lists.infradead.org>; Sat, 19 Oct 2024 07:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729349836; x=1729954636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j8gEdaXjCgYvssEU5IyYldyfPJ7EgCEc7AKiV0Wplo=;
        b=TihQjIU5ysnlShRLuAJ8vzWxygz08tJeAcMIx9Ht8c6JS0mq9L+nQd7jxIOHjawAlo
         IEuLOkk1rhLawXzg1a1KcM2LJH7PJoxg+prFtZ2S2eSGMljyWY8u9EgHx+DouuxtEu/7
         Z3Wun7WzDag5LCJGY2ZrnCb5pBB/kbkP5/HyhuFE4l1iA9RzJPC0iYc8XhWQNCX++xZ0
         XBw1vwtxZ4HXJTDvJjVct40/8i5HT8EDl7Jz52MK32jS+Wz8qUxVTHJPuhwBAbxAbm1z
         e3tK59pJhfx5lZEPyQySAVNG0IL56h0g4/T/EZ7HSmYedaPQPIsjvw/oVYo87MOMZ7aL
         D2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729349836; x=1729954636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j8gEdaXjCgYvssEU5IyYldyfPJ7EgCEc7AKiV0Wplo=;
        b=pDElQZ05s+JmyiPWX22237MeR/TbKma3QJRMfMOjKhGVmeZZwHQ/IVSUWgyegDg59r
         UKupbE1j1n9evUFtuNqME310W/Wl4fu3z2r/mSH5UoV9kb//hVgGVViQVFNrjIEXuYHM
         fIpY5akNbWlLqeiLXDpDTJJZGv0aKrCImHw3NKYwZMxqoiLUqIDuGZEE7CnjZMaUXibW
         Bm37R7/dYAzZtMZIZem3nTZN75uJk68hkWEk+1Axx7Qk4oCgyCsgvPVUu5eZFGhTGMZc
         IS9KjjzQLrV3ePfXH6lFCeku1eeyoncXFO+b1NYEBvuGIbchweDt0eMC600z7ZhCswO2
         isSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3aCOY+UVhp4BOs0gtPS06iKSVjqnR65hZBXN17fuJauLL1fja4Ry7MIPxseF3YU9MslaAN4fSr8BbTTk0IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCiSBEabddbxKqTdr2fyQ9V649DLqaWuO1tscqEdGFveLonRjA
	Xzm6/ZYsnMdh+Qvjf7rjBUGBCFcOF4WxO0fkVaPRFFKSNkGtAIEadxNH4XW8I20=
X-Google-Smtp-Source: AGHT+IF6G/RBVCJ37Wkr6byblq1JGc4buk0lZZCEyfBOLwQBxZWy4M9lW7077J1jd9gHkbNS4kARzw==
X-Received: by 2002:a05:6512:3a82:b0:539:ed5e:e226 with SMTP id 2adb3069b0e04-53a1522a891mr3517985e87.26.1729349835560;
        Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15214f1dsm551788e87.288.2024.10.19.07.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
Date: Sat, 19 Oct 2024 17:57:07 +0300
Message-ID: <172934981948.2755496.13654719356285263322.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_075718_055935_6F0655CC 
X-CRM114-Status: UNSURE (   8.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 25 Sep 2024 17:42:39 +0200, Javier Carrasco wrote:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> 

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: dpc3433: Constify struct regmap_config
      commit: b895a1805e0b01d523afa71818cb97a5d2655fcf
[2/6] drm/fsl-dcu: Constify struct regmap_config
      commit: 9239d961ce9d95ec13e241407d0320228e664d68
[3/6] drm/mediatek: dp: Constify struct regmap_config
      commit: 02f686d17c4305a0b5e2a9de749664dfe9c0f63e
[4/6] drm/meson: Constify struct regmap_config
      commit: 0bcbddb7ef0edb8b4ca994033128e955bb8b1b74
[5/6] drm/panel: ili9322: Constify struct regmap_bus
      commit: 6a92271233fb4789f69a9ba9410b23e2e5ab30e2
[6/6] drm/sprd: Constify struct regmap_bus
      commit: 420fb223fe6049f5eecac0d28136df5bc5699ea2

Best regards,
-- 
With best wishes
Dmitry


