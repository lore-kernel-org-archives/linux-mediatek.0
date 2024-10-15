Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0162BCFC261
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5toA+i342QCyHiEYfQpngKk7r+1pZDBgH0RjgANa6XY=; b=a9gB6thD0Om2OCcydVel/exUD5
	GReKsj9D+6+icnq7Y0uOs//UwOAWMVL6aS93/toevKDwGFEI2GM3/fIkY2E7HfLp7HqZ8EGwGCr2u
	pkxxTOadj71q/qnM0YLdOG9Y9oDDY3HeNiiXWEBEHhDtbGNN5hsd1bMqnbXCll3k3LjaT3ILmcXeU
	fyABTbYQxjvbP3KpQn9vMZidBtGVc/Ts8w/iws8M1zqsstlU8fHzI/w9+ReqwKkALViiCDy6tIWin
	LxE4QRucs5FCl2Y+pNLu/pjbDY+P74Z8163Wg02K7Mrv1V6IWLdmP0ZN5m8P4sbJ4U8PQ8GtiUlbP
	4o+3CVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0YG6-00000006z0g-343t;
	Tue, 15 Oct 2024 03:30:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0YEg-00000006ylA-1QUs;
	Tue, 15 Oct 2024 03:28:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20ca1b6a80aso26955535ad.2;
        Mon, 14 Oct 2024 20:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728962917; x=1729567717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5toA+i342QCyHiEYfQpngKk7r+1pZDBgH0RjgANa6XY=;
        b=NZIU1nx3htrZErRpGg/NMRwIbTK4OEXExtubxiAU6py9oW2iuey0zoQdfQTYol7D3z
         5HhM9ZCSqh2BtCwKZpJRZwy8z945lN2AtkmqEOTlinO8acJqp0VrJ7t+2a9Mi64p+lOX
         fMq3ua9BruMj74zVHHyb7mGuwNDe7eT7mUAYInues16kuPfIROtPL6+ZU2gUcj2QdzAS
         td0if9puA+AFN6+vkYCJ7/vCD4gNIaSlECN+oSvM5GLsgSnjY5XEKejgGebQpm98C1SP
         jWTcW0xncNUWdm4fDiOwvjtjXDrKWuP1EcfceAe2o4B7I9PdT+VR0b6kuHZR4/9xvPUf
         93Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728962917; x=1729567717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5toA+i342QCyHiEYfQpngKk7r+1pZDBgH0RjgANa6XY=;
        b=Y0oT2ja3LYTstQXBo8M4E2ZZ3tuIhhvurQAiviKygXLWpP77BBcVOf1EDUP676ToXa
         GpEtNm4US1ghNgNovxBlxloyovRhRitSst3CfH0mopf3JuiF7aOTiAb1khMpMP1QE4LP
         D7HtwtcRe7t+BeZiGgze021yN+EYDC5HbMO01CpDij4W50MDk90qn5uxecvwOA9us75s
         vgI88Dmkt/oNcjbKr2suBAQDrRqyGIzIf45lbsm7Ug187n0P6sBmzdsmyvvWlRG4ZTCd
         lOGmY7lMtuHl9s/QbDOCUHrPnT7vus8Lm4GKyx6xH+//sb1G5jTN9/0T2i7g/V7iU+Mr
         fdug==
X-Forwarded-Encrypted: i=1; AJvYcCW1H3atqCHNjxK8uHBG4oNVZivV51RbWwsnLl4IJtLF2fleONHDZiBsq9PMNsG7XGRIrTPyl/WsGwxOFmLiU8I=@lists.infradead.org, AJvYcCXtLUGp8qA/ZBUtdFpufqFjEbH4MumO8LrYYnnRO0rmPhs+ypRIvgjV7NzEa1zTbFOTTsGXZpy3Zkaf3Fd+dYUz@lists.infradead.org
X-Gm-Message-State: AOJu0YysO/h34aasrfTAu7zdL/tFsCCy2oK05vaUgPAgs8J0QbsuAhWF
	Jn4YFb7lQAEtvLsysmceil7oDKAz5rExb7N4vbW1u4dkWMyL7KHYTrLJColh
X-Google-Smtp-Source: AGHT+IFkkeRsQOCFrl7ubPyos8WBLRbx8OL51e45EkMfFWUlxyhzoH1mi6W60ixNwcxDkTLxUBbvTw==
X-Received: by 2002:a17:902:f550:b0:20c:a175:1942 with SMTP id d9443c01a7336-20cbb1aa3a5mr131065495ad.24.1728962917283;
        Mon, 14 Oct 2024 20:28:37 -0700 (PDT)
Received: from localhost ([2402:7500:477:e9fa:5129:403f:9618:b589])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804eb2bsm2722625ad.188.2024.10.14.20.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 20:28:36 -0700 (PDT)
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
Subject: [PATCH] [net,v3] net: wwan: t7xx: add PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Date: Tue, 15 Oct 2024 11:28:20 +0800
Message-Id: <20241015032820.2265382-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_202838_407682_462AADC7 
X-CRM114-Status: GOOD (  13.36  )
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

The Tests uses a small script to loop through the power_state
of Dell DW5933e.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50% of the time was in D3 state
  when host don't have data packet transmission.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
V3:
 * supplementary commit information
V2:
 * Fix code style error
---
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..ec567153ea6e 100644
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
+		ret = t7xx_pci_pm_init(t7xx_dev, PM_AUTOSUSPEND_MS_BY_DW5933E);
+	} else {
+		/* Other devices */
+		ret = t7xx_pci_pm_init(t7xx_dev, PM_AUTOSUSPEND_MS);
+	}
 	if (ret)
 		return ret;
 
-- 
2.34.1


