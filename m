Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C879C7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=luYV5Df8eNuIySHoKHf25sYz2ZzHfnSxqh4z/3Ay/Hg=; b=RHPTFL3wb+IVke+TJJ0RQDv37t
	EfGIW4lW7h7duH0BQBdYQyGm9lrzIowFCpjgRWTBRu7PTXsVHV+ve2+IXnZFGkJS9eEk7L03ontfV
	OCri+gP3J2RX0Pqbeh8dGYow39acZBHP4UKNAIJX7SdRxyctiGo+uNXfORjQx++fQSl6sp2ualvsN
	YM+x4M/luX91F6WcJ/0q/imPgDZXEcDdWLonKlRp2iew4RyEt6xPqhLQ1SUSUbSzmzEu8mw4BLPOh
	HtMyg4OmUzYyji3qY5UObJLIcuAZQ5ULghZyQnCE4InZ45KNfPnVa6LNMelE0Uw/4NDNU/WOeDmi0
	ri41Jh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q25jz-00FsYu-2E;
	Thu, 25 May 2023 07:50:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q25jw-00FsWC-0d;
	Thu, 25 May 2023 07:50:29 +0000
X-UUID: caa09cf6fad011ed912e1518a6540028-20230525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=luYV5Df8eNuIySHoKHf25sYz2ZzHfnSxqh4z/3Ay/Hg=;
	b=BIfWl0LrldnNUJP3Mf80ubkQnWhS7IylqZ/WtxJoIv6mRFN983sLhNdjBivnUvlzet8sU8F1UYS+GD4D8WwNOU9CqBmewwckojejH8MFK6wGb+DFMZcJywSRTFshBeJW7zyg1QXpYW2xr737JuQHhkIs29RKrcn7IB3MO2El2vs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:5a77281c-4d9d-46db-b651-2c54cb012e90,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:6405833c-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: caa09cf6fad011ed912e1518a6540028-20230525
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 663873800; Thu, 25 May 2023 00:50:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 25 May 2023 15:50:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 25 May 2023 15:50:14 +0800
From: Runyang Chen <runyang.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Runyang Chen <runyang.chen@mediatek.com>
Subject: [PATCH v4 0/2] Add infra_ao reset support for MT8188 Soc
Date: Thu, 25 May 2023 15:50:09 +0800
Message-ID: <20230525075011.7032-1-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_005028_240538_EAC69C85 
X-CRM114-Status: UNSURE (   9.42  )
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

Based on tag: next-20230524, linux-next/master

v4:
1. Remove the attribute constant for infra_ao_rst_ofs and infra_ao_idx_map
since the reset controller driver will modifiy them.

v3:
1. The infra_ao_rst_ofs, infra_ao_idx_map and infra_ao_rst_desc are not
modified by the driver, so constify them.

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

-- 
2.18.0


