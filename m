Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F45DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFiAneKtfyVpMA0VYXP4CYtFyTxeHu+8q1+4Oxaf5lM=; b=nWxG5be42qLRUR
	eBLurVrVw/QarahAXe71WuHYTryKBCS6p2XhlMCk95U8KQNtLo+kfYxfJkfTzZXkc+v6WfIvhrq+n
	Ju692W16UGB8yH5AQ895UtQN/AmFb6l5T1JSdk+c0xyxj9ne3hUJlW5zLQZlRNjkXgtpCyvU44ujN
	xj+RDpOvQIN1NlSN1wFURqusuIyE1BmY49rbJj3nF3VA9U9oTcnXqOuBVHtrmpe4rGvss/3iqsPTQ
	mgJY3WqXwOB8cCWNWI28sBkTiGOMsr+aICaKh5xeLx6UbgqNQpy4KrR7viTb3id+1i806sXS5PdJi
	FUNxYakQA1veW8NghMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV7zC-000mcb-9c; Fri, 18 Mar 2022 08:29:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV7yz-000mWv-2c
 for linux-mediatek@lists.infradead.org; Fri, 18 Mar 2022 08:29:14 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so3891586pjb.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Mar 2022 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZerwMZnU5WRGenUWw/mrV6k1v4q9EhMydhshaosUPPY=;
 b=T2JR3/lfNpGKK7qASyH6+wW97BBOWNrh7oRmcfnmWSqfgDCBAwtyhw6+z45yNahIVS
 eT7DsjSjEvXTznTI7qXdOGBWQS7eFEssrIgW0IBCHbilYllZhz4kW2weUObdWIu+O4X8
 KFf9ujVOZylaa3ymqWZq66ufRx7SrPJ6hbHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZerwMZnU5WRGenUWw/mrV6k1v4q9EhMydhshaosUPPY=;
 b=ygr0rOBEdG16OFZc/j22NsSV2KuULdMBALJ0aSgRpPpGA3UC1GGC1Zz9xKM9h0zBIy
 KMBCjUfb0GAtza5aAQXwmWvh3JbWZDdQdcawiXIOeZXtmuuOXyFXToUA60mCaafwHb/Y
 54DsZYA763W+8guvmJnTE5Q+CgB079Q12CSykaMfvCymbXbf93SqpvNosxvl+EGWSK8u
 C4N/Ee7WbOT169oaAnfcRox6AS5qprMdDOzl4HJZONt32/H9r9IuTd3V62sFWjIVMpxs
 BvdW6aL/66SZYXXtBne/JW8VI2JH2NxdMicfkAgje6i36CVMk48AgE+oeip6oLJDS0pW
 JQKA==
X-Gm-Message-State: AOAM532W/fKRtuWOaY8sqxsU8fz+hMH253DKh/cW+pDb4ysVpmyVJsMl
 xbQfwtSHGEOKIbchzK/4FXpKgw==
X-Google-Smtp-Source: ABdhPJxSlFaBTNqCJx14g1bDgmJ+YaO+Pg4LlRrGaMoIJ9J2tXiqSbojTVGwkQAUer85nUyOr+wzKQ==
X-Received: by 2002:a17:90a:ba10:b0:1bf:6900:2c5d with SMTP id
 s16-20020a17090aba1000b001bf69002c5dmr20601000pjr.36.1647592151148; 
 Fri, 18 Mar 2022 01:29:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v9 0/4] Separate panel orientation property creating and value
 setting
Date: Fri, 18 Mar 2022 15:48:21 +0800
Message-Id: <20220318074825.3359978-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_012913_145243_3B2F82E5 
X-CRM114-Status: GOOD (  10.34  )
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

Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
orientation. Panel calls drm_connector_set_panel_orientation() to create
orientation property and sets the value. However, connector properties
can't be created after drm_dev_register() is called. The goal is to
separate the orientation property creation, so drm drivers can create it
earlier before drm_dev_register().

After this series, drm_connector_set_panel_orientation() works like
before, so it won't affect other drm drivers. The only difference is that
some drm drivers can call drm_connector_init_panel_orientation_property()
earlier.

Hsin-Yi Wang (4):
  gpu: drm: separate panel orientation property creating and value
    setting
  drm/mediatek: init panel orientation property
  drm/msm: init panel orientation property
  arm64: dts: mt8183: Add panel rotation

 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
 include/drm/drm_connector.h                   |  2 +
 5 files changed, 59 insertions(+), 13 deletions(-)

-- 
2.35.1.894.gb6a874cedc-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
