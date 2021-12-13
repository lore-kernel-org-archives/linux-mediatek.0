Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A65C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xCsipzT1wgBYGQjABmNKl79jIknJ7QIvhCOt//hKZGg=; b=gJlFMGwHdMqnAt
	EPHM0EeaLo9nCHLeQ10YUWn4CebADF/E4eii5ewJb9S5zUnCoJghDSsf3F8f3P8+tmOQ9USzhHHtN
	pdcrqKmD1pEK4pQRo9gilPS3FeC7HnldnmkKEcbhT0RogO5c7dzYa60aRSNjeJ//F2YJGNfIleDIN
	YqT9X1PzamRaj6kiCHNtIlEq6j1sq5Jx/T+NpCOpn2l0CuyQV2M0LXmYlMy4KDVhlqJInlqvWEpdn
	vvAyOHjXggEN4XiSoF2d/OyfUlG69mMmu/NrCoDLPlD9+s7gRKVmlfdLl9yD2yOQh7I9x+8+qUIg5
	4oq+334LV1rGmGVHGSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfOd-0080xj-IM; Mon, 13 Dec 2021 07:05:15 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfOb-0080wH-8U
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 07:05:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id np3so11186811pjb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Dec 2021 23:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/kc7ebJlnLqfaZVU4eMOkFHSZDqfSXCTb3+LTn6SwU=;
 b=LShxVAZyIyqYus7DPwCbQTlPaaUHZLiGxYbFJH10V2CQ1IHefDJR6+7Fo49/Qzh6AU
 Lbw76mOSk/+soRdakEt0fsh8z0H9XwL21N9buUkkH8K50PN+8cDX4wcvo9eT4Dt9MGJW
 Ej0LzjYq6a6JUzQ9qzY5r/Yhavs06Cs6ltLCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/kc7ebJlnLqfaZVU4eMOkFHSZDqfSXCTb3+LTn6SwU=;
 b=QnvuusOREmolp6N592zs5rZkt5sbVPDKmz+h24hoFkPZvjWvCBRbF3i4HypoqDZbQU
 SAPO4nXmxOaSCmJkeYpps4lR6fG18OcF1Sh+QnCIXrLFh5mFnioHQ4sy21XzdaTz+4lr
 xA+BHpYnVQMHZGXvoz2z91wk4z757iJFTRDREdb6XcKotDy8zlS+wx7IhjlRVeZrYWxX
 b+l5rxtfepC2w5Uz3CHhCub19ObBy7ewoHlT1v0Kp/yQiPKPz+rRsiekLcaN+24JQOKH
 HGvKI2DbcNX+YWlQzkyxDleIh3gFzWDQNSR3KYJ8xxeV0rV8t4uVzGsBZ3nNCyJp8U6Y
 aRaw==
X-Gm-Message-State: AOAM533Xys3uOyNqkgswYPCZFO6oPx+BP0OFpc3eEEf0Yxk5ELtoPsnq
 Z6yVJcvn1u4DQc0gXzOq/dMxsQ==
X-Google-Smtp-Source: ABdhPJw5eN9BL11bnpjH2Litra/spgqz7gb1zNDlZ8DD8NBRQ5q5FEL8J+LhSLy30C37bExPbUB0QA==
X-Received: by 2002:a17:90b:fd5:: with SMTP id
 gd21mr43377175pjb.37.1639379111712; 
 Sun, 12 Dec 2021 23:05:11 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id k5sm5079402pgm.94.2021.12.12.23.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:05:11 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] mailbox: mtk-cmdq: Silent EPROBE_DEFER errors for clks
Date: Mon, 13 Dec 2021 15:05:01 +0800
Message-Id: <20211213070500.3977049-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_230513_309035_04522E77 
X-CRM114-Status: GOOD (  10.16  )
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

Silent the error if it's EPROBE_DEFER for clks.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: fix comments
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a8845b162dbf..6f9ee831ccd8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -573,8 +573,10 @@ static int cmdq_probe(struct platform_device *pdev)
 				cmdq->clocks[alias_id].id = clk_names[alias_id];
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
 				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
-					return PTR_ERR(cmdq->clocks[alias_id].clk);
+					return dev_err_probe(dev,
+							     PTR_ERR(cmdq->clocks[alias_id].clk),
+							     "failed to get gce clk: %d\n",
+							     alias_id);
 				}
 			}
 		}
@@ -582,8 +584,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		cmdq->clocks[alias_id].id = clk_name;
 		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
 		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-			dev_err(dev, "failed to get gce clk\n");
-			return PTR_ERR(cmdq->clocks[alias_id].clk);
+			return dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
+					     "failed to get gce clk\n");
 		}
 	}
 
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
