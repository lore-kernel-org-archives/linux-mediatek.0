Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FFEC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1479207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGv075Ar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1479207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fX/jzFji2H43wV+X02a2IcDQE5mCauALmi95Bp8t4KM=; b=fGv075Aro57+mGV/3zDHfUfVY
	cFNd8Acsi2SBLlk0OND53ddGcn3aSfZ/ozh7IuC4l3BP2S+pk3xuc+FAXCr2W/uuOoU0vKPcpsA62
	82h8zD5upIwXxT0kW7N1Sith3yUtF0gxvuHjdIjjU1ggimCXvXWthYME/MMKBE97WqyUz/RUCIDD9
	SaibrNC2zZatpfEpAaM6NtXPoa7aEVz6u6CB+XhfF8SrgZPrsV3X9bvIOoL4GiCpAqa3zzhklwu6p
	mORRSP6sloxzXSDde3cLEitgMjgR4wCOVrirstgrxsgqQLQ/owLWPPasplyMAjoSP4/r1udpfK2xY
	ROyFftbnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4VT-0005jE-42; Wed, 22 Jul 2020 02:29:19 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4SO-0003vx-1o; Wed, 22 Jul 2020 02:26:09 +0000
Received: by mail-io1-f68.google.com with SMTP id l17so862447iok.7;
 Tue, 21 Jul 2020 19:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sx6GVOI+dfrOqGHWvn9QoM3JtOMYpq/JE8Tqqq/XESo=;
 b=ctnK7rZ0V2PW+9ZQDmYiXfkhStULOX3DUV58ZQkQymttif6UjF7spV7i/TNmyoshBV
 o+4aX4f0e/8OQSqNTbcPL5I4OCLC6zKi7mRpChl8jK62SZ2vOSsOV9fbBKzuyqVbArkF
 XZpAYbQH56bytdRIw1Ko60UGWeo8EdHSAMZn85zFtE/Fv3g+3wo3NRaDqqU1Lj/66TRB
 skh9KThSyIuxLiIQaxOjrFdio9vuBMFsxQ3QutHlykwlqwPH+ZmvcX+AwAnUszwVVDbx
 plwXIL7T1BfZYG34wesoUvZE1T78q+mLQKgxBE9xrVVX4lDNOpaWbWs2ntyzWYIT+x44
 mPtg==
X-Gm-Message-State: AOAM530Me86z9hWN6A66J9jKryEUitrGHTPvGsXUqDEP08pVNzTNkxLI
 P7pWFXg7fPZN3pTb49vYKg==
X-Google-Smtp-Source: ABdhPJze1eEfXQhm3Te+g4pDNDpupsU66DO3G9MUAMxA5XH1jcrIjVL0er8s/IRb3RapW1a/bMPdhw==
X-Received: by 2002:a05:6e02:e05:: with SMTP id
 a5mr28941292ilk.92.1595384766206; 
 Tue, 21 Jul 2020 19:26:06 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:26:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 14/19] PCI: rcar: Use devm_pci_alloc_host_bridge()
Date: Tue, 21 Jul 2020 20:25:09 -0600
Message-Id: <20200722022514.1283916-15-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222608_294510_97E8637E 
X-CRM114-Status: GOOD (  12.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move to the resource managed devm_pci_alloc_host_bridge() and simplify
the error path.

Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pcie-rcar-host.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 58f4d339eb0c..c470bff5af0f 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -940,7 +940,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 	int err;
 	struct pci_host_bridge *bridge;
 
-	bridge = pci_alloc_host_bridge(sizeof(*host));
+	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
 	if (!bridge)
 		return -ENOMEM;
 
@@ -952,7 +952,7 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 	err = pci_parse_request_of_pci_ranges(dev, &host->resources,
 					      &bridge->dma_ranges, NULL);
 	if (err)
-		goto err_free_bridge;
+		return err;
 
 	pm_runtime_enable(pcie->dev);
 	err = pm_runtime_get_sync(pcie->dev);
@@ -1034,9 +1034,6 @@ static int rcar_pcie_probe(struct platform_device *pdev)
 	pm_runtime_disable(dev);
 	pci_free_resource_list(&host->resources);
 
-err_free_bridge:
-	pci_free_host_bridge(bridge);
-
 	return err;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
