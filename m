Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E9BC2B9F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:55:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE188613E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 06:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE188613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVDhaiFk3CFih0C+swlNFudvDz6BMij6TX52Mn6Z+r4=; b=EiWHhQuEqJI/k8
	LV2OcMugISTS6RJrLGOlS7UDdKjkYP7CB6paurmG4k/AhIGSWiYAElL6KFBxJdd2x4JxHpnmHxrxS
	ERZ2ivBbPVx/WOYMGZqw0vJuLQp9MRu+7TybiNSnsdBrxoyLoCy1cmWz1DYqOP7el87Q+5XGYRWM8
	54YFWPFev3fKDjL6KGhIhgrekye3LclU1y0hlJ9e4bwCvoRH6Eb3po/cUv3T8hkTjSEqAH2K5eS+t
	R2WPElUG/Z2hxAA/zj6NUlV2x8CnOCkD402kTi7DqGJKzH63giYOTwRorWbKkQysc3qfI3oEmyiEv
	HALHPkI5HLzeZ7jjkYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llnRv-00BnYu-HZ; Wed, 26 May 2021 06:55:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llnOs-00Bloz-Su; Wed, 26 May 2021 06:52:20 +0000
X-UUID: 302f976f7d574c67a0692a9a1d53efe6-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SyhAQTfpZtxFwomnBxego/Pff3vbnQ/UJiXCFryMZP8=; 
 b=uX/AE1DfLuRVNK2keAIdL4CizbJx7G2crIY/gmcKItSTybP+5fTPbEHHr+QyJtFkyv7vvYaRjDoaklA88CCf4gYag6sjPwNDf6uzTEwxFc1AlStE7/fjDJkdruXFe+i/V2fsIA+KomsHdlp+BL8zh2HUHacmhtTesF4uKYH3KXc=;
X-UUID: 302f976f7d574c67a0692a9a1d53efe6-20210525
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122665941; Tue, 25 May 2021 23:52:15 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 23:52:14 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 May 2021 14:52:12 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 May 2021 14:52:12 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang
 <eddie.huang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Fei Shao
 <fshao@chromium.org>
CC: Sean Wang <sean.wang@mediatek.com>, Hsin-Hsiung Wang
 <hsin-hsiung.wang@mediatek.com>, Yuchen Huang <yuchen.huang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 3/8] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Date: Wed, 26 May 2021 14:52:02 +0800
Message-ID: <1622011927-359-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1622011927-359-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_235218_975012_C605CC4C 
X-CRM114-Status: GOOD (  12.06  )
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

This adds compatible for the MediaTek MT6359 PMIC.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
changes since v7:
- no change.
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775..99a84b69 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6359" for PMIC MT6359
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
