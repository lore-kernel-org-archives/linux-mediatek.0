Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B34C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lmc3nBCTQwWzf0yQuGvl+YARoD+4DowvoSdMjMCGIrM=; b=f2Fjsh8e2FAHH0ZIyhM9lIdkpx
	6DMYXzA/4KVEnLuHFgAhwx0B1CcYbu4xl5T5ta2YO5W0mApxBf7haFcRI9q3ZnhRddNn7oxRqigrZ
	4aqmKUV4p9rRlGQjtsDaJo3qobdwQEl7oZSW4yKAdq6fn7ScQlMk9fvqrJ4J3w2KwzTvbqoG5rRQK
	HD85kTE2NbFvfAKxgAy9dTs89GTNJrMWj9ChCTy28EEOExBj1/M5NMWtHDGoufUvjIoBgg2QXj/ZQ
	vz9JB35RrO50aRDyoLzmBxN9Q/BPRq2Q7XblmsBaTrBy7+1Kb/tdhM2b9r5DswEB2IFK22/OnM2J2
	yNivBSzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgNL-001CTG-4w; Tue, 03 Jan 2023 12:26:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfV9-000yDs-0w; Tue, 03 Jan 2023 11:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lmc3nBCTQwWzf0yQuGvl+YARoD+4DowvoSdMjMCGIrM=; b=MEKV8SwHeVUEe1BRr/6TsyK/b9
	g4moOH45Ah2QHIbnC3MA86t+ZXU0VVBpmMWqrDm2BTE3F78xKZFCXPX8GCqF5JAz9qdAXx1jB2SU3
	sSPBmoIOhx1KxQ4jc+01YdjU2hEozZDUaEi+jvAELup4I/MVigf4HGp5EvS55/fWkRi4e9v1YGtqV
	3B2qMT5rm+Miw37COYTdwkATKgEZ/jn5UNHIHRtnEI08bTz6zn2pzwVocFnJ7rOAQisFQWAHn1Sfw
	1WXsKGKqmS10PLvm0hgc6wbgOcNVvKbnCU8FZpdMc1UX5fEuYBybCn2/1fj8mt4DClEKFnYz03v+l
	lem53bIA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pCfUo-000aBt-36;
	Tue, 03 Jan 2023 11:30:27 +0000
X-UUID: 4008fe9fcb514c1ebe8fc5ca3f3d1c28-20230103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lmc3nBCTQwWzf0yQuGvl+YARoD+4DowvoSdMjMCGIrM=;
	b=czBDGMzy0jt1Jr0Td0ER6cs6aMnGsyB0zNzbuN86ALEWgO2JHdziJEoaHsDQ4E7xiCT13uVemuz0b9ryFzrO/eUVPLtc285q1x9Pm94TDkXPeQzZ+X03xzugTxZYhQgVuyL9H8J0qGCb5gBno5nKjrLzvdZEGj6Jb0acEutNSdQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:9ae33140-8935-4bd8-ba29-a5106c6e79ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:8ba68053-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 4008fe9fcb514c1ebe8fc5ca3f3d1c28-20230103
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 628623922; Tue, 03 Jan 2023 04:30:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 3 Jan 2023 19:29:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 3 Jan 2023 19:29:26 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 0/14] Enhance SVS's robustness
Date: Tue, 3 Jan 2023 19:29:11 +0800
Message-ID: <20230103112925.16554-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_113021_698422_DED95D24 
X-CRM114-Status: UNSURE (   8.36  )
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

SVS driver got accepted upstream but still has room to be improved.
Therefore, we add these patches to fix issues and coding style.

Change since v2:
- change the goto label wording from "out_of_resume" to "svs_resume_reset_assert" patch [9/14]
- Add patch [10/14] to reset svs hardware when svs_resume fail

Matthias Brugger (4):
  soc: mediatek: mtk-svs: clean up platform probing
  soc: mediatek: mtk-svs: improve readability of platform_probe
  soc: mediatek: mtk-svs: move svs_platform_probe into probe
  soc: mediatek: mtk-svs: delete superfluous platform data entries

Ricardo Ribalda (1):
  soc: mediatek: mtk-svs: enable the IRQ later

Roger Lu (8):
  soc: mtk-svs: mt8183: refactor o_slope calculation
  soc: mediatek: mtk-svs: use svs get efuse common function
  soc: mediatek: mtk-svs: use svs clk control APIs
  soc: mediatek: mtk-svs: reset svs when svs_resume() fail
  soc: mediatek: mtk-svs: use common function to disable restore
    voltages
  soc: mediatek: mtk-svs: restore default voltages when svs_init02()
    fail
  soc: mediatek: mtk-svs: add thermal voltage compensation if needed
  soc: mediatek: mtk-svs: keep svs alive even though debug cmd create
    fail

Shang XiaoJing (1):
  soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in
    svs_init01()

 drivers/soc/mediatek/mtk-svs.c | 351 ++++++++++++++++-----------------
 1 file changed, 174 insertions(+), 177 deletions(-)



