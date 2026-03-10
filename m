Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9998F3C27D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=; b=bF7j3biCPIXZmAp4CrBTeCGthg
	EyuXiq4AWfcPjMqUrT3VL48Swg8fai4uVYG5XJUCWY7WYgdcKSeNVG0NiEB6BD5JmQvdrAptQ5Wad
	hwzUJ2+tgYNdgPIdSJHyG9JgUulPoz0A+uPxtheTVe112D1mzO6vJ4RSUI2aEC8XaBLrODsmfV1qs
	MWYidlNV842l7YW5xbhLADGFB+Z3UoCCrLvGp6lT5kfsiwiCz+H1R9EbjA+LYY3yr8vYzqhj+QW8q
	uKfzUVPpvhNdMR33pofLaxNFx6WjLQmAH8XhgCNtU9s2Dz0+Z0QnvlxR1gXS5Yh2d0yqdZQhRZmZS
	wiSyHdoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG6-000000094TE-3yMo;
	Tue, 10 Mar 2026 09:20:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG4-000000094Rc-3pQ4
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:10 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-829a27414a3so2206508b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134408; x=1773739208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=;
        b=Slex/4UEhFtvrtDh0fxFmnj4ivhcFcncJjodJ/wx01t3FsO8i+sStMzAlQY7BH32kn
         xoY2c4VbFgvQ2Y4rFYMuTtVoMKfe1liDuPJyCj9gOubJOuQyHJT9uD4bnFT1vaSLvrgZ
         50qYRElxgkaPawRNsCBPSqhVqIl794/sIZuTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134408; x=1773739208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NLaqL6RDjLUDRC9IFh+xvK4vJysRmVxopr+1H3G1aWA=;
        b=vUphNjJbsGryp1RbbqPPYbMC+IaNTLD0Dqs9Yui8LrDCcarf0N0asn8M3ldjF0onXM
         LfWzc+Gu36Nn4ntV8HbEiq/Y5etCCpFP4c2l0vWWGw4jDwC+bhSDSwwUS5TYgUoEIXl8
         af4hGVLIRV/hPjnLasY070eq+IU7h2dt5pqs0LJJyajDfZ1ZhpvESogSDkL23O3HBRkK
         KrrB9f0zCnhMxA0MzY5/ZR2Ias9cSl2A0/Kqv3/Jvw3CwPFY2tkED5jO/+5Q2YPyRjHP
         NAVBjdcsu4knhN+vb4uc6S5uc9j7pXIX1PmgUmM/LJhJpo5eC+THD7a8sHqpzLHggTG5
         1YNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQbwKoV3BldU5L4s9uoMO0qJH7pmNDndbW4eTCyRdoeqimsSVDLKe11X0peQHEadV7v8IYtEE8yvCW+VZX7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yycwi2vbct9QECCT5rpFEE97k9RdfpyQYpvaSUqV+LMrlQsFnoI
	Tqk+fUWcx58BfCdle1ovZrHoznBkqgr6vtg0nhsY0yTiBZdosISpqUBl16bUR0EFCA==
X-Gm-Gg: ATEYQzxigWl8uxEqft9X/NWdmu/weGGpA35CGqAbAunZseDG9870GQ3bpnB7JTF4Cbj
	qGht/wrbLkInVAAEWm9Ecq6Rcq8wFmRtVpBT7h/VHd/p16lnuTAcmIqu4sWPZDpNMwhoX+z3oK7
	yF8njzSVsuZNunEODmIE+cECWfYR/T0puZMxVv/I2AwC7cVhHLz/aQVLp1XmHQP4TQAy1GE1LUa
	ZediSaiOaxjVE8NE4VAMPefooZjBoCkKREWRX5Xbr5EA6SdZmGTN+f42M+xpmeQOJc59HN+9TE4
	xV8BEiHrwvyFxgK2y8Be+UMmewVsjba/E1+YbIYqx6ecbfHyAM0wF5Cy1ODLDFr/eWwJPCMFv6R
	WFuF+qLo+FraD8gJk1kJbn6ENBjstlFbR7YD+OnL59OMA5wqkz5XOZQtJp7oF7f1a7uJAtGKIXG
	dIjKkZ8GYvVvMaqCeC3Rm8o136IjrXkZYpDH7yuOeWIOvL/HnSlcTAlQQ9brR64ql5P8sEW1AIp
	GZ1Qy4E/Dr/eX8P1yE=
X-Received: by 2002:a05:6a00:1301:b0:829:8942:2c96 with SMTP id d2e1a72fcca58-829a2de2aa3mr12505372b3a.18.1773134408064;
        Tue, 10 Mar 2026 02:20:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:07 -0700 (PDT)
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
Subject: [PATCH v4 4/7] PCI: mediatek-gen3: Add error path for resume driver callbacks
Date: Tue, 10 Mar 2026 17:19:43 +0800
Message-ID: <20260310091947.2742004-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022008_964329_8D0685FF 
X-CRM114-Status: GOOD (  13.97  )
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
Changes since v3:
- Dropped probe function error path; covered in previous patch
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
2.53.0.473.g4a7958ca14-goog


