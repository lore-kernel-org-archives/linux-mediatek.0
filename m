Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qvpdtFwbWynPLduxlviGdvQsT78A7ey1fTbmga03aHU=; b=Hf4HvQ2Y7Wog2e
	FV58a91noZxVqu+hJjBy0WA/VRfAFo4RJKQn+RSm6khou6WSWczZlyTh+aDxEYpsZ7g2bGik52kMz
	UL4iGhnl5AJcQwvVg0yfJDNB2ovi0TAWP6CqGEJ+p8cN7dzBbMjtyz8x42AdhKs4dSD1lDxcIranx
	g8Y5MVPx1FQFNrVDva6c6vG5jW9Z+J1rvVRVPlAkZsyrxSC1ey6UDa5TSvDvES4WpZSEVDWfIoyGU
	2v4Hdc7GxaUhQTtiRXIBXz7NAkGndHb2YxzbwZ7Lyaj3Bfg5KjvscQGzZoDk+9Y13tkU/ZMoWAoVq
	8wHc9AlVYM4cBknV4/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzXH-004MCO-S1; Tue, 30 Nov 2021 09:34:51 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzX2-004M7m-4I
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:34:37 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3H9l461rz9vBqZ
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmEXa9UPuFlX for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:34:35 -0600 (CST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3H9l1yDVz9vBqq
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:34:35 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3H9l1yDVz9vBqq
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3H9l1yDVz9vBqq
Received: by mail-pg1-f198.google.com with SMTP id
 r35-20020a635163000000b0032513121db6so7014129pgl.10
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDsBAodbkJK1sTWl0h68gHfBD40liffXghGQbkMt8+8=;
 b=I7fqMmv0X1qKLOC4SuT9Gybc7pfg6RlaeR1Ga7XfJrUCnsA85LW9EOc0ywwVA0gRPv
 IhQa+Yr1B7SZqJi0n/hP1SQtyPZs9A1exN+lOnXF9tktk3nBakJCbgHQFoZcvwSbLVFs
 ghvr0yJKCaJ4mCBgl2V1C24mb7yY39xZ8sNRJ/rOqAiVraPrP2dG8MY2L5zHeY67jL1f
 tGTrAgPs3qxwDcO+136yRsq13j6CgQ0KvZqwZeR7b8A/KE5ydQko1IUadWs5FKzNphDT
 U1GG7usPKjo/iHCs9/aqONh9+Mq8HkaKLtEgjH2rQQUPpzKCkDqoqdfvcZXMt5zL6lVN
 NWQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TDsBAodbkJK1sTWl0h68gHfBD40liffXghGQbkMt8+8=;
 b=jA+qdCf9aZzuG7h2YZgPZh1HOJ8olPpwtZFzltRb+jIE5ibYBUydbykHwY4NSB7oIx
 K0hwKFbpbS8MTQN2IxSdh7/ZAsugNkcCFcbnJ+beOqzLCA6YPxNhwuuKaYFQTkJOYKsQ
 N6T3aYLpZpDFS3tPh5q2LoSaDmY4GzYfywu01zWoTqlxdZjGofkztSW3nS9mDxaRFGTK
 R4nCBmRdmiFKCjd6rU9whdi1S0ZP+BmQ8h5hyJUvlDEnfOXbNhXt1EZJOoS/QKFvzP7D
 cNw9Uarrls+0syPGPoZUT7m2kzwM0sBqREGqAQzhbgv2TagashthtEvLjSj/T/BiIltY
 nNZA==
X-Gm-Message-State: AOAM533D7lGSTlO+Ur4L1aOJ/0mww/KotIAHfCbLXcFwMSehnhUoOFLb
 ihB3Ui3yni+5WL+BI1kZO9k3mD2XWlvSXULoHFP47/KJJhM1KMpSzoEe1btHhejw+P3SOMtw2H9
 J/CUwOXkVbtiEUCWspOvXTDQPEEYh+LoNgZAf
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id
 x21-20020aa79575000000b0049fddabdcdbmr45022268pfq.13.1638264874342; 
 Tue, 30 Nov 2021 01:34:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsDWM9P1f5MUfWqEnY5V636f+gBeBhvK0l6UDhiuZ55X6bQo/QkB81s6VykNd/tyEgtDCV1w==
X-Received: by 2002:aa7:9575:0:b0:49f:ddab:dcdb with SMTP id
 x21-20020aa79575000000b0049fddabdcdbmr45022232pfq.13.1638264873975; 
 Tue, 30 Nov 2021 01:34:33 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id j2sm13833949pgl.73.2021.11.30.01.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:34:33 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7622: Fix a NULL pointer dereference in
 mtk_infrasys_init()
Date: Tue, 30 Nov 2021 17:34:26 +0800
Message-Id: <20211130093428.87802-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_013436_286087_D62B1CCD 
X-CRM114-Status: GOOD (  16.92  )
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

In mtk_infrasys_init(), the return value of mtk_alloc_clk_data() is
assigned to clk_data and used in mtk_clk_register_cpumuxes(). There is a
dereference of clk_data in mtk_clk_register_cpumuxes(), which could lead
to a NULL pointer dereference on failure of mtk_alloc_clk_data().

Fix this bug by adding a check of clk_data.

Another way to fix this bug is to add a check of clk_data in
mtk_clk_register_cpumuxes(), which may solve many similar bugs but could
cause potential problems to previously correct cases as the API is changed.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_COMMON_CLK_MT7622=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7622.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
index ef5947e15c75..3a389fa915c1 100644
--- a/drivers/clk/mediatek/clk-mt7622.c
+++ b/drivers/clk/mediatek/clk-mt7622.c
@@ -653,6 +653,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 			       clk_data);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_cpumuxes(node, infra_muxes, ARRAY_SIZE(infra_muxes),
 				  clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
