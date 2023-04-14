Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117E7C77B6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a8MiYNam0nDwFwB3ISUwXPU9++tI5ha1N9Pe3DCgOec=; b=KxXJWuBumwY4v0Qwvl6TOZ9DhP
	k4P0h6kk47497pXEg2/xskmSoWdWYp++muGpz6K2xNQB3UPhUa7By6zmnTR7sJ/z1LZix8pyVTuSy
	aOwXH/K6AM2S2sDxX1AHKSm1L6SsyqsEiKRq7vJFd73rAdPxheBRG9KNng7ot9jwKzWyN0JlmuXNh
	GRmp8fje7tsP9YuZGslFfsMe2JCYEFIAw97cBD9O7JPAMwj9e+NKS6LeIXGgdClLfGxjrfAy+eX+6
	7UTNYASgXFRyB3Y25hRaftWUyVNkQ6id3nlH+5QRX8JR74Ygryp2IpczeomwAfeC20nNZo3A1uqmz
	3GZDX3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFeG-008r0e-1S;
	Fri, 14 Apr 2023 09:23:16 +0000
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFeD-008qvK-08;
	Fri, 14 Apr 2023 09:23:15 +0000
Received: from archlinux.localdomain ([10.12.190.56])
	(user=zkhuang@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33E9JuZ5016647-33E9JuZ6016647
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 14 Apr 2023 17:19:59 +0800
From: zhengkang huang <zkhuang@hust.edu.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: zhengkang huang <zkhuang@hust.edu.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mdediatek: devapc: use devm_platform_ioremap_resource() instead of of_iomap()
Date: Fri, 14 Apr 2023 17:21:13 +0800
Message-Id: <20230414092113.64514-1-zkhuang@hust.edu.cn>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: zkhuang@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_022313_433737_CB75E755 
X-CRM114-Status: GOOD (  11.34  )
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

In mtk_devapc_probe(), if of_iomap succeeds and any following error occurs,
it needs to deallocate the resource.

Fix this by repalcing of_iomap with devm_platform_ioremap_resource, which
automatically self-manages the resource. This can avoid modifying error
handling code.

Signed-off-by: zhengkang huang <zkhuang@hust.edu.cn>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 drivers/soc/mediatek/mtk-devapc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index bad139cb117e..bea3ec8ab015 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -268,7 +268,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	ctx->data = of_device_get_match_data(&pdev->dev);
 	ctx->dev = &pdev->dev;
 
-	ctx->infra_base = of_iomap(node, 0);
+	ctx->infra_base = devm_platform_ioremap_resource(pdev, 0);
 	if (!ctx->infra_base)
 		return -EINVAL;
 
-- 
2.40.0


