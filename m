Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B85FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STcox88mUH+VdAhq8p9+4+XG107fbNNN1YjCyQgqCOI=; b=H36dSLC6SS1Fi8IpCUl5eC7wel
	wk1evGfJr98BFtCkxLwOWXUtr64mANaFSROkQpPHnNnpkOc1gtuGV8snVXVKr/k7zt50sknWTtn5N
	La03XAYIL5n63yARVAvSHCSS7hkaNVQrcF8lvrsWDpGyOos/1dSH1fW9CbHsEkb+1arschnk7g4ha
	3l/DfeywOgE5nkd+i00U/OjMSHxkDjc4KSsf4FdCyA+adMWrYzhZX7jwK2arGtGWuxTKX1XsVbdAc
	q77zIlWP7qocvrK6Me1nQAhu46mqZe0cb24XXOYhyuEYJLYeeyKR5+D3ekDIdvzm6OWMra7cEe+mg
	z6hJjcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SXR-00EZck-9R; Wed, 15 Jun 2022 12:54:25 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1SWr-00EZJX-T0; Wed, 15 Jun 2022 12:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=STcox88mUH+VdAhq8p9+4+XG107fbNNN1YjCyQgqCOI=; b=O5P73Q9Qzq5L30Hih2OX0VQl6k
	gn5V5w9d7DQLXSwcs0s/7Pj1gS9DkCpladTxY0nLSwA5vB1DQI7e0VIzHByv7vfkjexlpt0z7c9GR
	bO8Fbg7nkKatNE4FiIiYtXfsK97SZYDg2g4E0re0XcEWKk3qcsdlP+RgdVuFehvLUtn0=;
Received: from p200300daa7110200c95c40f4ac0d06a0.dip0.t-ipconnect.de ([2003:da:a711:200:c95c:40f4:ac0d:6a0] helo=Maecks.lan)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1o1SWf-0000WR-DJ; Wed, 15 Jun 2022 14:53:37 +0200
From: Felix Fietkau <nbd@nbd.name>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND v10 2/3] PCI: mediatek: Allow building for ARCH_AIROHA
Date: Wed, 15 Jun 2022 14:53:34 +0200
Message-Id: <20220615125335.96089-2-nbd@nbd.name>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615125335.96089-1-nbd@nbd.name>
References: <20220615125335.96089-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_055350_225441_F35A12B8 
X-CRM114-Status: GOOD (  10.57  )
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
index b8d96d38064d..2f6806dc2a20 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -237,7 +237,7 @@ config PCIE_ROCKCHIP_EP
 
 config PCIE_MEDIATEK
 	tristate "MediaTek PCIe controller"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI_IRQ_DOMAIN
 	help
-- 
2.36.1


