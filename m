Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5BC43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 04:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9V2UXdgr975e8oWKXm9Sok0FWkatEFhmU/I1292g8Po=; b=LZow7jDeFK139p
	DO56/H6QsYFi0zV1iVaTkDcvtqiGSPg0pKIz6wuRlvw/AXeqTIZEokdlx31BNeGOxjH3WSy67Rx6I
	zwtzwfkqtjJ4zc7S9wB1zhfFdsLykDiDA/djCTaSl4er57xM/mu0OYRfuQCcNnNJZF6STWGntlnVM
	Rq1aQ4tOK9CXY/hDx26fgJJbSTWANQ8mhvziOZIRVfAvQ2mkRxd6p2rJELkGf34Xu3QeAzHhBxEHg
	0dlFT25GLEVtszj8N7Addzgrs0baWxXO/h0IyM3/dQqfhJQyXapxJ3xSHaABO2/FkGdR0RvV8cIz5
	qI6j4T5cBYFQVxnxR/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eS-00GhCg-O0; Mon, 06 Jun 2022 04:47:40 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny4eH-00Gh8K-Bb
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 04:47:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id q18so11207302pln.12
        for <linux-mediatek@lists.infradead.org>; Sun, 05 Jun 2022 21:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V48jIpUPpkwi/mXw0vV1qlo/0R+nh6UqO3bUzG0QHns=;
        b=nqQSjOvanX+8t+tfNQWjxQaFfRS/+GiSKg6PgDaC+vs0EtY834wW/8lUSx+MIh6+66
         QxSZBzAa72S8ewu9/W+7na7Kc7k0dqpizfCf/j+3vNxRtbDBwkBlrf52exTYP/uHo+77
         Ssb8uKKBEcUSKuPtsbTbCH81UkVrmiSnDCncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V48jIpUPpkwi/mXw0vV1qlo/0R+nh6UqO3bUzG0QHns=;
        b=7bMUfJhn3LHHR/x+rBfgva9eETWPCjqlj0KzersXu65soGADgAp4MpGp3J/uNLIKbI
         5I3PryQQj5AeVzcwNmxk778iSxwyQ1KEmhz5QCWbwU0eJYTQsqrK0qc5vVr5Ri7Pof2K
         YU+pDOfT4P2AI+MlZuBEhc6kMzfMSrVunLkoaXaIB+tLP2eLMsPjST5vmkhHTjadFCoP
         aycLxSc6PuR586AhlLE6LKMwanxxAxHKO5ZCXqrdQZAcXe/QivB3eimxjhaW+SBeuo+J
         cZv1jPVphh/hVGvb5ZL9V1/9aAXPiPo8ch9PXFC6NW7SPx+6z4lUQU0zkd+VBIu/8UoP
         tBhw==
X-Gm-Message-State: AOAM530FWgQys9k20ocMGz8PBACQNmtAmyvzLU6TzWY8M1xBZkzdtX3o
	pVabGVIreDJVjKk3/eeGE+rULQ==
X-Google-Smtp-Source: ABdhPJwNc9WTpHKy7nu/+3cTPEdExZl8996ly7Ju/bCZ1Rjy5dZNznjIR0+wzUFpxhRy9BhxaOu5oQ==
X-Received: by 2002:a17:90a:c002:b0:1d9:250a:73c8 with SMTP id p2-20020a17090ac00200b001d9250a73c8mr24459800pjt.133.1654490847065;
        Sun, 05 Jun 2022 21:47:27 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ced3:b110:401b:b32c])
        by smtp.gmail.com with ESMTPSA id t190-20020a6381c7000000b003db7de758besm9718609pgd.5.2022.06.05.21.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 21:47:26 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/8] Add a panel API to return panel orientation
Date: Mon,  6 Jun 2022 12:47:12 +0800
Message-Id: <20220606044720.945964-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_214729_468289_1A10A691 
X-CRM114-Status: GOOD (  10.23  )
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

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

The series add a panel API drm_panel_get_orientation() for drm/kms
drivers. The drivers can use the API to get panel's orientation, so they
can call drm_connector_set_panel_orientation() before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API drm_panel_get_orientation() to return panel
    orientation
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm/mediatek: Config orientation property if panel provides it

 drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c              | 15 ++++++++++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c             | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c           | 16 +++++++++++++++-
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
