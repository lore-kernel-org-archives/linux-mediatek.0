Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C3FC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 03:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NCgOQZSMS8pPlt6XQyt85uPffzzE60v4WG1PXi+ygQM=; b=T/ccaDHpGAk3RFRbxaVB34hQ11
	HxkSF3eA60Q2t7TlR5FCCFybYJRcyKQQDt5xK9VZQy6ZwMwGmWnkVWi2x41dRDAw/eP4KMMQ7L8fT
	kzInaD9/A25uY6ch17W7Tqoa94hw/3FQm6qST9Z9pPTa1Qi4qqgB9Oo43l/ynlxQWjwkwJE2rRwVz
	3VyrtQdScVEXVWhDfEhZRDPQlkE1EHUxHKa8txQ4xzafzP33tscxoPUKuhdvCpb43sV2z4PxCn8AF
	YGesXpj6oLaZZT6n22+4WaZBcHSjgLovEW9iHLCT4hhmGx4jJe95TlAfO+wzFo9Jvo+NWTfEakzG1
	wvF2BCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI4T-00CBog-0m;
	Wed, 15 Mar 2023 03:45:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcI4Q-00CBnh-2V
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 03:45:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id y2so17418956pjg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 20:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678851897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCgOQZSMS8pPlt6XQyt85uPffzzE60v4WG1PXi+ygQM=;
        b=lgxwc8QzbhhRGX2ipj56laXav+/xC1sxXICdT3C8eFkuHwW7YsZ78gsYfY/vNm3QUr
         O4/kgZsxsEqYxWg3rcEzsyYMG+Hq5f8qZeHL4LasPHHVmha1rEtpLUzp88o2jPsrHxUj
         0WQblNF7LH6ij+/Qtk9t+MLRQOQVDCv4DdUrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678851897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCgOQZSMS8pPlt6XQyt85uPffzzE60v4WG1PXi+ygQM=;
        b=G1G385i2k7ifmZIu9xZyqsdbTlCxBWDYCmcHrZE2u/ZTEeRjZ5WFse8fUhMkyvR2rF
         dj9hqC3bjQapo9BMJB3U137m4bpt+UzqKnRisS8FKJk4sU0cyglW87elJzCOP569mkqS
         zRNT1ER4j89Vea7+Aez5sLmu7Mh77eL0+UJStSZFkw6IDadt9C/qYUBbjbmLezOV5DAz
         LZy+av/R2RiluPXFNmckxEbyqaPQvQZfmr77O4H/AmOQgMeysN/PvY/70XDI9YcJ13Qs
         e8EyuY5caxprPAyD5GAFjY07+YvLBvCDnJJIHRWvZ6oD0zlkhJocW/IH67kPeWcnMLBu
         V9Hg==
X-Gm-Message-State: AO0yUKVJXTSD4rDl0yc3NhqK1UP0LDzm+Gg0EzTaznlG9KvBSpICcqKD
	euzy1+hs/5OFV0/igCA6Ub/N+Q==
X-Google-Smtp-Source: AK7set8vm6w9RioA2nfhGaRBt/IA500jhyRIi/xVskISt1EDsZtETEiCXHOgMd0uL/e3yQrbH3RrAg==
X-Received: by 2002:a05:6a20:5493:b0:d5:e681:15c2 with SMTP id i19-20020a056a20549300b000d5e68115c2mr2170861pzk.0.1678851896791;
        Tue, 14 Mar 2023 20:44:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d05c:f360:99cd:4be2])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b005abbfa874d9sm2349107pfi.88.2023.03.14.20.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 20:44:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] thermal/drivers/mediatek/lvts_thermal: Register thermal zones as hwmon sensors
Date: Wed, 15 Mar 2023 11:44:49 +0800
Message-Id: <20230315034449.2604197-1-wenst@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_204458_891002_2C5B1E2D 
X-CRM114-Status: GOOD (  10.58  )
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

Register thermal zones as hwmon sensors to let userspace read
temperatures using standard hwmon interface.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Resending due to lists.infradead.org outage yesterday.

 drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 0557d1c61b9e..15f317c42718 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -19,6 +19,8 @@
 #include <linux/thermal.h>
 #include <dt-bindings/thermal/mediatek,lvts-thermal.h>
 
+#include "../thermal_hwmon.h"
+
 #define LVTS_MONCTL0(__base)	(__base + 0x0000)
 #define LVTS_MONCTL1(__base)	(__base + 0x0004)
 #define LVTS_MONCTL2(__base)	(__base + 0x0008)
@@ -996,6 +998,9 @@ static int lvts_ctrl_start(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 			return PTR_ERR(tz);
 		}
 
+		if (devm_thermal_add_hwmon_sysfs(dev, chip->tz_dev))
+			dev_warn(dev, "zone %d: Failed to add hwmon sysfs attributes\n", dt_id);
+
 		/*
 		 * The thermal zone pointer will be needed in the
 		 * interrupt handler, we store it in the sensor
-- 
2.40.0.rc1.284.g88254d51c5-goog


