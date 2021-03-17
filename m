Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF49C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:28:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7BB464F30
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 16:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7BB464F30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BBqlXV+gpxTYTwkiGM+tpAfRzuBY6uOI4/ZuPQK+8m4=; b=Nydv8y88J2KovXU+gMvB+Z1QYZ
	7sqtW8nhMN+wwidMyxU7lbatCehUgOhQc7HqfQWzmP7YuWQNqzPKx9ha9PweY4mLa2O+qKqzuAuzz
	C733xj1MWiITyfYbaC1JzPYvtXj66W9TLSM5dcuxBmE5b3g4PfRlke+qXmLj8z8gw9+eYLr1k4zJl
	9QmqQIEKJ/SkVlIS3m4X0EoZyOGTpxma7qQKYhYhwAK50Oj5It6Ufh1S0pLjREUR4Ag49WWmLEE7N
	y/GHjIHSh3y++HCXOGZKNSndEcUgXUHHRLPiWOcGUx2H5JHt+aJyV+wFiAnnpFqoH2AjXizUTDemR
	Au+BwYow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMZ1U-003Yes-8y; Wed, 17 Mar 2021 16:27:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMZ1P-003Ydd-E3
 for linux-mediatek@lists.infradead.org; Wed, 17 Mar 2021 16:27:51 +0000
X-UUID: effb0db2695644abab3f8b998faa83ab-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Bb9bJIntmFy10zrLnIKArebybBvk7zuaXc7p0LfHFPs=; 
 b=leyYFaAQY29b5+TROlPjCDSKh5mZfbOyd+hxwospNf5OqhrOdN9XxoaSKQzKlfqEo3vvlAzOpcrma6G2+AX5lSKZLYWCLcEor0Bq7vtc+jdQ3vlfq/vhCHXtE2/NmQBD51dJeGtjjcz3wZVSYNjoo8IFvU3MdFK7YoORfRnebfA=;
X-UUID: effb0db2695644abab3f8b998faa83ab-20210317
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 544881579; Wed, 17 Mar 2021 08:27:41 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 09:27:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 00:27:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Mar 2021 00:27:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Shayne Chen <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7622: add ePA/eLNA support
Date: Thu, 18 Mar 2021 00:27:36 +0800
Message-ID: <1fb0ff65cb7d8c4f3197a87b43c26c5925e973ea.1615997929.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7D846F657E33A424517F43A1E3D6A28EA76700F69B8EB68FF761DD751EA164682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_162748_119930_E123F6F0 
X-CRM114-Status: UNSURE (   8.90  )
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

Switch pinmux to enable ePA/eLNA support.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7615/eeprom.c    | 29 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/eeprom.h    |  4 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index 6dbaaf95ee38..d3182573163c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/of.h>
+#include <linux/pinctrl/consumer.h>
 #include "mt7615.h"
 #include "eeprom.h"
 
@@ -136,12 +137,40 @@ mt7615_eeprom_parse_hw_band_cap(struct mt7615_dev *dev)
 	}
 }
 
+static void mt7615_eeprom_parse_hw_epa_cap(struct mt7615_dev *dev)
+{
+	struct pinctrl_state *state;
+	struct pinctrl *pinctrl;
+	u8 i, *eeprom = dev->mt76.eeprom.data;
+
+	if (!is_mt7622(&dev->mt76))
+		return;
+
+	i = FIELD_GET(MT_EE_NIC_WIFI_CONF_BAND_PALNA, eeprom[MT_EE_WIFI_CONF]);
+	if (i != MT_EE_NIC_WIFI_CONF_EPA_ELNA &&
+	    i != MT_EE_NIC_WIFI_CONF_IPA_ELNA)
+		return;
+
+	pinctrl = devm_pinctrl_get(dev->mt76.dev);
+	if (IS_ERR(pinctrl))
+		return;
+
+	state = pinctrl_lookup_state(pinctrl, "epa-state");
+	if (IS_ERR(state))
+		goto out;
+
+	pinctrl_select_state(pinctrl, state);
+out:
+	devm_pinctrl_put(pinctrl);
+}
+
 static void mt7615_eeprom_parse_hw_cap(struct mt7615_dev *dev)
 {
 	u8 *eeprom = dev->mt76.eeprom.data;
 	u8 tx_mask, max_nss;
 
 	mt7615_eeprom_parse_hw_band_cap(dev);
+	mt7615_eeprom_parse_hw_epa_cap(dev);
 
 	if (is_mt7663(&dev->mt76)) {
 		max_nss = 2;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
index a024dee10362..a609c4bb108c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.h
@@ -64,7 +64,11 @@ enum mt7615_eeprom_field {
 #define MT_EE_NIC_CONF_TSSI_2G			BIT(5)
 #define MT_EE_NIC_CONF_TSSI_5G			BIT(6)
 
+#define MT_EE_NIC_WIFI_CONF_BAND_PALNA		GENMASK(3, 2)
+#define MT_EE_NIC_WIFI_CONF_IPA_ELNA		0x1
+#define MT_EE_NIC_WIFI_CONF_EPA_ELNA		0x2
 #define MT_EE_NIC_WIFI_CONF_BAND_SEL		GENMASK(5, 4)
+
 enum mt7615_eeprom_band {
 	MT_EE_DUAL_BAND,
 	MT_EE_5GHZ,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
