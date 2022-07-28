Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7769C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 11:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN5otZtaF9CvsvN8xDg4hfI27Py58tK5oPBqkl4So5E=; b=dqTP1R8WmHXdFumH+FuamxAT4d
	hu0k1Pc7oxsrgOEGZvR7cVdWZ29gvlLBEPh+9dBlN5mW6tObDIsMi2rQm3gQDBGlohEPHN59v9JeA
	4QvjNB3S9CyZdVIPjvBznQW9q71sZ2Wnj4laExmhtcOp9AUhtuejBK50z3XM7jpv7/IirskvcuL5e
	Avadzt5aK2xa109Bl8BxwJsKBFJs5BqDDvigJl/4E8rlZ5YYc7yfRojUIW1oq3wpqwsV/8WevFRvT
	O49uqtjI9V/MLPhorq3A09xeSw0irWdn6A32qpQFJSQ6LWDvoBkZnti5mDrEYNCe4xc9O/lHjM/AH
	n1ixcFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1i7-008ie2-MC; Thu, 28 Jul 2022 11:29:47 +0000
Received: from [87.245.175.230] (helo=mail.baikalelectronics.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH1hq-008iX8-LV; Thu, 28 Jul 2022 11:29:32 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 3F00A16D7;
	Thu, 28 Jul 2022 14:21:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 3F00A16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1659007306;
	bh=PN5otZtaF9CvsvN8xDg4hfI27Py58tK5oPBqkl4So5E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=df3MQX0szmnTC5vPaNKeLMR/BD2BT4LyJLZaqnji8/ECQ/Un3K9mPnMU0YuYOfhI4
	 AxA0X41TPAmQZovd6xDmM+E7e78tEeJhWopFCNtOV3JK5HGBfnK5P+DCNOh1SkX0GX
	 9pNs7rgIlmFdRFSMNQHJimXxsgow5mrsphbx2/GQ=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 28 Jul 2022 14:19:21 +0300
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
Subject: [PATCH RESEND v6 09/23] ata: libahci_platform: Parse ports-implemented property in resources getter
Date: Thu, 28 Jul 2022 14:18:50 +0300
Message-ID: <20220728111905.12427-10-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220728111905.12427-1-Sergey.Semin@baikalelectronics.ru>
References: <20220728111905.12427-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_042931_084248_4B557A34 
X-CRM114-Status: GOOD (  14.40  )
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


