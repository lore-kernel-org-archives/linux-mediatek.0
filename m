Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04EECF6498
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 03:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=; b=AUlgq6FZN9Ot4f7Cdb+BzfXPgS
	yQ8onqfJAaY8n30rGhMcDu7KhDHlJOl4l8Zb8UWGskdAlqFRNdcXaMiuyFfT3KnKRseeF9ra/9oe0
	7U5hai0U/lvKhkDk9R54fKVLim/kZ4NoACQZFbSVqnRONXGMf7SV1mqo4LG4ZfzIem7BimmG+OvIf
	d9v+8QMZOwLirP//GWIfyvvpAG2muSm1XohwyGINq+jXahjiy/KqXoeTxXxFrBEhtygWtSPp8Ryt+
	fQOp86qRsWuy8Fgq5/wUhLXoGhljsi27w1aDUTG3FIkCXSkIpXrCg1d5oP1IWPLlAYUBBqhpElDGh
	zuoAcQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6kg-0000000FmYt-2kyh;
	Mon, 30 Sep 2024 03:07:10 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6jT-0000000FmVO-2I08;
	Mon, 30 Sep 2024 03:05:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-718e285544fso3015564b3a.1;
        Sun, 29 Sep 2024 20:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727665554; x=1728270354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=;
        b=A24moU+SKQYJSOKbdRHenD2NrKp5uCuAeNk+pJOisD+W9HzVX74dc1+pU8TLt/MC4Q
         pvj0673i1jihP4Xxxw5eb66rFGpeACNTrzCjEAmymoTFmoDSu1RD5Bv+2aIw7LN2kqhl
         vvVCaul9vCnCv5g1eZRLNHLvMHiKMOCRclF5g+l7VhzPNkfBV9zwp6qIyX6F4miHPpYD
         OOknEAaTpaDBYqqpT8AJN1pUDmms/7MycrWlDbanCIcRW4FZUt7DIoabExp7mpR9/AUm
         RPIopyJCp9uDCsuUPNk298oPdEZsrS16uzmT+nVNHzgqKQBeFSjqSQ4KxnITGAOYaTif
         kujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727665554; x=1728270354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=;
        b=v2oqlbgQ/UR4uXDmeksA14T97zkBzi9VAFM+JArqzICwTqDa5PaZzr8bh8Fsk4mfj/
         /RgTNAhcxqBT615h+neaJ4786MZenDWAMhN9Qunmz/ObkEbJ/EscLoyMI3/YoNn4TqDH
         OiE6cyYA+vmRyD17YDCWyvGnzI1dkEnxCYWHM1O9PhOeqBhCR9cEfZppY27bn/jTyCKc
         YpQx4ePlQfCowkBdtU+fs8OnFr/8hCusB+2hiemihJmXAa8uFPgDGfoVCU7dUP6TdTu4
         RVnJQs04QUk1avx8aLqfJpsgG7wPUG8dNMbMX1h0QO9X/wy0iDKfyIOi9Rk9c2sSz5MI
         6+iw==
X-Forwarded-Encrypted: i=1; AJvYcCULL2uOuqZ0p5nwc1SXmCwmGYYA/V0fYdmpR4Q1Yj1WgP+BMGFG1qn5Nj7T0h59JJOcuo1mLhEBN+5DhOge5F8U@lists.infradead.org, AJvYcCV5PeEzFzRSK2jvAW4MgPav8+y+8n2XgcQvS4DZtdVwB5CEVwvL+Xu0Pv+FY19cRaBfMb4dyG29mfCesCmy5tk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrldItVTcgFkbmljFBTLc5jR6Jzy/Q9exE8AqfdtzlfLQIo/u7
	DXlk5yjeP6Jrzipu78vRQq/rj949vR3zW+9McVpmIkUFkFehiyBP
X-Google-Smtp-Source: AGHT+IH4GpRORCnq9LI2QFzModkh2qMGn6SjusdmX+tpIFnHxAv4i58A2+Se9YymegaBfG7F23ci6g==
X-Received: by 2002:a05:6a00:21d5:b0:717:925a:299a with SMTP id d2e1a72fcca58-71b260478efmr16421559b3a.19.1727665554046;
        Sun, 29 Sep 2024 20:05:54 -0700 (PDT)
Received: from localhost ([101.12.29.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26498b26sm5219466b3a.9.2024.09.29.20.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:05:53 -0700 (PDT)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH] Add PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Date: Mon, 30 Sep 2024 11:05:49 +0800
Message-Id: <20240930030549.2116070-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_200555_634914_C47038DD 
X-CRM114-Status: GOOD (  12.77  )
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of Dell DW5933e,
Add a new auto suspend time for Dell DW5933e.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..2dcb0967f9e9 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -49,6 +49,7 @@
 #define PM_SLEEP_DIS_TIMEOUT_MS		20
 #define PM_ACK_TIMEOUT_MS		1500
 #define PM_AUTOSUSPEND_MS		20000
+#define PM_AUTOSUSPEND_MS_BY_DW5933E 5000
 #define PM_RESOURCE_POLL_TIMEOUT_US	10000
 #define PM_RESOURCE_POLL_STEP_US	100
 
@@ -174,7 +175,7 @@ static int t7xx_wait_pm_config(struct t7xx_pci_dev *t7xx_dev)
 	return ret;
 }
 
-static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev)
+static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev, int pm_autosuspend_ms)
 {
 	struct pci_dev *pdev = t7xx_dev->pdev;
 
@@ -191,7 +192,7 @@ static int t7xx_pci_pm_init(struct t7xx_pci_dev *t7xx_dev)
 				DPM_FLAG_NO_DIRECT_COMPLETE);
 
 	iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) + DISABLE_ASPM_LOWPWR);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, PM_AUTOSUSPEND_MS);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, pm_autosuspend_ms);
 	pm_runtime_use_autosuspend(&pdev->dev);
 
 	return 0;
@@ -824,7 +825,13 @@ static int t7xx_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	IREG_BASE(t7xx_dev) = pcim_iomap_table(pdev)[T7XX_PCI_IREG_BASE];
 	t7xx_dev->base_addr.pcie_ext_reg_base = pcim_iomap_table(pdev)[T7XX_PCI_EREG_BASE];
 
-	ret = t7xx_pci_pm_init(t7xx_dev);
+	if (id->vendor == 0x14c0 && id->device == 0x4d75) {
+		/* Dell DW5933e */
+		ret = t7xx_pci_pm_init(t7xx_dev,PM_AUTOSUSPEND_MS_BY_DW5933E);
+	} else {
+		/* Other devices */
+		ret = t7xx_pci_pm_init(t7xx_dev,PM_AUTOSUSPEND_MS);
+	}
 	if (ret)
 		return ret;
 
-- 
2.34.1


