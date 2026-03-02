Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D68D58E61
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPd8tgeA/RssAFD8jAQGxHvdFlZ13vWwzgtMLfIKr3c=; b=pl4BWYeaetdEkEKffC/MBG0ozr
	5NUHWYs2dS22wWxzlKW/WLvGe96JS1SZaHz1qSiI49wr2BS0qbBVN+3BrzegQT3Mf3cVLg9iJJfox
	itpsH7HWYWw9HqPD1SNTw2tzA1UlduscKUQV2XGlAhFJPUIlUtkBOHNXHXz6p8Q/2ZbL6fl2AarjQ
	w3C+YDDpQe0JRQrsLZwLxZMLiHp1g2NagQyWUinCL4Up8QWpg1Q3wi8HZUxwJdgeuMaqA0e7GZ7Ta
	yXggjLdqro4uBdOLC6lE/ltG2hAcvVgX9TjOIP4B2/Zeo9MNIlcRvpYmmq/cxIq6TDvSyV/vsQJx9
	E4JW+FBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsS-0000000CIjs-0xBT;
	Mon, 02 Mar 2026 05:31:32 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsP-0000000CIiX-2EOR
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ab46931cf1so33408575ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429489; x=1773034289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPd8tgeA/RssAFD8jAQGxHvdFlZ13vWwzgtMLfIKr3c=;
        b=gzdVWRJj+61fLD/eK+X5BlX58jitRCnbgdS3jlvkRh+VtgD0O4P1cv36x/yjyJ/06R
         dohyr3QjXyNhekFvJ+Z2OzuxGq9gogSoyiU+BbHL36x1DjO5tusUp6jcVDLoAJ+Zy6R+
         ti18prZboEMdKFLiismAuxPceza+QsbgiBSKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429489; x=1773034289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPd8tgeA/RssAFD8jAQGxHvdFlZ13vWwzgtMLfIKr3c=;
        b=BfF+gVlJ45OYxCUqKKO4ou2qN5D6D9cS+OnYrjFngP0NT1z/ejcHhmDRbwUvMXt4+2
         tKnYQxGQWPKyex/tkmyJh3xnN4TIgEGb+KZmAt34RYaZKlod/+c11TD2e8GOda+s76JG
         Npk3e1KSG14ueLPY+Lnk8XUvYageCphwWrfKQjb2+QKFPik9/Rgfepp6cC6gGM03svP3
         o/243IFPm3tXgmAX6uief/p6Q1JlBI4h3lEMs7tfzeuFxhHDYtriL5o2t3TgbMEADHKD
         y2eUBzZv8HrgQsB12qp88rc0VTZ7s7HlQhluPb1taNGy7GkWn4JpZ2p9K7uqOFWqrb2V
         szlA==
X-Forwarded-Encrypted: i=1; AJvYcCU/Vz3ig61ntc1LcJTdx2UsXH+SoRI4hlx2PLw++y0hudNN5hoaPHzc7LPlN3hE/SqeKuiQbWXBQTvAf5AvXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyaz4PyYbK+VNCQyq64WE2ssGm3TZre8pEM+JZHwO4L6JEL/+bs
	Qv1vjM5Hr75sonlAF8tQqO9Cz33tCE+tw+T+XfRiPTiEXeKDA6YexBgc8vxIBGEV7w==
X-Gm-Gg: ATEYQzzDLJ5pL3Vmu3dNpMxaqGHfhXGs5aXEF9O1+XbeOva4VwYWsh3AwWptDgC8aZx
	80FWrwoysQNseaLlh4FKsgYC7as3y1N7vBO02C6nKtqjc0l2srKo8xt082yHs1dj/2lqUdZuC90
	Rj+AvQOUL8QzGw89F4jcMrpJgPxW56dr+AeT5FSW/vnsiCrTBJOalm1ZnoZliZBHZugMUB1TdA9
	jWNjcyYspluOapoRozssytS4jwj0wDA0JYcgQTCRaSUiY3RoGmytgBNX9JMqT9LCsufx949A0QF
	vDyULhROtvLj6fifBZbb8zmV2RNO5sFI3RjRjo0CoTeHERwC9ofxNL53jsWIV1EbT7869hU+FUz
	gzb8wRhljPnN1TWMyuRbgydmZRnD/59u54c9Q4aSt5HPsdYxZKOikKAO2b5AvgBv/HHWQOKngTA
	fq9P1EhhYHn5Arbqfbtvw+oh/pZ4juI8fjTN6Ow9AC+tgz30hRBJsIeCRszsF6+UgIa9OH621f3
	PHTNHsX
X-Received: by 2002:a17:902:ffce:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2ae4ef019e0mr23031325ad.13.1772429488915;
        Sun, 01 Mar 2026 21:31:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:28 -0800 (PST)
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
Subject: [PATCH v3 4/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Mon,  2 Mar 2026 13:31:04 +0800
Message-ID: <20260302053109.1117091-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213129_571493_188A298F 
X-CRM114-Status: GOOD (  13.02  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
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
2.53.0.473.g4a7958ca14-goog


