Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EC7F532D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcsyifPwpw7PalUEgFntf8CIjQvjzcA0RCRU1Yc2FT4=; b=i/FchMQhgc+ulLIteHeoJGh8+f
	lGZePFRo8yxVg7q8MWiFRgKki3ZQ03yBaH8GEHsxOef+ze+D/1kr8xaVot2p4vIeXFKX1P15gAZgh
	kF+I0tX6d+PdcMAzZdSvK7adIYwKgdD4jdyFnF+2dcuL8Im2+1kZhF3RumaBytKvcFDmNcOwV+rRB
	Ug0C8D07CiJhnzMpMQ4UR0PCRG93pCWoVa8UczmMjViYFr9uPeEczCEBl2sj9ZHqspGwk6B39zDWM
	nQvoEJ63R8EUP33Mv6SlkNyrpwuQmMBi1/PZgKFbBQqVim05DnPUhJVG5b8ilR8u7Lip4Nnm0mtDU
	nAEzodYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBo-00000000Zx2-3aMi;
	Tue, 24 Mar 2026 05:20:28 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBm-00000000ZwC-1Q7v
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:27 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2725699a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329625; x=1774934425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcsyifPwpw7PalUEgFntf8CIjQvjzcA0RCRU1Yc2FT4=;
        b=R9JQ+uIW1j1xvkRV7h0qHHarIin0X53dHPSPOcrX2zIYLAJuRAIXOL28+cehJd3zWb
         CGLC/ONbunjBACHozunJL8sxb3XgKrF9ZCQYUYTQuliTGeyUNqosvzwiwqq89V14F6uu
         6BaO7h7V4cmIgne8Uuy63ZFv+XS2XG/IlmWHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329625; x=1774934425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcsyifPwpw7PalUEgFntf8CIjQvjzcA0RCRU1Yc2FT4=;
        b=i0ohctePQgzcK/H//KMcmU9v3ix7nvHuFwr764q/Ykom3+qm5A7UKX7rHACd847G4p
         ASO3/gykIo4i728utVl6dX3qhOL6xMwogddA+YwL81o5dnFA1LzjSZ8kRkPnYGV2CtQ9
         uwSdnvrtEIrw+lddfr4yqIqCZn3UP7URwai0eHiy2RL71IGZc7VgORvCcDcezfYPjJV7
         NHzDs9OBHxfbClx+GArYyHce2ru8Q4Jy1rzZxydazKF/daKlEIs5XvXMvTHKGQetN0c6
         sGWqWOgIGao5qr/UxV4gwxq1XVYTB/xeQH3D2QGgeMmWT28llrIxpVZLqksM5Aar5V6N
         gL2g==
X-Forwarded-Encrypted: i=1; AJvYcCUtum5ujGNVdaFtRqI+6U4/r0VAzQBLQl5bk6B/u35K949alORGJEahcijn65tRUTnHATiO7Kdjvh5+teSEaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5FlbS7vW4Ap6MSOq+l4eY++FzzE+B9tUYs35nXqYCyNYZpoKZ
	rHWPgt0c0e3B5zuFVY/vReeoB/Tq7UFjpWQoM8iYK+321cs1nNHhheq9cWlKvVV/zg==
X-Gm-Gg: ATEYQzy85Rid4XbY+SBaM1hnoK0J5O1pRSWWjs2Yp1ozNSYO4hgRWtCwr4qKaoAbKDX
	K2QGacONqr08aUbI28UOrldL/6cPdVwqFvGsrQbyyRUakMb81P3ZeSXKRPGsfAObTKggB7pX6cD
	SFYuSm7lIrGKY190gEQoF8Xue74MS1rffBI09buxTqhXLoePuoL+NVw0ISP+Q4oLSFuzgsdUbsq
	F4qDs7j5hyRNK/qmjZzMAk1DuCY/cBo4qU1yrLDc6+XscAHfjZoFWUVCHzqTXhBZlabugGwKwX5
	S5fNGBRg3aeg+u9s8VZTgdVEMtVO0FicQHueko5wlb4blmt6UJ7jpmJoKzfnag5V+2oFEhfhh1X
	6cvM22j6+vcYkPDyQQDt1/U5OwPO7vrCNzen/9Ou2xZC1pExJiNBPlk2ERJP0kWwVuWruykbPzF
	JZmZ8kOu85ZFH3WwozO8JBnyPXj+Pj1jn3OJVKqLFGv2c71sxFPKZhuwgWSNSTU4ghw+lJJ651h
	XstRTjAvHeg3UqCZJ0=
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr12662239a91.12.1774329625440;
        Mon, 23 Mar 2026 22:20:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:24 -0700 (PDT)
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
Subject: [PATCH v6 4/7] PCI: mediatek-gen3: Add error path for resume driver callbacks
Date: Tue, 24 Mar 2026 13:19:56 +0800
Message-ID: <20260324052002.4072430-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222026_505864_E3635399 
X-CRM114-Status: GOOD (  13.30  )
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

The resume callback currently does teardown in the conditional block
directly. This is going to get ugly when the pwrctrl calls are added.

Move the teardown to a proper error cleanup path.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1b6290f2c360..22a16e4ebc76 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1304,14 +1304,16 @@ static int mtk_pcie_resume_noirq(struct device *dev)
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
2.53.0.983.g0bb29b3bc5-goog


