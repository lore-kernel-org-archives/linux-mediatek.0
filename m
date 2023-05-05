Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA51C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 14:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KhlDRAeeJnqkQ1VfZCBZx7biLs8pcsS1txRadTISsq4=; b=wtFtRXFgZw5+rjXL6xvOQ/f4d7
	9GkO9oV6dExemMWP1h1d1FW11UjO3nEjrCA32QuJU7aMnj/wg5/H7Zokw5NnDS4VKrGWntIbmKrqz
	AeC6Zlwl9tD+8xul0Xyehxzoug6uc0h8XKCm6XTNMjgVZb5Df9RXuV+u+RO89v0sC917jkbli6riA
	LNCXaZqZq5ZUiHEGMeidifC8u35mVx5ShYxdmu/4jifQVR3qpn/Hg2cNzZaQ5CthFz/mTEsNqHoIa
	6HgohoM9PdgpyEaJIr0U469N2TOx+87B1yDNacTAv8kOms4euk2ovMjvIvBxToxj0oW6N0qVSVtzF
	Cr5TTSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puwE1-00B4RC-0t;
	Fri, 05 May 2023 14:15:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvFQ-00Axd4-0Z;
	Fri, 05 May 2023 13:13:21 +0000
X-UUID: 9759a160eb4611ed83ed1395ce914268-20230505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KhlDRAeeJnqkQ1VfZCBZx7biLs8pcsS1txRadTISsq4=;
	b=jDixcrQ7lPlvYO2G0wFpiQmKirIOG86JVoZGLWdOwc4c/tsYI4dr8nyJP5ZdqeVNY6WGg8acjFknn2DKLVBZ7XwKhTLpf2spfcEAbKIrkfr4mwekl00+8BQtHEotZS4Z925pqMPU1LPSnti8aB+5nDj1qV/DZ0i0PMivLp3fqo8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:ed2bd2be-6c93-462d-9779-3587e68e7e91,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:1cc5de30-6935-4eab-a959-f84f8da15543,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 9759a160eb4611ed83ed1395ce914268-20230505
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1373179845; Fri, 05 May 2023 06:13:13 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 May 2023 21:13:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 May 2023 21:13:10 +0800
From: Runyang Chen <runyang.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Philipp Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Runyang Chen <runyang.chen@mediatek.com>
Subject: [PATCH v2 0/2] Add infra_ao reset support for MT8188 Soc
Date: Fri, 5 May 2023 21:13:06 +0800
Message-ID: <20230505131308.27190-1-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_061320_383645_74B2F61B 
X-CRM114-Status: UNSURE (   7.73  )
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

Based on tag: next-20230504, linux-next/master

v2:
1. Modify SoB to match author name.

v1:
1. Add thermal reset bit for MT8188.
2. Add infra_ao reset support for MT8188.


Runyang Chen (2):
  dt-bindings: reset: mt8188: add thermal reset control bit
  clk: mediatek: reset: add infra_ao reset support for MT8188

 drivers/clk/mediatek/clk-mt8188-infra_ao.c | 24 ++++++++++++++++++++++
 include/dt-bindings/reset/mt8188-resets.h  |  5 +++++
 2 files changed, 29 insertions(+)


base-commit: 145e5cddfe8b4bf607510b2dcf630d95f4db420f
-- 
2.18.0


