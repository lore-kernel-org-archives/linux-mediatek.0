Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C92C77B77
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFOJULAIHGPq12XJm5Jmua93Eyz9XsckyqBFWPq6Mto=; b=c79gfwu96v5TkfEzHmBT67Kzgi
	vOkVLISvwMNI4ObXDn4jeNXfPQXWfmbzksAIxYLxORuS4/A6o3Vq1jhWgSOPzp/TqWAAawc2zxDIh
	hL7/bLrwu1EGumSKa0udDP5eRJV3ZV7k+T9Hc5E33ZWmRS/EZCLoXAGRo8+9Sm7QiT6F0ZaY5YeNV
	4XS4zOwDTiaarNCZSKiFxkavTihvGReJb+bHqc7JVrfxoazdKy3qvhJR/qn3jOzmBSoZzGDM4SO2D
	Mw1S0Xs1vl1ZgQbSwceVEwdr4bwyVsLYvwv2P8GnuSlMp2gR/2AJr86RlkTUGaAK61/KTqUkZUR/r
	spWcTlCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poEyu-00EimJ-2u;
	Mon, 17 Apr 2023 02:52:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poEyp-00Eii8-1x;
	Mon, 17 Apr 2023 02:52:38 +0000
X-UUID: e53481a0dcca11ed8687db9d93187ff1-20230416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HFOJULAIHGPq12XJm5Jmua93Eyz9XsckyqBFWPq6Mto=;
	b=gfCiOOD+B9+kvoHzDrcYT4GH/TGTJ+8BqL6WjGsl3XivL0yrInRqb7rIVnlaGrCT66WUZm/b/HZPFNDCRM4m0N1XqVObh9r6uJ0NUd8TwOXqPUBVYbrvNaXb6EFVKGMdvKWjfUNarlQW7UdDtV2+dfIFfXDcPwE7mdtekV9LIQ0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:7e5ec929-65fb-4197-bab9-b467f5149b14,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.22,REQID:7e5ec929-65fb-4197-bab9-b467f5149b14,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:120426c,CLOUDID:fd6786a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230417105231HFR8R5MI,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: e53481a0dcca11ed8687db9d93187ff1-20230416
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 648198983; Sun, 16 Apr 2023 19:52:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 17 Apr 2023 10:52:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 17 Apr 2023 10:52:09 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh+dt@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Tianping Fang
	<tianping.fang@mediatek.com>
Subject: [PATCH v3 7/7] usb: mtu3: add optional clock xhci_ck and frmcnt_ck
Date: Mon, 17 Apr 2023 10:52:03 +0800
Message-ID: <20230417025203.18097-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417025203.18097-1-chunfeng.yun@mediatek.com>
References: <20230417025203.18097-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_195235_684498_A0CDC09E 
X-CRM114-Status: GOOD (  13.61  )
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

Add optional clock 'xhci_ck' which is usually the same as sys_ck, but
some SoC use two separated clocks when the controller supports dual
role mode;
Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v3: no changes
---
 drivers/usb/mtu3/mtu3.h      | 2 +-
 drivers/usb/mtu3/mtu3_plat.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index 2d7b57e07eee..b4a7662dded5 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -90,7 +90,7 @@ struct mtu3_request;
  */
 #define EP0_RESPONSE_BUF  6
 
-#define BULK_CLKS_CNT	4
+#define BULK_CLKS_CNT	6
 
 /* device operated link and speed got from DEVICE_CONF register */
 enum mtu3_speed {
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index d78ae52b4e26..6f264b129243 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -234,6 +234,8 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	clks[1].id = "ref_ck";
 	clks[2].id = "mcu_ck";
 	clks[3].id = "dma_ck";
+	clks[4].id = "xhci_ck";
+	clks[5].id = "frmcnt_ck";
 	ret = devm_clk_bulk_get_optional(dev, BULK_CLKS_CNT, clks);
 	if (ret)
 		return ret;
-- 
2.18.0


