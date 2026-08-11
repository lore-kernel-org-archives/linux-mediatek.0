Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEE4C5B56A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 12:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=; b=rOBH4pZ1PlDxXDJD2bVOX7l1RK
	HShG8wmuZg8NMXPBq6ZG0Wd3eUUlND38ljK989hzFyPSj+UeDzofoUoXhnCBBPbfBnyOF3mg0DlMv
	ciUPYSUxyhcquZkUzbJCdXIN+nB3bJLuW/GaNNTOHR3TMmRdUYRjsITRqDZSV9kfEQmfYJuHsJnMk
	/5RHpxhJ6mb6vpRWpE98X4s4CwOR+M/5VlIEdtFCz+lEJBWNrvoo0B9QyX0TdpcPkaH9wrobhrMVM
	ffZC/eZEJCqvemIOacwqnCaFLgFKr+sRO55eH7VdPdOpF8/yR69CLYVjEVu8Xe4tqVv3AOXMzXV/x
	3umOYfnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTM-0000000E07F-3d1c;
	Tue, 11 Aug 2026 12:20:48 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtlTG-0000000E047-3HOY
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 12:20:47 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so2494828b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786450842; x=1787055642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=OoNT+djAhNFWSfdz7U7XV+4nvibx7I5OW2rm83yCEqy8NVbdXAqteUutjTYd4cIloi
         GtKbjyFKKwIiEGxMPw8CvLxcVTB2j4mgpZpGFlhZ3j6XnKrJYSvyYP0r7j4nG680emn6
         t4rx1FVHgUUtRZMZxXgQgcCgi70L10DZTTezg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450842; x=1787055642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7I9lwGzwg7czeq/kM88e0ae+cNOZS1aNNH4lK4EhTU=;
        b=Tfh/ZpSH1aQddy5tNmRn/6CyMtjw5C3d4UjWSzPfXSwsoGFGAvBXaO/TKQZ8ONJLPc
         1yV332FqXi6ZGQ3TIWz3ks/UYeoPgTAmpUz7iaPp5isA9Lmr/iTlr/CPi+7nw352rcJ5
         7AOvxNMaHC+hxI8v2p1OJENBau5DQ7V4dSYxzfc1JB2J4tuDrI/oVLaWnJjMGsmZpPJ/
         AVqSGhOvS9CK7Re0qYAMI0KzFE0q9rgLuFpjQgbSSfTYssIX9M0YEi5sf/XJo3r7M8Lt
         CJWBK+2n+zJC72Ed45Coiu7OJpQHXdOsOsdVmyM0Gz8gR1iR0t7ZEcO/lra4wPL+Fwjc
         xsbg==
X-Forwarded-Encrypted: i=1; AHgh+RqnTsoi/yQ0IrZwzdzWjsT4L93mM35uLC+b5HQxZlxCvYKvwZA5f25c6TmnI6Axhczd+xKwZksBcV9vyuEWmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxypg9oMq5LsCiptYoVTIcM1obB5awVGalFFJSzOG9tjZYRqm9S
	v7ph4tebu3ENDLUVo65OCDebxuFaHJH5EzPpzkr/3jPHDDBCvJ6GF5bd35vzMvPhcQ==
X-Gm-Gg: AR+sD10yZ8F96c0+DOOBwIDsp/+CYNfWzd5VautQWIkuKTG0Gtmy/ZMiQC1JEVsHj9s
	oGgkYIEwAap3zSprjwzfJ12tXYBmnMGlnGAQaEg7M9Nhu4gOhEoPcDYKAp6tXae16F31Nba0V/2
	CNz59H26E0+o6r2vX/I1BrIw4W13wDxjnAt/JNBISDy11HL1mKVGg381v54C4sfFgj0+pasOGa7
	TL5dIEPpsIqpWRL/1MSYNK9RLC1AGfClFNi6OenoCOUg93Vfs1ypJ1yMdyV3tHjIcn9TcPWMTbU
	PMuEUywNd8RwGJ4fwdJHYH+oFJCGveea5cGu/uUPs3OlbG2Vqzzu9ZlHJKYrWVSTYX7pHKSFeZU
	WvW7C1cxo8+eGckD1AyUaeqjBjD+/btLPzAo4LwSV4UELlKwtn8YelO98ZiyKzux1zrW4X9l7jj
	cFKXwc+KKEnobhImqEqXUwuAtimSzj/OpO480MMDxRXiRSXD+7jycOefc0GtndmXFRrp8hIgb+U
	IRHN0cV50jB2a3LhYrV3HOMQg7XK34LLSrBdvk9RpDZ5Q==
X-Received: by 2002:a05:6a00:23d2:b0:845:c906:5ff5 with SMTP id d2e1a72fcca58-84fa8842ea1mr2725202b3a.30.1786450842194;
        Tue, 11 Aug 2026 05:20:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:12e1:df26:6add:1ea7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fa9574e9dsm662454b3a.54.2026.08.11.05.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:20:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/9] Input: elan_i2c - sort include statements
Date: Tue, 11 Aug 2026 20:20:02 +0800
Message-ID: <20260811122011.3539250-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
In-Reply-To: <20260811122011.3539250-1-wenst@chromium.org>
References: <20260811122011.3539250-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_052046_014055_909950E5 
X-CRM114-Status: GOOD (  10.95  )
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

Sort the include statements before adding new ones in the next change.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/input/mouse/elan_i2c_core.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index f93dd545d66b..9f024a435dbf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -16,27 +16,27 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/kernel.h>
-#include <linux/sched.h>
-#include <linux/string_choices.h>
-#include <linux/input.h>
-#include <linux/uaccess.h>
 #include <linux/jiffies.h>
-#include <linux/completion.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string_choices.h>
+#include <linux/uaccess.h>
 #include <linux/unaligned.h>
 
 #include "elan_i2c.h"
-- 
2.55.0.679.g6767b8d81c-goog


