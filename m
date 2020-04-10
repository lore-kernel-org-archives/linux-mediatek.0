Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4827DC38A2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1F92083E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 22:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2VMbswj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D1Xrstmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1F92083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm3jfFJwkYvmueYbOjtmqTkvUkksBYQ4p91X2HMuPuc=; b=l2VMbswjIhpX+A
	ozBy6CnscWe3HUH0AT8rCbe261YARCjuNi/K+dze2lcNVhwjVzHDd6Svoc6SZMJ8saHwDUu/CSHoP
	cwZ4HUv4vwpPaQqAgviRaLnQoorwaVgKifKhTfGssUk0sRSmwJeLPKvyh1SKNXOFmGLOelAZXg0W4
	fcFbyuhvNup3al/jyEMyPQL5s+SB4pbnl147/rCzarB1jnZRfXyAlYx0jcyalknjDBhrr8VPuCjTC
	wFpVIIy0OOWi/eR2Jco1AiSDjaFgdR4FdScSPVmwoU4iMCtWGzysCcBTCTYRjmbPxFL+h73dT1uVT
	yeA9xIUm6EDYD9qYopyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2V9-0002wD-Pb; Fri, 10 Apr 2020 22:51:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2V6-0002u4-Pb
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 22:51:54 +0000
X-UUID: bfb1b70c927343c3b7856ad89f34a89d-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vqu/zutvPUGFQUduE/Rc88ZnxYelSwiRPzDq7UrqkPY=; 
 b=D1XrstmjR+na6e8YMgAbuE4OUKGfXW4scIfHCWtd86wsXzh1xCP8Zdw6lZGm3pDHepSYlew6tamv6rvdfZDZGbwR8JYo8dL/g/g8oadFhgJ5vkwvyS2g4S30uT5UwupcKkncTBNkfziRNq1WQgL8cDBMosEG83enXp8sHaz09+Q=;
X-UUID: bfb1b70c927343c3b7856ad89f34a89d-20200410
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1717714900; Fri, 10 Apr 2020 14:51:51 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:45 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 05/16] mt76: add HE phy modes and hardware queue
Date: Sat, 11 Apr 2020 06:51:20 +0800
Message-ID: <27f2054108ef7ae4520ff266ead1927125545566.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2921474DE6C42D4AA44CBA91E2BE402C4CE69B73769D5C563934F196D5E5595F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_155152_848886_C8D5DC30 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is a preliminary patch to support 11ax deivces.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index c5e44c896097..b2984e1caa36 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -60,6 +60,7 @@ enum mt76_txq_id {
 	MT_TXQ_BK = IEEE80211_AC_BK,
 	MT_TXQ_PSD,
 	MT_TXQ_MCU,
+	MT_TXQ_MCU_WA,
 	MT_TXQ_BEACON,
 	MT_TXQ_CAB,
 	MT_TXQ_FWDL,
@@ -69,6 +70,7 @@ enum mt76_txq_id {
 enum mt76_rxq_id {
 	MT_RXQ_MAIN,
 	MT_RXQ_MCU,
+	MT_RXQ_MCU_WA,
 	__MT_RXQ_MAX
 };
 
@@ -577,6 +579,10 @@ enum mt76_phy_type {
 	MT_PHY_TYPE_HT,
 	MT_PHY_TYPE_HT_GF,
 	MT_PHY_TYPE_VHT,
+	MT_PHY_TYPE_HE_SU = 8,
+	MT_PHY_TYPE_HE_EXT_SU,
+	MT_PHY_TYPE_HE_TB,
+	MT_PHY_TYPE_HE_MU,
 };
 
 #define __mt76_rr(dev, ...)	(dev)->bus->rr((dev), __VA_ARGS__)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
