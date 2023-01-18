Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555C4C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi5UY5wYjAKEw29TcABVtPFmRKOtecoPlbXcffhZgNI=; b=jb8jetmGFCPg17UCHysj9SFcvf
	i9SlrKzp5jVlzcwVftMPx3qv1CotVGXfG8Ma2IEj58oxk/FClITKj3oSYa4uLAW/GFwCxmUN/fcC6
	V6DA0VQgshNZNTDti1AJIWTXs81vrP+PX7FE71rjNIUel7r3TUxTOaIJikuFD3KG2oLegeX9ngPRs
	is8CuIwcnPcomKB4IDaR5UL9PE1scpUxFxTq4SvWamWGR6bGMtFfo2JjNdOGxFki8G9fkJ3P98zze
	hew2loESkU3RbngAKEed3faaauRQ2okMLxAb+R7Se49txm7vO8tQbhnKMcRI2jH28CeZcJzoZl8yo
	2DzUX08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI443-00HWrf-Lq; Wed, 18 Jan 2023 08:44:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI441-00HWps-KS; Wed, 18 Jan 2023 08:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wi5UY5wYjAKEw29TcABVtPFmRKOtecoPlbXcffhZgNI=; b=ebZ6KoEGShQNBA33HsAKtmzH/w
	eNDz0P75Dp+6jz5tXXbUfmPQmnhaPUUER/PDJz8BUKMCuDhvVsPHCLE9Bo/fCzvzB81ykVHvWzHdt
	DtxeAl7HIFlDy6P1kkKY4XMBo4INk6xu20IR8Ydj0z0idTHKGAzcpdCMAeKpFl11lr9+1rx/DK2mj
	DhuOLO5coyioB3UGYnltT7yeb6fJWk4GaZ00rqgyFSGvGEXvtJWrajnoPggdeG+wxBpBKl/R+cvVN
	NZwwCZMvxhLuONsH1aA2ZaK8itltU0UX0dhBvoPIcWr1T7t7y3TSKbJteufhe1qrLK1fJ4IAveHqT
	w5njw+rA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pI43k-006D8E-2g;
	Wed, 18 Jan 2023 08:44:45 +0000
X-UUID: 4e07386c970c11edbbe3f76fe852e059-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wi5UY5wYjAKEw29TcABVtPFmRKOtecoPlbXcffhZgNI=;
	b=iEv9E3nu+evn1OmvvtcF4nKJs2jE19GxwyafyYyScnt0hoKKEJxPeLMAhvCYCsaaFRmSGo/IOr0hNUi07s8JJ+VkApsNn45CeZ2wv/BP1GqW0Q7vkX2vxs53J3gLv7ZAWpIJqMdXV35s/riLjd/j1jNzoVhyLfbVt26rSyclmog=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:f0d1d66b-4208-4fcd-8612-5ea2eea9db09,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.18,REQID:f0d1d66b-4208-4fcd-8612-5ea2eea9db09,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:3ca2d6b,CLOUDID:4c1429f6-ff42-4fb0-b929-626456a83c14,B
	ulkID:230118164424Z3J4NDM8,BulkQuantity:0,Recheck:0,SF:28|17|19|48,TC:nil,
	Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0
X-CID-BVR: 0
X-UUID: 4e07386c970c11edbbe3f76fe852e059-20230118
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 7653553; Wed, 18 Jan 2023 01:44:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 18 Jan 2023 16:43:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 16:43:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v7 2/3] phy: core: add debugfs root
Date: Wed, 18 Jan 2023 16:43:42 +0800
Message-ID: <20230118084343.26913-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
References: <20230118084343.26913-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_084442_392542_DC5272F4 
X-CRM114-Status: GOOD (  11.57  )
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
v2~v7: no changes
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


