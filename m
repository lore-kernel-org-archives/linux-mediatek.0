Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A56EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:38:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9BB64F04
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E9BB64F04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jmgLR2FrxHS1CUx2rzpNuMghqNZEjuCWpx7uM/NdiR4=; b=W0kv+cWp2tQp00DcmhBMURymJ
	nRyc+r9gf0+F0j0FUZFUuo1ATilkq1AypATb3kFWDL0iWxfHtuMpk1YfTS3KolMtpK1TSXc0Nmmsv
	NPyk4/8q2O0ozxUkQxJByTgCda86I+34ievr+PGiikrNqEOHiE7jFA2Gpe4joINF8SN6jKKi3vlwL
	hxUhNiDQSBK2NGFpeb9Wn/ch2ndkoM2hICkIrlhAq3nTBmoM2VAstfTAxUvQ4WUKC0awD2w+j5oAJ
	4RX9dNzBiC/a2UYDkV5bdq7ABWi7H3s0ZGG79BUoCNjkKHUUHJNZ9J6eCOhAZEEPwEJ8IDkZ0/3dr
	hWPAmQlDg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLrA4-00GXUj-27; Mon, 15 Mar 2021 17:37:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLr9C-00GXHX-9h; Mon, 15 Mar 2021 17:37:01 +0000
X-UUID: 7c07b7550d2448c382ce26821e9be85f-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ss3Leta/CQ0+95I506nqRTXK+f0b2xHxizn9D15KYvk=; 
 b=T4pzkpR9sisUEYLzRgZEJCo99VbFfSw2rcjQpryOuiZXK7pgZNcJFa7y78PiEpGo5r3s1vTkW+ouHWmiAN4UnfMH6/s28pkrZThPC6U4d9n4PRmbK3tQW8O3bXoXJ11MRNNcdHE7+nCYsdcRGlvINqhpUSg68DHUYn5KZWgTzjI=;
X-UUID: 7c07b7550d2448c382ce26821e9be85f-20210315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1983829508; Mon, 15 Mar 2021 09:36:48 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 10:36:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:36:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 01:36:45 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang
 <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Alessandro
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Nicolas Boichat <drinkcat@chromium.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Yingjoe Chen
 <yingjoe.chen@mediatek.com>, Fei Shao <fshao@chromium.org>, Ran Bi
 <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 3/8] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Date: Tue, 16 Mar 2021 01:35:52 +0800
Message-ID: <1615829757-3223-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_173657_368840_759688BE 
X-CRM114-Status: GOOD (  10.87  )
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
changes since v5:
- no change.
---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a3825..99a84b69a29f 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
