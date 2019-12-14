Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D4EC43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 11:26:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA6720706
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 11:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2w3AUlQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q1snk9PL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BA6720706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BRUfIQHBynCKYCEUcexe8addPYiJHRvmDUfVfBduO98=; b=o2w3AUlQIUHlOa
	5iUVXsSJeCalzyG7JdZYDGOsUdrUT/OCdDtdDhCuY8rluKp2X3HEC19I6/JD3hyl4441QsHFerQ8+
	KwKxbmO+tKuGIcWEki+oQRBmmDpMJ08Ze38rbW2MDEasbShN14FIJjudD2lQ5FqXvhearwXmIql4t
	gxM8hZdo0XuUsa43K8BbNXRNdvZvps0PrHLXJ+lV4G6ep3jmer22KcXv87xS2wG2K6acP6YuJrXMC
	S2tM6h3rhbztrpzy89IGpTKb+iG7GC3wUArGsFzvfYb+aRpZm3Hxflogk9H5KhCYr+D3lWMjii4iW
	MmvpV3TrUTKgpfh/es8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ig5Yl-0003W0-Gk; Sat, 14 Dec 2019 11:26:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ig5Yh-0003UJ-Uh
 for linux-mediatek@lists.infradead.org; Sat, 14 Dec 2019 11:26:05 +0000
X-UUID: 190e4aa909db4eedac83f1c264e14e76-20191214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tu9Jxro/WRqZ8zFULZtR4PTpeFKrsiSb8i5Fjp7K8r0=; 
 b=Q1snk9PLCyWms+mrI6Y86hxirL+HOWCY1RYtpTDrJbWTwyBoxo4gLIHIF8mV6bZxOI5PBqK29gOXOMnmhMKY73q0m79flPKkggEa3GJCOyr1EfnNC9u6+DZdUvOnDgzccDJ0AUhZPHTq2H1yFdII2FuITwq23RKVXfXX6DKbBAU=;
X-UUID: 190e4aa909db4eedac83f1c264e14e76-20191214
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 673563318; Sat, 14 Dec 2019 03:25:59 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 14 Dec 2019 03:27:03 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 14 Dec 2019 19:25:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 14 Dec 2019 19:25:14 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH] mt76: do not overwrite max_tx_fragments if it has been set
Date: Sat, 14 Dec 2019 19:22:04 +0800
Message-ID: <20191214112204.32701-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6C614476A65735D8D959C8976F109021CB8C575DD9BAB6DA3602F85CBB2D2B3C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_032603_994903_C5174959 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: Ryder
 Lee <ryder.lee@mediatek.com>, linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Prevent the overwriting of max_tx_fragments if it has already been set
in chip-specific init routine.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 00c2a875a596..0c71d671f29a 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -287,7 +287,9 @@ mt76_phy_init(struct mt76_dev *dev, struct ieee80211_hw *hw)
 	wiphy->available_antennas_rx = dev->phy.antenna_mask;
 
 	hw->txq_data_size = sizeof(struct mt76_txq);
-	hw->max_tx_fragments = 16;
+
+	if (!hw->max_tx_fragments)
+		hw->max_tx_fragments = 16;
 
 	ieee80211_hw_set(hw, SIGNAL_DBM);
 	ieee80211_hw_set(hw, PS_NULLFUNC_STACK);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
