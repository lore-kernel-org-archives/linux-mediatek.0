Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3998FC35242
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 03:34:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C07D217F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 03:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSmJt+1f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f1IntwTH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C07D217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=PC//AYGC15uEi9DVUy6ct41DowKbw3epkh94YdpL+TA=; b=BSm
	Jt+1fhHbqeDNBhF4slTK0uFJ0mfi2ZgtMVHOr8Q09S/cEBC1LNNCUdIrvtu8VE58erFeBZ/wFRJiF
	uAVN/3ASzxjc5RJQnNEXztleUWXEHBdFK6WaveXtXKARytLwvJ1ZSX/0b8kLEYKf6tpbSMSzSUibK
	Iy3uvevgzAKQh4wiUIPnUb2gWilntXeqO3XuEn9PoBfCqtc/4UQtPgLZW5EzahMallRXn/6bdTCMI
	nmTTtCqNkXelkr42adl4fdCDUgulqkMl5lq+EWgag3p75pYMkuiVUwO6paRuplxI5YQpJHDarG+hd
	fRfFXU4T7VCDgf/O0f0+c6AenVb+oVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Rkb-0005m1-UX; Fri, 14 Feb 2020 03:34:45 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2RkZ-0005lV-JJ
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 03:34:45 +0000
Received: by mail-pj1-x1044.google.com with SMTP id fa20so3284146pjb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Feb 2020 19:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6g5qTCrzQFZ3eAHmVApQv94R1DbpyCc1XXw3LcUa15Y=;
 b=f1IntwTHC7VZyI+zY4q/yOBy+KQdGMha4v1cqv8pLpPgml/BPg2XPrgDmdm4HTiRHh
 85YtsRWk1IVRAmVnIHL9Pvr1PZ/d6avCNuu5r5aPuJD4X4KjAvuBaZSQIAKI/MGDKK6W
 Exy0caGbef7j2SFeqsuRQ61bLzBmgSVXO4zD2Skfb5wcJ0siPQ5aiRQU7PoqdTCH/BLm
 k1DLM7002tzlv/dLQnDEEuu6Fu8C4TMuWcncSSyfcmvOHM4jAbH3L6Yw602cmoFcm/Hr
 3C3yW/Q5q+m042dxiS/Diktcz2i/ipplHBeC0uoutBTBERDFAnfRc0fvo+eI9XsJ+8FZ
 hMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6g5qTCrzQFZ3eAHmVApQv94R1DbpyCc1XXw3LcUa15Y=;
 b=JptFIm5Ok5spHoJKpinxwjlETbGHHUqxuxctFmiQjwv483+cTAeSE3fiioRgl5wPch
 qzbLOitAQef/95Pq0ojv+JBiC4rpCtycsr47rx/A0JIsLcyxc0eqbmyZUXVJmLxtd/1U
 VeuWetX2qSTJYBJ0PBKz/9zghNKqn2Y08/qHWTDWlIzmmM8CFXPuzeFurSvQczQuNH86
 IORwWIsz8ayC8og1vpQ0Y7Xor57SjYkagsoh5ZZHZoYJEMhL0yuOt+C5XnNeEeLcQQTs
 Qbp5fmC41lQiwDy5vrxUI24yh9Py5qLnZHlBCg50bxzkasr1zH5+Ds1iuLSvXNoGz7jZ
 mlpQ==
X-Gm-Message-State: APjAAAW3DEVEhP7MmMR0C5b4qEdw9adZQezk5ToJc9dqjcSw8em8ERt9
 aiON2fKpqCJhfyQA5nl5eew=
X-Google-Smtp-Source: APXvYqzBwfz75bgRIbLvVitkuu/3R+QCx8h5dAkZWCHTZIwfT55ZqHKw3qxqNfRN+kp8lFGjITixEw==
X-Received: by 2002:a17:90a:7303:: with SMTP id m3mr997565pjk.62.1581651282189; 
 Thu, 13 Feb 2020 19:34:42 -0800 (PST)
Received: from localhost ([43.224.245.179])
 by smtp.gmail.com with ESMTPSA id w6sm5065297pfq.99.2020.02.13.19.34.41
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Thu, 13 Feb 2020 19:34:41 -0800 (PST)
From: qiwuchen55@gmail.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH] clk: mediatek: clk-mt8173: fix potential memory leak
Date: Fri, 14 Feb 2020 11:34:34 +0800
Message-Id: <1581651274-5933-1-git-send-email-qiwuchen55@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_193443_666675_FC20CF87 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, seiya.wang@mediatek.com,
 gregkh@linuxfoundation.org, linux-mediatek@lists.infradead.org,
 tglx@linutronix.de, chenqiwu <chenqiwu@xiaomi.com>, linux-clk@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: chenqiwu <chenqiwu@xiaomi.com>

Free clk_data or iomem resources if init is not successful.

Signed-off-by: chenqiwu <chenqiwu@xiaomi.com>
---
 drivers/clk/mediatek/clk-mt8173.c | 43 +++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
index 537a7f4..eaf4e70 100644
--- a/drivers/clk/mediatek/clk-mt8173.c
+++ b/drivers/clk/mediatek/clk-mt8173.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
@@ -941,9 +942,13 @@ static void __init mtk_topckgen_init(struct device_node *node)
 			&mt8173_clk_lock, clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+		clk_data = NULL;
+		iounmap(base);
+	}
 
 	mtk_clk_enable_critical();
 }
@@ -964,9 +969,11 @@ static void __init mtk_infrasys_init(struct device_node *node)
 				  clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 
 	mtk_register_reset_controller(node, 2, 0x30);
 }
@@ -992,9 +999,12 @@ static void __init mtk_pericfg_init(struct device_node *node)
 			&mt8173_clk_lock, clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+		iounmap(base);
+	}
 
 	mtk_register_reset_controller(node, 2, 0);
 }
@@ -1117,9 +1127,14 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	clk_data->clks[CLK_APMIXED_HDMI_REF] = clk;
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		clk_unregister_divider(clk);
+		kfree(clk_data);
+		clk_data = NULL;
+		iounmap(base);
+	}
 
 	mtk_clk_enable_critical();
 }
@@ -1138,9 +1153,11 @@ static void __init mtk_imgsys_init(struct device_node *node)
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_imgsys, "mediatek,mt8173-imgsys", mtk_imgsys_init);
 
@@ -1155,9 +1172,11 @@ static void __init mtk_mmsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_mmsys, "mediatek,mt8173-mmsys", mtk_mmsys_init);
 
@@ -1172,9 +1191,11 @@ static void __init mtk_vdecsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vdecsys, "mediatek,mt8173-vdecsys", mtk_vdecsys_init);
 
@@ -1189,9 +1210,11 @@ static void __init mtk_vencsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vencsys, "mediatek,mt8173-vencsys", mtk_vencsys_init);
 
@@ -1206,8 +1229,10 @@ static void __init mtk_vencltsys_init(struct device_node *node)
 						clk_data);
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
-	if (r)
+	if (r) {
 		pr_err("%s(): could not register clock provider: %d\n",
 			__func__, r);
+		kfree(clk_data);
+	}
 }
 CLK_OF_DECLARE(mtk_vencltsys, "mediatek,mt8173-vencltsys", mtk_vencltsys_init);
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
