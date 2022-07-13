Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAA8CCA480
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 05:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN5otZtaF9CvsvN8xDg4hfI27Py58tK5oPBqkl4So5E=; b=uOvwm71qDMNjrkhOEeqwTTnBIf
	Q4pAsnJbbBJ0cquIsPimx+s5ArwMULtOA4FVOyPHcyUG2mrTQ04eFNzuou6MdLYmZy06wHq75TAt0
	scTPKiMcVTRKT2Wvh+lUM/xJCq4VuciN7sfqadnVeqLBC8Ji7MNghHBfoni1u2nxFb5ArSn/8FoLZ
	zsP3wXB2IGgvfPB0yWBZrPzlDLzr5c54wYteHdQWI9CAdn4SRrCEbTNsOPQMQEw50yo5tt8ow6VJ5
	mR/Ui85lSqXGRlcikTzA5xjSiuFRHOgKP7AggWe68kRogboICIWpyEx+F7+o3psTCtQbuyO61OHgz
	wLhW2ERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBUwk-000G2j-5W; Wed, 13 Jul 2022 05:30:02 +0000
Received: from mail.baikalelectronics.com ([87.245.175.230])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBUwX-000Fy4-Jq; Wed, 13 Jul 2022 05:29:51 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 85DD416B0;
	Wed, 13 Jul 2022 08:31:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 85DD416B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1657690285;
	bh=PN5otZtaF9CvsvN8xDg4hfI27Py58tK5oPBqkl4So5E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=VMn/3FRNfY2KdjjU1hoW7mAs64yuMY2vZvkkzVCPF5S8K3KLLfTaJUHTtNvs9Py6V
	 NH+uOc7mKLzzsLP4tF25wX/VUGmCzOOUj9IV7paZHXNWWhxtCrLKbaFQc1DBQjvwEd
	 Jndqr6wb4ls91I1mT21NA08Oh0T48OmOmFFqB0GA=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 13 Jul 2022 08:29:29 +0300
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
Subject: [PATCH v5 09/23] ata: libahci_platform: Parse ports-implemented property in resources getter
Date: Wed, 13 Jul 2022 08:29:02 +0300
Message-ID: <20220713052917.27036-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220713052917.27036-1-Sergey.Semin@baikalelectronics.ru>
References: <20220713052917.27036-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_222950_062837_614BE037 
X-CRM114-Status: GOOD (  14.24  )
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
index 579039956917..02171ac02306 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -486,6 +486,9 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
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


