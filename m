Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219F6C77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 02:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2vEushRIBDMZrtHhe0+2KbcgDPOccbzbirf4EsVaVMQ=; b=wKZlUd/qYSQ5mHadIYqFuftZHT
	Srz5IXdVGuxx+mqQ1hrOiVllVsmzaYfyWgdrqeKSubK7tJ5KeUBvDA36QlKPSFH5NggbL8o5/hYxT
	Z9nmlffBk2Fm5Bej//cMD7Kg42amTzCwWoNctqoiJpk9434P8/1FSvm2Fsu16gTyqtEfGgAULdpqK
	0jW+2EQIfEuWxMKtapCIiaZYEfPBH9l4ZB7fARok0fUM/zQT1FxQGHRVZ4s9ZtyluD3SK3hfxz8Pq
	sjYATEe99PnL+pF4R/0P0sxGKjkkYkMhU0tVOybdIoLab+sS+iB39IJFzkIUwzvW5rJwQk38OIJ8+
	7SUhgQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poEp7-00EhiU-1r;
	Mon, 17 Apr 2023 02:42:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poEp2-00Ehhe-1t;
	Mon, 17 Apr 2023 02:42:31 +0000
X-UUID: 787e5c3adcc911edb7d8d11f642b8e78-20230416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2vEushRIBDMZrtHhe0+2KbcgDPOccbzbirf4EsVaVMQ=;
	b=hLO2qsxOSjYSAzpar8nPdrXEmyIl+Xb3dbRxggjDYphOlZcb3DWMpe06mMcuoknKr/2M5xIJaQxNXUkQB13PSCey+qGXga02Trua8ShfdIOiJpevwjCfydpLNNPnubgq8NfYMOYGBZ7vj4R8mWKTgOUWVa6MxMLnQNHg+RfKw/Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9be4b114-f018-4725-900b-8304ab758f96,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:86fa85a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 787e5c3adcc911edb7d8d11f642b8e78-20230416
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 352353958; Sun, 16 Apr 2023 19:42:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 10:42:16 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 10:42:15 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mathias Nyman
	<mathias.nyman@intel.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH v3 2/2] usb: xhci-mtk: add optional frame count clock
Date: Mon, 17 Apr 2023 10:42:13 +0800
Message-ID: <20230417024213.17973-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417024213.17973-1-chunfeng.yun@mediatek.com>
References: <20230417024213.17973-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_194229_687648_ACBD7ABC 
X-CRM114-Status: GOOD (  12.08  )
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

Add optional clock frmcnt_ck used on 4nm or advanced process SoC

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: add reviewed-by AngeloGioacchino

v2: no changes
---
 drivers/usb/host/xhci-mtk.c | 1 +
 drivers/usb/host/xhci-mtk.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index f7cbb08fc506..90cf40d6d0c3 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -398,6 +398,7 @@ static int xhci_mtk_clks_get(struct xhci_hcd_mtk *mtk)
 	clks[2].id = "ref_ck";
 	clks[3].id = "mcu_ck";
 	clks[4].id = "dma_ck";
+	clks[5].id = "frmcnt_ck";
 
 	return devm_clk_bulk_get_optional(mtk->dev, BULK_CLKS_NUM, clks);
 }
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 1174a510dd38..faaaf05e36ce 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -15,7 +15,7 @@
 
 #include "xhci.h"
 
-#define BULK_CLKS_NUM	5
+#define BULK_CLKS_NUM	6
 #define BULK_VREGS_NUM	2
 
 /* support at most 64 ep, use 32 size hash table */
-- 
2.18.0


