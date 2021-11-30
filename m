Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 09:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRcJ36ZvWjbUFY8HoMgGJGN986EueSsp6BAIn56nby4=; b=k44klwRY/eRE72
	pDOt6WdyHXBAGZ093a7J4PXv4otJPzGhdbFpwxvMvGHKJvM9HVJCbHR57UNWEzB/mDZL1El0gr+Th
	ZQgnBmMP63oHEsxyiMNFJBsiC81IoKSt3Zl5m+El4No6/vZ9C8KioAWxl+GZ+79K5t0lsxAWV7YnB
	moEJjPQXiiJCLX/IMUUzhI+TjGBA/eg2DI1Swldil0hpi8cfHU6ZDBAO/fuT0SuConDMeHA467ijB
	sC10sRnkZm4QAWqLWTARE/IPvIFfJ0sQBWLIUp9V/TZiVcaWR94a+Jefaxy8Z94KSfgh77mC/7oNT
	LJUQEGymUP3bbW94Vh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzNY-004JQj-GF; Tue, 30 Nov 2021 09:24:48 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzNM-004JNb-09
 for linux-mediatek@lists.infradead.org; Tue, 30 Nov 2021 09:24:37 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3GyC3zHvz9vBtN
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 09:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_LbLhjT0q8Q for <linux-mediatek@lists.infradead.org>;
 Tue, 30 Nov 2021 03:24:35 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3GyC1wVgz9vBtK
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 03:24:35 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3GyC1wVgz9vBtK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3GyC1wVgz9vBtK
Received: by mail-pf1-f200.google.com with SMTP id
 z13-20020a627e0d000000b004a2849e589aso12554795pfc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Nov 2021 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Kpv95WvUkW/Ud7pYJF6QRY1ECX/+UULSLWzxdPLIgk=;
 b=Fw5Z8AyCfUSIgxqiupoCR9sjMbdmQ29AFdnEjQPhopEri3nPVfkJbbGXd6nS/bLtFS
 zJ1IE20IzWpQ5+g4mkZh0efIGFxNISOolZx8KzAjvK62U2xWPwSELLRUFvMzGdRQgGjK
 3JSQdoGAolMpLrYM08uIBskshSCFQI0Ku+X4icBsRT1XAZDWFNO6iHcOvhMVfqpAP/gz
 Cu75DjY0gzdTU1ghoWOTAOwBmjSMMMYX0mmH+jO45HeRyCOYnPkSsBLqBwGPhZt5TLx5
 v1IMQ+rr7RXzh5BohSs3s98ln71POKNNZhxZbNolKcIT9KWiYqbbhtypq7744QDgI+pg
 RudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Kpv95WvUkW/Ud7pYJF6QRY1ECX/+UULSLWzxdPLIgk=;
 b=7AOYuoX/meeY6QSp032R63IuU+C/9lDab2a1wA09fTzj1Is9lYcMzu7hHkKuTJPggr
 iKOtR9UhXczS/nBg3dSHyOqCorluDLbb1v79+lro5hMKiFLv3voFz2iyQkiaiH6ukWRd
 odWMeNdZWoNZD4teIcmYtvoraih39BoplkC5WWADCnU44zY6rOzApkeXfipmOcPfl/QE
 GoKFOuwkD9QRC9jLn3g0T1Y93gQ+Mr50cZdb5E3ouK4UCswecdd5Ltgp+u8AEFficb7e
 h6NMCndyx9k32rczsVHestGRfaoL5paEG1B8iV8pJa6sXFLycoGz0fWddXeFP8ZCXhV7
 QOmQ==
X-Gm-Message-State: AOAM530jWwfZI0dg3Vu/2u3hChzGfnTrQnZyvoJfIxcuqF3mxvTx950+
 y94dMNhnIoctwaPS1KYl17p+iPPg8UiBYCI8NQV3IKo3EEYKqxmLcnKi/IV8b0f8MKiPOTXliu9
 k+4HyAVqQgET6cgOrSpeBhwUhneuSBZog+lMz
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr4588533pjb.194.1638264273947; 
 Tue, 30 Nov 2021 01:24:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDBGO+aaLim+LpVySQCOJYODPf3ehU0UEx5GMCZAkK4vXF25CONHenek8Yf1aGNTHZ8rqCww==
X-Received: by 2002:a17:90b:8d6:: with SMTP id
 ds22mr4588512pjb.194.1638264273756; 
 Tue, 30 Nov 2021 01:24:33 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id b8sm1921015pfr.213.2021.11.30.01.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:24:33 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt6779: Fix a NULL pointer dereference in
 clk_mt6779_apmixed_probe()
Date: Tue, 30 Nov 2021 17:24:26 +0800
Message-Id: <20211130092428.82262-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_012436_139470_70315419 
X-CRM114-Status: GOOD (  16.78  )
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

In clk_mt6779_apmixed_probe(), the return value of
mtk_alloc_clk_data() is assigned to clk_data and used in
mtk_clk_register_plls(). There is a dereference of clk_data in
mtk_clk_register_plls(), which could lead to a NULL pointer
dereference on failure of mtk_alloc_clk_data().

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

Builds with CONFIG_COMMON_CLK_MT6779=y show no new warnings, and our
static analyzer no longer warns about this code.

Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support)
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/clk/mediatek/clk-mt6779.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 9825385c9f94..f22bf4025f55 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1217,6 +1217,8 @@ static int clk_mt6779_apmixed_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
