Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B062C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 07:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rOnbUEm5Z4zGlg0v1DA+7StRw+dk1tfIVeGfLSWIMdM=; b=HsU7TjZ4haZWex
	nyrKI16+iDjxxyY/Njvt257nJgg38Jp53fdNS3NHL5Xp17HTrEtw5CYqHH04rMpoPYWMyS2nJ1qMN
	zA2ViekMGFFFh8nDpy2urL7LbaiSup7Kh8tTgOzRe3c84EfUyTTcvCDZ+0edVilbZxExCT7bUULUU
	rAKkLl3ANDVTJa3Ly/QJPEmWCFFKy1cqYxhHRPkLKe9EtfMe6MlilIul+zvAaMEQg5ZN8QiXNvj/x
	AtAzUQzgOuPbs3d/69+/p+Matjkvoxho/0FWrU5mbPelJgxtHAGRsNnJyUyelZtNYivvJ0jNo51mk
	sIMCGHvwZxHmj3GJQc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvDPI-00F6wG-II; Thu, 09 Dec 2021 06:59:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvDPF-00F6vJ-OG
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 06:59:55 +0000
Received: by mail-pl1-x636.google.com with SMTP id k4so3189597plx.8
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 22:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RW5/PiePPwGEbHeQax2XMoMOzVE/w5j3urPprFU4xj4=;
 b=JVbv4a01GSr23DKUbNzvViDTbkroOUJ87xix4b42EFQaiFa1zGzPOWqcwlrYW5vgLP
 2ZGiJfe62HN460Hg51yFQcDuPG0SWbo/67FO3eJ1vwNyPZ+OeUXlPuupEXJAtnsZj0dS
 i2BZGWKeJrHSy0RM0ZGyNLL+bi05qB3ChyceA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RW5/PiePPwGEbHeQax2XMoMOzVE/w5j3urPprFU4xj4=;
 b=asubEZZ1D99mVBJUJZZP37ogEboaJl5YYvwkewplg2s5aw6lwwAyJQrTPsIFlhGozg
 +OOLyjGp/D8vbnkqmua38JiSDwOJv/qhHH5lz4mHp629fePzXt2Qb4YUaQgpT+/Xx48F
 wN4wfbWKTmgW/G/R+jkFf1XMIIYk3h8BU9ZQJneUjtoiz4QpusG9dHNO1eVgtDXNRxdP
 9RrI0SsoAwNs/qc2fAwLchEI8+9gMH1IC1WpwMNvjI3Y1Wv2sElqQo303SUjqJHhgN9Z
 cjTRRwLOcttHGIfr34cJNFKTkC8Yxqnbz0eHn/9dg35Z1Mk7KAXKPLkUR8+sPnBROEVb
 WwJA==
X-Gm-Message-State: AOAM533EnXI+94UH8FF+XrBTeINqVdEIX4X9o3I10GSClK1AMpsLLjzd
 iVu5CtTzTgM5D1EOw4y0eChNmg==
X-Google-Smtp-Source: ABdhPJxslNIMXLet9RCsdKQS4VcDTdk1MoI3qUUFLzT/WUMx1UA0lI3LnVvI7Nvbp4pNWZtW8vIZ2w==
X-Received: by 2002:a17:90b:33d0:: with SMTP id
 lk16mr13483577pjb.7.1639033192843; 
 Wed, 08 Dec 2021 22:59:52 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bc93:a930:2121:8bed])
 by smtp.gmail.com with ESMTPSA id j4sm4463519pgp.58.2021.12.08.22.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 22:59:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] mailbox: mtk-cmdq: Silent EPROBE_DEFER errors for clks
Date: Thu,  9 Dec 2021 14:59:48 +0800
Message-Id: <20211209065948.1796663-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_225953_837821_171A9ED0 
X-CRM114-Status: GOOD (  10.22  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index a8845b162dbf..087fb7334166 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -573,7 +573,10 @@ static int cmdq_probe(struct platform_device *pdev)
 				cmdq->clocks[alias_id].id = clk_names[alias_id];
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
 				if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-					dev_err(dev, "failed to get gce clk: %d\n", alias_id);
+					dev_err_probe(dev,
+						PTR_ERR(cmdq->clocks[alias_id].clk),
+						"failed to get gce clk: %d\n",
+						alias_id);
 					return PTR_ERR(cmdq->clocks[alias_id].clk);
 				}
 			}
@@ -582,7 +585,8 @@ static int cmdq_probe(struct platform_device *pdev)
 		cmdq->clocks[alias_id].id = clk_name;
 		cmdq->clocks[alias_id].clk = devm_clk_get(&pdev->dev, clk_name);
 		if (IS_ERR(cmdq->clocks[alias_id].clk)) {
-			dev_err(dev, "failed to get gce clk\n");
+			dev_err_probe(dev, PTR_ERR(cmdq->clocks[alias_id].clk),
+				"failed to get gce clk\n");
 			return PTR_ERR(cmdq->clocks[alias_id].clk);
 		}
 	}
-- 
2.34.1.400.ga245620fadb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
