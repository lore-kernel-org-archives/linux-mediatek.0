Return-Path: <SRS0=Oz0f=PY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 20:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAA5611C0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Nov 2021 20:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDAA5611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gVEADxAOY0zgDEJ+RoXi/EJWUwlcM6BaDM5/E4+mrt0=; b=AA7jqlg3GHNU/X
	ygEsbBWDxhMyrJF4bNcwrNueBmf2AoDY46d97MPQn1u6+ogyR2UtLII4nqa/tiH3JCuRPTxXTWdkV
	GbC6qz02W+aaHUADXhzq9hmO3VpeN02e7GT1NiAB3wne22iQkZG/sxDo+JTsuOZ5VBCxiUwUeyLUQ
	XtqUY6UD+t+7FbMcUGNxWR9asC5uX+H364JJHwCcquS2z+rkFV+Rxz3df3/DeZnBp7CLsmgdRPeS5
	fYQ4gBVNMh19F0Dh5VS205aBZTXvYk5HxUmRbssarqr/AUAOc3t2CdMfXVrHU1Cc4nOuAM6U1yN2x
	A7n91JNMmeYDIm/mRGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj5pt-00CHWp-Fz; Fri, 05 Nov 2021 20:29:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj5pr-00CHW8-65
 for linux-mediatek@lists.infradead.org; Fri, 05 Nov 2021 20:29:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 90E27611C0;
 Fri,  5 Nov 2021 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636144154;
 bh=v24JrlUtPh/fIqVwA0XqHebX4ahl48yzolKYIo3a7w8=;
 h=Date:From:To:Cc:Subject:From;
 b=hmXXB12pRp8nJ8CDaRLHr+/l6u5E6lgh5EvW7od/phJ5rkBkrPkX3d7+CCUFL05he
 csk4snElIBQC5dy4bqzW1ymJZIyChAuONcdSBWlY8RdszkeExGT8Abn6zrUjil+NcW
 2hv+f7aMiy4JUZ0JaINtAdYEOKbT9JwYg+JYt8jLO/5NWWA/bW5hWxyfuSMmiBGWVA
 s0GY8gfg7WReDUu4RXDDurkyL0UQTKSPiD+PgXl1oK4Fa90tI7mg4uuuAjn96N24v/
 YO0Y4YG9uvDYEHVP1MW4KOSPqrkvmaWjBuExPy/cikv+dST2viif+9qNIOqSvFHrJA
 nCyGnvXBkNYlA==
Date: Fri, 5 Nov 2021 15:29:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Fan Fei <ffclaire1224@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Distinguish mediatek drivers
Message-ID: <20211105202913.GA944432@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_132915_266276_7FD29ED9 
X-CRM114-Status: UNSURE (   4.67  )
X-CRM114-Notice: Please train this message.
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

We have two MediaTek drivers: pcie-mediatek.c, which claims:

  .compatible = "mediatek,mt2701-pcie"
  .compatible = "mediatek,mt7623-pcie"
  .compatible = "mediatek,mt2712-pcie"
  .compatible = "mediatek,mt7622-pcie"
  .compatible = "mediatek,mt7629-pcie"

and pcie-mediatek-gen3.c, which claims:

  .compatible = "mediatek,mt8192-pcie"

The Kconfig text does not distinguish them.  Can somebody update these
entries so they do?  It's nice if we can mention model numbers or
product names that a user would recognize.

  config PCIE_MEDIATEK
        tristate "MediaTek PCIe controller"
        depends on ARCH_MEDIATEK || COMPILE_TEST
        depends on OF
        depends on PCI_MSI_IRQ_DOMAIN
        help
          Say Y here if you want to enable PCIe controller support on
          MediaTek SoCs.

  config PCIE_MEDIATEK_GEN3
        tristate "MediaTek Gen3 PCIe controller"
        depends on ARCH_MEDIATEK || COMPILE_TEST
        depends on PCI_MSI_IRQ_DOMAIN
        help
          Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
          This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
          and support up to 256 MSI interrupt numbers for
          multi-function devices.

          Say Y here if you want to enable Gen3 PCIe controller support on
          MediaTek SoCs.

Both drivers are also named "mtk-pcie" and use the same internal
"mtk_" prefix on structs and functions.  Not a *huge* problem, but not
really ideal either.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
