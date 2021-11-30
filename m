Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pm07IU4Kq8rb0enc6rTGpUmCiOVyGiXTTJy2TkFvdfc=; b=Tfp70W/QUdiYvS
	7SAgDQgg7S+zSfNKnl6CkjcNnFQCTMZ5YGgtACi8xXLs7Hqe2NwrsoNdQy71RXbI1+hBMTvmKOssi
	8H8KcbGu3BDV2uwABdHDD527+v4JOq2CMVJrxPy07HEgds0uXerHrsJIJGDmJBdzoG8Fbvo7kEccW
	2p6tF4EEteaT33z0M643d89fuo5mD5b3dbLPuw0BePueZ0sLRL7GYN2JAmn1OxLCKjpHPqdeV+iNw
	ChqR3pE0TilwHevqY5mZEDRtpb4GqwbgtbY0cs6XiXy9Rv5nDFqt354jqfoipFN+EK6wrU2nBlJpm
	JQPGntzLa4a+xR6Zv/5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryyR-004EAs-Dl; Tue, 30 Nov 2021 08:58:51 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryun-004Cp6-Do
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 08:55:07 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3GJ82rdrz9vBtN
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 08:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6I-sbpbKmMlH for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 02:55:04 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3GJ80fmQz9vBt2
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 02:55:03 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3GJ80fmQz9vBt2
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3GJ80fmQz9vBt2
Received: by mail-pf1-f200.google.com with SMTP id
 a23-20020a62bd17000000b004a3f6892612so12470415pff.22
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 00:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwkYqyhX5smeL+L/r125AuKqmjcCfxTAw1WF1G/WgUo=;
 b=qStNVhS9s5xxEQjiT7/N1C0yco9IimARTtUel0RW79VmbmaqIDeUZxIOZ4qRbiCLzp
 JTjLuzCVsb9gCo20eVWkSin+Hykeec6Wl/yzLiv251iBuMwsOZdw3dcCSVKVtPdQzdRN
 a7z1Akh3RsfthmSHhC6WelA+HwY5p28vGLrzIw98rvHrQbAPQj24oEy5EZWcHOo21dOz
 hRTAm8nc/oUI7BTQ5QQMuLokd8GpE+c2xvjrRtmXLDB6CxpsYA3BA4AMj9kn4Lq8hXr7
 HYzPPuKArjH809WyANHlez0j0WfpAYI/8zJwNrTXIhvwS1Xdug8TXkmvVyLD2kiFcFzY
 z0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JwkYqyhX5smeL+L/r125AuKqmjcCfxTAw1WF1G/WgUo=;
 b=GFUFlPQtlk7EAeBF0znax6VGyj40ouzgCBgrzp07Go+k9ZrnuXa+YjiCsC4RFohR72
 D034jw9S65DwwLGo9koS4hgipecDpLT4AczdWfCyLcsmgxnZdrb0saue80gFhZj6/Cas
 WopI1u+4cmeWt4+mcXhs49so3sA0NKlHpklQuK5LowbNI1LTGcWRKuDXd3kU9VnpIMWj
 C0E98sTnt/I95k2hXnrMjRjHrE3GRonJxJilKBUmUz1w+n89EvcmzVg0vhuDs/Vi4NNh
 EwG1MGRPTmpK3Me50p3quGrdybuNSoXM0SI1XnU1WanIlrB9NUsFfQUhUTJa9YOIZ8BS
 Q0hg==
X-Gm-Message-State: AOAM530tgFFhM/Wl3r7eqD52NsCmwXmOQ+m6A9cRt6vkOil41qNbxwQU
 cMy+QTGNCOQvSLbdhHA8XS5QD524cehVvioY6ndsh6VA+0EBNVysUWfPLwrrKkUmLi7Cih9211z
 iv2TYHHOz2FRVz1faeFrSP7v8UD++6Av6n9Yu
X-Received: by 2002:a17:902:aa43:b0:142:6919:73da with SMTP id
 c3-20020a170902aa4300b00142691973damr65882689plr.39.1638262501514; 
 Tue, 30 Nov 2021 00:55:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt84MXmo7Ca8vyZxDhDjFTkMtVX+MNijU4eYMPkHKjS5V/seglj6amrRunpcPVSJcRS2e72A==
X-Received: by 2002:a17:902:aa43:b0:142:6919:73da with SMTP id
 c3-20020a170902aa4300b00142691973damr65882664plr.39.1638262501288; 
 Tue, 30 Nov 2021 00:55:01 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id l6sm1934745pfu.129.2021.11.30.00.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:55:00 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Shunli Wang <shunli.wang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt2701: Fix a NULL pointer dereference in
 mtk_infrasys_init_early()
Date: Tue, 30 Nov 2021 16:54:54 +0800
Message-Id: <20211130085455.75537-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_005505_604548_6918E330 
X-CRM114-Status: GOOD (  16.77  )
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

In mtk_infrasys_init_early(), the return value of mtk_alloc_clk_data()
is assigned to infra_clk_data and there is a dereference of it in
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

Builds with CONFIG_COMMON_CLK_MT2701=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt2701.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
index 695be0f77427..9ba30089cb9a 100644
--- a/drivers/clk/mediatek/clk-mt2701.c
+++ b/drivers/clk/mediatek/clk-mt2701.c
@@ -742,6 +742,11 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
 
 	if (!infra_clk_data) {
 		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
+		if (!infra_clk_data) {
+			pr_err("%s(): could not register clock provider: %d\n",
+					__func__, -ENOMEM);
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
