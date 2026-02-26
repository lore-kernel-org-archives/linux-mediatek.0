Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1207CFC5907
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+lEb7tL2fG6P1YagJO3dp4mOWouUPhOQxVuQNdY/Fc=; b=WcGGhxpb2cwREDlIhmHXebn8sL
	tx4LY0b9gLMnJugMg/5gTZ1GSdig/RF4xfnYAS0PTbHq2hvHwcnT57j/Wv22xTTGWwJ6HQrBAVpO7
	+XMIq0LQqvJjAdJniJ9rC5ECI9hrt/kD/Q8bgIiYFiJgfN7yOK+dlK+24SyK+5k2RzoHNI/NsykYv
	uF6I9HdtwzOQk8RWQgSf1cUVAciBFRZi7gut7E4DOTpA5RqIPpjclh1QyBhu8n438+y3u6M2mAjC1
	P09x85L1tG91Ao/0goKQ2R/VbyvkQpQaIOWttmlINSC0JzlKqkOlgEnSKDutTQH4/xnhSPQcbpZhQ
	t32UDhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5R-00000005b6v-0SL9;
	Thu, 26 Feb 2026 07:47:05 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5P-00000005b5k-1s4R
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:47:04 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c70378ddaafso354585a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092022; x=1772696822; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+lEb7tL2fG6P1YagJO3dp4mOWouUPhOQxVuQNdY/Fc=;
        b=g26z2g4SAtVLLQp7isErMjBQso6i6L2RcI4Un+UH1sHOSEXwEHihZj93FLrbRhFOxn
         33qRSuVZhgnHTgPaQPiJXqeqXh1mBxs1NWEuAeDwBiI0jJjlY9810kPNu6PRQOTdOVSo
         5WluD3RX0DQGqraB4rTVL2cCzYC9iU0G/+dWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092022; x=1772696822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f+lEb7tL2fG6P1YagJO3dp4mOWouUPhOQxVuQNdY/Fc=;
        b=VgwMQrO7oEdmZSUkMsph1qvD8PlhWVlsJRSJdWFQpoPQ8S1Sq/RIZh0EYQXqzpkeIz
         dr2B7dif/eXvJRwYKjqY0Nm8Rdqdds2Pj7nJoyJeYpXmaMqY3Bw6uF/PdmI6FBQ9TXwp
         GC1n7wnDfEAAsxaAM3JRJRM+DQAT0aMx++uVJiC+sJyrcR+DSIWJdYjm3xhjUUUVimFg
         UwWdeJUSrlv6TbBm4BSM0eUeFxfnDX06t5UXwm7j3PapuRxsU3c1hz6XscXICRotpjk+
         GCKfoRgXodCWvJJNP3ezMmpQEvIBauzXZbVxOU7HORiWVLPEyEzlq4XuCBN5GT3xSgpx
         tClA==
X-Forwarded-Encrypted: i=1; AJvYcCVjdpzvo15DWrj4JyCnnd0l2r7WBKfMKpisyliwvCxG7IFLPqP6Bw9ohjVjnyZTJyuYphwIMJMHuPCrZbWVQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPPz9iMFjQtuG+GnNbgyUVF1ugu0Vs1hBEfMu7jiJEfecODXyL
	Q4wgziJW/Fk2x+gp/zV87IXf8zwA57z+L4A94x3VdyH7C9Qdi9KHcqSj0Yfjs1zuJp5isUsRgBm
	yAN4=
X-Gm-Gg: ATEYQzxvCQkBUK745f9RL+P910ovIydK/Int+WzgOwf324vLEZY0mpL9cEO66Gsggmw
	9iBKO6EoI5YY33l7fzFeXDbXdEXRM+7bcCWPWZrQiUsywEGduTp+5pBraHHi4HBwlbKtVDG6RWT
	IGy60K5x1fxsvIDKWNqoNVt+YoavTdzipYhVQzI1DsIU35IvM3gXlH+j/a94jcCxUCxsaoRIacx
	5XPIMfPiipbq0zV8D4BtVx3ZRaP7ZnAYtx5EKCt4QPIXNu96OSt5/4zATMq98Wl+9xitZ0vmjaO
	oifD3GTgNszoPlTwCiniPH0qRB/FroUPD4Pm8IWKk0bpxnlEK1wFsCy4mqX514Hfr2wvrRFrXY9
	td5nbIVgbhQtuPKc9M2R+EJAxhVYAMGZL/BpXhKWj7dgkdit3lD372QiA+XhoUvHHWHtvCVfHZt
	fpOD2FuXMAi7hXC7QferZzuoslI7FZJbL4J5WZD6ISB1NN19oGWsGG0QwuTDLaTsU46+CPq/9ej
	BHX/Mcz
X-Received: by 2002:a17:902:e743:b0:2aa:f43d:7c42 with SMTP id d9443c01a7336-2ade99a71c9mr33563475ad.24.1772092022489;
        Wed, 25 Feb 2026 23:47:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:47:02 -0800 (PST)
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
Subject: [PATCH v2 4/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Thu, 26 Feb 2026 15:45:20 +0800
Message-ID: <20260226074524.3808081-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234703_484982_469D9195 
X-CRM114-Status: GOOD (  13.11  )
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
2.53.0.414.gf7e9f6c205-goog


