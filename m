Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0764C27C50
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 00:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UXkqvnUlOHE+7g2Lf+Wpe/9y5rRcSPhO6InYqluayHc=; b=eI1ByinhlSfGAgxspM7SIr9JDO
	2bKPBaqapPTfjp+ltSirrcycvCbKUFtyqpEKoizmqiffvw8H8p4osEvhBwysjRFnV34PpVCRuBLwP
	w0jToGcF3UWvjaBu0ecDKYuwUBH6kzalU/6Lxg0ENvVIUN9ItFuBzP7mBUuhmO4wIzwEggo/wE76O
	G8C86WFFzEB8gkH0L/vM33pMrgUmx4QtoYGqHPgzeP5lqkFQx3LtvXbvvb764eklmLJIw9JOGF2l6
	HpDGR5/t5RNL+5BQMePEyRcoPPr3nhTDzUt5enAmB2hPjZkPVu9Spqfvzm41xJzikzAh1KKEnT0Z+
	KzboiXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRq-00000004GC2-2wAT;
	Wed, 05 Jun 2024 00:24:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEeRo-00000004GAi-0zi1
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Jun 2024 00:24:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f692d6e990so16282335ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 17:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717547050; x=1718151850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXkqvnUlOHE+7g2Lf+Wpe/9y5rRcSPhO6InYqluayHc=;
        b=WzkEsWPVuvSgpoJs8rUhXQ1jzOuNXtkfdY53X4JBVqNU0cie3U34D/Ip6M6OYmAYYu
         BDtZPN0XOJSwM9ScJf4z+FdMFNMx4VVkEQ/bcU9bMUFrZ44XwRYD7IZMOXytIkLYOYwA
         G9P7Bqa5Jp14iA3aB/4dJh/2NH66VepPFG8hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717547050; x=1718151850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXkqvnUlOHE+7g2Lf+Wpe/9y5rRcSPhO6InYqluayHc=;
        b=l1HQKw3DeizYtHSvv/pLiVynw3JmeUfF7MbVOAyr3WU4bYS5DgKwhXMmPBjjmsTAok
         YEXpd91oaOBk+m+mhrCBwjEA8CgwB3DIQCS7rcuMq2kj8+rXR2EHZdpLvFbnWNq0YHEa
         qZCOn25yPmoA+uys7R/2ZXE8kBGSuACeWVzRiUpD2c2Fd0vH8yMDfjSTnY9nj6Tl/m4M
         UChwZYbKItQ7VAxUt30lv4GK9d7cOx9wvdyt06t4Zg57XzH8tg9Zli/5VNFhcZ5j6RIP
         Tr/UnJvjk0it46VmP60J8l23npfoFxf8BJs0zpgMPNpKW/V1VekmC30ELJdTRfQrnOeC
         7aFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUATqF5zZ9QAxikfAHniNAe++piPMUIMFsBgFw/W7iHSICyZW60Q6xZi7SymOarloYxey2sKpX3/UjApVkTeZ7KlHJSo9l4KFmQYyYzeTLcR2t/
X-Gm-Message-State: AOJu0YwWAfolf1i2pq/rn5tOiHP9lpqB5AavrRHaSSwU0yqiNB243YFn
	oMcW0vMmIKr15HR+y9RcNaSw8JJD91pdQLW2qR5nVii3pEy6hANgNLEIxpebfg==
X-Google-Smtp-Source: AGHT+IGvUgTyAuYEN02i7ZduVODq/yACl5LSlZJPkmZP9QjjxS40pxNiem+pMYUDo4VgKeR8msH+hQ==
X-Received: by 2002:a17:902:d512:b0:1f6:1c5f:e089 with SMTP id d9443c01a7336-1f6a5a86e72mr14291545ad.60.1717547050047;
        Tue, 04 Jun 2024 17:24:10 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:3609:ff79:4625:8a71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323dd862sm89032025ad.147.2024.06.04.17.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 17:24:09 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yuran Pereira <yuran.pereira@hotmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 00/24] drm/panel: Remove most store/double-check of prepared/enabled state
