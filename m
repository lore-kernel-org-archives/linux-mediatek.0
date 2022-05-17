Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4E8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ugQaIsoZ62cIhYyVjkMKvtZrWoV4EfwJ+fh4B49IU1Q=; b=Yt1Jj67gwpU1Xj
	6HtSOl2hneGsf3HbYzwr1x46jL3PwXKE6BfVrWEl3pCxIhC3mQi+ii6J1gewc5J1Yiu8Q1wEQtHAP
	byqPXVye0PIQ+wq67mHyEZXbp6Qui9zm4cvy/wGBhrxBWLrz2iZh6GdudEiWKEi03erortiAJTfmD
	dWeH1BdMrNgGwV0PoBT3UxaDgcciWtrvn8tR0YN5pdTrI1x4ovVhvl6mN21eVHaJ+b2MYQ0oJMF5X
	njDiZyf9+Fyw1hNqgu+M1jsayZm+Of6i3Xuj4+KB+uAno0awGoS5oSIXjeAQkThbZvD37zBgOEz9y
	oJ/C7jNp9NoVCcBXXR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquju-00DCH2-2w; Tue, 17 May 2022 10:47:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqujZ-00DC1j-Iw; Tue, 17 May 2022 10:47:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C356A1F444DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652784438;
 bh=XIylkIK4PGwTTMIF1DF6M1KJhRjnCtJV23RUsB9sGe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fNDKewcNVnlMJXfMAXIDUTzdjtfgDZBTy1ecBqv+MLPt6nCVtdFY9eKv/hfybU11M
 VmTkfp8wzKINjjEYFwCqL09R5oTgOh/u+KSTUxDtcKoHVNR1NCZMIHzO5ayPKotLbq
 Qi3byLgvPZe/+sgmE4fpuH/dayB3okZ4GUpVIfRc03biykNaOd5GjhXBzDk/sBExi2
 GU/AmsCdM7rxjoS9U01NWysuhIqOtKF4JWAJpY5ZUCgYw22dza6VhLGznnxEsjKGKR
 m2FCAQ+WtGG/OA92dEQei/n94L6y33jDx02Vu+MmJqZSlOZUWkjrW6L3sfeKjgvtlZ
 RSMjxfyxboNiQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 3/5] soc: mediatek: pwrap: Check return value of
 platform_get_irq()
Date: Tue, 17 May 2022 12:47:10 +0200
Message-Id: <20220517104712.24579-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
References: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_034721_878366_BF21C8DE 
X-CRM114-Status: GOOD (  11.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Check for the return value of platform_get_irq(): if no interrupt
is specified, it wouldn't make sense to call devm_request_irq().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 852514366f1f..04b51d21a5b0 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2317,6 +2317,11 @@ static int pwrap_probe(struct platform_device *pdev)
 		pwrap_writel(wrp, wrp->master->int1_en_all, PWRAP_INT1_EN);
 
 	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto err_out2;
+	}
+
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt,
 			       IRQF_TRIGGER_HIGH,
 			       "mt-pmic-pwrap", wrp);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
