Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FDDC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KiwPmbDD1MhVA6n6KkWt9LbHMoM8EQb6aIvzu6stn04=; b=IsonCTmV4tmR1P495+08Um5aVA
	9Q7tw2IinIOcKmqn4KdYJ773FiTtTvD3E1UlSrsqs4FVP4+ezXn+EzRbylqjnwpXAOFjxtvRmqPGh
	J04k9WtEZWy/9uSC2D2Yh02nwbW9Ruy30OlCU0iBBw4hmCG66yc+IdYgA1GdmqH39U7kHDpdyLVy2
	8wR/XUrgD5HE0TV/XWnn+ubrrwpiYalVh5+G91EXlyY/9VhTgYBBs5WRG/4fZIPbBoHL76ZBNaO1c
	8mfJfJkj2zYs3D2LfCF2l2bpMtws7TvRomqvSzlaGo16mnKSq7wYr+XruRYEDQNQPJACwVbWVyKpp
	3Gsx2Q4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabPK-003Hib-07; Tue, 20 Sep 2022 11:27:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oabPE-003HgD-UU; Tue, 20 Sep 2022 11:27:14 +0000
X-UUID: e38a32ccb39c4c3fa19983df31090fe2-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KiwPmbDD1MhVA6n6KkWt9LbHMoM8EQb6aIvzu6stn04=;
	b=PbVWBAikhUyI6gCikolaSz4t5fipeHG0hodD3wtHms18riQXGwvfjFbnUew1uy2VOB//f5t/vEdX6yazJrFRVDUt0cU09YvX15FQ+FLMwMCRxHGXaM1Q9hnd2eA0TootKoCO8Ev5XSl+Zpn1fQqTIqydDO7+5j+U8Rtgfaj0CrE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3bb2fb8a-9a43-48b3-ac01-836d11ccd5dd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:47fd485e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e38a32ccb39c4c3fa19983df31090fe2-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 284809198; Tue, 20 Sep 2022 04:27:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 18:56:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 20 Sep 2022 18:56:24 +0800
From: Runyang Chen <Runyang.Chen@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Runyang
 Chen <runyang.chen@mediatek.com>
Subject: [PATCH v3 0/3] Add watchdog support for MT8188 Soc
Date: Tue, 20 Sep 2022 18:56:19 +0800
Message-ID: <20220920105622.25666-1-Runyang.Chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_042713_017061_A8764940 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Runyang Chen <runyang.chen@mediatek.com>

Based on tag: next-20220919, linux-next/master

Refer to the discussion in the link:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220721014845.19044-2-allen-kh.cheng@mediatek.com/
The other wdt compatible strings are unchanged.So, won't apply the
series above

v3:
Rebase on 6.0-rc5 and add reviewed-by and acked-by tag.

v2:
Revert wdt compatible for MT8188.

v1:
1. Add mt8188-resets.h to define definition of reset bits.
2. Add wdt compatible for MT8188.*

Runyang Chen (3):
  dt-bindings: watchdog: Add compatible for MediaTek MT8188
  dt-bindings: reset: mt8188: add toprgu reset-controller header file
  watchdog: mediatek: mt8188: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 include/dt-bindings/reset/mt8188-resets.h     | 36 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8188-resets.h


base-commit: 4c9ca5b1597e3222177ba2a94658f78fa5ef4f58
-- 
2.18.0


