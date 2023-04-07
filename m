Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828F0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xj31V7FzD668bKNFp9tLeYwUXDvJEKNdD/9Iu2Cqb0=; b=T1Y950KptjdWMzQSuWU8ws5YYX
	uZF5WMZEk6COzVuqq8XdgVOShW3qWvNEkZfGIRoGkjb2wUzbAmIZWMan2ad8/BLH4omvSEaMAaBSU
	pt6cb7sleaOV6eNKrMqZKxhal9+OtKdjsj4+UGatks4j+WQv4486WkPyDaq7GXjnfNpcfzyqytOU1
	MqdSPteybaR0jjnuZC8dMrrF0jxz21UD2Nq3n3Aq+Gg1X/VOahK39S/pduiwMRkchoZn3kz7YNsZA
	J20CqU+IjexYzaFL/6uc1rl6qv06e7Ay+unxruas60rEwKDTfUxQLH4GR/ju2s2lOBMsNl5HU29in
	l5KmPMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkho7-009YXf-2c;
	Fri, 07 Apr 2023 08:50:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkho4-009YW1-30;
	Fri, 07 Apr 2023 08:50:54 +0000
X-UUID: 49ff072ed52111edb7d8d11f642b8e78-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5xj31V7FzD668bKNFp9tLeYwUXDvJEKNdD/9Iu2Cqb0=;
	b=RUN7FQAC2J6IQQ4xh+ehwI4g8A+ckqZLdkMDvHtH6+jkuKtcf+554+TQb6zwXZBJHU8pbilj5SfJJjb1k8jojULpS1J3qAwPq5iYIjBOqcFiMa6bwe2pByXpKUn4x6X9CXe7eegBVRAtoBsdDnKpRuHLLVvQJ7JGMRAMdLWWNX4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9f8e4556-5b46-4bb0-9029-66852b6a456a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:8cf0a02a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 49ff072ed52111edb7d8d11f642b8e78-20230407
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 492294107; Fri, 07 Apr 2023 01:50:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 16:29:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 16:29:42 +0800
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
Subject: [PATCH v2 7/7] usb: mtu3: add optional clock xhci_ck and frmcnt_ck
Date: Fri, 7 Apr 2023 16:29:37 +0800
Message-ID: <20230407082937.14558-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
References: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_015053_124666_31DE27E1 
X-CRM114-Status: GOOD (  13.29  )
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
v2: no changes
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


