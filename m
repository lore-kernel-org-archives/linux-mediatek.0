Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE93C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:43:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F294161241
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F294161241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7XL4M3zAJUej6MONpzXegcXukEtZwV7KaL6JRl476oA=; b=YXlPvrwTr06EmGiIEIDFjoDUP
	J6f0Ur6g60FtfFwIzlYOTkxCgrfwg8rKTUrqKjzy0zJPKnFM8SeXNmbC4wUHkryeLiboeGaBGm66Q
	lwjCWVvVDYnlTX3MlW4WuAHwISRAu1R4rGxSWyfGXHZBKrM8R9aW953QJw3/Ke+NoYkyG5NzOFio5
	y4eF6SMeQ4tGgXB7IJPQgh8Ze/s4v8Tz06vsRJa2YJxz98Lkr7J3vF4hgJuTvM8fpk+/Pt6uqwQXZ
	mFc8ngdBP/lLq6+Rs+4yDRIR5E1dfgER/NX8oGfpbyeYW2+rBWEjL0ziidYHTROUwmOi0tnEFgz4g
	avk0t31bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt61-006KMF-UU; Mon, 12 Apr 2021 09:43:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2k-006JXA-KG
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=; b=vboTf4ZOEVudf/8ztinRLrKY9m
 1ZTpirW1oV0WkZI3E3LgkbA4mLQS2pGzeh9WG7y/G0v79vhji3bjxZ2xcQlS852Enr+YCKxttdBCc
 E7plbYmCnK8S+tx8p9inzgvH865kYhCtrJfVaFDjoaoLce3jNpnRpbE3slTiZlOTUXJzCyQxEvvut
 lSP3hM3f1vajl65HgEoIPHoiAbBrYggunABp2ZOpB320vP3g9UErdznpScIQva2RKNrqITUi+wePh
 K2RegLYBiJgkl/3mxDV/snPLXFFUUz4YwnxVR7xjTeyjMxyGK0YryQOqhcwcwhRDIbJ7ZFw3AdFnu
 7bG7n1Tg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2i-0064wY-0F
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 09:39:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id a6so12198107wrw.8
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 02:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=eUPqdTia5iFGBnU+yibNZFt8DEHCfvTTXCKdGvWosxt5hgzyijv+ZMjBvmmVh+K3nc
 cGluFdswEu4BADOWi0qosoBXasU4r3Hh9F3dM9yr/hgCKNx0zicuRBFeaG8TG6n4ZXA5
 6XPp/YIIWQ3GlSSDFT2A7Uq1RIUT/3D1hHcxKj07dlfX3YuAZ5SaIz4ng87sRS0HSEu4
 54/HVMBdy6xi93Dxe3nnTwg+8AMcfE8/BhJEFuX44v4QL5YQk8ILOEfKJKl0hSfAaO5d
 +x48W2GH7x97MA8qr7wFbIohjIu+MzmMMH8xwiT+ag8EVdw0KLW7SfZDKQiNjj2U7NV9
 ucog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q4YDvpAD1UGIZmGY7ATXAVL5J0kUewQGcgvVMVoEerk=;
 b=Duj6BAhy9vJS34+NrtkghINJ12a2rzwlFeH92wNWJqXc/iiyq0P1boH+7luOQBa+8T
 CP6Ex6BYiPLTsENoU+OlZ+JqwkGfvLxPnkeERcg0grutb8ivCf3jBKY2EDxawrmsGNz3
 hB+fSWJgN1LWmx7vgVg0mCsHJ2Drx4+lfhioczhX6PshK2cTM3yxe7Vi7L6yMh0wzqry
 uR9WKCxhdY2zfCNea+Pvx1pBAokXvpl3bcoaJBevjDiz8HF/oDLpzM5RPhzDKTklLbCy
 cT1GTAPbla8yYnHtl7QqRZ3JbLJf3I6Dk5/Rfw36YIfpj452jndlnSJoA35I66fQL3JF
 29kA==
X-Gm-Message-State: AOAM532j6hm7Dyqc4aoIWT8yKxABGEzrs7EpaLduNXuQVmTJ97za0QQn
 z5HQw4vW4H0nzCPn8BvssKyBqw==
X-Google-Smtp-Source: ABdhPJxigmfZSCdDY1wqLPhfhhfh2s9j7fmTwvG4DM80AXXv5sUawdrPx6YzpUHMmhfQo3YB3ijV/Q==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr30640128wrs.94.1618220378404; 
 Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Subject: [PATCH v2 4/5] gpu/drm: mediatek: hdmi: add optional limit on maximal
 HDMI mode clock
Date: Mon, 12 Apr 2021 11:39:27 +0200
Message-Id: <20210412093928.3321194-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023940_082128_A1113B28 
X-CRM114-Status: GOOD (  11.91  )
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

Some SoCs like the MT8167 have a hard limit on the maximal supported HDMI TMDS
clock, so add a configuration value to filter out those modes.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0539262e69d3..bc50d97f2553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -149,6 +149,7 @@ struct hdmi_audio_param {
 struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
+	unsigned long max_mode_clock;
 };
 
 struct mtk_hdmi {
@@ -1226,6 +1227,10 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
 		return MODE_BAD;
 
+	if (hdmi->conf->max_mode_clock &&
+	    mode->clock > hdmi->conf->max_mode_clock)
+		return MODE_CLOCK_HIGH;
+
 	if (mode->clock < 27000)
 		return MODE_CLOCK_LOW;
 	if (mode->clock > 297000)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
