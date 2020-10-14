Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC60C43467
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:09:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5929521D7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 03:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hzEa9jQ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="r1mc4EDV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5929521D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AiQtz7l1vegZOAn/dvuVHOHx8SUZR7Qh00nH8yH6Xe0=; b=hzEa9jQ4z4zPCvZveXGKqfnhPH
	RpLSWr6sm3QD8DSRSeLmKNXPZxGBPdEQLeNSH07FGmVyeJg749aWpKwQy3+2c8DzMijVugIlup9Qg
	VxQR+Jbbz8JxcsMyy9GDt6UxMFUY4wyDCBg+YPUx+vLry9qcbweEMI8vIp0FG4JRzZXtgQvB07kAj
	OFPVdH5pT/Yy01ErYdJr5X7dzgrzEf3Iks4xTq3LMHz95aw/q9eAwSw10UiGHHAOUG2ZeGQpZPHIE
	PgVQZSaxWu1JiVP8hEMfKMwo60aE0xLO/ZeaEuT7bHTysrlCpXpMZ3d+P5fK/zKDRj7eI0QsAdzVT
	MDV54WgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSX9x-0007Yg-Dx; Wed, 14 Oct 2020 03:09:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSX9r-0007Ws-4C; Wed, 14 Oct 2020 03:08:57 +0000
X-UUID: 8dde10b3f7934df2845baa74583ebc6b-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nEv/nfQEf7Kv7V9kivAP7rJMl1OjvecHjq9vDRJ/g7Q=; 
 b=r1mc4EDVt5a/Z1MV9iIItpFbFqecrZZg+A5jn9jL1qT3nV/rgRIWJ0QL0TTtsad5zkhVzBXY0Lb9eez23ccmA2ZdDzIeSFWLBGxj0XxUcQeESXo+2ZbvcwtLTcw/EzZ+yznVAe0bYMSslErzznYBG6XzuMU8YcU0pIpFQKFi7T8=;
X-UUID: 8dde10b3f7934df2845baa74583ebc6b-20201013
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 179756254; Tue, 13 Oct 2020 19:08:51 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 20:08:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 11:08:47 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Oct 2020 11:08:47 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 0/4] Add mmc support for MT8192 SoC
Date: Wed, 14 Oct 2020 11:08:42 +0800
Message-ID: <20201014030846.12428-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_230855_350579_A22AC521 
X-CRM114-Status: GOOD (  15.01  )
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

Change in v7:
1)add "unevaluatedProperties" in mtk-sd.yaml
2)add Reviewed-by tag

Change in v6:
1)use devm_clk_get function for required clocks

Change in v5:
1)remove Reviewed-by tag
2)use devm_clk_bulk_get_optional instead of devm_clk_get_optional
  for bulk clks

Change in v4:
1)drop "vmmc" and "vqmmc" desciption in mtk-sd.yaml
2)add vmmq/vqmmc supplies and the pinctrls to required properties
3)change dbg level and exit this function
4)use devm_clk_get_optional instead of devm_clk_get function
5)remove else branch for sys_clk_cg

Change in v3:
1)change maintainers name in mtk-sd.yaml
2)change "compatible" properties to enum type and sort it
3)drop these properties: "reg" and "interrupts"
4)add "maxItems" constraints on these properties: "vmmc-supply", "vqmmc-supply",
  "assigned-clocks", "assigned-clock-parents"
5)add "minimum" and "maximum" constraints on these properties: "mediatek,hs400-cmd-int-delay",
  "mediatek,latch-ck", "hs400-ds-delay", "mediatek,hs200-cmd-int-delay"

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
 drivers/mmc/host/mtk-sd.c                     |  74 ++++++--
 5 files changed, 355 insertions(+), 93 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/mtk-sd.yaml

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
