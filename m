Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37720C30658
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 09:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbC8eskPoxKJ+eN2Qq7W2GaCgbxx29oD7K2szf1j0QE=; b=2B9Q1zr8VVDriqzD5pt6dNqY3k
	8dyvDNFDBZWoheMam7AqDvjd8XRHG5mmW5+fuEZviDz9COLKBk3BELpHJ2JFlafZJuuulF8t42i0R
	TT/YUIDTBnZRpMOPkktVfklBeDYEUap3pwAH0kZWptIhCegdrlGRxPaROqsmFYXcDcdSkhSq/2Bfc
	baEsRmOwVOK7sIuxNCxG05KHfXBWG2I4d+wqmyLkSUg7RvYKcHkT7XEG3dEconUDX6LhRXCZQotQE
	Y7EjrFkuu0shKLHp7IlDwHlExIcRVO0PIAGTXq40MDWaCWIKtR3DijkSxxyyCRv7U+0vyYyhG7JSN
	tdvPya0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFo-0000000GB2O-3Pd2;
	Sat, 29 Jun 2024 09:20:20 +0000
Received: from smtp-14.smtpout.orange.fr ([80.12.242.14] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNUFG-0000000GAmV-2KTN
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jun 2024 09:19:49 +0000
Received: from fedora.home ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id NUF6sgiHDa7etNUFFs5cqZ; Sat, 29 Jun 2024 11:19:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719652785;
	bh=SbC8eskPoxKJ+eN2Qq7W2GaCgbxx29oD7K2szf1j0QE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GLm2aW9jAdL1vITOmoKJ22fGy+4A6bXXIupEbaVhXFBjWbK4tAcN7p6wrh9akuhCi
	 9DIgF6Sgqyauc36H8w9LgJ3GDogS4OEERhmEcl6Bj9ASurrX+/k0Y+ZKl8xWSmXVB4
	 dMI678AoM5hbZYzDdRewj11b8KefFRB5pCdE0cI8KUmt++9xIN1XHYdpPdoY6uTVJH
	 tCGxCg6XRMKq6KoO1Wtw+H2uuPax70nAM/klCzp2ru/6xNMiIStjHNvJlbaURU7gd2
	 oE9Kt1a+VQlPW/1VBalZD1kANRAfeafe7iFBxr9hR3hEFQuO73Zx2A2C0XiJGBiRYH
	 Nk80KScPP8b9A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 29 Jun 2024 11:19:45 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	fparent@baylibre.com,
	fchiby@baylibre.com,
	s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 4/4] soc: mediatek: pwrap: Simplify some error messages
Date: Sat, 29 Jun 2024 11:19:33 +0200
Message-ID: <7e6f7dcded577091061e2bc3f86d6ec5f6c4be7d.1719652155.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_021946_840627_848C025D 
X-CRM114-Status: GOOD (  10.65  )
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

dev_err_probe() already display the error code in a human readable form,
there is no need to add it explicitly to the message.

While at it, remove some useless {}.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 6981d6a1ab93..c55f4061b8ef 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2533,18 +2533,14 @@ static int pwrap_probe(struct platform_device *pdev)
 	}
 
 	clk = devm_clk_get_optional_enabled(wrp->dev, "sys");
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		return dev_err_probe(wrp->dev, PTR_ERR(clk),
-				     "failed to get clock: %pe\n",
-				     clk);
-	}
+				     "failed to get sys clock\n");
 
 	clk = devm_clk_get_optional_enabled(wrp->dev, "tmr");
-	if (IS_ERR(clk)) {
+	if (IS_ERR(clk))
 		return dev_err_probe(wrp->dev, PTR_ERR(clk),
-				     "failed to get clock: %pe\n",
-				     clk);
-	}
+				     "failed to get tmr clock\n");
 
 	/* Enable internal dynamic clock */
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_DCM)) {
-- 
2.45.2


