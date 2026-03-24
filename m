Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C161F532D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfQ3i6n0srgdKQ5C4/oS1IhFvqnwaDhA6rAMXlkp0g8=; b=vwNGCHLcmEgztcsdz5SD3+Su7Q
	kVRkwaNvWHL0JjotS4kYzkSJfMj7XaILeg5pnzIcebosQaAVvtlsByMI5wqNLVZMvH4ZhTrSfrbd0
	M1lxlQAymTrNrIMVauyh57exnjYBvWDUipVU2Jj33PsFUfSJvvW0B35h9s+sLjoEaWlbfI+InKAcd
	AywntNet8alVMHl2mV+wn0BlEyUuRyR4w34SUEuGnJPd6S4B45xW18Qzikt1WT0S6QTImMAda3hiM
	bhLamj8pvTMSI88KAGiHdBlc1mOmXdY+YKYDQ69egSbpu7Ert9oMkCgxZKfY3IfKUXf+5G4m9SWBw
	5ksbv9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBu-00000000a0B-2jaN;
	Tue, 24 Mar 2026 05:20:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBt-00000000ZzA-00YL
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so4695533a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329632; x=1774934432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfQ3i6n0srgdKQ5C4/oS1IhFvqnwaDhA6rAMXlkp0g8=;
        b=EYiK0KzJWXrAy94B38URyX5J3HylodtmSLfFBo5JkfFRzI9RMzpYqqN5S10RpzSGLo
         JHjqlbCXTxv4QjKWWBgY2BkBJGfxqJ8hdqKWqGKVaOFgk8paPoLzMVqzf43KPsjg02tY
         O4oP7U96ffnOUyg7QcCHWvvl9+2JOpMjzF2jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329632; x=1774934432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfQ3i6n0srgdKQ5C4/oS1IhFvqnwaDhA6rAMXlkp0g8=;
        b=BUHFRlIoAMweH4RYdBR0TRbWi4OxmjwPj270gvj8V2akC0l16KrdmCzmMTNqse1yv2
         2dIDtf6xQShIYnubxP9egANdNMXI1FYKFAMMeNA6nouetgFOng+1AM240BZiV4XjFMQJ
         VW4vuCiVsTqVApSBfxDXv2uRDk0l0I6T/pMFZn1/vnPglekCc9yjEoM0isI+M1ajD/gr
         VcTnx9RKyMeAqCEKg3Vd5xlvVGknbbGx9OAm0upIaPbsvczxwtYy0oYXPwmYy9Sfv3qx
         1AKaS+huZPMaqk5/hoWscnMaEzXCUL4xGmBYFNkd6ZRQf2b/fhGeZo9dXKMEdtsDRhQx
         GCOA==
X-Forwarded-Encrypted: i=1; AJvYcCVYCkdkXKPA9ImrBAMvKI/0XTqGTz5Dn/IhHAtGlO9BySiGkAQC7AhHpo4nro6p1+q3rntr0hxV1OAO/bIowg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPv/JG56kRRSV4x/WAMfkcnA71s8ox/rqd74c57aGyk2O76/S
	kLB/s4qOUfefu6KBudYKXa34g4m1Nr2umtKJKgGy7yl/uWwXoFvoSDr96Dvsb4L8Pw==
X-Gm-Gg: ATEYQzxZsQ+sgrene9dAtWohlc8mGqI6C+7oqmEo7qImqXIRkvm+igvtcwWvmTYBSvN
	OhvL1RJsoqPnuZLhYxYmnLBVpfOITJ2ZMDe+AZY+TcGHCaf1QfIW3mkoo0BsGdsVjMG/NTn44VW
	1Fkg4PFH3x8gplZxYse8g4AGqTYRD13aS5lfBS7yQ1E6XTHtwjfCUqUFxYFLUDD3lZDPHdnswrA
	TRjGRvA2+JJ3Msm2Bj10ZEUeQlQ7vUvN0h0wKQdDvm+Gwi7CLmC45+ESVkNHAxQPSa3Dc2+AMGB
	SJEppVrrE3czvU/nFg4nR67otwHx8tvM7Ti+cLU92rzxqbDo3/sA/E62KtWWiDRGCOgpAjACgE8
	YGiNCLxhSF2hPck6JVnguqs2o1FtukxBeDPtzZvCeaqVV4ZeSHYqXW1AjaEQnCBiNibw679wz7H
	RPGomWVcSLWDM3cFwI5o+IT0f0Y8U8Wu7buFIEI5u0BFVZsArHusuwyAOC3ZLgwQuTuNAOFVY+s
	ClYZop5
X-Received: by 2002:a17:90a:1c08:b0:35b:e519:213b with SMTP id 98e67ed59e1d1-35be5192186mr4759182a91.30.1774329632112;
        Mon, 23 Mar 2026 22:20:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:31 -0700 (PDT)
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
Subject: [PATCH v6 6/7] PCI: mediatek-gen3: Disable device if further setup fails
Date: Tue, 24 Mar 2026 13:19:58 +0800
Message-ID: <20260324052002.4072430-7-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222033_044995_A78FED39 
X-CRM114-Status: GOOD (  11.87  )
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
mtk_pcie_probe().

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 526db8815401..208866d33c77 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -556,10 +556,14 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		dev_err(pcie->dev,
 			"PCIe link down, current LTSSM state: %s (%#x)\n",
 			ltssm_state, val);
-		return err;
+		goto err_power_down_device;
 	}
 
 	return 0;
+
+err_power_down_device:
+	mtk_pcie_devices_power_down(pcie);
+	return err;
 }
 
 #define MTK_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS	| \
@@ -1219,6 +1223,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_power_down_pcie:
+	mtk_pcie_devices_power_down(pcie);
 	mtk_pcie_power_down(pcie);
 err_tear_down_irq:
 	mtk_pcie_irq_teardown(pcie);
-- 
2.53.0.983.g0bb29b3bc5-goog


