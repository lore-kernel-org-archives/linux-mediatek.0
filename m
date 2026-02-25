Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA3F3C99C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=; b=yST0w3RvQuTieWeBbFIcz6eLzN
	lyJWbzqLIUfZPfGxkyWLeCFKE5gIMMI5S98cp50APqCOoxAn0Bz2v6mu4gv5wDFiwrhV5wQGp/8PR
	8F492Z6iQHQs2viEwcGuyf3egjbvN3kQs8oep9FnVfNoUSvwqfuxS6jL7LFWU8DZts0aYIvkkTQjV
	vTqf2dyUyDtNDsnWTUEXAvFcaXgPta+L8jOp30ZNdTi5hItJy63J8/w5r31I+b0u/4UKA0coKdTsV
	KwPm8ouMGhr+u4nOF1pmZYoQCJBx3TEjF2n5gsJI/0kYoAoA42g1szX1k4+iARieiKX4L2erCk5gs
	ZR45OJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EZ-00000003PP7-3dmk;
	Wed, 25 Feb 2026 07:22:59 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EV-00000003PKN-3Hc0
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ad21f437eeso4719365ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004175; x=1772608975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=;
        b=aJrUsPBmxEY7Q4d2rwTFrBL5DHh0pLIPwjB4YErt43YydPtrSmlZAnoG0IDc2G1gC8
         jJqqPaS8cK3JTQgkgj/VnmcgMDm3+mjrmXsRtsZhblXy1LRdsjV55xseQuHSKj+OCkgF
         XVqUn/AmLL0YAp1Hx8i25jKPi6V5jM48S8VQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004175; x=1772608975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B5DXCfdvJ1l3iaiyIVD67Vr2Fhjn3yvdCNDjCKNCXps=;
        b=DH/uFF/8qfqsJmXC5YOYQ5GHJM4Xj+OxeDWo87ajlLMrtGHsHBtkL5dphtBkV/FFF+
         Exw6DuC2ktN0ijmR1AXZek7UkRXt3L1w159L+jq6TtcyGkPSYcwJtsWKtP5dHSeKWBUH
         mj9W3rZxdA+GUSQMMdoe5NEEa7W5TCYEJe/32Xv+xrchQvHCQhN396PoDOLycPFp9PwB
         KRpvGrrogEtd3PLGSeF67FlKKYcOlgQLxbjQ7Xd8hgY+GNHpIQwY73EEZydT6+ETDG4t
         ydLVyy7rIheLtFDHDbAh3E7m2v7M9RhakKdd/H9RdnGqFUU2SzqR9asaqrx/RekJsJQz
         NFNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLB4vMV3enyw//bXq1WH8EpayyJ9XMuhK4yEUGP9Nhgivejbp4oMT25Mr3ouQZA7LLPut1Onq2WNKxRIxb0A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyorIgtP1OLvorn22o/PGfZMKVEu+Yte4F0077L2OFulRAL/CzJ
	4BTt8zXY7Igf0SNl8Uj/lhonxmjNJi1xTJLJRdB5d3T+u0BfAQPPiElEf/alnUS7xg==
X-Gm-Gg: ATEYQzw/Du7KxkZxaS8VPwGKTPMtRpiLIj0Ph/HZicHryYzOGQLb4vKsDWriLVC2Lpu
	uv1f3CqtJnBtqNviWoMl6iS638+6f2D1GNp8OFYpwTE0ZLK3UnKygnE2Oc21VR0UjMpr+TH+X9c
	400AFwJuJVSqawSGmyao6eXOCVOVStn4i/JsWLLkWIJEvKlZeZMiciD0GApvqFAye+c1TjKCkHj
	8ysaaR+zPOTaRo8YX6t67h2KXmllulOF5erSNd9HrmiWLX/62IwmS9Kp4ncAQFj3w41ZzBOsBYL
	/rOxWRRezw1ftdDAEeMCRE1bF0wvKLZvAx2nsdqyWzmgeU5VgsRtxLXyTHD4Pu4cojI8W+0nBIy
	+0SmysTRegIt78wee4Z4Au6aVxz0N2GamP3e49xgX3XY4UyTo4AvCliiOBBKnztUARTyUnjkuo3
	0jCNdox+qCeAU3JBKfJ3X8QJpthNm7/LEFnqPQd7ic/UOXSgom1/gW4m8C9mnd93SOqdqoqubBN
	T4aMqmgOLqvkXu7
X-Received: by 2002:a17:902:fc45:b0:2a9:5ac3:a925 with SMTP id d9443c01a7336-2adbdc3eae8mr23994555ad.3.1772004174956;
        Tue, 24 Feb 2026 23:22:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:54 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] PCI: mediatek-gen3: Add error path for probe and resume driver callbacks
Date: Wed, 25 Feb 2026 15:22:19 +0800
Message-ID: <20260225072225.3345307-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232255_974518_0892ADD6 
X-CRM114-Status: GOOD (  13.85  )
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


