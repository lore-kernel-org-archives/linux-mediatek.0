Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B320D58E61
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnRLakFFOm81oUmP2rKumROQ+VIkSIJ/KocU0Q9JzsU=; b=SGO9PWUE+8Cbp56Rih0xks5FFa
	LlmeNFhHUZtlmuQlbjdMlGpFwqUWS2ItokPD+N39+G4xWHFe2QMneyieI/NUtHQz5YpQeHxHhuvW7
	zTm5l+kwTgczooZ+IDwh80JGFTszywgb8v3Ai5+AVQsGotuVjmGnxlRm2oqQz8fu6IZOJ3RHvRLgC
	/GISN2FhiRf7LXyZyezxfMRzU/dN4L+kW0C8EHZhK5qBlX3KZf17sm3wHkNTpjubTMj40MspR/m5W
	tNzo2/1lY+4ZQGdalTcoNzsd99HPmD3Hr8gL/CBAGIb8o/6nOPzdcYIJ0EKr5oN+8Td91kU7pTvNo
	3+Qz02OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsM-0000000CIh1-29FM;
	Mon, 02 Mar 2026 05:31:26 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsK-0000000CIfR-0cri
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ab46931cf1so33407955ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429483; x=1773034283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TnRLakFFOm81oUmP2rKumROQ+VIkSIJ/KocU0Q9JzsU=;
        b=Mr/OAAAXVF4/4I/kYexU0aCDu9bsw9CVmKjHFNwu5BkR5kAfzzxtkazI7qDOTTp1uM
         AutWRESAcD5y27jBvAsxiMbN4qkAEYq+Kb/gJa1+UpH9dLIAMyLo0eXQbbyXvvwLpdR/
         ATQfPR/QYyGpWbdCSFQbB9i73MlXZFaZeBIJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429483; x=1773034283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TnRLakFFOm81oUmP2rKumROQ+VIkSIJ/KocU0Q9JzsU=;
        b=RoJXkocphKU4jlPLf/EMKVulHBu0F4Ztv8pLm6W9bUA7PaHAP0kFwGRfivFTNRxfSN
         dFHuwvK6RHUwITHm1vSJgQ2SCvaklewZTjyoaZG/414oLS2iPV3ojOindwfyQ+qpwF5V
         TbyD5XiJPtXL+z+7lt5c15Fpptum07O/pp0ALPPokxOFspHj17d4lkwM7y0gCAV7ccnu
         FqaEy4ILaJ3uuVQtz2CkFwrDe9lu54Hb0tyjh9+KTBqYTwvSE6k7Uh8Dyx4m8fQeq5S3
         K+gkdcYoLXSJBo3sNjSJDBoS8bnAfWDxahD9l2GHKCOuZOk1yun3YswcZ0QKxVwgxhwy
         VqDg==
X-Forwarded-Encrypted: i=1; AJvYcCXdFCROHti+mNXVy2Iu4x3RXenDrDIJCCz46enYmhWH78+64+r7Ea39JxgwIDmnYTo0fW0YU6y5LmZxyCqVyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPn7V59wDy2NMoMK0IqYDmlD5ATBqjVW6w2YD/BfFTsFJs5Jaz
	iL78VeCoDXVo5vjWBZqhtpJ6298jGaoUpmHdUg3VUmdGglI3wS69TW1gqh0VdkzGbw==
X-Gm-Gg: ATEYQzzc0265meyYKJufF7p7q2B2fzHwv7ZYqrDuf/hlHH9w75pomtZ6AF3pDgCZH2J
	6cBqhvq4TlLJdVG9Vqfccn5dZzpMXZN4GnsjGhwklMVAuw8aAhVkVjG39hNDyJ0aUUpbKpGeuc1
	Imjcn1EZq3z4XaC2sQ8S8k1RCRkox1hvPeIPmuivb9jf90V/q0knm6XJ2aERtYEV+YK3QFoedB6
	x5pfsra4zhAIcx3uWCYLvUnSLYE7KJIEtG+/SLIZEZ06oVGhieMM6Xq3rWN96BsSfXYy7Y2QVl7
	noyh3gc5RxZFdXwY6SY3wHALMHpFahj9bNRXTT3vyLp2IS0Moc6FaPAT0B6QgheMsbO4rbwZy8h
	HDCOMksY1c1OBOSPdhjJRKq1W28HBFZSmXPjAf4ucN1dVQIXyftTynzfpEtiFtzngdAxX7nsDUB
	3w1ChMQzA2HzOrH/33VYaWFzIz6tFcEklcxzDhIJ3nUC01K2atj73nLYOHU+LAUCZf6onqbk/m8
	LMB9/QR9d28okqqcTU=
X-Received: by 2002:a17:903:234c:b0:2a7:80bf:3125 with SMTP id d9443c01a7336-2ae2b8d4c4dmr117315385ad.13.1772429483143;
        Sun, 01 Mar 2026 21:31:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:22 -0800 (PST)
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
Subject: [PATCH v3 2/7] PCI: mediatek-gen3: Add error path for probe and resume driver callbacks
Date: Mon,  2 Mar 2026 13:31:02 +0800
Message-ID: <20260302053109.1117091-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213124_233015_C8A785C5 
X-CRM114-Status: GOOD (  13.51  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
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
2.53.0.473.g4a7958ca14-goog


