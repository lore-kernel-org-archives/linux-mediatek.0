Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9948C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86A3F610F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 09:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86A3F610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dUqB/68A3Q3/A/phK9HT6F/cDqCg76ZvJDgGVawVqxM=; b=Yh+qj+j8JjKRcC
	3MW/PWf7BJxZOdlBVyNxMvW3UuEJRVR5INweVxn9Q2fgx228qF/4C1h/m+sB5cVMJYSiHsNypC3xa
	YbmVAyv/bdYCxTSsebI/uEn8iCcHUF132Burt3Q6pDRpTw7dYZLVRSCslq+gDObK0cfu5aVlIie1l
	ac47mFs0iI+nQyE5GFpCTZR+SJeeg8cfdmgnN+n+qQOjmb8kskHLNjY73AfbEaMJFdD5Yx4M9VmZ8
	NYri1ASirPEN1b2x29636LxvO///p2jS91HwQ8FyLde+h4Uj3DmyLVQMPRr3pAt4rQA1YfC1GHYIc
	lqyvWBo5TudKAxcEmGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ug3-000nhe-Gz; Thu, 22 Jul 2021 09:07:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Ufq-000nfT-OB; Thu, 22 Jul 2021 09:07:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC9B610F7;
 Thu, 22 Jul 2021 09:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626944842;
 bh=G6uggNtHBw06DrLEyrx3+EPLEQiuV1JfBOJ1R+sWWJ8=;
 h=From:To:Cc:Subject:Date:From;
 b=KQeV/yh9kA3Pd9NOV0uvBntromN90sb9aiaaPGvLkaYVfUNU7O8bsgBgmvO/GMaao
 LFhN0mq06HHJtG4ZO2HKrb9Y35Kf+x8VSCBty7LmZAqDvWlAN+01q6+P9hsjnc/pS5
 Pq3wCiWrVQU+WsT+gJQa+4fqc6bRKBuB/W6E6fP4MRcNNHIFPUEGqMjbyX03kniPRw
 HJqqoQZI6u1tjkjzwkx6c9yl/xRlmtD7bGpzoZYgJjaL2KuqMcAP4T7YW/T7wyRzf8
 c1CeIPgNxz3WG9CfzPamEggWU3i9gd4RVaDmSPm20nO0AkFK7eBPZkDXhbFe8dLMsB
 LGD0yeHyDmw0g==
From: Arnd Bergmann <arnd@kernel.org>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Amit Kucheria <amitk@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal: fix thermal_cooling_device_register() prototype
Date: Thu, 22 Jul 2021 11:06:44 +0200
Message-Id: <20210722090717.1116748-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_020722_853903_13060C4C 
X-CRM114-Status: GOOD (  13.87  )
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

From: Arnd Bergmann <arnd@arndb.de>

There are two pairs of declarations for thermal_cooling_device_register()
and thermal_of_cooling_device_register(), and only one set was changed
in a recent patch, so the other one now causes a compile-time warning:

drivers/net/wireless/mediatek/mt76/mt7915/init.c: In function 'mt7915_thermal_init':
drivers/net/wireless/mediatek/mt76/mt7915/init.c:134:48: error: passing argument 1 of 'thermal_cooling_device_register' discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
  134 |         cdev = thermal_cooling_device_register(wiphy_name(wiphy), phy,
      |                                                ^~~~~~~~~~~~~~~~~
In file included from drivers/net/wireless/mediatek/mt76/mt7915/init.c:7:
include/linux/thermal.h:407:39: note: expected 'char *' but argument is of type 'const char *'
  407 | thermal_cooling_device_register(char *type, void *devdata,
      |                                 ~~~~~~^~~~

Change the dummy helper functions to have the same arguments as the
normal version.

Fixes: f991de53a8ab ("thermal: make device_register's type argument const")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/thermal.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index d296f3b88fb9..8050d929a5b4 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -404,12 +404,13 @@ static inline void thermal_zone_device_unregister(
 	struct thermal_zone_device *tz)
 { }
 static inline struct thermal_cooling_device *
-thermal_cooling_device_register(char *type, void *devdata,
+thermal_cooling_device_register(const char *type, void *devdata,
 	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device_node *np,
-	char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
+	const char *type, void *devdata,
+	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
