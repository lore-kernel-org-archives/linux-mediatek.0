Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88712C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SsrfygO04Vr2wQ29pg8nrnRrNyo5ifv4q+UTozUDO08=; b=uX2lqwexofFVeh
	cihbuBKH/NXgH205tpmPSHyAw9fJ6siEkCnOqHk446YUdwJXRFetBckiHn+Axgy/NW+IsYJEbeN7E
	W+XKYQYlZvvRoQKCGSTiE9Ii+UouFeTFiKV8wSMGOFsqV24/fgPGeQScFRv5UxI8KKQJW8GHmRHVD
	XPuFz1sPHJMLJVMd6FW0x+5PNgE04v+sg/2v17OfDJ9TJ5gcKD44oFIaXMhG7/4S/jAZnEUiiotS8
	8BqgPCGRrzVJjPeoY+eUi52GFBkpPiL0WnoUkteM0k1smvgLBKKfkre6NMpGnYQsVtCQwYZ8l6SVP
	0LkDZ6hC7uSSvq7QX6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzQV-004JxG-Ui; Tue, 30 Nov 2021 09:27:51 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzQI-004JuF-SP
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:27:40 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3H1k3fZ3z9vBqq
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:27:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wgr1GiuDxvK1 for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:27:38 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3H1k1cQMz9vBqt
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:27:38 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3H1k1cQMz9vBqt
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3H1k1cQMz9vBqt
Received: by mail-pj1-f69.google.com with SMTP id
 l10-20020a17090a4d4a00b001a6f817f57eso9489913pjh.3
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UmVL6Owf91KrAVSVN4T/a2Zm/TSDiHMyV8vSNTqLEAI=;
 b=crRhkDRObsvIF6ohNtNmm/daP2G/5tvHmMBSCSNq8BRwTiWU3q1tVKg/SsO4nghCBM
 1MxPVU5HQOkhLvzYnDrF66p7fprRhHdJzXpIXcfNshGvUPaAHB92waRxBIrDtQLsFTFs
 O+UeUdEQ9puMjaR9V9o2O9h5dZX8/kxD+NlCib48py/kl5FUf8IS07jl/r1bByVipMog
 dsOT3gpJKjyaFrgkwuWYqosYPaOGApQCBKeWtSp4LfGTIuw8Hev67zxt5yLaR4ZaH2jY
 38nCHCyaJa4Q84HkjzPFwpSjpEwu3qhfn839JGSJgjBeeGBpQQA77mWECS5mbhMdUkj3
 wccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UmVL6Owf91KrAVSVN4T/a2Zm/TSDiHMyV8vSNTqLEAI=;
 b=uTpMgf66zzQBfCEJMsMFWHfe5E8hEfuhFzarlWfAwe+4MQoVrBlYvP0GLW3+v/yIJY
 GxPDb909aQnr7bp/eS2wx/ggJn75V0jW43RoVnJOzcleRLdNvuhLQW4vQgg99N+0MimB
 iwcRnz7/IudZQr6s0XDxAnXb8dZXOvqtfzdymOech9qUob0CAOxkt2McgZ38oLaEO8JJ
 KtwikjbiVW8++QwNVOEJKOU1NY/XJLzjD8+JYJGysqs72xgpdkeA08Yma+F8yfGECD06
 U0LE/4m6UDmLLzUPgIt/TmYCVr1DYeExTaxqGKTjj91bMcjw9qUKk6q7fBYr9Ozzce8H
 Ev0Q==
X-Gm-Message-State: AOAM5314ufjMhvWo0IHq4hFz6+h8qHgXK8R8KyvcxH/RgWvJBvyDT+2F
 0MMKTYOpfQnJZv3tp9C1qv5E/4ea0id+gk0KhjHahyL3oF2aLhKppOkGq2+Zu3gYfC4jjgDzs6d
 GM5tDjHUA+DG590TqH8ijpAUV3biwrNEU6Ha6
X-Received: by 2002:a63:7c03:: with SMTP id x3mr38833926pgc.394.1638264457360; 
 Tue, 30 Nov 2021 01:27:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcUS2Pm5qOUBh9nDN92KPHRcDmY3kWaqLBZdVVTaBBj/oCqWJ6lcYyk7AkcWuoMj+QeBfDtg==
X-Received: by 2002:a63:7c03:: with SMTP id x3mr38833914pgc.394.1638264457136; 
 Tue, 30 Nov 2021 01:27:37 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id e6sm14397203pgr.24.2021.11.30.01.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:27:36 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin-CW Chen <kevin-cw.chen@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6797: Fix a NULL pointer dereference in
 mtk_infrasys_init_early()
Date: Tue, 30 Nov 2021 17:27:30 +0800
Message-Id: <20211130092731.83763-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_012739_014958_C432F35E 
X-CRM114-Status: GOOD (  16.13  )
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

In mtk_infrasys_init_early(), mtk_alloc_clk_data() is assigned to
clk_data, and there is a dereference of it in
mtk_infrasys_init_early(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of infra_clk_data.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT6796=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6797.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6797.c b/drivers/clk/mediatek/clk-mt6797.c
index 428eb24ffec5..184b283b6926 100644
--- a/drivers/clk/mediatek/clk-mt6797.c
+++ b/drivers/clk/mediatek/clk-mt6797.c
@@ -563,6 +563,11 @@ static void mtk_infrasys_init_early(struct device_node *node)
 
 	if (!infra_clk_data) {
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+		if (!infra_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+				__func__, -ENOMEM);
+			return;
+		}
 
 		for (i = 0; i < CLK_INFRA_NR; i++)
 			infra_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
