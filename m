Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDBBCF6498
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=; b=iLVFukD7GDXnRC7QpqMpuGIqtV
	nNBpSUBqZBWikT/iGE8pKIY3SjhcEVui+e55xIFLfl2wP56UvvofnQXENmoRc3HF7R7Dlcq/S7pVl
	fHC7Jauz6i4GeUweetP2NSsb2jm70hAOEAjkda2q6tmr83utFSCbjyLcu6AK5UNUPO7ZyJog/X7IZ
	EIANExSSk4i4RKZ/HHjjh0o1dp8pewUGXj7SaOw+vaab/f61050KRvRJXp27+9HUWI/3wq70ihTvq
	ln5q8sEHyKriC3gsHtreIIQu51vgbINIBE/e0ArP/6gwiatTjdieNvonuWKsRJFaqdW7Qp9HchpEt
	aynKAJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6o1-0000000Fmn7-2CB7;
	Mon, 30 Sep 2024 03:10:37 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6mo-0000000Fmhq-3Zgh;
	Mon, 30 Sep 2024 03:09:24 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7d4fa972cbeso2768365a12.2;
        Sun, 29 Sep 2024 20:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727665762; x=1728270562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=;
        b=lbYHbplnjQ3IGBfdafwvm0LAjm3FuWbz5zLVNC+JBcb4p90ltlAhMcZD5qIE0tVZJ3
         2qEgQZjVgRghsw0mvPPx3FJDvdbFrCTGnmF4IaAZnKhtRvogB+zj+Mhf1eKCE2n9SQLS
         PjS/vTej4C+S9gqYXNn2IX1FU/2I3zzwkazKMWtYKj1ZfjrIwM6rwa5peUpO786dGLde
         CWOyDLWtX7AAAT+pR7j6hRmvVnCNOx/7CvorJURQZjk40W89Ig47WRRaNTHkQ4gSR7fL
         HtNu4UshtBNXHSjM2YhrYkLTvDf0+wB7iOQKlXg+mpwXqt6vlgyAdbK1PI5X22bEP/pf
         0ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727665762; x=1728270562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liH+2HX4gU0bkSiJPPJupVzmEbjmJ5tsUvyE/1aKSfE=;
        b=eiwa+lqlkyN6wJmd9W3mGuWy7X/gDoM1x/Fhv3q3mNFu7Bj36WFWpmXbhCyBV8QJZC
         VzVBDWWhPTB6u9W5i95fUbsS9I8Ep0sIau3PZUHETGpYYLaIRtNoFWrA+PjFzXvUsOUb
         ZsWt4kEZfrxvRhKFdYWQVwIGW3ClB3UtaNaayH/ahd8Hr0Cq/oO1rcBsqWwLxKQm7LB7
         29kX3Q5LJZ6mGerBHGInzYRuNLYbk9oEnGPunAlvXFuk4njUyrwKIsRT4C5cVmDO2e2q
         Xn2yYlJ49QTWYbT0IPjPOo1tYBn3J7WX1EblDXfFtj2gDCx0LVcDKKSRcsCfql18BAZI
         mBhA==
X-Forwarded-Encrypted: i=1; AJvYcCUC+bLFmyLYdDrYGkMO3zdQnXJysqT0KASIytAm2cMJkuBzMRna+UnDw2/Wdc4NzDB6XAloepoVfwD/rWIyQZPn@lists.infradead.org, AJvYcCUS8w/sgBcHKy+0LYE3/PCsjYwU6Vqw/LagbRDWcBef339SPSbxyXHlc6plreUm3Tq/CaPYWfUciuEE12G5naA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+q0QndW8EdV3grUrac3j6Hcl2+6k561OeZxcVCTc8XMDPQy7G
	0TfkHWriQeIn9g3DXQe2deJi7srp+3PY8QqX1Ulqrb6ay09QpiPr
X-Google-Smtp-Source: AGHT+IFdwqW2x+LGQ7yYzogOpNGWw7LvWSFFkUOqczekRhOYAg1KYqWZJSV3YBPjsXWkv2LJgeUzjA==
X-Received: by 2002:a05:6300:4041:b0:1cf:3a0a:ae45 with SMTP id adf61e73a8af0-1d4fa7ae36emr18049593637.35.1727665761650;
        Sun, 29 Sep 2024 20:09:21 -0700 (PDT)
Received: from localhost ([101.12.29.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26538a3esm5235967b3a.208.2024.09.29.20.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:09:21 -0700 (PDT)
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
Subject: [PATCH] [net] net: wwan: t7xx: add PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Date: Mon, 30 Sep 2024 11:09:07 +0800
Message-Id: <20240930030907.2116224-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_200922_898893_AB395C3C 
X-CRM114-Status: GOOD (  12.72  )
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


