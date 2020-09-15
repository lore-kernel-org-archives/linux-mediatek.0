Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285CCC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:14:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F3020829
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 06:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZbwX3Nq7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mRWJ9u/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F3020829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbAFpG0tyeRyiyscQ6iRVWXIJ2wClYQzDxqq/nl0mV4=; b=ZbwX3Nq77Kv23mr/5q567FSaCc
	7iPmxlyBN18f95yIvGYpscZPKmdq0AvIryUrV2Tk+0mY7XlPbPqoE6W4hAb32/WUc4GdinRpDtGVK
	zshm94/WV00FImtiSwgJv6hc32SPsIMyLWs0c/ESreOIrPHnCGjHGXzApfF8fPRaarNc4rWYZeRkF
	UGJ/DmP5cpP81ZoCOL3RGbRZhuItLTLtQ3xG3+yu9xzzWY49qfv75FgKXhgk8pe/dGuRBAvKi9Smt
	LOjZf/kjfjhDGMlty0umAZDzZf/oHlnjy89F8ucE1fO8kknXE5lb+VC02rJYEhvWdI+Mz8APXP1Jg
	SFkaKcRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4Dy-0006aa-67; Tue, 15 Sep 2020 06:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4DX-0006RR-7q; Tue, 15 Sep 2020 06:13:29 +0000
X-UUID: 8f301d9b46dd4730b24fef18ae8f002c-20200914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hDwwvEKbQNKWFsUY6/pT152QsMoq9kreFwlKpG3Sd6o=; 
 b=mRWJ9u/W1Nr9nefrC8hJivdEUw4G/MKEzNyfkvsKglbUNCdERT0vH0dBi4qOlHMJi169qRvIkbwzm9HhPFk2Z/d7V4dNNHZQ/yRGadzKZbyWKGU8vW34CZK4OIEiptoTxhMPEskakJjoPM9451VP0RA9O6T4YNX0aSEsBYS8zAE=;
X-UUID: 8f301d9b46dd4730b24fef18ae8f002c-20200914
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 110277409; Mon, 14 Sep 2020 22:13:22 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Sep 2020 23:13:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Sep 2020 14:13:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Sep 2020 14:13:18 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND 0/3] Add mmc support for MT8192 SoC
Date: Tue, 15 Sep 2020 14:11:07 +0800
Message-ID: <20200915061110.25833-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_021327_947845_EFDBB12B 
X-CRM114-Status: GOOD (  11.52  )
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
