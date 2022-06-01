Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xdbG88PVEdrSH3lqgsOrhBP8gIIIqHuemtwrSnivbTI=; b=ceVrfOWg00pMxu
	H2lrOy4nFZt7hkKl+Yp67kIA70YiKfRFnLg+SFePFmNChEFwABePLhSOfuhAR+KJyk2ayS4A3eJWN
	JAZxKhwk9JkJdQZ8q2aVUurUBviEdtnHI3sNUG4nlll9G7JI8hsj+9TmSV5zeErpS6j8H4q3tyykJ
	RqFpsjiX3otzpJ4eX7s0jmuErLOfYgkFFZjYf6GEU7+I6xLF+1GV6XMZhNTe99cvl8K0trdQMi+Yq
	v2GVESiw+EH12yAT7DBCtWy0IrvV1p9GahTx/RTYZ1tlTWZWLzkd/7GN9PuoSIZ970UhMOGUVdW+f
	HPrSEbxUHZf/aHtIhBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL4r-00F4cs-EF; Wed, 01 Jun 2022 09:55:45 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwKw9-00F1EU-EC
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 09:46:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id i1so1295019plg.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 02:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvYVrSCHuE1p50B2T8AG1mFSUMzRH35rYwVgN1pnAHY=;
        b=VFr+ClLg8bfhBtdYrCra7C+xLD2UYCMvTA/ZuyDiO8wD4ONPpbRBz3vXSv+5c9mvJV
         0KazDP7LcYct+M79b86+YFML//pqwhRdDnznoXtO+FLTA0sVmCu/tUuL7DIxaRN6V0li
         dlUGidNlzChRksOxsxfY7emIpz2VYfPjY1YGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fvYVrSCHuE1p50B2T8AG1mFSUMzRH35rYwVgN1pnAHY=;
        b=a0zXk90jGliMasXo3PTFxikmpds1uEomuE48POJfsMo5XRDiZ+BihxLjEQklDdIJme
         YuAwruG1SiWhTJ/39R7bGKrin6nGM4DbMM0Odeuw+tUOKl8qQQAkLpafmArer2DfVBMs
         Sa7cIyGAftTTneG6CqgkVOD4dohHh1OpCMQSAKYneOn0tebAauarIM1sZ9fro9gG0nNs
         Y9Jln2pkH/2VDVY6caA2maWxEkpNLXJ8bcrzU6i5oJi3FkuDStKQTJJcHdjpqtxQhWGX
         7wLJFpZozIPYDxVbevotuRrrMVEgb55Zq+rIki3uM+qX+kxKuxtMjXeSLar1utoBky9l
         U0oQ==
X-Gm-Message-State: AOAM5329oXPhlLw2KR1J+mS5dCwMhAjsSaDEoiyQrR8VRIK2BgQQA5Wb
	YSmWZrD7BHeqsxHHkJGLTTpEqQ==
X-Google-Smtp-Source: ABdhPJz/lyHkTPTNWf6r3FAfoIfyICC7is3wiA8+I+xC7MUGVd8BMu55GAC4KUIxaK9Y/TNtmKBDEw==
X-Received: by 2002:a17:902:ecc5:b0:164:1a5d:576f with SMTP id a5-20020a170902ecc500b001641a5d576fmr4541605plh.19.1654076804179;
        Wed, 01 Jun 2022 02:46:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a0018aa00b0050dc762815esm1039494pfh.56.2022.06.01.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 02:46:43 -0700 (PDT)
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
Subject: [PATCH v2 0/8] Add a panel API to return panel orientation
Date: Wed,  1 Jun 2022 17:46:29 +0800
Message-Id: <20220601094637.1200634-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_024645_553667_80EA6F78 
X-CRM114-Status: GOOD (  10.26  )
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
 drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
 drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
 drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 77 insertions(+)

-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
