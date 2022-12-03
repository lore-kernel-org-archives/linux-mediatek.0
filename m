Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A5C352A1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Dec 2022 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saqmwGDHPiQoY0ujUbcEMntCCAa+nV40NWD8EUNh7o4=; b=oLplgXxZg42wAUvEJmifKDt0WH
	9Ro8817Q3o5DnN3mk9cO42IfKAbxOJFNtL+UN9zl997b+LaicyQfNOrfHzF+87U4Ak9snFzj+VS7G
	bRloqfc27SiYdSSa5iBUxpIBf9WZ7Uo87ty2dfkWzX/V9LvVPnA7qRkPm1a8ZsZ9TT//ULcSUr9Yy
	ZnpHauHmIY1VVnLT064t+1y0au8gDgCsMJTVTw5tUeijvwHDCPjdkVHWWiZpnitWfKOOC/57rxJUv
	WPzHzrz/M96VagSGvlyu2eqFhXYhiCVAlgbpOH6bLm88ozH2m2UXSgcmdnPlrxMb6ho8QHHCXar2h
	HxwT0Vbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Twq-003qkq-Oh; Sat, 03 Dec 2022 14:57:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1Twm-003qjZ-Gb; Sat, 03 Dec 2022 14:56:59 +0000
X-UUID: 285fac1f1d614206886ed7b36bee8b5f-20221203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=saqmwGDHPiQoY0ujUbcEMntCCAa+nV40NWD8EUNh7o4=;
	b=PLGjM7LMTqQKOtfX0Pxt5YDQDp75Hwa6RfG7mVdnukl8W+61QOZf1JovHn+z1ZIZWIPBm3r+lBAZHaQ45R4B1RoKsfu+lLz6z/rdPWrOMsgwZUZrPdFCcpIXQ6RH4HUty7gZktGXUqkg7myK1VeOrqA2r5g2kWrvpkq77oYWIpE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:98666fc8-c53c-4121-b1ba-8f3cfda708a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:132a9130-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 285fac1f1d614206886ed7b36bee8b5f-20221203
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936516591; Sat, 03 Dec 2022 07:56:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 3 Dec 2022 22:56:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 3 Dec 2022 22:56:02 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v5 2/3] phy: core: add debugfs root
Date: Sat, 3 Dec 2022 22:55:58 +0800
Message-ID: <20221203145559.24763-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221203145559.24763-1-chunfeng.yun@mediatek.com>
References: <20221203145559.24763-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_065656_577332_84FE2616 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a debugfs root for phy class, then phy drivers can add debugfs files
under this folder.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v5: no changes
---
 drivers/phy/phy-core.c  | 6 ++++++
 include/linux/phy/phy.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index d93ddf1262c5..2f9f69190519 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -11,6 +11,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -1204,6 +1205,9 @@ void devm_of_phy_provider_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_of_phy_provider_unregister);
 
+struct dentry *phy_debug_root;
+EXPORT_SYMBOL_GPL(phy_debug_root);
+
 /**
  * phy_release() - release the phy
  * @dev: the dev member within phy
@@ -1233,6 +1237,8 @@ static int __init phy_core_init(void)
 
 	phy_class->dev_release = phy_release;
 
+	phy_debug_root = debugfs_create_dir("phy", NULL);
+
 	return 0;
 }
 device_initcall(phy_core_init);
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index b1413757fcc3..c398749d49b9 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -205,6 +205,8 @@ struct phy_lookup {
 #define devm_of_phy_provider_register_full(dev, children, xlate) \
 	__devm_of_phy_provider_register(dev, children, THIS_MODULE, xlate)
 
+extern struct dentry *phy_debug_root;
+
 static inline void phy_set_drvdata(struct phy *phy, void *data)
 {
 	dev_set_drvdata(&phy->dev, data);
-- 
2.18.0


