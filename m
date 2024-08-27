Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8750C54734
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fe3psrywiuJWL+HL3IZKyPsJdSAR788wRHt5GRegjMU=; b=LPHAOYq3HCdba61nMXYCV3BFCh
	XX2u190Bv2FOLC++A9cSIl2LSHIJ97M5Q5iGJVSylbksYThp9aCTS7cmhJFIh1bvuq+L67w/4FUmy
	BOBNIxhU5K1ea54iyH0n5EJMx+XkMXyls9L7NPQKr+cna3QY9befYjPWeOqoA3iUONaLtW3JKsOHP
	xBtySD/R2Tl7E97HanH/UZPMN/fxi6JTkcdpVg6YInWQd0Vt//iELCgFnXWZNQDmC5CqumLSuRkwF
	3y4NpUbJ+En/DkUPnE0WzbHTwemu+k/BE+FIL/QlI9djNjD6ALXWlYmQBtUYJgccdFaxf94JLNtUp
	zG4hlBVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivXi-0000000BIE4-25Te;
	Tue, 27 Aug 2024 12:43:26 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivWt-0000000BI6Q-2Ivt;
	Tue, 27 Aug 2024 12:42:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WtRwW4FfvzpTr6;
	Tue, 27 Aug 2024 20:40:43 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 397BE1800D3;
	Tue, 27 Aug 2024 20:42:24 +0800 (CST)
Received: from huawei.com (10.67.174.77) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 Aug
 2024 20:42:23 +0800
From: Liao Chen <liaochen4@huawei.com>
To: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <mkorpershoek@baylibre.com>, <dmitry.torokhov@gmail.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH -next] Input: mt6779-keypad - fix module autoloading
Date: Tue, 27 Aug 2024 12:34:11 +0000
Message-ID: <20240827123411.431388-1-liaochen4@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.77]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500020.china.huawei.com (7.185.36.49)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_054235_870885_CD38595E 
X-CRM114-Status: UNSURE (   8.58  )
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.

Signed-off-by: Liao Chen <liaochen4@huawei.com>
---
 drivers/input/keyboard/mt6779-keypad.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 19f69d167fbd..6d2557a9b9f5 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -260,6 +260,7 @@ static const struct of_device_id mt6779_keypad_of_match[] = {
 	{ .compatible = "mediatek,mt6873-keypad" },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, mt6779_keypad_of_match);
 
 static struct platform_driver mt6779_keypad_pdrv = {
 	.probe = mt6779_keypad_pdrv_probe,
-- 
2.34.1


