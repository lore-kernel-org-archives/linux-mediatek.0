Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E328BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UIjZYjz+KDRCSSIizaqpQ2jzY8KGnXindF2gfhckhEg=; b=vTV8OD3A7QgDj3
	itHzTtRdaBwEsIQBsMeMvF/KJDIpSYdbO18I3DlIFTqh8nOpPyYc46USLh/051gS6pNM2D6k+2wP2
	J8j63PgiQ7hIAqXi70SzZAokI9KGYLwbhxQ1s5QYmUpofYBLem5S4iLXuPjHdKuCz640hMjqGFH6P
	QSrZEPfq+rqiWogsYAyB58pCpoEapedrcf2KcDe6I0KWn6hEPwGLeGZUOyH7ixJaU72B7t93Y7tYi
	ive2ypORFtQgmWL6KnP7JKZ29zxMpgfdcCnoT7qwcPrdTRbl4Asf+DIkqiSXy+siEVi506/0ubcNS
	u9/YyVDMym18vYkQbeTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvacZ-005skv-6i; Mon, 30 May 2022 08:19:27 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvacU-005siS-VF
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:19:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id cx11so1964901pjb.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBLLK5jVhwbNway5d1jcnH/mwgI9yxE1r2VmUrlYtDU=;
        b=LLgjKgp2+ro4rOIKxUWfMFimQjfxFWRvVWoMjpqWUvgtX/IIENmwdkMHUIq88hcolf
         ROFZ7vAAUlY+NJsshhvUkkommU11wX7sGxpjL1CjmCeZgVV/zkVhk3p7u/ZyNujeoi9J
         QxRXyXc9nqN8qIybleH4/7N9FDZp9fBXbaLPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pBLLK5jVhwbNway5d1jcnH/mwgI9yxE1r2VmUrlYtDU=;
        b=KjPO1R7oXgW3ApxHnGcLqYc/HLtKMrzLqNeU7Qr7EI62Adnlo8WkQBfrZIK2eS3WWE
         yVhIQMjFRvd3fnQ7jjufF8yU+BllXk9dB6ZRSXPASK6O+PENxfWim4i4P8tPqBCagsEY
         Warfk+BTLcIjRn0QXKIEGCR3CiGEhloBp2uqANMiA9e+oQBhiWkoUmxRd6/Yj6HYnPP2
         JvrU9w3h5K13GInAFgMAZwodeEAqCrFSVbKzMqmAVCXwDjlhYcnBALlpmAk14knf9qhX
         VmPbj4LnV8tyllQxwgJgitQ+zWMJElHBBMkXyflISyXQvoulatohPgjxa6yU+9FBmUx7
         gVvg==
X-Gm-Message-State: AOAM5328NrccRaE9XSy07Lg1CWZSKifXgQOTkMKnJm8idxNllgusjy0G
	Mio7D3HGdIF/XQeissmIf+HU/Q==
X-Google-Smtp-Source: ABdhPJz+H5PQ1/wn0WMWpccN62eOSMQ6CsdGl2YYPW6OhEKjBgqYnlaum+TZJlp8G3W0bq500UZXIw==
X-Received: by 2002:a17:903:124a:b0:154:c860:6d52 with SMTP id u10-20020a170903124a00b00154c8606d52mr55869147plh.159.1653898761542;
        Mon, 30 May 2022 01:19:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:ae1c:3d63:abec:1097])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902f64100b001618b70dcc9sm8537900plg.101.2022.05.30.01.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 01:19:21 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	amd-gfx@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Emil Velikov <emil.l.velikov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v10 0/4] Separate panel orientation property creating and value setting
Date: Mon, 30 May 2022 16:19:06 +0800
Message-Id: <20220530081910.3947168-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_011923_059860_F978B5F0 
X-CRM114-Status: GOOD (  10.20  )
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
before. It won't affect existing callers of
drm_connector_set_panel_orientation(). The only difference is that
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
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
