Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B48C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B4822249
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 02:29:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9fG5S4J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ux63eHHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B4822249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/UNocHpIaFTvY2Zd885g8jEcqOHf5wBIuDYh2wlC04=; b=L9fG5S4JfNDdY06LS+frV3ATZ
	EDjai+4C30A18AvUuvVGNocz1JPk9TugDK2MsX/Ioa7HPHxCzuI+9MlUH6/vhNV8b9pTlAEQppYWB
	UPeLxcEbzamfgiF1eWLGuMpWgomZhVoqr/ZUPWEkBgeujumq36EuHn9TF0R99yXPZA+my11bLT4A5
	c754QWP1AxdaZXpwxx5fBPaBFICkKl/VM0dB4onYIuFHh+UPB3PuZkYzzkkuzuLNS8UxxT7tMbNZp
	QGzU6++m9SI/3beWYUESZ3nHeuV5JILemqCjx1r5kAtej1R2D1CLey4jZNEF9n10xWV9xZJ/2nUmL
	8JhLMXMuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVQLa-0002y5-4a; Thu, 22 Oct 2020 02:28:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVQLV-0002uX-5n
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 02:28:55 +0000
X-UUID: 854b3e08c9794413b376c67c41a597b6-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=guyuTsoRUuSIeXgClFrwBChoxIhGLul/egI0BsmawRk=; 
 b=ux63eHHpMmtk5l6aDADjDviBZlrxohd4mcYpYs0NuroW/mMt2BKGinHF7/+QGjhrML4P9zq1nWIJY5u6j34W88GyCGszLB9ByrVm1MXr5YRrSXCH2d9qffWNklb1/FJxPrGmUI6pMRZDI2CqfF7c53qpZnDsDeVzyM+4bZRb8xI=;
X-UUID: 854b3e08c9794413b376c67c41a597b6-20201021
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 894066515; Wed, 21 Oct 2020 18:28:42 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 19:28:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 10:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 10:28:38 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v4 02/10] mt76: testmode: add snr attribute in rx statistics
Date: Thu, 22 Oct 2020 10:28:12 +0800
Message-ID: <20201022022820.3077-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201022022820.3077-1-shayne.chen@mediatek.com>
References: <20201022022820.3077-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A48846BED3A15C7579A47C7470F215387AD934F3FF0CC8ABEDFA51E09C5F6C442000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_222853_393559_4F637D81 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support to display snr value when dumping rx statistics.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: change snr attribute description to u8

 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index 02c9495..4d22627 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -101,6 +101,7 @@ enum mt76_testmode_stats_attr {
  * @MT76_TM_RX_ATTR_RCPI: received channel power indicator (array, u8)
  * @MT76_TM_RX_ATTR_IB_RSSI: internal inband RSSI (array, s8)
  * @MT76_TM_RX_ATTR_WB_RSSI: internal wideband RSSI (array, s8)
+ * @MT76_TM_RX_ATTR_SNR: signal-to-noise ratio (u8)
  */
 enum mt76_testmode_rx_attr {
 	MT76_TM_RX_ATTR_UNSPEC,
@@ -109,6 +110,7 @@ enum mt76_testmode_rx_attr {
 	MT76_TM_RX_ATTR_RCPI,
 	MT76_TM_RX_ATTR_IB_RSSI,
 	MT76_TM_RX_ATTR_WB_RSSI,
+	MT76_TM_RX_ATTR_SNR,
 
 	/* keep last */
 	NUM_MT76_TM_RX_ATTRS,
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
