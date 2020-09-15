Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78D6C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:11:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DA6206B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rj8YV9aI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UDw6mJW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DA6206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hnozp+9ffoQpkk02O+HZU6EW3fUKJh4A2wW86r7XVq0=; b=rj8YV9aIKu/NQ3gQeGpnwwYqWa
	E92hy8k108GSmPPHhcx+X1Vv0zkqtm1tv82VbggJqRGKkKU4jF9/d67uFHCLr9DLig5kSfD/HTOPg
	aQw7GGAY08wlAtPyoonPg/7NhlqQy11pxgPVY5beK++iZCJtfot4qmZ2GELkIQLYZ3i3UFbqL2uxv
	IaCa/vnZFArFkWeP6ZACnmzOtCqrZ8CZFL3W+bTJ4z6dbxTYp7NIllU+R6SZzqsToSM/6EA961obR
	VTVmoEKOUDj08ijtZMAFkt+SaIdAKJ6OQBuNMCeBVx5+1yCl+TC+ZLOrvIS55w187Dzy0pmXdQg1B
	0NkvD1WA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4B6-00063R-K9; Tue, 15 Sep 2020 06:10:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4B0-000620-CY; Tue, 15 Sep 2020 06:10:52 +0000
X-UUID: 9ebe53eb0da04e23a60442933b8d3494-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=X8Z5QB7G03Bfi4YPnNUVk/455t8rUc87yOD3C0YOlFc=; 
 b=UDw6mJW3/6WPLLn2MutNScXMexqbsbxpIj3VpjBsE8P1AI9mZAtgbSArRiYlYCDZr8pR5ffQV2Ee4Ruz6QvR2YDRE/4O6zP1+kVRQKQeD6kpmPhT8u5rRBBsqbbAJqO5S4KXYuZwk+7ubxi1czczW6ZPIcalkIGvF4q+meBq46A=;
X-UUID: 9ebe53eb0da04e23a60442933b8d3494-20200914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1495968081; Mon, 14 Sep 2020 22:10:47 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 23:00:44 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 14:00:42 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 14:00:42 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: 
Subject: [PATCH 0/3] Add mmc support for MT8192 SoC
Date: Tue, 15 Sep 2020 13:58:32 +0800
Message-ID: <20200915055835.25590-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_021050_577224_4B0A3475 
X-CRM114-Status: GOOD (  12.59  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Wenbin Mei (3):
  mmc: dt-bindings: add support for MT8192 SoC
  arm64: dts: mt8192: add mmc device node
  mmc: mediatek: Add subsys clock control for MT8192 msdc
---
This patch depends on
[v4,1/3] arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile
[v3,1/9] dt-bindings: ARM: Mediatek: Document bindings for MT8192 BSP
[v3,6/9] clk: mediatek: Add dt-bindings for MT8192 clocks
[v3,9/9] clk: mediatek: Add MT8192 clock support
[v3,1/3] dt-bindings: pinctrl: mt8192: add pinctrl file
[v3,2/3] dt-bindings: pinctrl: mt8192: add binding document
[v3,3/3] pinctrl: add pinctrl driver on mt8192
[v2,1/4] soc: mediatek: pwrap: use BIT() macro
[v2,2/4] soc: mediatek: pwrap: add arbiter capability
[v2,3/4] dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
[v2,4/4] soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs
[2/8] dt-bindings: mfd: Add compatible for the MediaTek MT6359 PMIC
[3/8] dt-bindings: regulator: Add document for MT6359 regulator
[4/8] mfd: Add support for the MediaTek MT6359 PMIC
[5/8] regulator: mt6359: Add support for MT6359 regulator
[7/8] regulator: mt6359: Add support for MT6359P regulator
[8/8] arm64: dts: mt6359: add PMIC MT6359 related nodes

Please also accept this patch together with [1][2][3][4][5]
to avoid build and dt binding check error.
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=332621
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=342593
[3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=330017
[4] https://patchwork.kernel.org/project/linux-mediatek/list/?series=322937
[5] https://patchwork.kernel.org/project/linux-mediatek/list/?series=323171
---
 .../devicetree/bindings/mmc/mtk-sd.txt        |  6 +-
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   | 89 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 34 +++++++
 drivers/mmc/host/mtk-sd.c                     | 77 ++++++++++++----
 4 files changed, 187 insertions(+), 19 deletions(-)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
