Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D916C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BD320738
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 19:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CXSrk+Gh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jq25Rx78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0BD320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b4R0yvBop4emItf272T5DF18ty7VE7sWY6UlqbAtsp8=; b=CXSrk+Gh2aI1G39oaFeYwWiSv
	TlKZZCzQra0V8JAsAsHiJCjQ4qqKK3ZMuWbDSRRtTksqxmn6jCPDYS4qeQ97W02u3PPbZBKJAKqXA
	SYLJn6ryR3LjGKEs5mjObhVUAYV+ZxVJ9RHRCCMOtTkBkk7T4OEhvMbgoN9sGvLSYI8YLSekME6Hp
	aOHl/DDskHOdVSHD8FaXGVG9TwzZKhhX6DtC+JOR+cdaxl5drSH+LwI7ZZoVCSUKx5T6M8qX2RqI3
	MIYqEx3suNCYzCtbMToUyS1i0ea0BZJ6gLkj9zn8GtGTCTszKukx0LbVBxSncQd/d0c1K8T/9iveS
	OA0YT5uGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jst5a-0003OY-Va; Tue, 07 Jul 2020 19:17:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jst5W-0003KY-IG
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 19:17:07 +0000
X-UUID: c41c259de92149bf8667e639c3595c8f-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/WUA0+LRnFB+TGhQ0pQghsVlxdUXTpYr3oN8/7I5g/Q=; 
 b=jq25Rx78OWmVL8dfMgMH6EC3GVo+o3TDtNV/N3OHzq4cg5i60vEzakcRsCHsn1StDTMCvy3ZrYcatUO/WxSi3GhZZYcAWm6kEY0Kt7AXdQaeGQbnI1UV9cZigVZ/aBSxRB+vGe0P60qTSJKgeV8jJr7mYAqOKKhsXOFgOUAOvtw=;
X-UUID: c41c259de92149bf8667e639c3595c8f-20200707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1309902814; Tue, 07 Jul 2020 11:17:11 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 12:16:53 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 03:16:45 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Jul 2020 03:16:46 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 3/3] mt76: mt7615: fix potential memory leak in mcu message
 handler
Date: Wed, 8 Jul 2020 03:16:48 +0800
Message-ID: <1d14e3065c4cae75ac8c91fcedd5af80f8282413.1594148548.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
References: <57b81f8efe7e767616a0d5957728756cbfdfa235.1594148548.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_151706_826750_607C6598 
X-CRM114-Status: GOOD (  11.74  )
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
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fix potential memory leak in mcu message handler on error condition.

v1 -> v2:
        - add Acked-by tag

Fixes: 0e6a29e477f3 ("mt76: mt7615: add support to read temperature from mcu")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 1b46cccd93c5..58e3838a3dba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -183,8 +183,10 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 	struct mt7615_mcu_rxd *rxd = (struct mt7615_mcu_rxd *)skb->data;
 	int ret = 0;
 
-	if (seq != rxd->seq)
-		return -EAGAIN;
+	if (seq != rxd->seq) {
+		ret = -EAGAIN;
+		goto out;
+	}
 
 	switch (cmd) {
 	case MCU_CMD_PATCH_SEM_CONTROL:
@@ -215,6 +217,7 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 	default:
 		break;
 	}
+out:
 	dev_kfree_skb(skb);
 
 	return ret;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
