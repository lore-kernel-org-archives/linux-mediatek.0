Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EF8C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umhh0FzBGsNXEAALHbqMIj31OfSdeB0GwIF0mV/MA4U=; b=mb8dXguckOaXcc
	M//YXp02Va0Q0QNL799jJ/V+wFxAFrX4FfJkF+lazci1bfBHfUEWlFK96RUxl3bHI1qPQfWcly3ER
	lyfx/DWCIeYu/yDxr1HJ2loNi4fdHv9pP1KhgX9uKnaN+6YxdaZGdj97GNVJuC6NedfQEjpJFu9uQ
	RpVHse55gM1dLCrr8VJaD2TFRby3b/NQhTnBnJ0r8o4GKeoRSLS9eXCQw5zgGwCcjqTB63gpC3rd8
	CAahr61kd6HFqBOl+REeBmwuMphDHq8F9ZIkfr7Wz/IwnlOba9cx/PzPQTZepgz7ms4VR/XAcgliA
	P0pdJ4+KRaOhjbTHl+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZqj-006iv1-WF; Fri, 10 Jun 2022 08:18:34 +0000
Received: from mail.baikalelectronics.com ([87.245.175.230])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzZqV-006iqU-Mi; Fri, 10 Jun 2022 08:18:21 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id AD39E16AA;
	Fri, 10 Jun 2022 11:19:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com AD39E16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1654849142;
	bh=YC8mhxZWlVipdQB79Q7/wQI6740jLdk6WakSOhvy74Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=aJEIpofTiH5h5kpDnPFE9zQtcys2DQLkWcbntsQGMPt+jIIfTXwuoB/iuybP8vUgI
	 TKSB9jApQu0Kav97oa38UAIrf+kE1ffjXk8oYN+AvZX3cINyHVUVGpVqS08bFoSvFy
	 r9L5XqSEU+pfB5+kdVcecAmRYGYBTl1DPuUduPbw=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 10 Jun 2022 11:18:10 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Hans de Goede
	<hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>, Hannes Reinecke
	<hare@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Patrice Chotard
	<patrice.chotard@foss.st.com>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
	<fancer.lancer@gmail.com>, Alexey Malahov
	<Alexey.Malahov@baikalelectronics.ru>, Pavel Parkhomenko
	<Pavel.Parkhomenko@baikalelectronics.ru>, Rob Herring <robh+dt@kernel.org>,
	<linux-ide@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 09/23] ata: libahci_platform: Parse ports-implemented property in resources getter
Date: Fri, 10 Jun 2022 11:17:47 +0300
Message-ID: <20220610081801.11854-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220610081801.11854-1-Sergey.Semin@baikalelectronics.ru>
References: <20220610081801.11854-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_011820_536434_B62303AC 
X-CRM114-Status: GOOD (  14.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The ports-implemented property is mainly used on the OF-based platforms
with no ports mapping initialized by a bootloader/BIOS firmware. Seeing
the same of_property_read_u32()-based pattern has already been implemented
in the generic AHCI LLDD (glue) driver and in the Mediatek, St AHCI
drivers let's move the property read procedure to the generic
ahci_platform_get_resources() method. Thus we'll have the forced ports
mapping feature supported for each OF-based platform which requires that,
and stop re-implementing the same pattern in there a bit simplifying the
code.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/ata/ahci_mtk.c         | 2 --
 drivers/ata/ahci_platform.c    | 3 ---
 drivers/ata/ahci_st.c          | 3 ---
 drivers/ata/libahci_platform.c | 3 +++
 4 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index 1f6c85fde983..c056378e3e72 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -118,8 +118,6 @@ static int mtk_ahci_parse_property(struct ahci_host_priv *hpriv,
 				   SYS_CFG_SATA_EN);
 	}
 
-	of_property_read_u32(np, "ports-implemented", &hpriv->force_port_map);
-
 	return 0;
 }
 
diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index 28a8de5b48b9..9b56490ecbc3 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -56,9 +56,6 @@ static int ahci_probe(struct platform_device *pdev)
 	if (rc)
 		return rc;
 
-	of_property_read_u32(dev->of_node,
-			     "ports-implemented", &hpriv->force_port_map);
-
 	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
 		hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
 
diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 7526653c843b..068621099c00 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -168,9 +168,6 @@ static int st_ahci_probe(struct platform_device *pdev)
 
 	st_ahci_configure_oob(hpriv->mmio);
 
-	of_property_read_u32(dev->of_node,
-			     "ports-implemented", &hpriv->force_port_map);
-
 	err = ahci_platform_init_host(pdev, hpriv, &st_ahci_port_info,
 				      &ahci_platform_sht);
 	if (err) {
diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 8aed7b29c7ab..1a7060646009 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -483,6 +483,9 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
 		goto err_out;
 	}
 
+	of_property_read_u32(dev->of_node,
+			     "ports-implemented", &hpriv->force_port_map);
+
 	if (child_nodes) {
 		for_each_child_of_node(dev->of_node, child) {
 			u32 port;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
