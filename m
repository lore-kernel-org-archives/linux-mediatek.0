Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85E0FC5907
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rNr9GUXcZ2JMX/g86l+sUCt0HEQieC19OqXNz4Aux8Q=; b=ozRoPBE7AL83VAwg23XXEfGC48
	ZoFvtSZrGm6ozF7sDKFE1GztR+jXuw71xkW1YAJ+sgczrzaHcHE6xdM130XAylgtuOTBu0wxruOwN
	8+Ux2LFhjB71mGP0s6WXUGnVtwcz39CgXCvr9+w5uOBMdveSOjOhU6XYGD04ndLXfl2hVI/zd+WdC
	5YEqwGU9t1AdZWpoeFpcfg/n60Es8zlPFHvXSimVN8JgVc36QUoq69M0W9O/8DX8yaBZRuMHa0RkP
	V0sicoE1JiADQOrcwe1asAvU1DkZXJgUjW1DsznRQltHKLfZWXUPYTNGQb1Vt1KUGNY006T+Hx2kD
	ga9xcxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5N-00000005b4t-2ZLQ;
	Thu, 26 Feb 2026 07:47:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5J-00000005b2X-3Kyl
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:46:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2adae92249eso6027215ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092017; x=1772696817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNr9GUXcZ2JMX/g86l+sUCt0HEQieC19OqXNz4Aux8Q=;
        b=S1AJCXDm8Zx+s46iRs0jfqyL6hs1lCMnrkLsVic3FdjpY4O5l6Ha4BnYAKE69ElsZQ
         gQJ9g/SLFaVZxwP4ikDY2tfXT4aU9OXzcbxc8Uxt/y18CSzp9V7C82wzggD1yJiaw6gx
         phS+pzsR0n7wo4VVTMwo2XGXPrKS8+Tfg0pUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092017; x=1772696817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNr9GUXcZ2JMX/g86l+sUCt0HEQieC19OqXNz4Aux8Q=;
        b=Eqdx1dwnePWJ94WSJ5gpAAwN+eGVqF5btBnh24EpKELg+Gwt2/37ROQLzcSGNd0xPt
         RbN8HO0q0eQwQG8WVf1C4B+GAzb0LBqF+mytYid/TaOSzY2H09P1R1Rzh0lPNck1o8Qu
         ym0YUgnP4kJrmXDfVF7aGJc/RLpQSL9dTrA/nI1Uj41NEHmObvit0LZ+N6MuKpW6eEYO
         TeoF6nDhjoBKXGVo208OMJBverX1Af2Eg3yxVAJQVOfidCMGqAaYNRv9oww6JbCdpHKh
         COV2yDHJurgC7A+5klpGx7gKnezM05MDL1IK5EwY9/SDeVVbrJlsYq9IJj5aFa89hArD
         EbiA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDNRKuCB95MyMOh3eVAxQEyzS+7kNe5O5PZtiHHGE0jvKOWWl6NJeD7grVpZw7IBxX5k2pYkBkXbM4xZp3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxzqTeO3DUFvS24W1Ni9pIR0Tm+c94F9+pFD5SZz8CVFcRbjR1
	kI97++ph0rM0gQH5cnAfBZztVa9FOlLE2UOG+CmT8Y78zYIVdQjNvZCOhN2ItBmNFw==
X-Gm-Gg: ATEYQzy/IIftLyZalDZ0GlZ0fa+U9oS+0eHqpD2cd0KRu4dLlRvXAGET4Ruz9tFrrG5
	72y/GrZnOKLYc1m61jvhcXduILf/K5YPFWEG/+PHYyWQDTT7PCCClWofpENrFQoZ9u8ab2sNMzZ
	Y3antocs/SWzdWlqVmZMhj9eXhjqscmGF4qOhzyHkq24cDoy0NPI2tt/8c2UamiCsUK01oOPnoD
	qFlcWJz374LPObDj4R92zjSPZyO229Bo3Fyz8US9RcXYC92kNHw/7Dy/ek+YAtmjYOe13x15ZNV
	mfLYMTIiD+f6M3l4j5bJ/wZqGrc66F/DSGp4uU2oEOF8u9JLKkVP06djHnArUrjf9s5ftg4Cbml
	x2E+FmqSUMhKASYc8qwg5Ya8kx/5VKFOp0lAqyypO0kTkiJe0KJFGDBxwF8RtUC1bS01BZzFsmv
	CatSM1sn1Z87tdpmKCAjlzs5EjikIDIduKE6sXTjeKg11xRwSx3DdVbJNy/wW8duUtBPK2kzYTV
	r3Bxwl59ntLRfIBNJk=
X-Received: by 2002:a17:903:1a8f:b0:2aa:e0d3:cad7 with SMTP id d9443c01a7336-2ad744dfa4cmr164499035ad.27.1772092016979;
        Wed, 25 Feb 2026 23:46:56 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:46:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 2/7] PCI: mediatek-gen3: Add error path for probe and resume driver callbacks
Date: Thu, 26 Feb 2026 15:45:18 +0800
Message-ID: <20260226074524.3808081-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234658_913143_0AA7983D 
X-CRM114-Status: GOOD (  13.58  )
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

The probe and resume callbacks currently do teardown in the conditional
block directly. This is going to get ugly when the pwrctrl calls are
added.

Move the teardown to proper error cleanup paths.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 22 ++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1939cac995b5..f2bf4afbdc2f 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1189,13 +1189,15 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
-	if (err) {
-		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_teardown_irq_and_power_down;
 
 	return 0;
+
+err_teardown_irq_and_power_down:
+	mtk_pcie_irq_teardown(pcie);
+	mtk_pcie_power_down(pcie);
+	return err;
 }
 
 static void mtk_pcie_remove(struct platform_device *pdev)
@@ -1301,14 +1303,16 @@ static int mtk_pcie_resume_noirq(struct device *dev)
 		return err;
 
 	err = mtk_pcie_startup_port(pcie);
-	if (err) {
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down;
 
 	mtk_pcie_irq_restore(pcie);
 
 	return 0;
+
+err_power_down:
+	mtk_pcie_power_down(pcie);
+	return err;
 }
 
 static const struct dev_pm_ops mtk_pcie_pm_ops = {
-- 
2.53.0.414.gf7e9f6c205-goog


