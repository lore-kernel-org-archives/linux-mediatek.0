Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EAFBC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKSj9iSpwxdHQwd1QdXwFI9qKTo6Er4DC6wWU11sT7A=; b=e7EmVngwW2WOQfdOyGvHqVbuI5
	hPPRMajX+WNbqvNL5y79WnEH0UyoepsVae4PCZNc+YOm5mvQq+xRffQ4f/hXnd/FcZ2s56IgnZCr+
	TmUOfemFO3KX6T5juZ0TK9BG1+dj0swMgRnYlBRLKdeWDuYFtrWSw3PzhUXiAfyvl3Gco5K/A9Fag
	VwR7ll2JuAHhh6QBKY2+q57LOQLjcLxNYa62QSQkkpuFtQqRw8Kg6vJmj8N8DjuR6l0iAEVevnQ4w
	2tO2pet0wsDZd6EyYrw0/iUMe/wQ5cbUZEGHJ1Jw3LHqQgEXbInTl+TzJ5j/BPpKf31E2wSTfehrm
	pbw67YnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD4Qo-009a7B-L4; Wed, 04 Jan 2023 14:07:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD46l-009SPM-LJ; Wed, 04 Jan 2023 13:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PKSj9iSpwxdHQwd1QdXwFI9qKTo6Er4DC6wWU11sT7A=; b=rQJdMRgaO5y7NpyHOTuY6WXzkJ
	SZwQnEv7P63zsmQY5D5TZxxyE0lvdL/hGEzgM9WTs3us5SznNuWTK6R6iEYhSo+urfcYJx36Gjhwh
	Ef8vLm5K5LxfSj4+1VYs4W3nWwMceADl6qTWm/XdxI6fILY0pJhkexcAneH7ip8sKfsvCVSrNTRZI
	4WO3iY4QQwVmRcp94nKVG948oeRjYKZ8pdZ51n3ZNEcZ0MtDHK6QEgBKx0oG0T/h9D4I7aFkcsd72
	/vNOH4K8cLGwd65kPFESRt/Sn9CPP4pCAFRJJM+6IHR2BV/oz45bCeoNT7Lj+o1zFnsr4WgstrCaj
	PNdFjhaA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pD46b-000xc9-0Z;
	Wed, 04 Jan 2023 13:47:00 +0000
X-UUID: a2c2ba1688ee4ab48328a9e47bf9b96f-20230104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PKSj9iSpwxdHQwd1QdXwFI9qKTo6Er4DC6wWU11sT7A=;
	b=n4UMFACO50TydKLIi/8URwSvuLh6nARUs7cKQUdYLv1CUR2/yD4LH6gRvLb5+k0TDoDXe3ENmPHXHM3gYJ7uBrUAzWUwaUE1YyCsSiLZJD0/0jMOWwVhe39Kx9090QEXbrVMD5PqVt+HLnwZI2n6S5trEh6lqfwvtH1ND9Bkf7k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:7c7f9b02-9560-4ba9-8182-8c9b5ebd8876,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:c946cbf4-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: a2c2ba1688ee4ab48328a9e47bf9b96f-20230104
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1865799554; Wed, 04 Jan 2023 06:46:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 4 Jan 2023 21:26:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 4 Jan 2023 21:26:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v6 2/3] phy: core: add debugfs root
Date: Wed, 4 Jan 2023 21:26:45 +0800
Message-ID: <20230104132646.7100-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
References: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_134657_951244_432E0FDC 
X-CRM114-Status: GOOD (  12.16  )
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
v2~v6: no changes
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


