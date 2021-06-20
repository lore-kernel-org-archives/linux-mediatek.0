Return-Path: <SRS0=SDo2=LO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02320C48BDF
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 07:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13A461156
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jun 2021 07:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13A461156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfkaxiE4B3YXMJjJy89DaM36mQv0bUCqK9R4D5kTpGI=; b=qeq6Ob72Nc+k4y
	NmW7cv22n8Sv7p+2lMKehzI+njtOEVdFtSlbAAl+WQF+7pdu1nWAWl4fGZ6ls+OocBoyy8NrSTOtU
	tPO1Tf+OCrkEr/ybU/5uj3Hv/SU7rKuhSbzxOJl3d5iF3yJESzmkpCTuNwOa6nGucxm51iJEbrwUH
	/T0lNcWZfHk+ft4+1V1kSlSQU5N6VCc4EqLo7U/1B9jIwQi0gwLKNU0ZKEE0yZrWNPUVOSOtlcFAq
	+30+cmlzGQQjio2t1dODlVOahgDMM/2fypox2bh/+fWwWmJ+LilUGZGz3UTGDZtVxlzJwQYqjiPM8
	7RzjpDhpE5Awtmcp+9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lusC0-000fHc-Cy; Sun, 20 Jun 2021 07:48:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lusBy-000fGZ-9o
 for linux-mediatek@lists.infradead.org; Sun, 20 Jun 2021 07:48:31 +0000
X-UUID: b785ed9185934aed9c45d5b409998b02-20210620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QkS2Hf0bWXZ4HnN40YRDI9AYhuarmLfCzpD2GQCxs/c=; 
 b=tAODL9VzOx7HHJ9jKHSpQrFx6KrzTX7EO4/LZE+MFNE4Mr8vs3H/rCEKg55Nnjalv+MKz6O/Y6FQk+Q4p0D1G+tQ0XKguqq//afzKjoH74LnAI2+R8u+g2Lon1xW8iPHTg6DGqNYcLAB9tA8Owuzm6shCk7e5+Py3ABhj9o3CN0=;
X-UUID: b785ed9185934aed9c45d5b409998b02-20210620
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2112113783; Sun, 20 Jun 2021 00:48:24 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 00:48:22 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Jun 2021 15:48:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 20 Jun 2021 15:48:09 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921: enable aspm by default
Date: Sun, 20 Jun 2021 15:48:06 +0800
Message-ID: <9b704807383f3048898944d2b9cb74e6b4e8d83d.1624174954.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_004830_393273_6941FA6A 
X-CRM114-Status: GOOD (  11.39  )
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

mt7921 is mainly used in NB, CE and IoT application where battery life is
much concerned so the patch enabled PCIe ASPM by default to shut off the
clocks related PCIe as much as possible when MT7921 is either in suspend
state or in runtime pm to lower power consumption.

We still leave disable aspm as an option with module_param for users to
disable ASPM if necessary.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index c3905bcab360..33782e1ee312 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -17,6 +17,10 @@ static const struct pci_device_id mt7921_pci_device_table[] = {
 	{ },
 };
 
+static bool mt7921_disable_aspm;
+module_param_named(disable_aspm, mt7921_disable_aspm, bool, 0644);
+MODULE_PARM_DESC(disable_aspm, "disable PCI ASPM support");
+
 static void
 mt7921_rx_poll_complete(struct mt76_dev *mdev, enum mt76_rxq_id q)
 {
@@ -132,7 +136,8 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	mt76_pci_disable_aspm(pdev);
+	if (mt7921_disable_aspm)
+		mt76_pci_disable_aspm(pdev);
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7921_ops,
 				 &drv_ops);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
