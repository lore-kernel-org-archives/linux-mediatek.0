Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAA6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 15:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OloxL41416j0dtlZQrOwSKVoKWWxTAqOsy1vcR6cR6w=; b=SKLrbFSl8mkgKWaXmdviuN4NmW
	HM/KH4S/r4DBErKpcOn+DUaJrwzqYEpJSfP+zSlgMtpxgynOoZveIHeqW0CUDF1iSBcQDGJ0BUD31
	kUJEK97AdEq8y/M/X3A6ep3usrwa++v+TJgGrTI52PPkGKj0Au6yuay5bNAnGjpyj5el1URozomop
	fdiDKf/MTqqv00xNnd5sRDOLrjPNDqswmd272KzO3lybHFsHIumPe74DchcvqVGwjLYZ8ZLWDrliI
	4QkzT3DoxgZO6G91zsR1RM30EauR2u/UlQ0JzOrkXvHdRn96HorP/IbkgTuK3MpNucEAtYqkzxwxV
	vnldRtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paexT-00F4RW-3k; Fri, 10 Mar 2023 15:47:03 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paewm-00F43C-8m; Fri, 10 Mar 2023 15:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OloxL41416j0dtlZQrOwSKVoKWWxTAqOsy1vcR6cR6w=; b=PQcEwwxWD5giAesV9944Oyz6i2
	L5GPw7MoyYbNHeKnhLuX7h7vU1KLiAinzB60nNPN3Yfoa52Wxwa3CSPpUis+UWQ4aTwHvwzmO0QMb
	cXoXOaF3+JnNvwTyfwc4DQEkamkTGOnDazYxgSe3YZJtdw7eFY8yN4HffwZT2q7Hg84z7o8qsavIi
	cKz16YpnYzbX+4oVbeK2hEN5H9Wlv9jiPQutkRHQgoYgjBo/NjDIRFx5LTXntI63EVyjXLdxorPWh
	ml59SLLvm5q+/zUE+3XJEt1W/IGPU2Zi4UdjcDu2ELl4DGPhYlMULltuyxD/FyibbDHAqh6TPu+cw
	rl83V57w==;
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pae1c-000UQa-0D;
	Fri, 10 Mar 2023 14:47:18 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-176d93cd0daso6077094fac.4;
        Fri, 10 Mar 2023 06:47:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OloxL41416j0dtlZQrOwSKVoKWWxTAqOsy1vcR6cR6w=;
        b=6WEMxNmm7QAU22ZKYprGUtr8cP3y5ZGVQ5HTIwS739kHFt18rd/GMAhdGwbkLFC/LC
         r9t/nsRKLCQU1FrL66AfqV8a7PtYi0tA6Sqj19fWtB9TARCW5gAzGYC/HyDlHnS3ELvO
         ajb8PgRaCLNguSRle7O7qDIgsaFGTlhCNaOqp4pvq7D89KERul/GeCf22fMiPgrM7BAl
         p3TxX+3Q3YLLIgFElWKJKtCcr38O/4Bu+re8dw6G9HNyKmGWtU4seu1CsYYUUgyj4HT5
         00n2SlGTR1bRf1gFbpOaE12v6kRg2fnD9R0yEmYig5csCe0P/xpl7kmtGMe3EVxHD+Or
         r8Lg==
X-Gm-Message-State: AO0yUKVdmAkxfsbjOb95pD6NeXo38aHKu0MAykCIxsB2YUlGtqTMi+Fd
	SbfFTTHn44J+Xy+b8E0Dqg==
X-Google-Smtp-Source: AK7set8cE4u5Ar/WSEdd16NF/1QGLSArsjjzwCLB+imXcXgcq/h7vUoNgg1qv4X2jNW3kiukcdtxwQ==
X-Received: by 2002:a05:6870:560a:b0:16e:7440:db73 with SMTP id m10-20020a056870560a00b0016e7440db73mr17913111oao.26.1678459630847;
        Fri, 10 Mar 2023 06:47:10 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s26-20020a05683004da00b00694303567b0sm129607otd.29.2023.03.10.06.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:10 -0800 (PST)
Received: (nullmailer pid 1541461 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:00 -0000
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: devicetree@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] ata: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:00 -0600
Message-Id: <20230310144700.1541414-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_144716_345804_FC2A4A4E 
X-CRM114-Status: GOOD (  15.26  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/ata/ahci_mtk.c         | 2 +-
 drivers/ata/libahci_platform.c | 2 +-
 drivers/ata/sata_dwc_460ex.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
index c056378e3e72..5714efe3f8e7 100644
--- a/drivers/ata/ahci_mtk.c
+++ b/drivers/ata/ahci_mtk.c
@@ -106,7 +106,7 @@ static int mtk_ahci_parse_property(struct ahci_host_priv *hpriv,
 	struct device_node *np = dev->of_node;
 
 	/* enable SATA function if needed */
-	if (of_find_property(np, "mediatek,phy-mode", NULL)) {
+	if (of_property_present(np, "mediatek,phy-mode")) {
 		plat->mode = syscon_regmap_lookup_by_phandle(
 					np, "mediatek,phy-mode");
 		if (IS_ERR(plat->mode)) {
diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index b9e336bacf17..f00da19670b0 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -363,7 +363,7 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
 	switch (rc) {
 	case -ENOSYS:
 		/* No PHY support. Check if PHY is required. */
-		if (of_find_property(node, "phys", NULL)) {
+		if (of_property_present(node, "phys")) {
 			dev_err(dev,
 				"couldn't get PHY in node %pOFn: ENOSYS\n",
 				node);
diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 21d77633a98f..3a30e6eff8a8 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -810,7 +810,7 @@ static int sata_dwc_dma_get_channel(struct sata_dwc_device_port *hsdevp)
 	struct device *dev = hsdev->dev;
 
 #ifdef CONFIG_SATA_DWC_OLD_DMA
-	if (!of_find_property(dev->of_node, "dmas", NULL))
+	if (!of_property_present(dev->of_node, "dmas"))
 		return sata_dwc_dma_get_channel_old(hsdevp);
 #endif
 
@@ -1180,7 +1180,7 @@ static int sata_dwc_probe(struct platform_device *ofdev)
 	}
 
 #ifdef CONFIG_SATA_DWC_OLD_DMA
-	if (!of_find_property(np, "dmas", NULL)) {
+	if (!of_property_present(np, "dmas")) {
 		err = sata_dwc_dma_init_old(ofdev, hsdev);
 		if (err)
 			return err;
-- 
2.39.2


