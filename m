Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2724AC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:55:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A436A61878
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A436A61878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pQH2Op8dBQtGdP0dWY3FvfRYNpPk3d5G1eM0tZ35qL8=; b=gpF4ltL9GCcqagCyK644cVH6Bl
	trp3sZ5MdG4gyF0a8cmd965iln7ciQPN9nU9X/rsuvKsDDwC0mvBXUxBY0oDOvsTpDX1Glc26Au4y
	X920NrWa1ZPNJnVWrCdiI5F2RvWjP35KYNtUCB/kfyGstodqi46bFscaSyaqDlPAJOVcwf+6YFNrj
	LI1OzKxF7fIqsSck/tF6oMzVej2plFieT3hmSo5CvlERhZ2KlNH9kW0j0dkbjjK+HcpiPtku7/3sk
	iVu6VqDHaOKPZ44ugNFyNT/ZFmgZgc8osRo1vO87UBWqIMQ/jgMJZAnkgEmHdRWQysbT0BtsIQUnm
	JMpLzhLQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1jK-0024TZ-HF; Mon, 29 Mar 2021 23:55:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQvnE-000vJA-Bb; Mon, 29 Mar 2021 17:35:15 +0000
X-UUID: dfd9e60e5b434f0b86fb143c57f9e93c-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mrjo2YUedZP2Xt/dwLQ2GEIZ2tyDFiuostBC76zrcnE=; 
 b=KmFhWZjE2Rf0FLacgqfbQX89+Q36BT5pp0G0mKsBm6QVe10297xgnqVB0m8N5zZl8F76MPE4iaPAgzwsr/3KFpPcnKV7z9RrowOZgt1CSSYIwoS1Gez7JF/bzA39UgYqpeoWQ6FZiF9hEx0l6GQHof/XO1cI0qfg/JKqtg/MG0k=;
X-UUID: dfd9e60e5b434f0b86fb143c57f9e93c-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 723210009; Mon, 29 Mar 2021 09:35:04 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 10:25:04 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 01:24:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 30 Mar 2021 01:24:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2] arm64: dts: mt7622: add ePA/eLNA pinmux for built-in WiFi
Date: Tue, 30 Mar 2021 01:24:48 +0800
Message-ID: <641c5e40f54e7c9c8eaa6be398d7169445b6fede.1617006498.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 33C84F3A3DC6B97209695C5BC5AA06205A65E043701F837A42238801DCC1A5FA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_183513_125510_DC7CA0B9 
X-CRM114-Status: UNSURE (   9.55  )
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
change since v2 - add pinctrl-names = "default"
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 08ad0ffb24df..f2dc850010f1 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -495,6 +495,16 @@
 			groups = "watchdog";
 		};
 	};
+
+	wmac_pins: wmac-pins {
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
@@ -559,5 +569,7 @@
 };
 
 &wmac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wmac_pins>;
 	status = "okay";
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
