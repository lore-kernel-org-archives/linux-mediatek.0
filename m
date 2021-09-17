Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1430C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 09:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51D8611C4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 09:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A51D8611C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j1IhKp2YJTqm5z/1mmD0FuovoTGECH0rgMIjo5e5X+g=; b=ThY3Gkw7Aea3B5
	TjvE7l4Kyn0vEik+7UAkHZt4OG9t23gNocqyiLrgoxQzZ7kiTjzymm0R51uebJNgQgRumhmPigc0o
	+B779EzxsCMnr3+zHPT8PEXPIzuHaTKfkuHjbfMTq+fFIHoryMkBLvLsL3z2C1LvqyTg5vMcC4JMr
	SxnEnW/e9wY1JIDjnn2cJIfcKBaTVLC8TbBfPul/v/Pa7rbntOHYejWGmJ0wYqC8Pd4O9csW72fLJ
	kEwlB+OzZ2sbvB57xBS1J0bLUziGwAHGufEM2ea/P3B0vTChr0tuvK/xarr8lmyjVqX31s8fIFHkX
	RtXpLavBIYf+b5tCLJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR9vk-00Dbhx-UV; Fri, 17 Sep 2021 09:13:12 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR9vY-00Dbgy-CG; Fri, 17 Sep 2021 09:13:02 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 mv7-20020a17090b198700b0019c843e7233so3181908pjb.4; 
 Fri, 17 Sep 2021 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1bx5uHHL6FlfRq6JP+/w3u8MNp6sfgydH0tgxJOMHo=;
 b=nORhe60bUPzqB5JFOh+AJ1PWv4zBImjnTbBncLzVM6tTimzBs9PDNwlfJZCMww0IwH
 TMrVxXUP1SsMqDb84c2hjrLQGILlThiplOb+8fAsAQC40u/b7zeeJJu00UmNAlPpNf+2
 IVydlH+/jaY2m4H2UbtVc8grUYR8loiCk3jALFglz3Ut2exYUHEM/MT03dzq5JSLYL4s
 r4o4+pm8+JWoTuegYLPvkE3PhlO8xXp6oTXgtyP/XzhrGIlxC4MmX6ymBqcE3Gsv09p9
 l4zxdkWTEewq2PUJE5hSSXG/QLcDyNKO1FqwDPMr0W04fRwFHFPZ8x+emylNHBRdpQIm
 Dn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1bx5uHHL6FlfRq6JP+/w3u8MNp6sfgydH0tgxJOMHo=;
 b=OCtQ/EI6ZPn2fWIrPhoUsXQGl86y5WU8WEhRHm2vBuBfwDZXE1/LB7N8lS60mEleb7
 pL2KqmDsEyCvsIEAhXWW9bgjYywNHyNJn+jhH8b+FpUIhhZvXZky7Kg1koF5LsD8sAEm
 F62iLVSey6w/KGYlCuVDmc8QcyXfR5kb8ZY/kziaXpSaZ8ea+R/XThsyyzt6Kc/NypXv
 0HUGkLcw5X+K2SDo6FhdFyenShpkYjRvyTmH2mOkKgZBCmtMsAphk5bavP5D8iu6pwPR
 4ssowG4J/SkiicsQNvaqLcXTci32ykbe5ndko8ysHeC5KdUL41cDKw/p2sWtgH+6NzC5
 KmLg==
X-Gm-Message-State: AOAM5300vpBth35Ofsaq40uyFEuW5yeqP9x2xADJOjFHD1Tmz3XCw7KU
 z/bNWgxy1DZd2E1gQZ+EM4k=
X-Google-Smtp-Source: ABdhPJx6zNVayeQJBv7jSiAMoD9Z6H6ldSBP8MdTQGW6ETgLPaNDnST4Jy6apaRTJxCgvJUBOlLXvA==
X-Received: by 2002:a17:90a:352:: with SMTP id
 18mr11120223pjf.116.1631869974138; 
 Fri, 17 Sep 2021 02:12:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id h4sm5981757pjc.28.2021.09.17.02.12.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 02:12:53 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: mturquette@baylibre.com
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, lv.ruyi@zte.com.cn,
 chun-jie.chen@mediatek.com, wenst@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] clk: mediatek: remove duplicate include
Date: Fri, 17 Sep 2021 09:12:47 +0000
Message-Id: <20210917091247.231305-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_021300_464050_D9DF2243 
X-CRM114-Status: UNSURE (   8.95  )
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Remove all but the first include of dt-bindings/clock/mt8195-clk.h
from clk-mt8195-imp_iic_wrap.c,and maintain alphabetic order in the
include list.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
index 0e2ac0a30aa0..261610509e39 100644
--- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -3,13 +3,12 @@
 // Copyright (c) 2021 MediaTek Inc.
 // Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
 
-#include "clk-gate.h"
-#include "clk-mtk.h"
-
-#include <dt-bindings/clock/mt8195-clk.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
 #include <dt-bindings/clock/mt8195-clk.h>
 
 static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
