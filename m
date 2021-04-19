Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CAAC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2BB61221
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2BB61221
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cj0RH3+RiQiEurKQizjPi+XEEkhEofADp/HTG+pDZkI=; b=naDuqBfD9tTeQrCK/WX+8U1fy
	kAsJXM0EyMYlGPQZMsouSbcYt0SIU9b3158o+YRaRO9Bten/I/Pbvln2klc2dmcD+k/o79RigdImy
	bgCrmn4ZAFhYB9x7bVolsGXXthy19WpIcJvsfNBT2c8PMoX4qnw12OVpOpKK29C6dxbufwafB+VmY
	5qRGfWA4iomO8Qm58NBwl9938t2zDw1foMlCwy9h/kepfaIfP8WPmmTeWQsh1q5+AU12NPADpf8r9
	fUIkBgMV0z14l6zto55VOIGD+yvvADggbwUwL23R9F6Ses87SEniDOxJe+G74Zm08sY+SyoiWQYMU
	k6X9l4QaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYUm3-00A4n7-TC; Mon, 19 Apr 2021 14:21:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUm1-00A4mG-4M
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 14:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=UN+tG3wxrerkJyna2GJZRZHpvY/ORJx9lS6Rl1lRfDg=; b=0DGQACfV1VHKOKNY/68HUWKp1M
 F3uVQUz72DxbC6mh/mFWzNoa3rtocP7S7maYG9o4P0zm8d3DC7/fdL4av2ne+4AoK/FM6ryUmnISn
 MecvVHoMk38/mQdecRfLo6jfLPzZ0KAgAl9mg2l37QluOFMPaH2os2KlgJ8RcaEAX4FwrCg+aX8hg
 4xVfJsMRrugE5vJqFPeJ8r0HV4+U7zjPvTFZ2eCeshITTYBf483HR2sLhVbujyJfm0YukCR60zyod
 QJKiJjZzLtjclXtMvZBEaVrZ8KkPhRBG+7gRDOEdXqd32Ks/M438pwaAAOxlsla6U+bsQ5T/8jv/G
 HTH1Tj3Q==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYUlv-00BRib-Tw
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 14:21:09 +0000
X-UUID: d5cc2e58e3e648b8b2443c0b8ad3723c-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UN+tG3wxrerkJyna2GJZRZHpvY/ORJx9lS6Rl1lRfDg=; 
 b=pyTtvibTlX6DqJprtpAiQIg1x+MJCVO0iYutXjMKCQTkiONmsVQ84IJsc5UV+k2eDaD5+iQkLsMwN+WtkbN8CQHojiHm9bYQVRboTuliqapNGea97mY+PEqUc6KXSUpSvBy1wm2hMqCx57D+H2wor0Fdse/VEsOIzvmW0IyT3gQ=;
X-UUID: d5cc2e58e3e648b8b2443c0b8ad3723c-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1827558588; Mon, 19 Apr 2021 07:21:04 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 07:21:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 22:21:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 19 Apr 2021 22:21:00 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 6/6] mt76: mt7921: enable deep sleep when the device
 suspends
Date: Mon, 19 Apr 2021 22:20:59 +0800
Message-ID: <1618842059-8192-7-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
References: <1618842059-8192-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_072108_018851_62D07C6B 
X-CRM114-Status: GOOD (  10.59  )
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

From: Sean Wang <sean.wang@mediatek.com>

Enable the deep sleep mode in suspend handler to reduce the power
consumption further.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index d5da98d36f63..25f27e9d379b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -201,6 +201,9 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 			return err;
 	}
 
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, true);
+
 	napi_disable(&mdev->tx_napi);
 	mt76_worker_disable(&mdev->tx_worker);
 
@@ -239,6 +242,10 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 		napi_enable(&mdev->napi[i]);
 	}
 	napi_enable(&mdev->tx_napi);
+
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
+
 	if (hif_suspend)
 		mt76_connac_mcu_set_hif_suspend(mdev, false);
 
@@ -261,6 +268,8 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	if (err < 0)
 		return err;
 
+	mt7921_wpdma_reinit_cond(dev);
+
 	/* enable interrupt */
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 	mt7921_irq_enable(dev, MT_INT_RX_DONE_ALL | MT_INT_TX_DONE_ALL |
@@ -279,6 +288,9 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	napi_enable(&mdev->tx_napi);
 	napi_schedule(&mdev->tx_napi);
 
+	if (!dev->pm.enable)
+		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
+
 	if (!test_bit(MT76_STATE_SUSPEND, &dev->mphy.state))
 		err = mt76_connac_mcu_set_hif_suspend(mdev, false);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
