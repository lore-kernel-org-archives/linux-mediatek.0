Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115A0C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RaKKpJY30DLjF30j4rsNr5xz1lKy9xjBQ30C+TFpxfY=; b=hNVFwRys0H/udJ
	cAuG+vy4eVv1/VIDik3mP/b04adXlkS71zj+09sK6gV8/GqPmAAMPC0cEJUlzUzfMMyhXMUjfgA09
	VDTKzfa13DYfj5OYkbOr09yi08wyiZCPUyt4RKxUp2dtC9ZFA7op9lxvg2YIMPqdw7i8GeLZTbREP
	VMONXhn55K5uHP2yzTknUt+IVsrfIufdxnhAxdRGYEUukK626GBugOZpDX51kgxiHivwqScFSoztB
	bpo1eqzwM6Gh4Efil5wt8eBzoOOuVSPx4b5QKMBISXNi6jO5M2vCDrmMppIoTIM9OuYaPhSSASuSB
	6h91c1rcuMHylzen0W0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyVEP-0065aU-VH; Tue, 07 Jun 2022 09:10:33 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyV9y-00634y-8n
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 09:05:59 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 129so15287490pgc.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4LE7zrySWEA9gMurfRvYyAHVJx1m9VkHmbAjloR5rc=;
        b=OSmFZAqcOBYpVk9PtT//wYdshGIbZFqLmNvinrT7LM2bplu1QaPw+SAh9TblfHTm81
         tHtOg9TZdOLiWycsapflLUGU+qZw0lGKzsP2SvF0Sru6lkn3VoC4KdThYPVwFRvsn7IC
         DSxoneUuol+XxCC8sHbzH+zHV1oF13gvUW5o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U4LE7zrySWEA9gMurfRvYyAHVJx1m9VkHmbAjloR5rc=;
        b=z4paDeqCPpIVJU7Ln6zlTRX5SVRBD0oI6iYB3X/ur9QTaCGu5Magso0ToZ8xLcoHNo
         6KMH6t36k3Es2n/woyg0++0KcWoScNq/TpmYeEya6mU8LpMXN4vx9CSTFHCepEkdD8Ov
         FAkJSfTCXHsBsrC2qjYwVjbZD73DXwmP0bK+/9PGownSRnBUzehP4wY0HIoMlgyiwSXh
         BHE+bCQKgYBqymJrMhAfIvG27EdR9ZX01QP7HYkrakFB0NdOdJu/0YqbgICpTeWZ4zVy
         1uq9pT7nHMHgmC1Wh+5bW/QRMzJoM5Fm1T6S5shD6xAahikFtY8BnJn+lL5GwtpiN6GW
         0jfg==
X-Gm-Message-State: AOAM530AtCAAX3ICfhyhb/gikC1UandQ3Gi9z7Jc0YQ+I0j1RXybcrJl
	yCrFWNMjwGozg7zStYK/df/S8Q==
X-Google-Smtp-Source: ABdhPJw1n+xUkdGWbXx1cahLihtS+UTJFd1fPnlTaE3+N4brLzLb0z8zg/XQOnqI8aeTH/v2v9Cp7g==
X-Received: by 2002:a05:6a00:244a:b0:4fa:ebf9:75de with SMTP id d10-20020a056a00244a00b004faebf975demr28675288pfj.73.1654592755183;
        Tue, 07 Jun 2022 02:05:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
        by smtp.gmail.com with ESMTPSA id t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 02:05:54 -0700 (PDT)
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
Subject: [PATCH v5 0/8] Add a panel API to set orientation properly
Date: Tue,  7 Jun 2022 17:05:41 +0800
Message-Id: <20220607090549.2345795-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_020558_328226_3ED136E5 
X-CRM114-Status: GOOD (  10.30  )
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

The series add a panel API drm_connector_set_orientation_from_panel()
for drm/kms drivers. The drivers can call the API to set panel's
orientation before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

v4 of this series is "Add a panel API to return panel orientation":
https://lore.kernel.org/lkml/20220606152431.1889185-1-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API to allow drm to set orientation from panel
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm/mediatek: Config orientation property if panel provides it

 drivers/gpu/drm/drm_connector.c               | 32 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 15 +++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 12 +++++++
 drivers/gpu/drm/panel/panel-edp.c             | 13 +++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 12 +++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 +++++++
 drivers/gpu/drm/panel/panel-lvds.c            | 13 ++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 14 +++++++-
 include/drm/drm_connector.h                   |  4 +++
 include/drm/drm_panel.h                       |  9 ++++++
 10 files changed, 134 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
