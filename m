Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE85C4727C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 13:12:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F37322074A
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 13:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AJ9uy2Zw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fCvkD3jJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F37322074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cDb2Rvmmbv8mGdzLkJ1XD4w1S3h1M67OaiR1s1VAbJk=; b=AJ9uy2ZwfP1Orj6X4WTrSILves
	YtZNN+kRXSIDGMcCWAQe94uMmnjy7zme4yHCBw2hoPFJsc6xs7uQl6qtxV/E6tbXtM1fv/0cLYNMo
	mISZSBDCHfg2I5QcAgt19mLfZ07ha5i+RDCuZh+aq9r7FFntXo9QLnVW9I5QmwwE+eoZcqJv+J+c8
	Tq7QDsWeowrt0OLMEjq19K091geHPNcAPqq6UVprZZole6zTIs0ag50Qdu2Wnl2c4pX3FOWSPxmeo
	zxWc+CmBFxBrtoiPHQqTDo1+iG6x+gAULgVoKgLotNUJ2wl8J6VjLixG2I8F/90cO9TuF3dbq8cw4
	NKCP+XYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMsxP-0003Jq-5s; Mon, 28 Sep 2020 13:12:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMsww-00039m-Bg; Mon, 28 Sep 2020 13:12:18 +0000
X-UUID: c4b6f3c0571d42789968c978aeaaf373-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HAnA55pH2gnLs+1hkZyu5tVa5XboVMuVkFZwZIdK4vo=; 
 b=fCvkD3jJOa2dxniqJzocCkOHJ4PkBknLrM2bCzptbmxv9FgA2NmdjsK1or441z6Ievja+CjUlX9t75OSGfMkZsfkFn48Z7QJFReSAglYc61QaE+22BBMQ220h9CG7T7iZRvg8etqx7e6Ju97lAwNuYmItnHFN4wz3lMNkuy2i5k=;
X-UUID: c4b6f3c0571d42789968c978aeaaf373-20200928
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 51429146; Mon, 28 Sep 2020 05:12:01 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 06:11:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 21:11:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Sep 2020 21:11:57 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] Add mmc support for MT8192 SoC
Date: Mon, 28 Sep 2020 21:09:14 +0800
Message-ID: <20200928130918.32326-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_091214_548026_5A444C82 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change in v2:
Convert mtk-sd to json-schema

Wenbin Mei (4):
  dt-bindings: mmc: Convert mtk-sd to json-schema
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
 .../devicetree/bindings/mmc/mtk-sd.txt        |  75 --------
 .../devicetree/bindings/mmc/mtk-sd.yaml       | 176 ++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts   |  89 +++++++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  34 ++++
 drivers/mmc/host/mtk-sd.c                     |  77 ++++++--
 5 files changed, 358 insertions(+), 93 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
