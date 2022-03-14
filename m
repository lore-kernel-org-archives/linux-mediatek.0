Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB6FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96QMI2xqsxLXu8CWJydINXTGAPHCM+P7ofZHT2ZyvyA=; b=j7jBVNI9Vw6Myn
	Kd2wpYdl17jRJZrgWkk5Z3SeGHrI9ARZGUnpZigaQDf11Y84WPovlt9nqjzEDbnrkwlJc9ut3WZ5H
	NUls0Wv7oeiYlsbKLDzDura74U8f36Uc7t1GU+eQUbf5nEk4f5VPmMjc9Lu6PkaQ5zhqV2wM8az0Y
	aGOV3/b2hh2L9FsDJ51NMJSPhcGwOD9xfl9Wz649j1Rrl4l9OSgsyAEEqKPqOlNxex2umnpF17Ljo
	U0gCwQJDGPn0boTp1nCYdpk+l4mfLV+V/ccUHmPwy5dsUErFBg3FRqrVexSvbA2+1ETYkIiLediYT
	qA5pocxhyvz1x/vPBeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgMR-004bM4-HL; Mon, 14 Mar 2022 08:47:27 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTgJY-004a5O-71; Mon, 14 Mar 2022 08:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z/5UNriyrj8defLJ4oKkkrpPkuAVFAS/OEtzwbbbsAs=; b=BEPUyk3bumAs5tUAqhPenNG5tl
 Ad0iWvPwDfTZzSkGX2rNPB39NsNs19kzqNWcswa++Ah+uSDasBmltYwcEg6cXCMAJwxrI2N1T5nNC
 OvZobC5zxIbMZHLNiWad/PbC96I3mdKB5PFqcWm2yu+rVkgnOGNGo8arto6qZxcq7iSs=;
Received: from p200300daa7204f006c015a90d6b6c4d6.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:6c01:5a90:d6b6:c4d6] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nTgJS-0002UN-4o; Mon, 14 Mar 2022 09:44:22 +0100
From: Felix Fietkau <nbd@nbd.name>
To: soc@kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 5/6] PCI: mediatek: Allow building for ARCH_AIROHA
Date: Mon, 14 Mar 2022 09:44:07 +0100
Message-Id: <20220314084409.84394-6-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314084409.84394-1-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_014428_472108_F412C024 
X-CRM114-Status: GOOD (  10.87  )
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

Allow selecting the pcie-mediatek driver if ARCH_AIROHA is set, because the
Airoha EN7523 SoC uses the same controller as MT7622.
The driver itself is not modified. The PCIe controller DT node should use
mediatek,mt7622-pcie after airoha,en7523-pcie.

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/pci/controller/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 601f2531ee91..17d9635c7038 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -233,7 +233,7 @@ config PCIE_ROCKCHIP_EP
 
 config PCIE_MEDIATEK
 	tristate "MediaTek PCIe controller"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI_IRQ_DOMAIN
 	help
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
