Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD1DC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:04:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2805761966
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 06:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2805761966
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TFGBSwwRMnZsbHbSLJr8Mm0zZes94f+xTzlZttn7Gsg=; b=CLWstbeKlYUhcjOC6hHS1sild
	Kc+WTSIRAx+e3EdCY8P7GWHumYbFN3+NXEP36PaeJfrerwxw7379pm+z4eQcrZwL0W8svhoALIofn
	Uce38rbxrUNND+jlYTTeEbyzpsHRN/VeP/y6rZtBlSxhc6K/kkj20vdXenAN0z5PItyD/7j5hcMqG
	cecl9Eox+q6sFR23Wczi4qghnuTCtpse8QYqwbolUq5bwcSp1Co3Zn9p6E+TwvygZ7JoEopndytmJ
	1yfSm9IvMdeLMRXVAkdrCleIODoMwfHuRG2peI2IPC+LdCZEaHRVVEICErq0znhSdv8/xjItpu4e1
	LFGHxQuUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lODg7-00AyUL-Ak; Mon, 22 Mar 2021 06:04:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lODen-00Ay4n-DS; Mon, 22 Mar 2021 06:03:22 +0000
X-UUID: a1de3f1b7fc44b5ab7236d2a62fe6e6d-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cPhbu4oFo/dFLHNZuFeBBDy1LoKfSc9x7YN1dHK55+s=; 
 b=NpmYmOM4X8jApetYpgY4lcNgCZf+GxwuadB+OyD8Hx9Rue7S6EjB/Vu5tn6CVpK5mmk8S96Ru72BMz7GQLat0SjtOOy9fsalzXyHkY8uhtLNtTA1kT2q5p5IanN/mge4asNMBvGO3zDggOPk2NBgrMtYeNAYShYGqXDcwSC0joI=;
X-UUID: a1de3f1b7fc44b5ab7236d2a62fe6e6d-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1245153073; Sun, 21 Mar 2021 22:03:12 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 22:53:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 13:53:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 13:53:04 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <fparent@baylibre.com>, Leilk Liu <leilk.liu@mediatek.com>
Subject: [PATCH 1/4] spi: update spi master bindings for MT8195 SoC
Date: Mon, 22 Mar 2021 13:52:41 +0800
Message-ID: <20210322055244.30179-2-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210322055244.30179-1-leilk.liu@mediatek.com>
References: <20210322055244.30179-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1AE6737A00D13FA30C1AF666ACECCA53224FDDC1BEDF3E087571B5E5460E21FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_060321_279362_A068A0D2 
X-CRM114-Status: UNSURE (   9.60  )
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

Add a DT binding documentation for the MT8195 soc.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
index 7bae7eef26c7..4d0e4c15c4ea 100644
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
@@ -12,6 +12,7 @@ Required properties:
     - mediatek,mt8173-spi: for mt8173 platforms
     - mediatek,mt8183-spi: for mt8183 platforms
     - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
+    - "mediatek,mt8195-spi", "mediatek,mt6765-spi": for mt8195 platforms
     - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
     - "mediatek,mt6779-spi", "mediatek,mt6765-spi": for mt6779 platforms
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
