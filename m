Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LpV6Z/hwHvEOJHMFXh8gM3EUrhvsp3zxdO6o1lQNp6w=; b=Rsruno4lC5UU2Z
	V5l3icSjPO8izSB14PV088DQXIL144xfdT/WyPmEne8k6iYHkI/+nU/Gm8EJmHAuourjba872GTbw
	bgN37ZFd/l2Bp+uP+j8v1fAo/Hw7pHm7uPtlMPD6XJ6BN465PjJvRWOiNttQXXxIpkXztY9tL4ZXp
	e5Y1OCVF7jc/0Ui8xYqgtq/m33HboMEJmub6B1UEyWqXSWo1q6Q/iDIVt+YJmhetrPsRbkEYjZJOk
	cOdK4JsdwSEjCeMFDbKN8N7DLkdwoeTvCXAwnRM0KNwEcTXcMKuHZyvYWcrYOiSFKu3C2zgEp52D0
	FYtR3jlpi94hULMcvN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSfR4-00GXg1-Ay; Fri, 11 Mar 2022 13:36:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSfQs-00GXZt-5A; Fri, 11 Mar 2022 13:35:51 +0000
X-UUID: a78d4f84b8cf4252a3e3bfa7272df427-20220311
X-UUID: a78d4f84b8cf4252a3e3bfa7272df427-20220311
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1630538469; Fri, 11 Mar 2022 06:35:46 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 05:35:44 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Mar 2022 21:35:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 21:35:29 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Jianjun Wang <jianjun.wang@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rex-bc.chen@mediatek.com>,
 <randy.wu@mediatek.com>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Subject: [PATCH 0/2] phy: mediatek: Add PCIe PHY driver
Date: Fri, 11 Mar 2022 21:35:25 +0800
Message-ID: <20220311133527.5914-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_053550_208528_5414296B 
X-CRM114-Status: UNSURE (   8.87  )
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

These series patches add support for PCIe PHY driver on MediaTek chipsets.

Jianjun Wang (2):
  phy: mediatek: Add PCIe PHY driver
  dt-bindings: phy: mediatek: Add YAML schema for PCIe PHY

 .../bindings/phy/mediatek,pcie-phy.yaml       |  71 +++++++
 drivers/phy/mediatek/Kconfig                  |  11 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie.c           | 198 ++++++++++++++++++
 4 files changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
