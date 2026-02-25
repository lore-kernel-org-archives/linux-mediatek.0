Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E3F357DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=; b=MtEY53OxGCkR3Kt3oU+Xp3HaBc
	aPW87qX8OMvS90V/Dmk9vx1ZeNM/kZAOEs5YNq3JBGCfl3E2Zkb6+dITuYQuXuyyL1h3mFygL+Tvo
	GoPklXvqKlP4htIDeNcJ4oJTU4IdYlpTd/KTyZ/cgX1k7x6x7UVMS7ztsknzJDuACOD25Fpc7gIbI
	uxdcLFMzl0n0vGJEVSUX9S4SY1Ju7XmiXM0NSrfXlukMW6rt17YvgbGCvmB5TuScHf6Gcbve42rDX
	tYjbYh30m//Xy4fv2wTxC8Z1jMwSc+1TNczKqZb7KpUNEJVP49NrMRkpKQYG1Le/5IBe9EabndkHe
	5pmi8SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ee-00000003PUK-1QAU;
	Wed, 25 Feb 2026 07:23:04 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Eb-00000003PR9-426S
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:03 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c6e2355739dso2232226a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004181; x=1772608981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=;
        b=jNbf5JBTv5DlxPpEDUg4MRmPFBVzjyVDPB7joB8qOo+Go164DsEGDzlr59wQkyh/+u
         NIz+w18B6Zb8+Viq7+4gu0GTFwy/7l9Gwf0u4A5DFM/r1+F8SnAlskrfCOYHItE2+U/i
         PPhZxDZVYZsuxz9Nf3AN/ZJdZ3RNLUvzLLxZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004181; x=1772608981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EHFAXAM+Xml9R5RaHZQMemPytApXKVc7eKJLfBSsIDw=;
        b=QjKS5U/xN/uNzxYkEnZ0ZV8UJ/DV58CpuSGvuMYtPSU1rTXsedERtc/S4J33vFeq55
         Ecnvxt47QGxK7ZO7bCWNt76vQaNduQ1XYPM88hPDu7ldubKSiwx0AvsDZuxTM4nP0P3Z
         aUTOmolvFHTjkp4DfpG5ieBue8ZfS6MUR43tvlishWY/Ssuiu+Rhv4UGJRGEvpLgjn7w
         bkhwA3UuWbCINbGVKPA7k/yfFlex+oJMTRuhJKehoTNF7Kz2smUPrTksBaFmIGc9G/oI
         SZ1IIbv8wQgtWWfzOflw5mGhUJ8nS6ViD6gG090xomN0JrgaceqvtcUm5NPUonQkW7po
         fqcw==
X-Forwarded-Encrypted: i=1; AJvYcCUAuSf2hqRaqRhqoMJafCmzhzEZ4EjQakAIybwgA9WEZQCwtO7rL4rX0sXthnrv28qNwtkmiBmd7fk2gg3UYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3HyuukMqNSJ0YIwyOWq7u5EkAjA8cl5D0hC4lb4DL/WcyS+R
	2U1sdwGFwFrfUhtgJ2zIQePNkgAGBUzy4fvkejyNXCSwIP2ModsVKU5CY8E6J1db5w==
X-Gm-Gg: ATEYQzyy+MizerYvtlHMpyc+Me+ztrwxEPnNRx/IK7+ni8giMP7H1m1Ab6sqcnwfs9R
	IuK3fRedqr8wIByu+YdWhRMVf39ZvEGH7Op3/cJRPU6CueQMxDXsi/KXjDuToF8aD8pvfNxU1MW
	Nhee0XxEEn/vztajJVomWGqOICrfb6WT9QutF0CWbHpKkpc7H8O501T5IkWvADanW+dFLJIba6Q
	fFFdy7BXMoN7Gi2Pk9I9GwlR32jNFT/v4ZthSucs+NiUxZyBjU5w+ag/U2pAYirP0fTPbFAEtko
	Od3sNWv3ReM3MZ+uD01wshXPPLi90fA74WLADF7779a3wGoxkXaKDaN/vUSE8nutbEYedKFIsqh
	Yx7OiskQ1x+P5i1GKB7QEblVQwlu5HAq53QPD/E4TZVxHKrazoWfSubhPGvCzsK/yHz4JyXjqIz
	6vC3uqDRlu07f6rviLbLHkaOv+b8xx5YeOVQzxIgkhQ+4xPS1fkW/4r9lb+j+pV13uEAU7fSYmZ
	ncduQ==
X-Received: by 2002:a17:903:3510:b0:2a0:fb1c:144c with SMTP id d9443c01a7336-2ad743fe17amr132040615ad.5.1772004181108;
        Tue, 24 Feb 2026 23:23:01 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:00 -0800 (PST)
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
Subject: [PATCH 4/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Wed, 25 Feb 2026 15:22:21 +0800
Message-ID: <20260225072225.3345307-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232302_004141_7215959B 
X-CRM114-Status: GOOD (  13.09  )
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

If further setup fails after the device is powered on and link training
succeeds, we want to place the device back in a quiescence state to
avoid unintended activity and save power. This also helps with power
state tracking and balancing once pwrctrl API is integrated.

Power down the device in the error paths of mtk_pcie_startup_port() and
mtk_pcie_setup().

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 870d3b3db11d..7459e1c1899d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -531,7 +531,7 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		dev_err(pcie->dev,
 			"PCIe link down, current LTSSM state: %s (%#x)\n",
 			ltssm_state, val);
-		return err;
+		goto err_power_down_device;
 	}
 
 	mtk_pcie_enable_msi(pcie);
@@ -556,10 +556,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
 					       type, &table_index);
 		if (err)
-			return err;
+			goto err_power_down_device;
 	}
 
 	return 0;
+
+err_power_down_device:
+	mtk_pcie_device_power_down(pcie);
+	return err;
 }
 
 #define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
@@ -1174,15 +1178,17 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	/* Try link up */
 	err = mtk_pcie_startup_port(pcie);
 	if (err)
-		goto err_setup;
+		goto err_power_down;
 
 	err = mtk_pcie_setup_irq(pcie);
 	if (err)
-		goto err_setup;
+		goto err_device_power_off;
 
 	return 0;
 
-err_setup:
+err_device_power_off:
+	mtk_pcie_device_power_down(pcie);
+err_power_down:
 	mtk_pcie_power_down(pcie);
 
 	return err;
-- 
2.53.0.414.gf7e9f6c205-goog


