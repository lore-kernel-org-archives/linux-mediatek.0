Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716A9C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:33:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8D0206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x/Xxcy3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8D0206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EUcnyoAkvH7AxR0mE797xJ+Yp02AXZ73JU4lkbDkK14=; b=x/Xxcy3bU21HdeLItWmnpCQFO
	OyJlLfSP/kUBwgS9TJXRa3AhGE+oX7x9KZD2AgmkLSEwYbRfBuJxAH+nVDLgM1XJiEGY2aMIR5bmr
	/bXHgCukCV00oacJdMTwixA/wgUp4fOfEuEX34G0bl+inA5HnhunZb+ursAmCzTwCh44kVhuZ761w
	+ccJPtNNruhS8wBhTCTia3ZmcCnMlIm+ERWWijw8j0Jn4JS3/sch5qzEExZECfnj4MCN84vOrt6Cm
	GtAtLCFogGAmyAZLBSksQ1Xa4u8zRt6ZbywsJ3OKRqL8LpvxguIPEI7RFy30yWiDlqBOzAmy9ZAgO
	ZgRVhzHjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPsiW-0001WW-5G; Tue, 06 Oct 2020 19:33:44 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPsiJ-0001Rh-3Z; Tue, 06 Oct 2020 19:33:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C497229BD86
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] soc: mediatek: mmsys: Use devm_platform_ioremap_resource()
Date: Tue,  6 Oct 2020 21:33:18 +0200
Message-Id: <20201006193320.405529-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006193320.405529-1-enric.balletbo@collabora.com>
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_153331_270016_1AF90A49 
X-CRM114-Status: GOOD (  11.44  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For the common platform_get_resource()+devm_platform_ioremap() combination,
there is a helper, so use it and make the code a bit more compact.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 drivers/soc/mediatek/mtk-mmsys.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 36ad66bb221b..18f93979e14a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -306,15 +306,12 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	struct platform_device *clks;
 	struct platform_device *drm;
 	void __iomem *config_regs;
-	struct resource *mem;
 	int ret;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	config_regs = devm_ioremap_resource(dev, mem);
+	config_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(config_regs)) {
 		ret = PTR_ERR(config_regs);
-		dev_err(dev, "Failed to ioremap mmsys-config resource: %d\n",
-			ret);
+		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
 		return ret;
 	}
 
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
