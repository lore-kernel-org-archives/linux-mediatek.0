Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D94C43457
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1826F21BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 12:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sykw+HWu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hnLD23EO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1826F21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qPJZeNPTaSct+HvKf7o7DCdLJnu+Pe9LLr7oN/ol00Q=; b=sykw+HWuemMIqdLYndCj0Z4dK
	z4kgZTZr/hjTZbqwBA4RKxcswKcyJ0EjKJw+KBYs4JbKUXI3iodDWeUhj9EdGqyih/+lvjB5BRd6a
	BcD8RYYmUZgyvNPfgV4HRs0bq3iiSycHi3TbVpw9T5mX99tYgwZfHC/RA4WVcy9QWakVzxEYNhpn9
	31M+DKiAMuTWXWR2HHClSKl4YgETSzJ7VR3rNso02xVYICOJZcyJFywlk4U63bvI2s7TvGeOgTpni
	mEBJry4BF3X80AYQ/fKSMoBsMlupQL+rcjwovKJgaPnUUcyI+5ZH8pDcdOYPQq+mEBEwXO8OFTMde
	y1ygTxNaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxNC-0000PI-Uz; Mon, 12 Oct 2020 12:56:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxN2-0000I8-VL
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 12:56:13 +0000
X-UUID: e23fda6257e34b89ba3437ba5e00f381-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OsrUwQxqriwwfjssZ4zMnRPt/9Y56sd1QaZKXyN19zk=; 
 b=hnLD23EOZMD0lm7TMDQBxhsqcOxWm1Eyd1flAILDuE5vwG8uHcxT8tJ/3gwjYyaDZnxm+aaS96UbUm0uKRPgOrPRDFeVeuq2qi+/uui9m1PYkl1ZP6MbOxlU2qX7tmoeU9qRhqAEEvsnUOLc9rHPdV7ca1DF/RajVOVmnmyk5+U=;
X-UUID: e23fda6257e34b89ba3437ba5e00f381-20201012
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1757219279; Mon, 12 Oct 2020 04:56:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 05:56:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Oct 2020 20:55:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Oct 2020 20:55:56 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH v3 05/10] mt76: mt7915: fix tx rate related fields in tx
 descriptor
Date: Mon, 12 Oct 2020 20:53:58 +0800
Message-ID: <20201012125403.8608-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201012125403.8608-1-shayne.chen@mediatek.com>
References: <20201012125403.8608-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 977D8090A7B6F3DEAFE6B47C9B7C3660E1FB6B749BAD503248BA54D82C5304452000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_085609_229712_F9A55E84 
X-CRM114-Status: UNSURE (   9.34  )
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

Correct the bitfields of tx rateval and bw in tx descriptor.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index 456bb81..0921b6f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -231,7 +231,7 @@ enum tx_mcu_port_q_idx {
 #define MT_TXD6_ANT_ID			GENMASK(7, 4)
 #define MT_TXD6_DYN_BW			BIT(3)
 #define MT_TXD6_FIXED_BW		BIT(2)
-#define MT_TXD6_BW			GENMASK(2, 0)
+#define MT_TXD6_BW			GENMASK(1, 0)
 
 #define MT_TXD7_TXD_LEN			GENMASK(31, 30)
 #define MT_TXD7_UDP_TCP_SUM		BIT(29)
@@ -248,7 +248,9 @@ enum tx_mcu_port_q_idx {
 #define MT_TX_RATE_STBC			BIT(13)
 #define MT_TX_RATE_NSS			GENMASK(12, 10)
 #define MT_TX_RATE_MODE			GENMASK(9, 6)
-#define MT_TX_RATE_IDX			GENMASK(5, 0)
+#define MT_TX_RATE_SU_EXT_TONE		BIT(5)
+#define MT_TX_RATE_DCM			BIT(4)
+#define MT_TX_RATE_IDX			GENMASK(3, 0)
 
 #define MT_TXP_MAX_BUF_NUM		6
 
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
