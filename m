Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8B6C43467
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:26:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2DB42078A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 03:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yqTjciNJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MvD7wMQC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2DB42078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e/UNocHpIaFTvY2Zd885g8jEcqOHf5wBIuDYh2wlC04=; b=yqTjciNJRRCRM3MJJ/AtStsaG
	JPjK52l2yF3aBs3Ds2pbXPwKqqcXu/WgodWiCXeb0IUREz8T0VPu8uFGonZopNb4yhnF/JB45a+0j
	VoBaN8JAzQtPC3EfuolZj1/puJHXpQ82aqm9KHra8agg0l5t38qi84n1kJEOhxZG0FF1A4nZQjHma
	e8UvW9tRuCVkhSi+kqhJF9LCov/fLXpfPEOJDR1gXNYzv6TbEmc/9YbJ/XP58bzrlZMlijZW9NqlA
	8z06n65jTNyApOUjxg3DAEMWGilGFhLTBnxD8Fs5u136mJh31FQK555PhY59apwQScGGAGD1E/pfM
	thMF1kBIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRoTp-0007OK-SE; Mon, 12 Oct 2020 03:26:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRoTm-0007MO-Jt
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 03:26:31 +0000
X-UUID: 917856c87f984718b98837b0d0ef4bd0-20201011
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=guyuTsoRUuSIeXgClFrwBChoxIhGLul/egI0BsmawRk=; 
 b=MvD7wMQCFn1TokB5XqJcIYfnC+5TTGLZ/+doGrNePhOksRcf9JMnhSPcxGGyXseSPXmPXO9ZpHvQ6KyJiqf1LvlE5r5aj9B3qnwNbUO8jxEKcgE+ddOFwHqfP6Wfle6MgwC4s5cFMZA0TnvL//Z1uhRY8XDRnnha17UpJ9zFT1M=;
X-UUID: 917856c87f984718b98837b0d0ef4bd0-20201011
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1007662228; Sun, 11 Oct 2020 19:26:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Oct 2020 20:26:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 11:26:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 11:26:18 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v2 02/10] mt76: testmode: add snr attribute in rx statistics
Date: Mon, 12 Oct 2020 11:25:30 +0800
Message-ID: <20201012032538.21314-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012032538.21314-1-shayne.chen@mediatek.com>
References: <20201012032538.21314-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_232630_773043_2C16ECF8 
X-CRM114-Status: UNSURE (   9.79  )
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
