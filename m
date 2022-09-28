Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D506DC04A95
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBUNOKwksJ5/FO9gSAvNBUj6kkAQRn0Ke6+TRV7hb+c=; b=uu/sHjWLLVY26mONMLP7YRRWP6
	FXO/k8wQRKMT6WK5l5BkhDDc2LRndKS/sGmCviYonkK3RByYS6RkGaSI4j/5fSpH+NX+Ori8FS9jg
	qbnoQKII847LjDxCJP+ljnERNL+w/vOChUWTPpvXDrlgVWBOQW6osX2Nqm7C6uZUCNXPNGiCenLHN
	Hrb22QHX2NpLlpkrtDeVhG315DJyFILr0df0legh0VwWnJVks+dBYiak+flxPnFZiM1KGb6UwtNge
	wa1ISKDdKHumkPeqrGoA1txENWm8LwhWpDcyYg79b1QjBNQ4DypSho81iR6zEKk68R9EAoL6vNT80
	MeIAFfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTHv-00FAcT-R5; Wed, 28 Sep 2022 09:23:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odTHs-00FAbI-Pg; Wed, 28 Sep 2022 09:23:30 +0000
X-UUID: 0e3ba9cbd84e4c50be3b2bd62543ff87-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oBUNOKwksJ5/FO9gSAvNBUj6kkAQRn0Ke6+TRV7hb+c=;
	b=vDaQDgOpez47fgtvQKGSIbYnvo1B98x20oBftbTKdWIGJzUCdjSuE0LPRcCwMgGuzKP3xhSwgfplf1hv6vBWFh8SUcCT+CIGunmMerwbsEVpkqoosTDFakz5mXx8pm2tv1tD+E38zVfSi4oxIdKMSyNDnOc7IYehK3YCoeAzdXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:8968f056-e352-492b-9271-e3ea3c2c5bf6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:e59782e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0e3ba9cbd84e4c50be3b2bd62543ff87-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 472844718; Wed, 28 Sep 2022 02:23:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 16:43:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 16:43:18 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH v2 0/2]  Add power domain support for MT8188
Date: Wed, 28 Sep 2022 16:43:13 +0800
Message-ID: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_022328_860740_945EE6FE 
X-CRM114-Status: GOOD (  10.56  )
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

Base on tag: next-20220927, linux-next/master
The power domain driver manages to power up/down MediaTek MT8188 chip.

changes since v1:
- add more description to this series
- remove change-id
- align as the same indention
- remove redundant parentheses

Garmin.Chang (2):
  dt-bindings: power: Add MT8188 power domains
  soc: mediatek: pm-domains: Add support for mt8188

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8188-pm-domains.h      | 623 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |   5 +
 .../dt-bindings/power/mediatek,mt8188-power.h |  44 ++
 include/linux/soc/mediatek/infracfg.h         | 121 ++++
 5 files changed, 795 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h

-- 
2.18.0


