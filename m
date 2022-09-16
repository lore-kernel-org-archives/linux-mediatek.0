Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B7BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 05:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8XNsKyeaMToiIn7YqeU7dM2qmHfwWehkMPw7XfZq8s=; b=oh1sWruAG630ybUl0rbElGBPfC
	bnKlisYPVMShVA3RZtR2LX3Gc+eK8dGYy0nO106WDDVdkEzHenJsdcQZIsAtIkDmyRQ7Dt7rHqv7h
	PB3INduJOH9Z9udc4GMx4pixzcvZCWTlehgt/E3zJ0aQnDlHsd1WCgmr6PF0jtzVlvBS5+837FpmV
	N7HofCXeWR/rvFKylxEdKBTdbAW5A+Cg1K5lsBCaJm8Yd3lDaVHZvvpAMa8uOckvSXd0s7VCfrIYv
	2y9XX0th3pZwPA40ecqDgDqBkdfL8s+YC9Np3kYi8Qhd+05lj3KnHAWY26w2q757SjMUVJS189MVZ
	0JchBIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4Hl-008cDz-Bl; Fri, 16 Sep 2022 05:53:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4Hi-008cAV-W5; Fri, 16 Sep 2022 05:53:08 +0000
X-UUID: e78e9dcb6683452b8d17b27acb7dd5fd-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=e8XNsKyeaMToiIn7YqeU7dM2qmHfwWehkMPw7XfZq8s=;
	b=Hp9bgHg4TokP+Jke8HFAr3dCO5PNrpbV15pknwKKzqrSk6uo/9Vzf0B2GM17P7HlV7SCcpuHrcoNtnepAmeF6pzO2BBS9rJ3MyHuW53nrigzBA/XvQCiS2nhAiEvNcJB5/gKlRacUkWm11e3gE9FRAId+n+f29j0A2kv6QGJsls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:ed9326fa-aff1-49a4-9e99-dff5e9a90c3b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:c711d87b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e78e9dcb6683452b8d17b27acb7dd5fd-20220915
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 784219165; Thu, 15 Sep 2022 22:53:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 13:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 13:52:20 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH v1 0/2] Add power domain support for MT8188
Date: Fri, 16 Sep 2022 13:52:14 +0800
Message-ID: <20220916055216.20139-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_225307_052705_8A3C5B0E 
X-CRM114-Status: UNSURE (   9.80  )
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

Base on tag: next-20220915, linux-next/master

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


