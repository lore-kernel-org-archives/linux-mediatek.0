Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 737C861167
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 737C861167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR5o3sunVUV0Xq6irtDruyH53gI6TuvFhd2LXQqAdZs=; b=u1igKPhjtxqq+A
	WyXVlMTFMInbPiEthX+bSbBdk5k1WCZ/RyS3Ma1jey0VR6KeKtMMR3C+D+NBYTW27OfMLnOyyBBi9
	4WjqieFlCqi+3dy4am6FSHDenvUZ3jcO91Af1grXCANBvtoYI+QtEwyo9TyV0YqIJunVkPGKsoiVe
	KE4VjvDA78NANTEqSmK/p7Jqiixfr7/EVMVvyEoqNvz0zU7ODwiW2rcWwIHvjcYkBlMF792vQChtY
	6rgQzH/J7qbLbrrdOpop1wRvwbINr7EeWs95BW1kBMUtwXvFCfhtWKwB3a0IictmyGiPhxi5svaRI
	2p0Awnfry0WcfW6s+tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNqrr-005WM0-Cq; Wed, 08 Sep 2021 06:15:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNqqg-005VsB-Je; Wed, 08 Sep 2021 06:14:20 +0000
X-UUID: bc111a7fc97a480fb17a1883adea4600-20210907
X-UUID: bc111a7fc97a480fb17a1883adea4600-20210907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 994068004; Tue, 07 Sep 2021 23:14:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Sep 2021 23:04:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 8 Sep 2021 14:04:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:09 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 04/17] dt-bindings: arm: mediatek: mutex: move mutex
 binding from display folder
Date: Wed, 8 Sep 2021 14:02:59 +0800
Message-ID: <20210908060312.24007-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_231418_762989_E41B8410 
X-CRM114-Status: UNSURE (   9.93  )
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

Because mutex does not only control display function block, but also
control mdp function block, so move mutex binding document from display
folder to this folder.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/{display => arm}/mediatek/mediatek,mutex.yaml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,mutex.yaml (92%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
similarity index 92%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
index 97013f0d7ccf..8d6a8b1296a3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display mutex
+title: MediaTek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek mutex, namely MUTEX, is used to send the triggers signals called
+  MediaTek mutex, namely MUTEX, is used to send the triggers signals called
   Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
   data path or MDP data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
