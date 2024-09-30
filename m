Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2507DCF6499
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 03:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ucD2XJQWu4yYNPDGQD/Z5MzEr03Cm1SCrLKcaC8nSKQ=; b=oOhVPUa2r/C8GceVGd3V/D1SZk
	qwrE6sdNbL3D88Bp8hHpY7eOpEoNQctB7w6DQBMXIe0XVK9hN7B2wK6HsBZ8GZsDL7SHA9u40rhYr
	moCRyDPkJjpWccme++H4YcJR3eV6Rvh4exgAFOIw0ohZ0aIBXExQJfwkyBfApiDNgnd7BX13KWWM1
	4LiJMDtFHPfYr/L5Ww0hZtB3VUBLjswCP9c9uOn2YWCIlOB6aU83f4HDy8sm4mt0F2MjVm7/p2/E+
	qd6RLCrlnya9gPOZdX2NAVhdDowhqsawaJhq7LDcUZW9NN3bSHXXm9UlE7MIHbKShETPl0fiXWfna
	qfk+5Tmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6v8-0000000FnTk-0Nqv;
	Mon, 30 Sep 2024 03:17:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv6ts-0000000FnFv-2xQM;
	Mon, 30 Sep 2024 03:16:42 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20792913262so45873645ad.3;
        Sun, 29 Sep 2024 20:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727666200; x=1728271000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucD2XJQWu4yYNPDGQD/Z5MzEr03Cm1SCrLKcaC8nSKQ=;
        b=cTNH9/ROTC3txEQB6KBIUfWNB/w3RdttrW7pTlzMesaASgLS/UwX7GEzAE7auZKJIR
         RRX93+XbRMdtbFkEdTHeCWMFP23B9+DyZ8+YpPork8PD/D2pOPL29WHUDF4zZDJXBbwK
         NPf1gpH4wRWPHN0q4FMWbttxs8radeS79X+bqUFrSycTQF85hPeqSbTnWbkaTzDex5Rw
         Iyn2MSQq8KEDgzYeE9zE3OGrDYFgDbK8+O09Hc/neJeq07jPJDbTf8Ul2qcH/t35TzyQ
         ZH7o20Ii7bZFqBSHmj9TxcGma4thPY85y78fpk6reh34udaIWH4Ro+tGDLtxmcI3k9fA
         XBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727666200; x=1728271000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucD2XJQWu4yYNPDGQD/Z5MzEr03Cm1SCrLKcaC8nSKQ=;
        b=l6+Ifr3e9UbQ0XY9O1ifrYUdCZ43lrgAYS7xKwBXoPaHCJ3zDDLjtxAqhBfqATS3Z5
         EmjsnmXLeRQriqF5Y5rpvCMWB1rSNmeabJBkwZ/wk/Sfafk1Fukk4Yh6YBk3/TuaPbOg
         g4kpHPak/qalviZVW6oPHiVW9pkmXOhPRjveor3A0opWvZXnNHhQvTbVW5m4v5Teqvm3
         KA6Epzmi0N4xYXS+Ld625jPdyq8raa9TpKhojAVvRzUvw5/VthSdi5bUWnxn7WKS4R+D
         D4l7kaceiG5W0TXzg/DgOgOo3KToWMRgCpnHbDZA01kT8ynuW0WjpKJnqY0DqrIXKErZ
         rF6g==
X-Forwarded-Encrypted: i=1; AJvYcCWE5yn8z5pHvHdcv7zOOs9f8Ge6/e5o2YDKrJxoSQ3lpi5pT94mPLSKW87IyJpKX7lI7mrWyzNRq8suBoUX76pJ@lists.infradead.org, AJvYcCX+wDfUKXcwuY1v8OLPX7GD3eq11/ARQ4Jqtcy+6gvdhsnKdcoQh5U+Zu1XGrzCUvms+FkXNBuXRW6b5B9zwSY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyprZZ1i2janTkeHoloB+kAtNGuyIPBK06kQZLcjsalKmGhlydf
	gYTCepXYK2CqEFFlzxLImmlfYcifzzA/IhTbL7xCcPXwOn2lQqaN
X-Google-Smtp-Source: AGHT+IFY/j1+pmbrhjQJ+rVokz3hyAtdg0T8qtcMxVrjc6gVnltW0QOJKB1T14p2O3XdAmPYhDYnew==
X-Received: by 2002:a17:903:228d:b0:207:6e9:2da1 with SMTP id d9443c01a7336-20b376750a8mr169203605ad.17.1727666199594;
        Sun, 29 Sep 2024 20:16:39 -0700 (PDT)
Received: from localhost ([101.12.29.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0fd99sm45794935ad.173.2024.09.29.20.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 20:16:39 -0700 (PDT)
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
Subject: [PATCH] [net,v2] net: wwan: t7xx: add PM_AUTOSUSPEND_MS_BY_DW5933E for Dell DW5933e
Date: Mon, 30 Sep 2024 11:16:24 +0800
Message-Id: <20240930031624.2116592-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_201640_775709_467C5D99 
X-CRM114-Status: GOOD (  12.82  )
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


