Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C005C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SMYVomHWMuhgFhSlBtaA1KQF2ywg5gB+hK7Ql/PZ58I=; b=YWBom0+LDn0fTX
	EEIXDfN1porbRSxl1lwZHoiM6N+Y/yUcTZlL4I2mH2gsLuMvqzG7qpBsERxe2WvdoqaEDLSNbWlf/
	+A64OmKtaEhaHrY3dpJI7jkjptoTWB4CDHK+gP0qwSql4ows8ZRBKNAL09Ds+Wfm64aM0enXFdmCO
	0CaC3NOSNAoix4iziIfgI83IzxL8vk+OClZgzkAwWsN5qScq7GFEfCUv5BfmGI0fqtiRanilrI4fx
	j5oBmIS7eZsCmjOgmsuoFeXUsFeyp2FZAp31zC/FIrjjfz88KmkXSKYfAwHroeBST4zKMLikCzOHA
	+3oluhESWbIViY0UulTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms0BC-004Xut-Nu; Tue, 30 Nov 2021 10:16:06 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrztf-004STX-GL
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:58:01 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3Hhl07mwz9vBqq
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbBqD75fHxyH for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:57:58 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3Hhk54Tnz9vBqZ
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:57:58 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3Hhk54Tnz9vBqZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3Hhk54Tnz9vBqZ
Received: by mail-pf1-f199.google.com with SMTP id
 e7-20020aa798c7000000b004a254db7946so12567723pfm.17
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MrDmOmqy53ncuiVE/GEYR1H1+QCkQb8baxwPMZ1tiko=;
 b=bzUs68d9T5urMxTKmIOyZFIVWQNM0enC8qVpTkeU6GGTbxGaHO2Y1eA5KwwMlg1hIY
 ONUFYNTTmKTp9uHx5zb99/5WZ95Yzw5z7wu2l5XyLEN/VRZdqobUvl/dpns5/+6LQZZf
 M2xUwQqyQTo3lhQBYvnss4YCuOvNsXDCU+JQQOtATxaJFClmqt8/M+wSddCu8UwRTLln
 N2DtnIEEPPQXjU6lLHh4mFhZLs+oD4pgmwCrSpmkethS51Xatkm/lh8Y+wnZCamQ5TCz
 xGTEE01kGoxa4T0ArRKugyOAnek/W1htiYzUpSM4cum6LW1W3wyLFYHxtVuihnsBMmid
 0scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MrDmOmqy53ncuiVE/GEYR1H1+QCkQb8baxwPMZ1tiko=;
 b=boNRE9nlGPdEMRVpis9c1nknZzbTGUFVbsay6uHuIaq93KQ7zM+JS7UBTWjt4hnbyf
 25mEiaUYU2NmaCBotyp05qNFkdc55s5VhCAcaQfUcDM3MM1Nx5ptUYOczELFKgB349k/
 MNbfjNjGqDHxbW5mx8yyEIO3ojC6BStPaEwj5aO+HpQNa+EWd2cDtZvC9BfgrCKiT9du
 eQpok78/o8mcs2uJkGtEuvuXzPwQPRsNEbF6H5psSRgUMJHTNQhNXba80/on3XLlFXyu
 bHrx3xIptNm4x+LDx2yHdg4pHxkwuepjjYnm4B5feWTOCXwbenrNqfiCexKGLQ/c5zdK
 LD1Q==
X-Gm-Message-State: AOAM531FeugSgbAOyvpUsxakvbup/p1AfjlAAstDzqMeUxuLZ6t6HAtF
 TFPCh/naA2WwNFuJhZ7VERcTMyJOVfVwmmbFXHATuCrx20NvsE7tUDKF9Moy+HXB8DiCSc6gYWZ
 qW1gxpNsyHQF69BiZ1oaV56L8A2Ptw8o5D3CI
X-Received: by 2002:aa7:864f:0:b0:4a2:ea0a:a16d with SMTP id
 a15-20020aa7864f000000b004a2ea0aa16dmr45599378pfo.11.1638266277957; 
 Tue, 30 Nov 2021 01:57:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz0S5KZw1PVwUuiwDkP9/RaONTERv32EcCQUY7AvGGsmbqzODVGFX2Awn3Qo0pkVauxwXzKQ==
X-Received: by 2002:aa7:864f:0:b0:4a2:ea0a:a16d with SMTP id
 a15-20020aa7864f000000b004a2ea0aa16dmr45599362pfo.11.1638266277757; 
 Tue, 30 Nov 2021 01:57:57 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id v3sm7229121pga.78.2021.11.30.01.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:57:57 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8167: Fix a NULL pointer dereference in
 mtk_apmixedsys_init()
Date: Tue, 30 Nov 2021 17:57:50 +0800
Message-Id: <20211130095752.98821-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_015759_674251_3C2A48F7 
X-CRM114-Status: GOOD (  16.64  )
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

In mtk_apmixedsys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_plls(). There is a
dereference of clk_data in mtk_clk_register_plls(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_plls(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT8167=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: a68224832118 ("clk: mediatek: Add MT8167 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt8167.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index e5ea10e31799..7b18b751487f 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -1047,6 +1047,11 @@ static void __init mtk_apmixedsys_init(struct device_node *node)
 	}
 
 	clk_data = mtk_alloc_clk_data(MT8167_CLK_APMIXED_NR_CLK);
+	if (!clk_data) {
+		pr_err("%s(): could not register clock provider: %d\n",
+			__func__, -ENOMEM);
+		return;
+	}
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 	mtk_clk_register_dividers(apmixed_adj_divs, ARRAY_SIZE(apmixed_adj_divs),
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
