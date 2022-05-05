Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C346BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vAflMIaRoAIktqF8fIHwu9nK7l3VEIQ+vFcMF5UlAVc=; b=slaPKWTj5oX4gW
	q+bRAREMSpsZe0EylvsJrBNKhRbVZtg0+AHqPq3fvSkpTZIuv2feXtXWg+eYOgAPyxhrQe30Hk/DW
	MiEd6opmBR+DG7WVG1pCiQz9FBtOKNNGVmZhsUGuHbNK2k6hMO4dDM1Arq9/Nxy3Y6hYGLgWQ2zBb
	4DxyR5eU4JRXjUPQg9Yt8Vz879gNcf/p4BBwtlNqWywQCPbKTRwJzMGJ5EX3OG1lZVWNhYf8DLMQ5
	AH7CafwluCIN4Myu/hVDGXoN963WlWdtlZUNKY3EtnSmfB5wGayadDva3TZcw4U3E6nEc3thJHRIg
	QmNHes/42iRhXu29e29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmX1O-00Elvy-9m; Thu, 05 May 2022 08:39:38 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmX1J-00Elqt-Sd; Thu, 05 May 2022 08:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0S0y/Rdk5Z4jKRvQmXg7i6mtMuCdFPTssifWTZDLJYc=; b=gaoOwYpXivZzZ1DtvcqcuGuWnr
 9asAcKr/aWFEoP1l/b0tBhBIoJnDAwSSCxvgDbjuvaCAGi6KmqXdB6iys0TftjF2fnuwjpFKSu+R3
 C1lXozBHaxkYi3xnGPq4YS3Dud5xTGpthOeFdlVd+p5H/tERa1XWoU89zv6NdNG5k1gw=;
Received: from [217.114.218.24] (helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nmX0z-0000IR-Lu; Thu, 05 May 2022 10:39:13 +0200
From: Felix Fietkau <nbd@nbd.name>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4] PCI: mediatek-gen3: Change driver name to mtk-pcie-gen3
Date: Thu,  5 May 2022 10:39:07 +0200
Message-Id: <20220505083907.86598-1-nbd@nbd.name>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_013934_287406_BD183A61 
X-CRM114-Status: GOOD (  13.12  )
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

driver_register() will refuse to register another driver with the same name.
This change allows pcie-mediatek-gen3 to coexist with pcie-mediatek built into
the kernel.

Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
