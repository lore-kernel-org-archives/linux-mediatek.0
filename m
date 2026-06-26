Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220F6CD4F26
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1aJai2EacD3fT+kMpiw5eHMwfJpEII/nsylCRovDvHU=; b=qIysujkgiDAgGXr3fLzcZISGKj
	hCaEJ8tXB/DiaDEpFs03kBDmx5J5XJuWpvhDkIM6DWkAK+1Pik1mtPMryY0OE8wEhN4dk4JK6J8Dd
	h8dKi3PvAcOaQq4Y0uinTULe/CeRh74sY8R4vIQQNK9Djkl5nHnGEBTmqI+W9fLvtqpoQ6TuaKkNy
	2HBjEg99RoEllOhvPN7ZDsIfBl4eY5cNanV33meYmgS+bHplpPaLgGwamkGYolLzNE83XsIjMnMgE
	BJKT2FJYT5dJKXWm6nJ+LEPOsiGKRMY7GxRI5Rpebe3oy3zou7voBccNWE2CxtrPODL85PnUq2RSj
	iKprIqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Id-0000000AiTU-3kg5;
	Fri, 26 Jun 2026 07:48:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ib-0000000AiSd-2C9I
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 07:48:30 +0000
X-UUID: 6926eac0713311f1acbe4559397dec65-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1aJai2EacD3fT+kMpiw5eHMwfJpEII/nsylCRovDvHU=;
	b=JAwBeFVfpyk/oiRefL/ZvMmw2VqbymGgzQGB9Hm2JcrMbiHppkNNIJxyJi8UMbf6rRwZHCP8aDny5XEtSSjFbBbolY+RY2ZWp2dXnXa4JvmemyuyIx1hdHvY4wDpjaY5ZPbaMTg0EzfJSdp4punV7xiCuzh6KSeKL0AET05z3O4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:9231d467-d98b-4103-8f19-cef490fd6459,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:f01f8fa5-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,SF:102|123|136|836|865|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6926eac0713311f1acbe4559397dec65-20260626
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 936761699; Fri, 26 Jun 2026 00:48:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 15:48:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 15:48:22 +0800
From: <peter.wang@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-devicetree@vger.kernel.org>, <peter.wang@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 0/2] reset: mediatek: add syscon-based reset controller
Date: Fri, 26 Jun 2026 15:46:07 +0800
Message-ID: <20260626074820.2537772-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004829_586358_6840AA79 
X-CRM114-Status: UNSURE (   8.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Peter Wang <peter.wang@mediatek.com>

This series adds support for a MediaTek SYSCON-based reset controller
that manages reset lines through memory-mapped registers within a syscon
MFD block.

Peter Wang (2):
  Documentation: dt: reset: add mediatek,syscon-reset binding
  reset: mediatek: add syscon-based reset controller driver

 .../bindings/reset/mediatek,syscon-reset.yaml |  93 +++++++
 drivers/reset/Kconfig                         |  10 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-mediatek-syscon.c         | 230 ++++++++++++++++++
 4 files changed, 334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek,syscon-reset.yaml
 create mode 100644 drivers/reset/reset-mediatek-syscon.c

-- 
2.45.2


