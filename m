Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C125C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XD5t44+9DTSzcWf+GgD99imo/6HIbSLy15g1LU7CXOQ=; b=CteGeG5sD6D58S
	nfx+eHM5sVlx79OYuNU7TB9s1qCTMmJiLAckJTTv56sOM2Q2w12MzSMHbSeXv7cb6yhkxwit/2CSW
	/BpYptVHYcxL+0iq5MS/cmTkV8K5mkZP2us07oHy+HR/bROktxGckTKMElPfB+FBj2Lx7xxHvNInp
	dmSh+nkXv30fWQ+Kx9/7LOxgj3ReTFCBOC00nURSmsIh/fxNpWZ/+7OHWwgYzpA5rb3GD5M8FCIm8
	QV4m0StkQFfRUw5NVAd+5cvSdSHfE5nVqe8e5Al1VOZ95Ih9bgWRJcZz3QKN45kfstWldv8fdrWm9
	vzcjcutv1cPMJseTTfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJZG-00EaYh-Lk; Wed, 01 Jun 2022 08:19:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJYo-00EaHY-9C
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:18:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so1346415pjf.5
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GemiEwLCjqeqzreRXrlIOTn/YyLsal6nhhhXl7NXlqk=;
        b=fUCScFzCpuzwgyHn7xrFQ7LGQY1FA++dCWMbhVb83r3eKHVpLa283g3v7wU3WUEKzm
         JGCGzFjgej+HQwWcdTNenFSje7ses1XT25cOmGt+ACU0UKCpvDLhllWBp1y2kuWuZGLT
         jy0QT+usJUmu/D0p+bU7o518zh0ElhfJMicpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GemiEwLCjqeqzreRXrlIOTn/YyLsal6nhhhXl7NXlqk=;
        b=NSogkfunJdzf7jByT8mFFDMPqykhl6dPUAOYOyImrf+FKyU/1SzaoPZ81QOUl8jiy7
         DFfdjMwMytv63MgA3CLbw4i7NFwG8GGaBCEMwbcHKHM/32T9fKx6VmcTyWZKw4OKBQL6
         LhzqFNh/0udJBudjw/hwq7k7numxUQD2jCdhQY54LFNQl6MKnpXhUJsei+0jqReNx0ew
         41kAd8/rWGilq5Wk3slPK3LqtCAG6TcEIgXQHmf3UB7S74CQvNWfM9v6KeQSXOJy833f
         3RLWld64UzjP3LGaEhVDqJH9g5EoEyigqK1VBWkXpax9Mslf4Zh4Nsckkp9iNAs4TyNX
         awnQ==
X-Gm-Message-State: AOAM533Kv28gAe77nuYpYW41H7+fte33gNXK9ql7XE8GxNaFRWI0oBhc
	mfmNU5Pl6LZCYi76Ikeby/+xibxz6ugyOw==
X-Google-Smtp-Source: ABdhPJyLFVUlLgJ+84lYTY5lEbCVVe3v3IQgMn9ywuY3YaByw8oDrtX0EITnzMoe+Ibd0yBMOKH7fA==
X-Received: by 2002:a17:902:a705:b0:156:9cc5:1d6f with SMTP id w5-20020a170902a70500b001569cc51d6fmr64614112plq.66.1654071510782;
        Wed, 01 Jun 2022 01:18:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:dc30:e75c:ae95:f2d6])
        by smtp.gmail.com with ESMTPSA id c3-20020aa78803000000b0050dc7628182sm824680pfo.92.2022.06.01.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 01:18:30 -0700 (PDT)
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
Subject: [PATCH 0/8] Add a panel API to return panel orientation
Date: Wed,  1 Jun 2022 16:18:15 +0800
Message-Id: <20220601081823.1038797-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_011834_427768_7E0B7421 
X-CRM114-Status: UNSURE (   9.91  )
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

 drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
 drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
 drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
 drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 81 insertions(+)

-- 
2.36.1.255.ge46751e96f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
