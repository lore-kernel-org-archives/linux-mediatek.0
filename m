Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ED1F532D4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O74W4ZMgDpT3MGQ+8wcjX/PqoiKfeKCvLKILcQ8L8Jc=; b=hTbt7ARV35UJd+Dwt2i4rcYPfP
	XEcDuwj8aE6L5MzPYq8/ZmT90EGWphmbg+enzR0+GbHYGjb27o7/4nkL9qYQ/zUcu1yUklL75LnUy
	brnApMseJQn0lfHcZRwdtUKoskveDcTqHYXdbrSw9BwoxlW8+98/FpwU8mg6xjJw93yVdJ1ThJCWc
	i8eTAOp7oevWlZjnD9W7FUnGLiS7qHlonRYOIk3ccG6flhL0nMisFWFeltnRbh9C9/Vuwf4pPpHbG
	lSWTDFf3O7Ml+aVESAiUhVkdI5IpZYwgx3XwdrfV1if38J0BtcEzpZDMNl6mV5CD3pIi4Ivr6uY/+
	swTE1DEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBi-00000000ZuS-1IqH;
	Tue, 24 Mar 2026 05:20:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBf-00000000ZtL-1LKY
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so541390a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329618; x=1774934418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O74W4ZMgDpT3MGQ+8wcjX/PqoiKfeKCvLKILcQ8L8Jc=;
        b=eWQwhZ2U+1TrWLw9cP/TxTe1ItJmfv2Yw8Q5OiXNxko+QyFUA0zCrJC7X/MaKCkH5Z
         vzy3YRcPSu8oBxzo9TixSguJjWlKYOSj6ZqWMcguiEWweN/FMTbaHRBTSRwFGS40IKfS
         0FMi/3io9xvpPQuJ6fuZNIGoHXB2asU2CnNh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329618; x=1774934418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O74W4ZMgDpT3MGQ+8wcjX/PqoiKfeKCvLKILcQ8L8Jc=;
        b=r0W+whZd41aDyPRjY9sMelrZOEnVxlatBI2/29Utg3vcOlLNO+TgRi/uhpxv4ozYvl
         b8iUtrIJNSbyL2B96wPbdfVCoewBwrRlPF17eHWrPTS5w7wGaEAebngJDd4uoH+iDp13
         9A0hNnNpCFhQJvsESZ9Vk8WSIhvKp2xsUK6v3e2TqZdfeffK/tQv6pp1BNLQjEAybSeg
         JlH8hulzqXmsLqBWeJEaOai2ci/Xs87kv7C5NzLiq4mV0iI1Jpw3VstJTQIy6ee7xeED
         MqP89f20dNmfYNgMd+QVFiBY4Q/5bD1j0PFyr5vSE1hEDhvI3FcYTq2PyBIXdhhcQIpM
         FfMw==
X-Forwarded-Encrypted: i=1; AJvYcCX2IqlUZp7V9DJDb1xoE1lnd3JlkeNJRqMHbZxHRwkIDBp8m2hqW/X0PL5dPqLMVFp94eiotjN50A08zNHnDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf+hTnQ23A4nEYi1REsk+il1cLhXIh2Io3XMDE/ENkasp/p+mI
	yLaCN1Npp8vzm2jAmPT+OOxMUiU8T5VERA00cN2TqIe/wMRJl6awhUl8OEqeAa86Sw==
X-Gm-Gg: ATEYQzzTc5tRMpfNc9zHK+8ZFicbW9Z0gk9btXyjCSo0Ylu+shoD89iZWz0nN66sirU
	+20Pf21LayUws2c21m830VYd5Lal3md8CPZzij2+ptbdNbOB/UukvqT2CDlNlGsIF9qq9AfyOa3
	qyCoAzsSJUNlnTzbHgO2yWOTKaF9qq+CvivSU91qtsig03wtjC2WIMoL9QZ84GSjDOme0KPazAl
	R4n3cGxPjojMQ3BEZRgiyV4FIQmGni3YaGz39zj+veVUjRif2ZlVoW/P8BHw7s4wjdj0RpGV+sn
	xf+DTBfO98RzGwYSp7rPiqGByfx3pLPHN+rV+7JE6VKxTM/aOqZ48i+J/BeyBXTYMN9m2kZVcUH
	qu065wGkEXgRQ1i+Hr5EdoZ9jyms5PKbO9w5C0zJvPoUFbXoD61MCG8VwVg7gvqohdW69ADgyV4
	0RPKAKD9oGGIIpuLskEqOl2EicouqGxtCF4V1PtIs8iG0j4Ihv6c0SBzQIhQ5+5Z+/Ew360ErBA
	sqJt9hs
X-Received: by 2002:a17:90b:4c8e:b0:34c:fe57:2793 with SMTP id 98e67ed59e1d1-35bd2cec778mr11788613a91.20.1774329618496;
        Mon, 23 Mar 2026 22:20:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:18 -0700 (PDT)
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
	Bjorn Helgaas <helgaas@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 2/7] PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
Date: Tue, 24 Mar 2026 13:19:54 +0800
Message-ID: <20260324052002.4072430-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222019_368381_F8680D33 
X-CRM114-Status: GOOD (  14.34  )
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

mtk_pcie_setup_irq() just sets up the IRQ domains for PCI INTx and MSI,
and chains them to the controller's interrupt. It's not really related
to the setup of the actual PCIe controller.

Move the mtk_pcie_setup_irq() call out of and before mtk_pcie_setup(),
and add a proper error message for when it fails. Reorder
mtk_pcie_irq_teardown() in the remove callback to follow. Also create
an error path in the probe function.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1939cac995b5..04ae195d36c2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1152,10 +1152,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		goto err_setup;
 
-	err = mtk_pcie_setup_irq(pcie);
-	if (err)
-		goto err_setup;
-
 	return 0;
 
 err_setup:
@@ -1181,21 +1177,28 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = mtk_pcie_setup_irq(pcie);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_tear_down_irq;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
-	if (err) {
-		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down_pcie;
 
 	return 0;
+
+err_power_down_pcie:
+	mtk_pcie_power_down(pcie);
+err_tear_down_irq:
+	mtk_pcie_irq_teardown(pcie);
+	return err;
 }
 
 static void mtk_pcie_remove(struct platform_device *pdev)
@@ -1208,8 +1211,8 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
-	mtk_pcie_irq_teardown(pcie);
 	mtk_pcie_power_down(pcie);
+	mtk_pcie_irq_teardown(pcie);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.983.g0bb29b3bc5-goog


