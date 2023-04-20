Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA24C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rULVDRFLy4mQ5APNLbHeqA/Dh8cWRZbwRv1r8JwmeAQ=; b=Gae6guDDNtt+6+z5uHYnhRYS2x
	yktcxUL6vqIEedz7rzi86jNYAAIpkwaM5EQ30Tag6N0VET7GIQvOHU4ugFKWyY3Bb0TjpyDaFkIaI
	xnAZAqRC55tXk87NSkbhHY1TokgNu5LI2jO585sAByUukjShHy6fDh14200dC9Gl7KK+8VhCt4QjK
	YTA9mYakbJoe5yGwrePocoonOisdIPqVJOWcKfL2HV0NqA7SuHUc/Q8SqB3b8txOnkVnTrFihznXU
	6MnJ7jOLGDq7UANXJla0On2D/+ubBUJ9b8vcTmye38hjT3+i8e0dhNTMfsaIDQRI1K4x6gWiBswbC
	o/fL3HMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQKY-007VAu-0G;
	Thu, 20 Apr 2023 09:11:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQKW-007V9a-12;
	Thu, 20 Apr 2023 09:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rULVDRFLy4mQ5APNLbHeqA/Dh8cWRZbwRv1r8JwmeAQ=; b=kX83zqN2lATYGlnPXR1+TvtL/0
	Xr49Eju8Z+DVBaGOuUvhV/TR2/Pp3yh+UU5cEoP8N0OIgzFZc4uDr/8rtVdhIof7SHckk/PbPXv4A
	3LUO8+TWJ7kT17MTSQ4Ulqu9HRI/sZgz61DaMayTbQUgyxfdbJ1mMfZAwTm8/ZgOSWF59CfXDxNKn
	I1nUOx3rrkSuOzF0UpjKhG/CU6D97iHw31R3xUFNIe5gHd/Dt5w85qbomV0vztj1meqUULG8y/4iG
	UTEqbfKDWLp3NjzbfHjVCavnyHSCitmcPrVzLzFetJDNFxMLfD5o+nG9YXufjqXqxfyFCheEoKxtP
	vEsKDMrg==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQKG-003jfJ-24;
	Thu, 20 Apr 2023 09:11:40 +0000
X-UUID: 496a3981a3724ed9863cfd24002f4a03-20230420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6a5a27f8-f086-46c8-ab10-ba7c001f65f5,IP:5,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-9
X-CID-INFO: VERSION:1.1.22,REQID:6a5a27f8-f086-46c8-ab10-ba7c001f65f5,IP:5,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-9
X-CID-META: VersionHash:120426c,CLOUDID:d90999eb-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230420171125Q0UCYOKU,BulkQuantity:0,Recheck:0,SF:38|24|17|19|45|102,
	TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 496a3981a3724ed9863cfd24002f4a03-20230420
X-User: gehao@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
	(envelope-from <gehao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1812346153; Thu, 20 Apr 2023 17:11:23 +0800
From: Hao Ge <gehao@kylinos.cn>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	matthias.bgg@gmail.com
Cc: gehao@kylinos.cn,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	gehao618@163.com
Subject: [PATCH V2] mediatek/clk-mt8173-apmixedsys: convert to devm_platform_ioremap_resource
Date: Thu, 20 Apr 2023 17:11:21 +0800
Message-Id: <20230420091121.28642-1-gehao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7b162010-4fa3-4572-c834-7264eb937e4a@kylinos.cn>
References: <7b162010-4fa3-4572-c834-7264eb937e4a@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_101137_305491_11D0946C 
X-CRM114-Status: GOOD (  10.37  )
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
Suggested-by: Stephen Boyd <sboyd@kernel.org>
---

v2: fix error handle condition for devm_platform_ioremap_resource
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index a56c5845d07a..73c29d1dccc6 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -90,8 +90,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	struct clk_hw *hw;
 	int r;
 
-	base = of_iomap(node, 0);
-	if (!base)
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
 		return PTR_ERR(base);
 
 	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

