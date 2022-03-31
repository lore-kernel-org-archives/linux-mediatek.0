Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA527C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/rw10HdSDFXlP6xaiwmN9deffYhGm0f1H4LeGNHRbo=; b=b3cxtQJQRMtIXV
	N7zD6BN7TRamDO+KArgyphxYavwNVHU2ARwen+Fvn4GseVY4Sfa21FpgTKS9sB0EBsAE86kkocLJd
	eO2nhMgVpYWX9SJefAdfvm0VHYWftuIoSEu/+m6+DqzQaKEJONdHa1YibrOoHbnpPXPGkrJe+AunG
	0FX/HTvrvdlJnLBrAlFhXRHSUn55/S/hmdb+C/+01nW896ovDFnpoS5G2KVjeh5BUC9oYWQa7cEwf
	FBXuOGnUSgFn+Sy59uMnRTkpSuh4DzdQJfNaf6xQ3I/voIDGIo1CKstdUYfoTyk3nlvKRYjEd/KMH
	fX+D5NigqAXahqdrOrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZpi1-001ATN-Sp; Thu, 31 Mar 2022 07:59:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZphL-001AGH-Ju; Thu, 31 Mar 2022 07:58:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 97F091F463B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648713504;
 bh=bsvmRE+wqqh9TXXo7ZPObERdtNVFfcdK+ZOSlKfJ9jA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DWvTCqTdDWtQTNrH0p+UCgHL6kqIII8WyL5J74ksghMi3DhwDIjPzYPqefDGgu2FJ
 0qqnYUossltngy97be+kWJ0DxR8q2ap5JLdB52rSJCBpL1zueIimVs9pa1U3u/ZNaw
 VshZl9F3blj/kCT0A88G+jeae2/fjPC305t+ap+bihc4SKIdvLUvXxt0GZ7Veb7RFQ
 Kh0rFMgZWEem0pvbBmQUz5wlmeAU93DQhX55aGzafYOhzwv2lU4vrWKoGwHm5kZNBV
 ClvzzhEV6pDUPVjS/Oc57KVjB+lt2jl0ixX55benTKVWKj3dOmPe2tJtihOebCjc3X
 cVApGRXjWs0tA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/3] soc: mediatek: pwrap: Move and check return value of
 platform_get_irq()
Date: Thu, 31 Mar 2022 09:58:17 +0200
Message-Id: <20220331075817.7122-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_005827_809066_377B7CFC 
X-CRM114-Status: GOOD (  14.71  )
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

Move the call to platform_get_irq() earlier in the probe function
and check for its return value: if no interrupt is specified, it
wouldn't make sense to try to call devm_request_irq() so, in that
case, we can simply return early.

Moving the platform_get_irq() call also makes it possible to use
one less goto, as clocks aren't required at that stage.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 852514366f1f..332cbcabc299 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2204,6 +2204,10 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (!wrp)
 		return -ENOMEM;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	platform_set_drvdata(pdev, wrp);
 
 	wrp->master = of_device_get_match_data(&pdev->dev);
@@ -2316,7 +2320,6 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_INT1_EN))
 		pwrap_writel(wrp, wrp->master->int1_en_all, PWRAP_INT1_EN);
 
-	irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(wrp->dev, irq, pwrap_interrupt,
 			       IRQF_TRIGGER_HIGH,
 			       "mt-pmic-pwrap", wrp);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
