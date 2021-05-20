Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423DAC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB801611BD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB801611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ms9UxIji+VU0g2jEUzPrEvD4V18aj84vc/H0ig1N8AM=; b=C+N/XEg/MLADkDN196bf0EOSA
	pR40hqLOpEI8SyzA4Q1tYxRWcACmibjCTZfkXe/KNYIA8Bkd3VekyF+y0cSU/ztONoKZ1Gkz0608S
	ZvPjOdqnVhoDmtlU/JkkIKlFMIhJxgVLjDf4cPWW4AyAVbamqYs9b/yARVo9Ce3Y3SUAcv8ntrrX4
	9qhUwvchbqCHrsjB3GXpVFIriRtmrOf9Mj/UGyx/fV4qPSUfSFu10tYJm5t9nH0m4XbE93VNJBU8v
	xLdgzliZ8CDOFY5whK9657ADtRLntq/YF4poJhxGmm2FtofpGovM15FQ1Gp9TD+QH9+McGgSJjiWY
	RLyr3TPBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZfi-005nNY-G6; Thu, 20 May 2021 03:48:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfc-005nLZ-07
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=uHLSNEPyXw+VmBFrct7Tk3j6etz/hO3MWbJvEgJ3dHk=; b=euzwniewqxQenf3TG3A9JBHcLY
 freZyny0xDb9c5hQ7em0XgBjuizTbyqPTHCZQGaC2Cb8weAG1CuPW7a6MGtBZMa8O+SoUNwdN7eWZ
 kupYC66a0ipn+mH9LW6KMPO2WlhmtNcmqiXLIApNa+ieGE9dOTF0G/y4QEWd8r6VU0w5j198cU8P+
 Yp1lf/g9sfItaACG3fFBbAaMILVt1Z6Ab8E/Dq3jmyvIUGi2hQlPQm3FnKM7Xw68+ugatEKKW4Glb
 A1ltGChW9gn6TqxrVXBvKmhjR0vIQq5UOzIRk4GlOcoAo/rdzhTIjVoJsKKp8tRgoYDdZI3VBdaoj
 vYSwcP0w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfZ-00FumR-Gu
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:48:22 +0000
X-UUID: df46966078064ce4978067ba08fb2e60-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uHLSNEPyXw+VmBFrct7Tk3j6etz/hO3MWbJvEgJ3dHk=; 
 b=SucOqerFwnt2CTKgVBEJHqXNJnVGIVDMlF5RatbuIlT3AYGXCT11Ml+SvVSqmu+calIRD0At+u8Ejn6PVAxbcAmZW2iZ2JfNxssrUuC261PP5w40DhiwTAytcrd6laggSyt32QbTzRfrjhjcxc5e+QgWuDMTATn243qCKpujLKc=;
X-UUID: df46966078064ce4978067ba08fb2e60-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 414357478; Wed, 19 May 2021 20:48:12 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 20:47:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 11:47:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 11:47:04 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 7/7] mt76: mt7921: enable runtime pm by default
Date: Thu, 20 May 2021 11:46:41 +0800
Message-ID: <1621482401-29025-7-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
References: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_204821_588778_9E33E2DC 
X-CRM114-Status: GOOD (  10.98  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

mt7921 is mainly used in CE/IoT market so enable runtime-pm by default

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c  | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index d78eb4ec4b8a..7f5589cd8213 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -185,7 +185,6 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	mutex_init(&dev->pm.mutex);
 	init_waitqueue_head(&dev->pm.wait);
 	spin_lock_init(&dev->pm.txq_lock);
-	set_bit(MT76_STATE_PM, &dev->mphy.state);
 	INIT_LIST_HEAD(&dev->phy.stats_list);
 	INIT_DELAYED_WORK(&dev->mphy.mac_work, mt7921_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7921_scan_work);
@@ -200,6 +199,7 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	dev->pm.idle_timeout = MT7921_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
+	dev->pm.enable = true;
 
 	ret = mt7921_init_hardware(dev);
 	if (ret)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 486e5593d99a..b7957f4cc321 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -942,8 +942,6 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 	dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
 #endif /* CONFIG_PM */
 
-	clear_bit(MT76_STATE_PM, &dev->mphy.state);
-
 	dev_err(dev->mt76.dev, "Firmware init done\n");
 
 	return 0;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
