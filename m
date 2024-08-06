Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2DBC52D6F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LUy6mtPdj2DuYs9x688gR5X6TBdY76K1VdtXWohu5IE=; b=k/+Z5+DzYlvH+bqQZUuTzAxbP5
	GDyCvS5C6WOis05jtIYaiJKND+w9Nxq9I4bOM4VFIjCjV4+thksUotNTm9N6yRbZC/toIUYDGvcqw
	FV80wx3gvjNJOvXvyMiBIjQf0Zeix/4nEt429kfGtkW6hUXhvBpn7AMDHoDIZmuLYTeuPWX6uqHoS
	FzGMGPNXjgsADDoTudWhhQWnj8JN/MZIH1/EBrXGGBk5D/o7GS/NtlXLxAzmnTneBTxmqkvnoO3Y7
	BdibwuunS8tXk/bTJb8TMhh9CBbDcRqvxfjwBg5GDLpxQh23IxS1LRo+3Y3A/pu7wnjuXlLcnqJ4C
	9FkwstUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGlO-000000018Up-3nBE;
	Tue, 06 Aug 2024 09:45:54 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGlK-000000018Tw-2t4P;
	Tue, 06 Aug 2024 09:45:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1722937543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZctF7vNs94TXVz4Rm9jy4hDUQ6a9qtayt2LgYT34yiS/1s7P+6KtR+88tM6MR8Q6uOUMFrwBMXGdmMtff5tCKlFihNZEkdkzxMHH3LnLQ2j1SPvk64azZCpppCE2xlfEhWPj97fEnBRI9xH6kRVf8qJa1hVCZxJW+/eWOtD05W0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1722937543; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LUy6mtPdj2DuYs9x688gR5X6TBdY76K1VdtXWohu5IE=; 
	b=fCIMPjgS6J2yLdEv2js4Od7DDY+d8uBVAtqhGq6Jr9dvmffbLIsmiDHOZllRT6utXbfyt3IiA7WuR4IW+XFmvDyLPYB+TyeBNrd+19unKP9E5wTRsG1aq+nFceIsb28/pVCOoFqOtu76QJle3RmQUjWnka7y+xB+V3PqMcpDxBI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=angelogioacchino.delregno@collabora.com;
	dmarc=pass header.from=<angelogioacchino.delregno@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1722937543;
	s=zohomail; d=collabora.com;
	i=angelogioacchino.delregno@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LUy6mtPdj2DuYs9x688gR5X6TBdY76K1VdtXWohu5IE=;
	b=Scpag60OL0XahnB2muQd3E/rU96vhvtYY1iR7o9njCbXKIA9hINwanTBHwjfN33o
	r64sS4zlRrzUXRy1JZx3PtHFetxql1+snioKSKj6gXx0VwwqqO33Imk8KEdh8oasREf
	lvyx6t3uDOyBFwmuFRR1MzlnU/cTcZBCVNadzGVM=
Received: by mx.zohomail.com with SMTPS id 1722937543110540.4230663378206;
	Tue, 6 Aug 2024 02:45:43 -0700 (PDT)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: qii.wang@mediatek.com
Cc: andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] i2c: mt65xx: Avoid double initialization of restart_flag in isr
Date: Tue,  6 Aug 2024 11:45:37 +0200
Message-ID: <20240806094537.90747-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_024550_810443_06F02940 
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

In the mtk_i2c_irq() handler, variable restart_flag is initialized
to zero and then reassigned with I2C_RS_TRANSFER if and only if
auto_restart is enabled.

Avoid a double initialization of this variable by transferring the
auto_restart check to the restart_flag declaration.

This commit brings no functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a8b5719c3372..e0ba653dec2d 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1306,12 +1306,9 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 static irqreturn_t mtk_i2c_irq(int irqno, void *dev_id)
 {
 	struct mtk_i2c *i2c = dev_id;
-	u16 restart_flag = 0;
+	u16 restart_flag = i2c->auto_restart ? I2C_RS_TRANSFER : 0;
 	u16 intr_stat;
 
-	if (i2c->auto_restart)
-		restart_flag = I2C_RS_TRANSFER;
-
 	intr_stat = mtk_i2c_readw(i2c, OFFSET_INTR_STAT);
 	mtk_i2c_writew(i2c, intr_stat, OFFSET_INTR_STAT);
 
-- 
2.45.2


