Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79792CCA482
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hZ5qs2kgSpkm+Iw7VRmnfesDIvZdLdpUOq6IX/swYxw=; b=KuqriEFB+slMFE
	6rc1x+cSQFUdpKnGQB29GFpwPWEqoIDMVudTUwY8S0xxyki8tFbxqMKvcU6UIUfUuTDDXm7cv3T20
	QU+TWkQE4eWl4CI8vmvyXFMtdWPC0Wy27HUJMfQYJnZgKFunYIXRzPJWAe3VbBI0qCn/hLZ3jLM0c
	PrQk6/wgSMgzxTQ/+PEMpd2c6IsW1Tv4sSOGGt3Gu/2QxuroEnIp6gbRnDk/ZhDdS0Qvj+wNzphk2
	pGKmlxiDtlpIKfCyxVy428OAQeVnMXVkOUYCb/g3DdsH/Z1tIrcjo4QN+Bd55uVhcBT2lQuZmTN4O
	du/N8DLkDx4/teP4bOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEb6-001mIi-SV; Mon, 06 Jun 2022 15:24:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEau-001mBS-CB
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:24:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id cx11so13092094pjb.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nCKSgi5ghJh488few+daxz3n+frldGQMli1tF7tyziw=;
        b=Ly/cjxqyjPT9IndQDQLYI+ZjtL8lWCrmZudRv3GvHr7KjYTv4MVJzC8F4KqzUH1WZI
         ctE8rDupsFcURmpqMWiF944tW2wc65OHIXrkmqNN1RblfZ5SXZrHEPuXa7lrzgx0btu8
         +bCBc0Pcrtiwv8frSSD330az/t2Dp7qQy0uMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nCKSgi5ghJh488few+daxz3n+frldGQMli1tF7tyziw=;
        b=mu1B4L3EyyKiWf7UMpMbVCWj8BczhdlHoKhyKNcCtVJoQRHTLreWkEATU5E7RKFV+j
         KdkNszenbb5bRzlZpC5gWUrgk13EecEReTARBzQbA70VtOptYdACi4J1iHF2auVOcfI1
         77UuQerkZAprn9UGqaXImjbIOL3OoFHWQ1DjDsBOb0mWRCnd1j1De9Az/8igqCqawWWA
         anmKrPlerBzyyMpMaxIEmmdJHXUMdSZBmeFydGHDe/hFyyeYpsZggjJCaDJXSr+eqWi1
         il6XgX2+uT9dXhFMbxg7ls0IbZSKC1Uu2QQyN8fjj/0e+RZ4IklXKtvaqzY4NVwnwmyV
         fBrg==
X-Gm-Message-State: AOAM5333BOhhEkfQvgwdXRyDB5C/alI/mZ2aBRRtTzixAMrYAyWcqB07
	p5fbx5w8rEB+VpIAMES0eQi5aA==
X-Google-Smtp-Source: ABdhPJx/j2miMgCNt4Lz+zNAOBFsU+ps9maigyn2E1oMZ0cj6Y7pMkdlNEf4FN7+jd1e8jQNIgqnrw==
X-Received: by 2002:a17:90b:33c4:b0:1e8:6e2f:97a2 with SMTP id lk4-20020a17090b33c400b001e86e2f97a2mr10110935pjb.165.1654529077457;
        Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:a0a:5e4:e24:c8c4])
        by smtp.gmail.com with ESMTPSA id h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
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
Subject: [PATCH v4 0/8] Add a panel API to return panel orientation
Date: Mon,  6 Jun 2022 23:24:23 +0800
Message-Id: <20220606152431.1889185-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082440_447680_8E85F866 
X-CRM114-Status: UNSURE (   9.59  )
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

 drivers/gpu/drm/drm_panel.c                    |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c              | 15 ++++++++++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c             | 15 +++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c           | 16 +++++++++++++++-
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
