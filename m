Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF521C433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E23229C7
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E23229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oOw7DlfhRa+ziyaHN81a8oIJxrXkMWcxy0r6FnfXQ1g=; b=s0t20WubJws2baZu+P8lNONZkg
	/w+tbvpX9PoD+M0B9+owEyUj1RIjHJzoTe/0SHvMwHm47loIr0OTgucvDoEIj4YAzVuv+3yQHZiAC
	pPlaAH7ERQ6ygG+SaNQe/ydfV4Hv2PyU5w+CSOhimNKJmHZIqFsYVjF3s3o2FEdKY0RH7HAq889Zb
	LgDOHwORhIeyjZscF1attKwn2qXId5q9CBoUVjaESoTDlPAxv2MfiRReUykYqY4hqNWjLAwdNC16V
	4ntiehqgu4VyYavlD9fqdpvnXxbv9aivzT+8H7hWrSw5hBjsg/N6oJbLBa7vp0P0DuXSzCRTqQ2pu
	exyRBfRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkYk-0006E0-Nx; Tue, 05 Jan 2021 11:31:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkYh-0006CT-6A
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 11:31:28 +0000
X-UUID: 29cdb0cc12894144b2744022a616b88c-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4tT/inEqEUmSCTTxkEpAQezIkJrmHnF2/5kL1a+YBU0=; 
 b=M55qNRANNV1zsR53BIZDv0VSpJP0N4js8I6FDFrx6lZK5fB0djCe/NvL1mjPaDWvsZfL6kgNOCAnz02RHdRgrIKtx7S0w3WrXkDExNgtvYx3Szp95zRGPjLMsmv8O3o/vq4UVb6PBTi0BZsLM5kKQYIZkZvg1/8KPS1MWfU5kes=;
X-UUID: 29cdb0cc12894144b2744022a616b88c-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2068259730; Tue, 05 Jan 2021 03:31:18 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 03:31:07 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 19:30:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 19:30:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 1/4] mt76: testmode: add a new state for continuous tx
Date: Tue, 5 Jan 2021 19:30:42 +0800
Message-ID: <20210105113045.17815-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7E5E07FCAB5EEA3F854DA865564EF26F7A0991E141CB9B2D9F73D132B9646A5F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_063127_485677_EEAB4E0D 
X-CRM114-Status: UNSURE (   8.54  )
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

Support to set a special tx state in testmode: continuous tx,
which is used for sending tx without time gap.
Note that continuous tx mode doesn't send real packets, instead, it's
pure phy signal, and the waveform can be observed by instrument.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index e4849946f180..6db8109a0945 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -140,12 +140,14 @@ enum mt76_testmode_rx_attr {
  * @MT76_TM_STATE_IDLE: test mode enabled, but idle
  * @MT76_TM_STATE_TX_FRAMES: send a fixed number of test frames
  * @MT76_TM_STATE_RX_FRAMES: receive packets and keep statistics
+ * @MT76_TM_STATE_TX_CONT: waveform tx without time gap
  */
 enum mt76_testmode_state {
 	MT76_TM_STATE_OFF,
 	MT76_TM_STATE_IDLE,
 	MT76_TM_STATE_TX_FRAMES,
 	MT76_TM_STATE_RX_FRAMES,
+	MT76_TM_STATE_TX_CONT,
 
 	/* keep last */
 	NUM_MT76_TM_STATES,
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
