Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54088ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0nq7xfZDD4ZYowzdYVLDw56ampwPWvrE73MxNai3bhk=; b=b657Nw8gey7S0BWD3DXfTQOfbs
	KbpPJnGmdfH8l18BfDYIGu7TT7U6+18U1LwFvh/4+85rigW9K9WcBPQBVKAaWaP5y1X3I9NsXN/3J
	LI4pU0aQe2R25hAjr4fd+L8UYfkOAk6kRwD7VeBAN3cI/U8r6Gy0u3kcazJbIyvsDS5bhCT1Z3Nbc
	xLqGArU4n0F+fXueoLe4k8Wc4WiZKAmPg6qfYNC7kJGx1tmk/XlmJ7UsPDzFxXWmS9zaDNR5hJLfJ
	F871D6eBQS8fLo/nrmbt3prL9NFxPlE1lvL63K6Rw+qOlj64R3A3R5gT0ZjmGllUv1vbnxjzt3Bq2
	J4ilPpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYklG-004YNK-Ok; Thu, 15 Sep 2022 09:02:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYklE-004YIH-9D; Thu, 15 Sep 2022 09:02:17 +0000
X-UUID: 2e4ac91b6595400389fdf72244134a62-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0nq7xfZDD4ZYowzdYVLDw56ampwPWvrE73MxNai3bhk=;
	b=H8o4MGyDjEqq9sV3a/dJRfBlEDwcDTHY5rEZkkfbD+taj8QXNgWWu9KaUE2xfSRptw3IIaF/c1mKjOMQTxktzlUXGvXLG4xjsaGoUCclGzbILLUFz+QNSsklMWUg1AhgBg4I9Clsqsim1SFDBm5CU6jv+a/kYXHF2hARFR1TxZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c9c8ff22-d293-4071-a0fe-7abba598b0b3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:f216bc7b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2e4ac91b6595400389fdf72244134a62-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1225286618; Thu, 15 Sep 2022 01:59:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 15:58:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 15 Sep 2022 15:58:50 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH 0/4] Add dp-intf and dp nodes
Date: Thu, 15 Sep 2022 15:58:45 +0800
Message-ID: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_020216_357005_3BAC7AB6 
X-CRM114-Status: UNSURE (   6.13  )
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

This series add MediaTek dp-intf nodes and dp nodes.
This series is based on linux-next-20220914.

Bo-Chen Chen (4):
  arm64: dts: mt8195: Add dp-intf nodes
  arm64: dts: mt8195: Add dptx nodes
  arm64: dts: mediatek: cherry: Add dp-intf ports
  arm64: dts: mediatek: cherry: Add edptx and dptx support

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 86 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++
 2 files changed, 134 insertions(+)

-- 
2.18.0


