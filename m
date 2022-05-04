Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D601C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z1zbW2j5ktlz33MSosrbIvKpMfuiryP5NJvaDjF141M=; b=rOQ5ukYP90uATQ
	G0jJOqR3icV+XXGgsMqAQ2e0UbUmSH2naNEuRDVnCN1rzEMSP/n3mg0UAsOaIimjsyNT1IhAx7cJ2
	Ifz4yES5/SopWQlS1WPDAN6pBGF/K3Lw0mp692z8d2wACdl1poSuiD8ulkyginUybGumM7xICnydc
	nxQkC92hjXjBJQ1RMxdW2hnZrjhTqxV73UCvfr4KE7Q4B0HXkdOKtlDRsw9TbqwGSJNWGKrALYOoQ
	NpD9nKizlOAJt3GRA0MU1MK9GikXvP9FJtGz9hIwwaeprx+YD2RH16HXN1qt9N2h7lcchgy8IBjMm
	AK1AMhbIzOIKvAhg9I6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmBte-00A9qK-Cu; Wed, 04 May 2022 10:06:14 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmBtb-00A9p0-C8; Wed, 04 May 2022 10:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QFtJkn5BuBJmX8Cb0xWWHrPPY+oTpRZoTPus45vNpxs=; b=IQnS1Iat5s9IUVBlsUtsC6SNEQ
 FrgVXD48EVV8xxC+s9Ngx87L8drjwRWZfnU1Rb5cgnFR/bFhyxH1xVrqJMdyNuc3StlDcjyzC6OYA
 +qmz/CzzxXw4dbxtfZhyRRWicgYeiQsgDDkSxXSKyDejMDL95WkkiARbnQWigsRbaKJU=;
Received: from p200300daa70ef200891a2ae4514fd280.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:891a:2ae4:514f:d280] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nmBtO-00029r-EQ; Wed, 04 May 2022 12:05:58 +0200
From: Felix Fietkau <nbd@nbd.name>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: mediatek-gen3: change driver name to mtk-pcie-gen3
Date: Wed,  4 May 2022 12:05:55 +0200
Message-Id: <20220504100555.96007-1-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_030611_701060_BF093D2A 
X-CRM114-Status: GOOD (  12.56  )
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

This allows it to coexist with the other mtk pcie driver in the same kernel

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3e8d70bfabc6..2e665cd7e735 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1021,7 +1021,7 @@ static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
 	.driver = {
-		.name = "mtk-pcie",
+		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
 		.pm = &mtk_pcie_pm_ops,
 	},
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
