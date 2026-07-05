Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0C3C43458
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2026 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R4nai0spS4xz/sy9X2FqTj+eO3xeqrH21m//XxXvR6k=; b=Tnodia+vOo55928CJWNHQ5gC8y
	0hY/+KHlgtFUzZoRT/YAwNHZQXqMvmjuFtxGFjqJ9DFySJUmp2fLiJJ2QM9MxRa5hEAirge7Du9X9
	T3/C3aVk0bHKRNZV7E9meDQ4+rITiKXN2ZrsDsI2a7I+CUxPVwe40WwoxrpxPQUjr7CY/SiyjbkUX
	dorqQUctI1o3Js892pWV0GHKaJqMz10xqVN6YqWqad7IYGnNQcxF3ptxK+/hrBa5z0OfALe3rC0TF
	joHrYHQZdD7dx7QyReyej+3I8yuXu0nUoLnoX/mON+rgcvFIa21JeFrFAWN1pHlWpZKUULbvBnluH
	MtNxc4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPog-00000009Twu-0MDe;
	Sun, 05 Jul 2026 16:35:38 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgPoc-00000009TwE-14YP
	for linux-mediatek@lists.infradead.org;
	Sun, 05 Jul 2026 16:35:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=R4nai0spS4xz/s
	y9X2FqTj+eO3xeqrH21m//XxXvR6k=; b=Mb9xW01AMDeQmGNCk/doumAlIlkjGD
	roB5XhSPIwOCCU7lqGRk48xN+ova6KodZkaNC3hgYJYeGwWA0FGH08IBIwV5YUID
	qcmYIxwtVxJIelKE7clOHJJXYZDu2s+ppaivdcdurq150jCz2WV7klrveqyVaEPT
	uphMP3MvY97OZZfFWMl8MJ+Eui9LXvbB6FhWy4HaNzWFEo7XsosLKxxMTQaPhcz1
	OYWMi9XedufpUsQKe+kX26jObb6bzWJdMJwyZarGQNBK7ICj5AMcv1ojNibZ2kB+
	75Z0MKWFyZfXZrT+edUxJGLgHU+dPqW3v8MMEP1N9Nol0uqQPJufWH4g==
Received: (qmail 2287049 invoked from network); 5 Jul 2026 18:35:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Jul 2026 18:35:27 +0200
X-UD-Smtp-Session: l3s3148p1@1N/Lvt9V8XdtKjFj
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: remove unneeded 'fast_io' parameter in regmap_config
Date: Sun,  5 Jul 2026 18:35:24 +0200
Message-ID: <20260705163523.1797-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_093535_098901_9578B86C 
X-CRM114-Status: UNSURE (   9.33  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
index 7dcc164627c5..ee88dc4a231a 100644
--- a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
+++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c
@@ -629,7 +629,6 @@ static const struct regmap_config vlpckgen_regmap_config = {
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = 0x1000,
-	.fast_io = true,
 };
 
 static int clk_mt8196_vlp_probe(struct platform_device *pdev)
-- 
2.51.0


