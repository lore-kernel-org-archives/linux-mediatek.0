Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6FDC433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 17:26:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9CE2078B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 17:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PWQs3Fy6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LswLyjQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC9CE2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0fczpLER10P+nynUHELT/FFjikXWwrUTsBE6R5iKkOs=; b=PWQs3Fy672cRlAiWpfKGBbf2W7
	dXKYOmbX70aFvR3LSOj0nhHfCNlUWxUJKPgfNMkPMRuDRNOin1kSMRLmhK6fVewkK6XgyRPOJK5/C
	j1yzOoLgi7CeZ1GeGnQeC7/0qGGAopnCz5EyWtQ/fGc3hoIqfhaDnZ2DXawssbF142AwtyP6GXSR8
	aDMJO0Xsehig3AYktKmqONcJ55lrcO+0hmW8qSdZ1vMlMyXy2xKiKHVlobQL+ln3XH+cnvCthaqox
	RSUzvdLpogzJ/qctpw8rJyty+btgKyUurqksEWyq1e8kmaFYVNQ8G+FwDPcreGwhtlqrPKiLkdG/m
	CEoRMQHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juJGR-0006Qm-PN; Sat, 11 Jul 2020 17:26:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juJGP-0006QB-SL
 for linux-mediatek@lists.infradead.org; Sat, 11 Jul 2020 17:26:14 +0000
X-UUID: e62c5ff73f2840cda749648f4ce7deb9-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=KsPZrYh83BKh7NcfY83O8cMZ2ziWNuHaOaDclSXHB/Y=; 
 b=LswLyjQPHkqHnc/BY+9yfpWs8bQgOMifFAoGOT6b65bZ21vBbFm+1UhnEsdeg97dSOIDQ5RU3A7COokOGjnY6UELS50AcXzPofKsL0FcGgEaQ6TnW4IhuN99wV+wZjw+sf1k0o9DZ62aFGOFdmqE60sdHeqZdB1uc0KxWFxmvHo=;
X-UUID: e62c5ff73f2840cda749648f4ce7deb9-20200711
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 659158030; Sat, 11 Jul 2020 09:25:56 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 10:26:03 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 01:25:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 12 Jul 2020 01:25:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: fix potential memory leak in mcu message handler
Date: Sun, 12 Jul 2020 01:25:51 +0800
Message-ID: <4cced050b9b3dc4d1da2a15e38738ba80a30dac0.1594487923.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D7429033F07453C9D9C29E3419561C1A46274DDF38E6A64AE525150F343466A32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_132614_051001_B08C0FBE 
X-CRM114-Status: UNSURE (   9.29  )
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
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix potential memory leak in mcu message handler on error condition.

Fixes: c6b002bcdfa6 ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index eed327b09ddb..ab08622d1736 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -312,8 +312,10 @@ mt7915_mcu_parse_response(struct mt7915_dev *dev, int cmd,
 	struct mt7915_mcu_rxd *rxd = (struct mt7915_mcu_rxd *)skb->data;
 	int ret = 0;
 
-	if (seq != rxd->seq)
-		return -EAGAIN;
+	if (seq != rxd->seq) {
+		ret = -EAGAIN;
+		goto out;
+	}
 
 	switch (cmd) {
 	case -MCU_CMD_PATCH_SEM_CONTROL:
@@ -330,6 +332,7 @@ mt7915_mcu_parse_response(struct mt7915_dev *dev, int cmd,
 	default:
 		break;
 	}
+out:
 	dev_kfree_skb(skb);
 
 	return ret;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