Date: Tue,  4 Jun 2024 17:22:46 -0700
Message-ID: <20240605002401.2848541-1-dianders@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_172412_332712_6B2ED93A 
X-CRM114-Status: GOOD (  22.30  )
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


As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

This series attempts to do just that. While the original grep, AKA:
  git grep 'if.*>prepared' -- drivers/gpu/drm/panel
  git grep 'if.*>enabled' -- drivers/gpu/drm/panel
...still produces a few hits after my series, they are _mostly_ all
gone. The ones that are left are less trivial to fix.

One of the main reasons that many panels probably needed to store and
double-check their prepared/enabled appears to have been to handle
shutdown and/or remove. Panels drivers often wanted to force the power
off for panels in these cases and this was a good reason for the
double-check.

In response to my V1 series [1] we had much discussion of what to
do. The conclusion was that as long as DRM modeset drivers properly
called drm_atomic_helper_shutdown() that we should be able to remove
the explicit shutdown/remove handling in the panel drivers. Most of
the patches to improve DRM modeset drivers [2] [3] [4] have now
landed.

In contrast to my V1 series, I broke the V2 series up a lot
more. Since a few of the panel drivers in V1 already landed, we had
fewer total drivers and so we could devote a patch to each panel.
Also, since we were now relying on DRM modeset drivers I felt like we
should split the patches for each panel into two: one that's
definitely safe and one that could be reverted if we found a
problematic DRM modeset driver that we couldn't fix.

Many of the patches in the V2 series [5] landed, so this V3 series is
the patches that are left plus one new bonus patch. At this point, we
may want to just land the patches that are left since it seems like
nobody is going to test/review them and they've all been Acked by
Linus and Maxime.

NOTE: this touches _a lot_ of drivers, is repetitive, and is not
really possible to generate automatically. That means it's entirely
possible that my eyes glazed over and I did something wrong. Please
double-check me and don't assume that I got everything perfect, though
I did my best. I have at least confirmed that "allmodconfig" for arm64
doesn't fall on its face with this series. I haven't done a ton of
other testing.

[1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
[5] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org/

Changes in v3:
- drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

Douglas Anderson (24):
  drm/panel: boe-himax8279d: Stop tracking prepared/enabled
  drm/panel: boe-himax8279d: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: khadas-ts050: Stop tracking prepared/enabled
  drm/panel: khadas-ts050: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
  drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at
    remove
  drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
  drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: tdo-tl070wsh30: Stop tracking prepared
  drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at
    shutdown/remove
  drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
  drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
  drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
  drm/panel: panasonic-vvx10f034n00: Don't call disable at
    shutdown/remove
  drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
  drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
  drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
  drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
  drm/panel: sharp-ls043t1le01: Stop tracking prepared
  drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
  drm/panel: raydium-rm67191: Stop tracking enabled
  drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
  drm/panel: Update TODO list item for cleaning up prepared/enabled
    tracking
  drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown

 Documentation/gpu/todo.rst                    |  47 +++---
 drivers/gpu/drm/drm_panel.c                   |  12 ++
 drivers/gpu/drm/panel/panel-boe-himax8279d.c  |  40 -----
 .../gpu/drm/panel/panel-drm-shutdown-check.h  | 151 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c             |  19 +--
 .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  35 ----
 drivers/gpu/drm/panel/panel-khadas-ts050.c    |  39 -----
 .../drm/panel/panel-olimex-lcd-olinuxino.c    |  44 -----
 .../drm/panel/panel-osd-osd101t2587-53ts.c    |  41 +----
 .../drm/panel/panel-panasonic-vvx10f034n00.c  |  47 +-----
 drivers/gpu/drm/panel/panel-raydium-rm67191.c |  26 ---
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  49 ------
 .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  63 +-------
 .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |  24 ---
 drivers/gpu/drm/panel/panel-simple.c          |  19 +--
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |  23 ---
 16 files changed, 199 insertions(+), 480 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-drm-shutdown-check.h

-- 
2.45.1.288.g0e0cd299f1-goog


