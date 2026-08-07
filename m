Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CE5C5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 10:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=; b=Rjqw5/pyLb+JBvUjtaBqeGMaAa
	rUzFq8gYQZJl7gwOugYoqH8DfFzoV5AYiqu+WV7AsCdITDs4Ql57uiQwA/s/auHLUsV8NnkOu3HPt
	wMS3uMH4MSO6sDYqL924q0tZPhGUv3Q+sktRvSslYZKSfYpRbcYJ7LWoFpbliiRPcn+A55Yyw3AHm
	7jcfW3NShHGuuIrqDZe9SX8zfJL1aYuyHff3BxENJH2o1WAGDnJjhYJ9x1HDZqhCSUj2tv/0XzpXE
	+Zmwr5EjpD/s9vO3kF8NnTwm7GCAyGsM/javnJN/Gibf9QhbEkudW0CPkr2ANLkpp5GeZwua/KeGk
	Xdeg9ThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpr-00000007ft7-16dQ;
	Fri, 07 Aug 2026 10:29:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHpo-00000007frj-3H4Y
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 10:29:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3393409a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786098592; x=1786703392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=;
        b=BPXe8N4lVobLvSZ7W3j/PA0C1DBPgu9uvBtWmJUnVrNg3AdYVb2EUCiL2jt9fGvFZq
         hH81AfVr9Nsk1sRC7hqeheBi4N+ZBZLryOuX8+VnVFXadyAltJyeXFtJEW95m4tQrxOd
         O6gqui/k33sH81ozQQPd6f8Pm4AW/iTQMZXSFt6k+5blYcOYw9BZruE9v5b2tdOI7xBL
         35sTjGtw0TytMFAM0eQyQRlePY5PjBG+8yt+HWY/7qGMtm9tKri0hUGja9um+Ib4nteS
         0yZY3UPA1szfbQd28QeR/0gQhBzVfFbJDKmVmzmm4TlYOFLFIu77o/70uX01r9Ti+28n
         1TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786098592; x=1786703392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZTcrQzGXuunNIwct3+GtblbyDkGvD9ZQvC5QSvDxeM=;
        b=VIAWaa358K/1btf2NQv0R/Tr7Ucj3cLPCcBDai5gmy4tZLjZ1NiA1j1+jzd0R0qxaR
         qFigQ1xZWq33jgbPGnE0vnQ8Qs9xi/q8Rw/WSzUZ2eZOHsKhxDomJ2KmeMBlEhS3RUeM
         DlEz++J1N5dIeID1MfOpsuHlkSuj7LbmfKu8mPGrliUtgSbUAAvKGVc1Q90KH88jsRac
         KXhGKqivppq2CSHTV983Z+TwbAkNgN6mGjOiEuJemTIOuDVk+d5THorT/mICtp+RWmGL
         EVRGajRxL4yrVBCLrfbPoUpam3j5I9cKI2rHz08Oy8Vq9knNzoqgKG4M1v2iKTkK5YDQ
         JwxA==
X-Forwarded-Encrypted: i=1; AHgh+RqvHZUeNNBFoND6cCaCp8Fgu/Cwu0Hzu/U4kXsEYsNBd2OVE7NO08u46WaY6Y2xsSbyCJUfusif72MSpbpEkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxliZztQuIe3HJ7Y7evR5Pojs5MxMraogyaGIWtFkQvvqTgZpyG
	sp41ABjEuCChWbXuYfYFvdDEIlg3WA2aj1QMFDwZVIR1rLIPCduKt77/Uqdb+g==
X-Gm-Gg: AR+sD10qJPMxBPL7ELTfrt2wN8vQf1BrDeMbfx37GQf26BwllPB4GYwMM/YsDjR41fb
	cz03on4Yiw2LAKOps2kFG6PyjpCpknf+/6Qvc+ldzvuDLfmKtsXQa8MxQybQAj10IFiNIojmISs
	tloIlYX9Hm5X7fJ0ZlFf+R8M7UBJeY9xU14c4heIDzhskRORv7FyzwFHRguMQVG126e+l4qZLVp
	KBwEMP6ymrjqVo+GgehlW2yUwFoaW8ceEFnU5Lpm3gKLFnK7F5Xc00X9ZVig8D986PKdbDDPUhS
	nd1bFVJfzUCppf1eqd72Zx2igF2d70+srOImai1RJ/MSfV6YR3bvsGzKRpKBKdO+/Lb3yJ6UA5p
	GsfVNEo0FqMSwqMvDlEWYmxVnlplyJfVfJNwBNegr2LjSYFrcgtygSNrhaM01iGafF1H0F8DW0p
	S592Aj3D+kxvmvhfclEDxYmKcc+EEuw3an7CkJLsy7xISbsustBh6fC1nZSxw5Q0c1zfhC+XVrf
	mknzsXDXp7GSNVy64HQgKio5ihdD9/iW4h9bG/dMXq6MIKwJBkRIfH2Rzc/DCvyFeI7a7VeY/pK
	n6bT
X-Received: by 2002:a17:90b:1d10:b0:390:b41a:b92f with SMTP id 98e67ed59e1d1-390b41acf77mr3051923a91.18.1786098591764;
        Fri, 07 Aug 2026 03:29:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b1389e1fsm1133614a91.0.2026.08.07.03.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 03:29:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] spi: mtk-nor: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 17:29:30 +0700
Message-ID: <20260807102932.45785-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_032952_835541_605A9691 
X-CRM114-Status: GOOD (  11.04  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 74f34537b02c..6b9a5d728549 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -895,6 +895,10 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	irq = platform_get_irq_optional(pdev, 0);
 
 	if (irq < 0) {
+		if (irq != -ENXIO) {
+			ret = irq;
+			goto err_disable_clk;
+		}
 		dev_warn(sp->dev, "IRQ not available.");
 	} else {
 		ret = devm_request_irq(sp->dev, irq, mtk_nor_irq_handler, 0,
@@ -928,6 +932,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
+err_disable_clk:
 	mtk_nor_disable_clk(sp);
 
 	return ret;
-- 
2.43.0


