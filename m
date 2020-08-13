Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8371AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:17:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F99020781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fjuFB6xE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b7xCoKf8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F99020781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wqhFr+aS90hmR1mbNUkiiPkPbKAkklAPoorc5/UlS7I=; b=fjuFB6xEBDaZlEgyylCGHeQbb
	dtLeH6DPhBMEU/zQVMK9QRMQnz8WNjtB3nGMMJ6rHxtd8sytslXxEKu8RbH8m28Pj9bIWoYrACDYF
	xAWRsaDHf/aES1ecN5bFBIs7c0SBG4xXkZxMk8NZ5TyIMULser9osgCWjoy7s09N2qz//GZcpAkZ5
	pCNo41wZ8hqZJYV11OzmX2SK7WjQK3RJTzskfGHr/8ObTZ8yHTDfCxYX3ReUaG0oMFHzJZ3BZQGMr
	cb32xPeYZG9L49ZQ75NIxLVWdtrDfAWevWOxWJnR8x6KGYVqAYMWX8kkXOILilVz45lX7Pi0zrj4Z
	Fmc3cob7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69Me-0001Eq-Si; Thu, 13 Aug 2020 09:17:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69MW-0001Bl-Kp; Thu, 13 Aug 2020 09:17:30 +0000
X-UUID: 61c17a9f99dc47189d76263a4f67517b-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=v5RL6V9x3ufySZ6lQXXP3W0N4mG04Wkwj8+hcLlIG0M=; 
 b=b7xCoKf8OA74GZtLEi66e55I4YMaROmG4DF5OsPC9td9b0BXYWuxPfmi+/v3LaLCdHCt7dEJwbjV90HzRjngfqHCAKW1PutW1/KZP0/KjwoMnkJ9T7Bf6M1zKlIh44BGirkq8EEmn958/9B1Y8VgrNppQX1xsMV5yGUoEERoIGo=;
X-UUID: 61c17a9f99dc47189d76263a4f67517b-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 517142134; Thu, 13 Aug 2020 01:17:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 02:07:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 17:07:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 17:07:18 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [v4,2/3] arm64: dts: mt7622: add reset node for mmc device
Date: Thu, 13 Aug 2020 17:06:17 +0800
Message-ID: <20200813090618.28009-3-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200813090618.28009-1-wenbin.mei@mediatek.com>
References: <20200813090618.28009-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_051728_866848_92D43DAA 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds reset node for mmc device.

Cc: <stable@vger.kernel.org> # v5.4+
Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 1a39e0ef776b..5b9ec032ce8d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -686,6 +686,8 @@
 		clocks = <&pericfg CLK_PERI_MSDC30_0_PD>,
 			 <&topckgen CLK_TOP_MSDC50_0_SEL>;
 		clock-names = "source", "hclk";
+		resets = <&pericfg MT7622_PERI_MSDC0_SW_RST>;
+		reset-names = "hrst";
 		status = "disabled";
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
