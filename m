Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B13oO+0LWTVEwnngUAhEkDdldjb1bPBrWZqwwESfR+0=; b=Jnss/+XOuext5K
	hBZD1JKsyj/EfT1O2XQDacwWnLeXV56QrGrWl9ZWGr7f1FMM7imLc/ktsSjSx+/Zo25TnTSkjp9vS
	8LAIbo1eyRocXcGBTkWkcwUUs5GqSFH4FR/JfR9hylYVStD6xW5x6RdZ3qaoUpfhSuKo5BvF22OGC
	DaGTmRkGBt4yvxfuQXuoB+tVNCVckFt2TSHyMNPdib5uFU9YHIRUf6MwoCwpX3oy5Z08+8y0Bj57w
	E0FZn9hGrnTFOT63eNuh6qtoewYAhRvcpT24/JN24feVbGkwS5zvkOnpEjmqRNrPZoBZHKiUNCg/k
	7iFBbh8NK1K7xdcwrB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms03Y-004VRI-AN; Tue, 30 Nov 2021 10:08:12 +0000
Received: from mta-p6.oit.umn.edu ([134.84.196.206])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrznR-004QEN-Sz
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:51:36 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3HYK0hqFz9vC9F
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VWYc9zNCEbM for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:51:33 -0600 (CST)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3HYJ5hZpz9vC8y
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:51:32 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3HYJ5hZpz9vC8y
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3HYJ5hZpz9vC8y
Received: by mail-pf1-f198.google.com with SMTP id
 y68-20020a626447000000b004a2b2d0c39eso12546333pfb.14
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EkZVrHY7dDlBHaYqmsvcGz7vtd0FsbZd+iFeZSl0pw=;
 b=eX1OlLJGnlnjZkEFRXOiPM4eNd4fDrgYiEP7qGWxq8BGFuZRTX/cKs7O5X9SD7a+hQ
 4My4mGlmVkyKzcOY9EfUimRcA0afJ87YVnU1FUbgPQ8DtBc+0hKrbhI9302fijdAU8h9
 VVVGklII0T5GV58ctwpCNv6UVffytP7jaZv2T1DeXKb2R2f6dXfRTYg6o1cgxgnUFYcN
 7/MnOgpBZxXm1M6MKx4xf9qM0ridKSWofvNLlnJRSX0NB/K64tZ/M/unWdW4a4VC84LC
 VBbrkRwWUNedyaCnsiVQuHgP/LKlVeiNTdlIKbzLIBJYSk0R6ZIrjPW4aGwI112gbGXl
 PI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9EkZVrHY7dDlBHaYqmsvcGz7vtd0FsbZd+iFeZSl0pw=;
 b=B5GYv79yCFfqGDqHiraBIigK8Le5Rh0sfTK6fdnVXsVpkxRcXCUv3bipbXa0+anw79
 a4rHVABVKgzBhegm/6vysPUgxkax8y50FAQbSZtY6W3lG7ViEgXyNnYAbruxUpVR3eYG
 sBD+b/mxPVr5y003vwN4e055z7aMVVyURbStAN4NRueAfl6phohUe1rEmoUsiie9vH3d
 3HYa8de5eN9XdwOlnpHztK1p93FTV+sjjcDpjamwGMTCcchYEqII9UVJRCM2PaVEeEsT
 yqhLEE8zNHsZPAy79wy1rkUjLnLLUwdEIf3U0Jj3jyKA8Schcw0J+Xx+eRlNRvoQHrNu
 UYPg==
X-Gm-Message-State: AOAM5333NrQF5v/LAcwWVtMxkglL4A7vh9E0yN/8Tft7RykEP1h6PWXH
 FCykwxbVtGfTbAqxrfdrvdbN94Rpwk2+TPlo6oqNxYaFIptsVFXgy5uRTcjIgRJX2VJaupQt5e6
 3JZW9VuWCFSInIEeBXYNMpXrcJPajDjFMAMLA
X-Received: by 2002:a62:14c7:0:b0:4a2:a6f2:2227 with SMTP id
 190-20020a6214c7000000b004a2a6f22227mr44975645pfu.22.1638265891751; 
 Tue, 30 Nov 2021 01:51:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQImtzv+LIHTUu5TcQasG21GTkCIDnPySafq7nEj8Fg6iyWGGeeFw9694JEl49rBjqO97PVQ==
X-Received: by 2002:a62:14c7:0:b0:4a2:a6f2:2227 with SMTP id
 190-20020a6214c7000000b004a2a6f22227mr44975625pfu.22.1638265891509; 
 Tue, 30 Nov 2021 01:51:31 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id t4sm19770149pfj.168.2021.11.30.01.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:51:31 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh@kernel.org>,
 Wenzhen Yu <wenzhen.yu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt7629: Fix a NULL pointer dereference in
 mtk_infrasys_init()
Date: Tue, 30 Nov 2021 17:51:24 +0800
Message-Id: <20211130095126.96006-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_015134_070686_291E7277 
X-CRM114-Status: GOOD (  17.07  )
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

Builds with CONFIG_COMMON_CLK_MT7629=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt7629.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7629.c b/drivers/clk/mediatek/clk-mt7629.c
index a0ee079670c7..30fe4b9b9fda 100644
--- a/drivers/clk/mediatek/clk-mt7629.c
+++ b/drivers/clk/mediatek/clk-mt7629.c
@@ -603,6 +603,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data;
 
 	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
 			       clk_data);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
