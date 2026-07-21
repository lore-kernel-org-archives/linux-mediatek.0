Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974CC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=; b=QN0NmSqQezBQV5vwL68H5KzyZh
	9g9HnhWDcA0JKPc+Xz0UkeURRjb+Xy+wFx0/47sq5w7yHWnMjOuorQ14KD7TVZ1ikUnDHj4qTV3J2
	ftqESGJ4zp8iKrdzSMXplJXwTyq4f7O8Z+7RNTJa502K0985lGt/Qf2KkoAb+cTYCS5wHJXUeUaOZ
	q/plvsMVjYHEX+ykiVDMtVpi2VRw1LUMMQKjBFPWOaO92GjhNHCS2nU1100Dk6sZiKbK23dyEMATf
	pQND9dAcXIDBrUSXkfgD30VMA2JrUouNyMjHkLl/nLy733CWTYrIn/YNFgqwJIseeY9iZVmZTYLQ+
	HRTDdZwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5Iq-00000008hn3-2AZZ;
	Tue, 21 Jul 2026 07:54:12 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5In-00000008hkN-3EdL
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 07:54:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22721005ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784620449; x=1785225249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=TmHAwahBFfigPThzMjDusMftJxNVhU7Ts94TY7v+66wr5cQwLTP+QBIGr83I+QfunN
         0qyd1E3nY4nUbra2OcoBEPdEpb6oBsjTrfjORnX2SmSPOLnJRj6vpjx6O7vwbMbezt12
         RGzV61S1+Ii48Iobu2Heb4NoGQwCQ05hMyhm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620449; x=1785225249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CGtEOhOpR/1OiCj9qufh1O1atPkJph2JTGUTc+kCL1E=;
        b=cizQNW5JhXE+8l3c/yjSxnTngXGo5PlQSfpqDCsxi2sUUqcMXR0hDpKxzVAfkDG9Ez
         eHVtCfwpvpxsXIUSgQrLSteGHMVEGt8n8zQkDZk0pne+WeLD+Nk1CVUFm6x28T8v9yuR
         Hdhwbm6Kw6OuwsI27gR0xnR4joQ6XQVq7urzw02yTFnEt2x7lkDXp4k4njAwPYymUwi9
         fPAYZoccgslinKNJzIZhnZPIoi40LLVRRmN4e/GY/l0Xq+KosK+o1L7MnHceX/j6FVZq
         PJpd0mDxkC8J3TOiH0OtxVsjxj33V7j2h9buODQOXSIG7mP9ZVWvA9AfS+y4SRmSYPf1
         Zj5Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqzy7/+jAdnJs8LQXbHfHDU+BJ8J5ZNrU6IVpv2TZWOOUN4PBF7L9kI4tbcCavFYcBkfvGA8ayiOYk+xGGTgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlKZDwkt4dBxTQTn4sqIKnI39CVAVOPIQFkF4rGnZCO7DYxRAB
	NArcliTtuoJRO9iSdPPF1uBZhfv9sLjR/cRNl7/M2VpZ3ncBpQ5213onJgK5wABnow==
X-Gm-Gg: AR+sD11ENo/JFUY7s1rBbXGtd870xsAqaLWqBIbTkYmqGZPt6h0p6VbbLfzok1Geg5N
	ETb2Ed9JSR8rhe+ScyN0XpjfIZlZOL2ByvFocrGU2b5EFoeMhbcRVhLaWOTqwJW2IXGxnBUORXp
	0LD+lpPmtib9gV0y1iRQfcrilt+pf4g+zEi97Pqx5JqRlbDWDh/OVfdswj/8R/4pK3iJGees7u6
	RwyyeUdzWQdOaSu+A7hipDiY2515OkUnyfSs+B5KRTfdornRYiOIhGh6pCbqWB7qg5tj0LjCzJv
	yWJykPOw2wIKRt5Q6h3TdlCPBbhDPNtIhoQi2qamRb4yiVD3UZyXXeW/6sYP6q/Pyh/lclV0DYD
	a9etmLwkPc4EoO2zQmjJI4G5EBpfTA0Uz/66Dkd4ukLnidlPPlGOQFIj1sV4JtczLpxJ3VcAB5g
	P2fy4d2tN2WdvKCL7MAZe4O6T/MNLt/OxTXvYlkbI65tZWHqJabSM001zsyWs=
X-Received: by 2002:a17:902:e748:b0:2c1:98b7:ecf3 with SMTP id d9443c01a7336-2cf3494aebdmr189718205ad.23.1784620449012;
        Tue, 21 Jul 2026 00:54:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f705sm70724175ad.15.2026.07.21.00.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:54:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] Input: elan_i2c - sort include statements
Date: Tue, 21 Jul 2026 15:52:16 +0800
Message-ID: <20260721075226.2347933-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721075226.2347933-1-wenst@chromium.org>
References: <20260721075226.2347933-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_005409_832187_42C1FB65 
X-CRM114-Status: GOOD (  11.07  )
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
2.55.0.229.g6434b31f56-goog


