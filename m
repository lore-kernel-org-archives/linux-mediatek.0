Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BCAC0502E
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Aug 2022 11:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbxrRp1evwFc20WFeXZbEJKJb1zjP4hvMQ6Xd+syTH0=; b=ep00Kv1NFUVNMhyjtKO1pPFUCz
	TqHCa0B10vEzODng73NS72bcvfyTynRZCI3uTP43N1F1ClR4K1V1OC5H6sNDmcsBd2FqwM72wEk+B
	BwmztxobP42Y5f9Klnz+3pp70TbTJeT6mE9JCFMfydqXytsE9AjGCHoAImuWV+1pGBSNOwYy8sOtF
	KhpG9kYSLkqEJ9ywT6aMF3AKwdz3HA0iXSjG9tDmJcspxAMG83DyJATReY9UhVtdJs1PzGYo2xdUF
	rGw2E0vHaHI96p0qmKWtlruaVpkIIDAZMPXCzc85q4MXXgxXPPxsvn/lIRP1YILqV1oYCXtILACJb
	zoWbQHcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuDX-0090VO-3X; Sat, 27 Aug 2022 11:43:11 +0000
Received: from smtp08.smtpout.orange.fr ([80.12.242.130] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRuD8-00906e-Ib
	for linux-mediatek@lists.infradead.org; Sat, 27 Aug 2022 11:42:48 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id RuD2oYf3rUoLVRuD3oSO9F; Sat, 27 Aug 2022 13:42:42 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 27 Aug 2022 13:42:42 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: broonie@kernel.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	neil@brown.name,
	blogic@openwrt.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] spi: mt7621: Remove 'clk' from 'struct mt7621_spi'
Date: Sat, 27 Aug 2022 13:42:40 +0200
Message-Id: <76ed0ef91479498b9a2d5ef539f80851cffdb4ea.1661599671.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
References: <cover.1661599671.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_044246_806324_70807698 
X-CRM114-Status: UNSURE (   9.17  )
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

The 'clk' field in 'struct mt7621_spi' is useless, remove it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-mt7621.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
index 114f98dcae5e..c4cc8e2f85e2 100644
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@ -55,7 +55,6 @@ struct mt7621_spi {
 	void __iomem		*base;
 	unsigned int		sys_freq;
 	unsigned int		speed;
-	struct clk		*clk;
 	int			pending_write;
 };
 
@@ -361,9 +360,8 @@ static int mt7621_spi_probe(struct platform_device *pdev)
 
 	rs = spi_controller_get_devdata(master);
 	rs->base = base;
-	rs->clk = clk;
 	rs->master = master;
-	rs->sys_freq = clk_get_rate(rs->clk);
+	rs->sys_freq = clk_get_rate(clk);
 	rs->pending_write = 0;
 	dev_info(&pdev->dev, "sys_freq: %u\n", rs->sys_freq);
 
-- 
2.34.1


