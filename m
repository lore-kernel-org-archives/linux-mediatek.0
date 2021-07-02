Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183CC11F6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 03:13:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC1161407
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 03:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC1161407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ll8zD8AWZymuWFSGk3/qxKuZBCWKTU8zldmu/96DJKI=; b=3fI2fM0RJ1iK5e
	BTmx6qa9md6O7x7oL7Dm0GzXB7rmsIi0XoQYawUaehHwq4r4sW5RJMdMEapdyrG1fgTUBBkOP+LGU
	jQLHuYSQmyrOlljGPeMVV5oSShffSoOtSNgK4Exv3Smi1AoI6yBfThpAUMHmer0b2ezQtI+X326xV
	iTfA1bOhUA/sFI+gJB8M8iDRxmfgVfcUftwnllHXPdynE5q757ZGSlHMKXMULrDL8COwhywHKQsSQ
	1SiqDoe2s6Y2gpWxyHSH7mUOu9XOh/JAXHU+zEJS2Znx7EKDCDwFUiRLM6Xk3zVrG/mSH5UCFRx0b
	9MDsGXK+8MIku5f5anmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz9bp-001tX1-DW; Fri, 02 Jul 2021 03:12:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz9bN-001tQi-41; Fri, 02 Jul 2021 03:12:27 +0000
X-UUID: df641b0811f24f208d7a7fec88386ebc-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lkc4gqeV0Rfm4GgPirokMR6PFdscXKrpZgdfJpmLiO0=; 
 b=VnfmpdnwgZEPiIsno/GrF1P2EE3v0JizdaIqfR4qOzE/eY19fzhPKU5Tbmuh9gqyV9CNJ44MeMvGQgnQO1bgg0ETLNErXZ8EB7DOu6oIgIQGy+p0QWiJ41L4C03cP6rI60mKQHXQlPEJbtzGHZ/N8PcKhnJCuW73v97E0WRmGTw=;
X-UUID: df641b0811f24f208d7a7fec88386ebc-20210701
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1642307493; Thu, 01 Jul 2021 20:12:19 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 20:12:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 11:12:15 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 2 Jul 2021 11:12:15 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH v19 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Fri, 2 Jul 2021 11:12:07 +0800
Message-ID: <20210702031214.21597-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_201226_010661_E83F6DAB 
X-CRM114-Status: GOOD (  11.73  )
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

1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
3. SVS dts refers to reset controller [4] to help reset SVS HW.

#mt8183 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/
[3] https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/

#mt8192 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201223074944.2061-1-michael.kao@mediatek.com/
[3] https://lore.kernel.org/patchwork/patch/1360551/
[4] https://patchwork.kernel.org/project/linux-mediatek/patch/20200817030324.5690-5-crystal.guo@mediatek.com/

changes since v18:
- Add edge case handling in svs_set_freqs_pct_v3() when turn_pt is 0.
If we don't add this handling, SVS HIGH bank will fill FREQPCT74 / FREQPCT30 with 0 and SVS controller won't run normally.
- Remove redundant SVSB_MON_VOLT_IGNORE flag from svs_mt8192_banks[]'s low bank configuration.

Roger Lu (7):
  [v19,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v19,2/7] arm64: dts: mt8183: add svs device information
  [v19,3/7] soc: mediatek: SVS: introduce MTK SVS engine
  [v19,4/7] soc: mediatek: SVS: add debug commands
  [v19,5/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v19,6/7] arm64: dts: mt8192: add svs device information
  [v19,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   92 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   15 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   34 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2527 +++++++++++++++++
 6 files changed, 2679 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
