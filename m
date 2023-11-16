Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49261C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 11:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31E9DlJ5yucq2g/1La5PjE21qLBCZkmSfZE8KvwJ31Y=; b=xM07bR0FydPV6ThTRSxeMann61
	OaL2qNa6l7HKlA7C57pUffAiKZrn1Rjog4cuFOk+G+HeY7nwCnPZcRV0eVL1djltjCTtPtxpVuDA4
	pXyGSdZ2FsoxjG32/aaIHk0j/nxAdu45zQ8mL6lHVqdM7xMY9XhoY6uKy9+vNjSghKmuXv6W/76oS
	R7W/y3kBf/wS9czcAQv+MFYl6QDNPf+ZWj0MKBYoe5v2I/420SbhHq/T3T2t+ix6Kj9A/b5YPu4o0
	7TFqeiDZDB9f843ha0kK2M9wQRljlVGZgbSuAlba0NeJeoe2bBRJCK/AFsznCpCvvZtWKt4NteByP
	PbKp7MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aBl-003AjB-0T;
	Thu, 16 Nov 2023 11:05:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3aBh-003AhO-2z;
	Thu, 16 Nov 2023 11:05:35 +0000
X-UUID: 0aaef2e2847011ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=31E9DlJ5yucq2g/1La5PjE21qLBCZkmSfZE8KvwJ31Y=;
	b=bKRhrqM4/eBUlCJSIOM5DN3ogZJUrFv7el1nEy1xDo6QSNePJAvLW/iUk/I+cuIWJWFyBPCAiUEFXiz5hle0+pdzY4cn2omUPccvfFx/ph4kjxdeaejT3A02T9XLfIJ9M+JFKdXAdIg2ykVjVmoYANkghfzqWzVYkcI0lV3ZPZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:24782b8c-4e87-4919-9014-9aa946f23250,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:1cd67795-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0aaef2e2847011ee9b7791016c24628a-20231116
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 963791406; Thu, 16 Nov 2023 04:05:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 19:04:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 19:04:50 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>, Kevin Hilman
	<khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 0/3] soc: mediatek: svs: add support for MT8186 and
Date: Thu, 16 Nov 2023 19:04:44 +0800
Message-ID: <20231116110447.3598-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_030533_967343_502B205A 
X-CRM114-Status: UNSURE (   7.24  )
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

Changes since v1:
  - modify mtk-svs.yaml commit message

Mark Tseng (3):
  soc: mediatek: svs: Add support for MT8195 SoC
  soc: mediatek: svs: Add support for MT8186 SoC
  dt-bindings: soc: mediatek: add mt8186 and mt8195 svs dt-bindings

 .../bindings/soc/mediatek/mtk-svs.yaml        |   2 +
 drivers/soc/mediatek/mtk-svs.c                | 418 ++++++++++++++++++
 2 files changed, 420 insertions(+)

-- 
2.18.0


