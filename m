Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF125C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ftTTpqzcw4TeAO6vK1isNbMh37m3zW8/HkEym5+CSB0=; b=arz5WiyZ1ZwgkN85L7r8WzkPbh
	Yt9M2uMbAfVFkuKbhGmkkXpqpo3XF24I3HeaAzTZGkodY1Q0upTZck3qbaRx8I+5+Kuh2UhzDIpxC
	HIkh9DCWYxlFu+gj9c0+KOBhQN+vwxh6If73iEPGTEYewDsTLLYZbLQvvRRvMfiaqO676C2/nYZQY
	d86ZwrM96b+6pz29zj9gileiX5Oc5QMX+xurSr9qH64NkTxd826uuNknJjlRVxxdXAk0RGt91Jf2K
	4qwmAT87LSECoXBrM4NKi5qXq7usGMxHhqmolm8rf4YwgqlvGld0h+i2ZWTdlv+KA2ta2LwXyiMCC
	iC2+8D3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqD-005V1U-1v;
	Thu, 13 Apr 2023 09:02:05 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmsqB-005Uye-0w;
	Thu, 13 Apr 2023 09:02:04 +0000
X-UUID: 18142d70a7ba4fa4979d7736f75fe837-20230413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:ee4c8d52-2964-462a-b687-6d8ce734d4ec,IP:5,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-9
X-CID-INFO: VERSION:1.1.22,REQID:ee4c8d52-2964-462a-b687-6d8ce734d4ec,IP:5,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-9
X-CID-META: VersionHash:120426c,CLOUDID:cf28d6ea-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230413170137RYK53AXK,BulkQuantity:0,Recheck:0,SF:19|42|38|24|17|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 18142d70a7ba4fa4979d7736f75fe837-20230413
X-User: gehao@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
	(envelope-from <gehao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 513328953; Thu, 13 Apr 2023 17:01:35 +0800
From: Hao Ge <gehao@kylinos.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	matthias.bgg@gmail.com
Cc: gehao@kylinos.cn,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mediatek/clk-mt8173-apmixedsys: convert to devm_platform_ioremap_resource
Date: Thu, 13 Apr 2023 17:01:28 +0800
Message-Id: <20230413090128.60119-1-gehao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020203_653933_0F19EA6E 
X-CRM114-Status: UNSURE (   9.36  )
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

Use devm_platform_ioremap_resource to take the place of of_iomap for
avoid that we don't called iounmap when return some error or remove
device.

Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index a56c5845d07a..fe386bf8225d 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (!base)
 		return PTR_ERR(base);
 
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

