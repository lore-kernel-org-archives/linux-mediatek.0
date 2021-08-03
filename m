Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D85C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 06:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E68160F11
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 06:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E68160F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ehb0f0qCJDT524bWZBDh6ZNPwhFDr0T1hbXAkBWnMQk=; b=aLJdmGD3tGgsx+
	XmwuvCXSqMppG+QvjXy7szJBcaBeYA2DxQdxyk8jDDHx3UdJqqZIWyT1MZ2sMROuOKTJrROdDEhZn
	ES4uJ8UNssdSF5db0OUSUha47wdu/H5ts5dbeKl52pSfkOHAyyvNn8c8ZOWoY0a9PUepXbtu0Wbob
	erx1grrIeg046+EtY2+CMYTzHtTycn+xN7Dw4A4v2lah1Q25kbahXmTO+5WtmaY7TOPcpTbV9ANLR
	JREg4ftAwaWDaGgzICgKO2OlS/9rORA0sgGIb15yxyrwOiDh1ph6pRl1qQAC2MIAEME/TAbbtRAuk
	jGimwNmda9yoZl/DG4iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAoAj-001K0N-Ag; Tue, 03 Aug 2021 06:45:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAoAD-001JoN-9b; Tue, 03 Aug 2021 06:44:35 +0000
X-UUID: eee75626954e4d719de5a391d78475e4-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HtaQfTY7cmMPUIgLBdMhbQuU6T9/zWpnLYA6vo/ykO8=; 
 b=RJvjfOH1UDTm+PrMAjpsIJ9eON1fX6iQFInMJdOGfhq+VeteKeR919xXNjYifHktNVp0qJjZSzl/NBsIgin22EUBptiW/bXziSF8dUiMtCTsFNvNpuf8uNUTTxwRSWBFrPP4Sx2bmT6xyWs+cOnXQGYPmMuO78MetKtEWSp7cjA=;
X-UUID: eee75626954e4d719de5a391d78475e4-20210802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1776491138; Mon, 02 Aug 2021 23:44:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 23:34:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 14:34:26 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 14:34:26 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v10 0/5] Add SPMI support for Mediatek SoC IC
Date: Tue, 3 Aug 2021 14:34:16 +0800
Message-ID: <1627972461-2627-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_234433_384256_FEAF8EFC 
X-CRM114-Status: GOOD (  12.11  )
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

This series adds support for new SoC MT6873/MT8192/MT8195 to the spmi driver.
This series is based on Chun-Jie's patches[1][2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521655

changes since v9:
- rebase to v5.14-rc1.

Henry Chen (1):
  spmi: mediatek: Add support for MT8195

Hsin-Hsiung Wang (4):
  dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
  dt-bindings: spmi: document binding for the Mediatek SPMI controller
  spmi: mediatek: Add support for MT6873/8192
  arm64: dts: mt8192: add spmi node

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  76 +++
 .../devicetree/bindings/spmi/spmi.yaml        |   2 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  17 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   2 +
 drivers/spmi/spmi-mtk-pmif.c                  | 555 ++++++++++++++++++
 6 files changed, 661 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
 create mode 100644 drivers/spmi/spmi-mtk-pmif.c


base-commit: e73f0f0ee7541171d89f2e2491130c7771ba58d3
prerequisite-patch-id: 8e70d378642e084a14296dbaa2aa4e07c1d30563
prerequisite-patch-id: 82ced16215cdd31201c6146ddb5c30bc17525996
prerequisite-patch-id: 7f2137e77cfc439c2e4b4e4369a6d6b48fec1ece
prerequisite-patch-id: 15f52bb664f0f0436627d056a53afefb0b99f67a
prerequisite-patch-id: 479b44dfdc6d7b367c0d441d8635d2dc02466057
prerequisite-patch-id: 5df1858972e343d3750cdda1063655fc232eb831
prerequisite-patch-id: 7e63a29430f65c2a0d56d7353df884645d70ed8c
prerequisite-patch-id: 2a6200e8a05329d51aaa4fd63aacfbba66d16177
prerequisite-patch-id: 604d2702c4217b77de3dc305ff08f630ba38fdb4
prerequisite-patch-id: d3ece2688dbd45eee248a8c6ba3206c0c673c904
prerequisite-patch-id: 1bebe1cd9b267c974cae50c3df8c0f8f4f0b0b3d
prerequisite-patch-id: 3b34fe85667da5287bde9fd2378359be4a126266
prerequisite-patch-id: 5d3d139212ab304739b75f7638251703b95948d5
prerequisite-patch-id: 621291b21be177a63eaf6769aa6d2ee8ddb2ea2b
prerequisite-patch-id: 024f786586b409420782d24218b15f05f6476667
prerequisite-patch-id: 946aae93303bde26226289dc389c94de96a9dacd
prerequisite-patch-id: b3ddf6f2079c3c269bd24091243030a971c43cbc
prerequisite-patch-id: 5c0e0308aa8eb06ca6df6f5467bc925f2cc106ad
prerequisite-patch-id: d4e481acd8b970f08d3e4da9c8fc0ad6e1fff551
prerequisite-patch-id: 99db7309fbe1b9f73a07e25d5174db8976c77a2c
prerequisite-patch-id: cffbc99e9e60f6db43cf7879f17e05c5b041d312
prerequisite-patch-id: 69871b871ab339881b50a2d6988173050b6c7a4f
prerequisite-patch-id: 4f5900b98a0c7cbe62694f2477a6cb410187714b
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
