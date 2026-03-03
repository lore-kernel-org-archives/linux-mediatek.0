Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B312EB3648
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 01:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/0sEz2jINBRcc5irANs4F/1esK/f5shwDnPb1VrGRpU=; b=1I9RVcb1t2OqQW65l/11613p1k
	NN92CunXEqU86akarKUaoXAI7nk5nydThLGFX4LJ4lbwxD85EcYnJHxNu8vFjHadRG/2FFNl7nIsK
	LaxmzX3iH7a7JqcUgZT+6br4KcC4EBizLzqj3vwS1GgVB+8rbz9nrm/E1HETJu9GLDSArpko8ATOg
	6TtgSjVpmkHk8voeoj3g7ENXcMPDao59XCZVMq1flsy6nmyC6tw1in6T+lUuji/kd8CDbzfcIMGJO
	WWSdcNYOi4st2eHy9L+bouf0KDAIwg5eEc3MnsQEfkb/cRs6DjlBjYk2ufJrx35KUayHbekmjvFXm
	+LO2TNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEqk-0000000EMuL-0pBb;
	Tue, 03 Mar 2026 01:47:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEqh-0000000EMtu-3Lo6
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 01:47:00 +0000
X-UUID: db2ba1c416a211f1ad39f32c34db0b1c-20260302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/0sEz2jINBRcc5irANs4F/1esK/f5shwDnPb1VrGRpU=;
	b=AyhzdipDzLnPrFUb27ADVujk9CLn+LGCxDWOjVBSB0JNKecd0I8oaqQlNbymcgJOoPswadaqmuVJytolhCW5H2yGLoLPv6baWXnuwFCmYjYU7Q+BweqFZTcf2/JQEQZFtljN1zjU6S0sbzq347s7ddFZlIo6WrNZSl4pNRtmViQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:02eceae6-bfb7-45a5-991d-9effc453b9ac,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:3d2d2ff1-16bd-4243-b4ca-b08ca08ab1d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|1
	6|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: db2ba1c416a211f1ad39f32c34db0b1c-20260302
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1122997646; Mon, 02 Mar 2026 18:46:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Mar 2026 09:46:51 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Mar 2026 09:46:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>
CC: Jianjun Wang <jianjun.wang@mediatek.com>, Manivannan Sadhasivam
	<mani@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?=
	<kwilczynski@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>
Subject: [PATCH] PCI: mediatek: fix W=1 snpringf warnings
Date: Mon, 2 Mar 2026 17:46:48 -0800
Message-ID: <b835e360b42c5e0994f9301a34dbdf140a8d3ef5.1772493898.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_174659_844902_C561D650 
X-CRM114-Status: GOOD (  10.54  )
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

Fix the following errors in W=1 builds.

  $ make W=1 drivers/pci/controller/pcie-mediatek.o
    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      drivers/pci/controller/pcie-mediatek.o
  drivers/pci/controller/pcie-mediatek.c: In function ‘mtk_pcie_parse_port’:
  drivers/pci/controller/pcie-mediatek.c:963:43: error: ‘%d’ directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Werror=format-truncation=]
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|                                           ^~
  drivers/pci/controller/pcie-mediatek.c:963:38: note: directive argument in the range [0, 2147483647]
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|                                      ^~~~~~~~
  drivers/pci/controller/pcie-mediatek.c:963:9: note: ‘snprintf’ output between 6 and 15 bytes into a destination of size 10
    963 |         snprintf(name, sizeof(name), "port%d", slot);
	|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 5defa5cc4..75722524f 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -953,7 +953,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	struct mtk_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
-	char name[10];
+	char name[20];
 	int err;
 
 	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
-- 
2.45.2


