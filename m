Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA77C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Dec 2021 21:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IaFtz9DGjLEWRM74CUAdPbQVjrMjUjKGv9ZOOgOfJM=; b=bKIP0vF5LXDoy9
	Hp8joifShEkRk99KWAcIdqM0BY/8SkAZgg+vfJxJXk8c+6DcwZ9LGus9nQvQo2+KbxnYc8JNWNDFU
	1pqucGRj4pmQHpokK9SpsFeVkNsKqXcnWpeEj912cFdvQWYXrGMNobt/k17ElnDnxdF8o3xz21WwE
	5c4wG6qH31vF+vg6rkNoyHmWlkcZuzTRJdBulfa0yCj0Aar+55pus8fSvzJl++J2KCKfWy9tMo8n+
	/utmTC4tEsYjeULOkU10oUDg62yJ0Ot33TX34QG8RZgD2jQEa8tqXklsKUhgFNI3fnQrEFMpJsOJ9
	A/r58Hgav4648B+or7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzQCS-004TH8-IQ; Mon, 20 Dec 2021 21:28:04 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzQBo-004SxJ-Hj; Mon, 20 Dec 2021 21:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JWqi786giIKaSw4tSGdwpvXgr1JgtStfMmdgvrcLvio=; b=rlGlWIGfBBFY5PWUmFDUpm1mWq
 qDZ6R2ypBWQBL1VEtltKcvHhGjLjN7dO/tjODkZGhlMoEylq2jAZ7dUZukyRqJUWpYH5DrtIv0TFF
 I6CUXC4VijTKVvftAba0Io/mrRxQKsTBBEd91/85V5fWrMq+7cctb89y9LDRNl5oHlxo=;
Received: from p54ae911a.dip0.t-ipconnect.de ([84.174.145.26]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mzQ3r-0000zo-3j; Mon, 20 Dec 2021 22:19:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v8 10/14] PCI: mediatek: Allow building for ARCH_AIROHA
Date: Mon, 20 Dec 2021 22:18:50 +0100
Message-Id: <20211220211854.89452-11-nbd@nbd.name>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220211854.89452-1-nbd@nbd.name>
References: <20211220211854.89452-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_132724_788558_A35B88B8 
X-CRM114-Status: GOOD (  11.21  )
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

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/pci/controller/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 93b141110537..f1342059c2a3 100644
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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
