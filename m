Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 471CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:28:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6056A64F10
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6056A64F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8zvyP975SrTsSB88DntNAyWo2jpVguDETFPsCjxGI3M=; b=cav7tVBkzmBxuYix+oRpDPG3K
	MgMuaRX+bxZlvWKx7p7LLPUa7xlPf1csyNEyTwrQuhDRJ6/nDvQ7c+AHSqXaLJrRvYmGl7JDP5tuV
	30XIYh8sMUNL3Pu6SMnuSZF/L0tMUy/5/KtX/+yxRjqKrzP4gFXtH4aBn83zWHgbEdAVCZIAbYwfC
	xHgE5ouX7Kz4Gh91LuJkEvHvIq6jmcWI+nl548LxQDL0K004FMgGOTu1Xf3bh/Mr0j/Vvmwe72STr
	4K6WnpkhPO0/kywC4kbE6tZGuqj3ZdvvhR8qxdmjTFpoToopg5ltUWmmetOKHterig6E88IMr2atk
	EmlUhSoaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMZ2N-003YlI-Bm; Wed, 17 Mar 2021 16:28:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMZ2J-003YkC-Ls; Wed, 17 Mar 2021 16:28:45 +0000
X-UUID: e0fd070ae5894cf9a512849328c1c3fe-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NnU8GqFZTBYqm3Cvggd59SLyfu126S82jsgStGNmkg0=; 
 b=JzmQMDUQerakVWoJSJDDRgjch8Drd9dbJmydQWJr6yI6Std5ouyhZAOEBFIL3k+J+b1OikNfmmdGmQEd4/lmXYUiVYbGXOeGqw8tS2jPsz8FtOXB3hlI1myWDcoCjrDlMTuRQJcvsbzqJwWj0sJSjPifKPjEnM0cZ9bzRFIL+GU=;
X-UUID: e0fd070ae5894cf9a512849328c1c3fe-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1684695268; Wed, 17 Mar 2021 08:28:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 09:28:34 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 00:28:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Mar 2021 00:28:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] arm64: dts: mt7622: add ePA/eLNA pinmux for built-in WiFi
Date: Thu, 18 Mar 2021 00:28:32 +0800
Message-ID: <7c565b111ce2dc8e26c04cc15e7e17239390fd55.1615997929.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1fb0ff65cb7d8c4f3197a87b43c26c5925e973ea.1615997929.git.ryder.lee@mediatek.com>
References: <1fb0ff65cb7d8c4f3197a87b43c26c5925e973ea.1615997929.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B45593C075271649236C3B4EE87190C598451E3E15E89443E18361BFF628057F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_162844_064078_F4EC561B 
X-CRM114-Status: UNSURE (   9.94  )
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

This just illustrates one of possible combinations. User should setup
the corresponding pins according to the onboard RF data that stores
in eeprom.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 08ad0ffb24df..50e74ce715f4 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -495,6 +495,17 @@
 			groups = "watchdog";
 		};
 	};
+
+	/* specify pinctrl-names = "epa-state" for ePA devices */
+	wmac0_pins: epa-pins {
+		mux {
+			function = "antsel";
+			groups = "antsel0", "antsel1", "antsel2", "antsel3",
+				 "antsel4", "antsel5", "antsel6", "antsel7",
+				 "antsel8", "antsel9", "antsel12", "antsel13",
+				 "antsel14", "antsel15", "antsel16", "antsel17";
+		};
+	};
 };
 
 &pwm {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
