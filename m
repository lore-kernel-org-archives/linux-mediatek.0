Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6513AC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 08:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4isQDaPCrg/5LtQ2cuPxSwGIMQNqcE2yG4PDklAlSaE=; b=SjBE+u/n9wtSyudMC7YXYScSQW
	IfOpIRJywEbA/WLATtOsIKNBIn7GIkLyj1OwBtYR0o6r0jOu/GwmFBR1JyKVx8kdpn39IlxF2oU1+
	4s3VjZnqaKoHFU+L5qf2Z0l/CZjntKta6qoyrEhyjGoWwuxBVvNh2QLgPW1ZXvve4GpLemBVS9CDG
	YIOZHbrQ+Oq5XNjgUurhaKfnlsxFIDh0vED4XzLcgBmdOXCwDToJ5pUejPRuh7n/fqQgtBlhuCapd
	xAVahIMqEJMzRsQnw7qnngv3iNXWEP7RnOxRUvDvO0gKsxqQLYlCklhgC0VYRGYnLAfgc4SY/ISs+
	2fvDFtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8diZ-005LqH-39; Fri, 23 Dec 2022 08:47:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8dhQ-005LBH-Gq; Fri, 23 Dec 2022 08:46:42 +0000
X-UUID: 1b0c182439134ec19883cdd8f614890d-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4isQDaPCrg/5LtQ2cuPxSwGIMQNqcE2yG4PDklAlSaE=;
	b=mC0/yWYjQMLkFdrzaKbj53yik8gsTTG1CdWkyDLxcgg+W3s9EjC99jRBe9u0slojXxbqsyHuBRXARWYLD6ZpNaBEYu+5j5eDm2jNFkRwjAJA2/9TaDo6JAxOkII/SdQ3LE2JltY9FuRfttuby6yMXkzALgd5yvbaOlPDQxFbYoU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:9119a086-044d-447c-928d-1621e4cd80b9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:2a3dc4f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1b0c182439134ec19883cdd8f614890d-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 437450348; Fri, 23 Dec 2022 01:46:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 23 Dec 2022 16:05:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 16:05:56 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v3 0/2] Add power domain support for MT8188
Date: Fri, 23 Dec 2022 16:05:51 +0800
Message-ID: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_004640_619515_AACD410A 
X-CRM114-Status: UNSURE (   9.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Base on tag: next-20221220, linux-next/master

changes since v2:
- 	add MTK_SCPD_DOMAIN_SUPPLY cap to MFG1
- 	add MTK_SCPD_ALWAYS_ON cap to ADSP_INFRA

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


