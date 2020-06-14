Return-Path: <SRS0=Y4ok=73=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F4CC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:38:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E32206B7
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:38:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBCht6rs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DB5uIEK/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E32206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pRf90cn+MxHN1md/i4vDBh9mp0JZDu2NVXKwX5i/V1w=; b=nBCht6rsHANd+l
	nhXtqw+XhCecVc8n3VjaK9vS18Zv3U4s0lBqmnAy/thO2pmHnmjqRqIT+0zMThqo+xUXKxgJ3XrQW
	JVFxq7TqGIpd8gYYskT7F9GcK/nMlHbeT+zurOm5WGpeMGsXbdH8J3pDYm0Nr9pairrfHTNAyRfNv
	70qgZw1+wKswukNzNtVvUJDm36edGRVTVvZwYHHhwsVMqPtxuJYLHcIa+WB6qFAN2zOnGn6UqqDKr
	U50IQxsHX4G2Gc/2rETx45HRzjS4NBHLg7wAoXYD356Fh1o2p7heqQ0GJ+u7wAqn0V6xwpP86vC4H
	l/6qFiK8iiLxmWHgUJIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkXW0-0004sb-Fe; Sun, 14 Jun 2020 18:37:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkXVx-0004sA-VG
 for linux-mediatek@lists.infradead.org; Sun, 14 Jun 2020 18:37:55 +0000
X-UUID: 865763a2e7e042a1b9762a0f665cd2a0-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BJmFZxpc5gJCz9bp1c2mprgDExNZVkRketLDbjwuhBA=; 
 b=DB5uIEK/BdCnCXAZwofRYD6R9QJUrE6LX+j7JliI8NpJV25I2MVOapQ1340UTdEkflXlSgiHacfYL0HAAh3TgwUZmAu4vVXmRYjur9ZxJL+lSGCpmgulD29ZaOqK0wbyvemqboztmbwVk5CSl6WVHR7annfS5JLTHiNIk02GJsY=;
X-UUID: 865763a2e7e042a1b9762a0f665cd2a0-20200614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2051720676; Sun, 14 Jun 2020 10:37:34 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Jun 2020 11:27:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 02:27:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 02:27:45 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 0/4] mt7915: add MU-MIMO support
Date: Mon, 15 Jun 2020 02:27:43 +0800
Message-ID: <cover.1592158312.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 51BD0B510CE7B4BDB95B28DDD489A5BBB0D09640FBCC167C46E2AB553BF6D0ED2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_113754_010204_20267D9F 
X-CRM114-Status: UNSURE (   4.53  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds MU-MIMO support.

changes since v3:
- add patch 1/4 to avoid open coded and fix a wrong WMM parameter assignment.
- cleanup unused sta_rec_mu_edca_tlv.
- fix a wrong enum number "MT_LMAC_BMC0 = 0x10",

changes since v2:
- move CONFIG_MAC80211_DEBUGFS fixup into patch 1/3

Ryder Lee (4):
  mt76: mt7915: add missing CONFIG_MAC80211_DEBUGFS
  mt76: mt7915: add a fixed AC queue mapping
  mt76: mt7915: add MU-MIMO support
  mt76: mt7915: use ieee80211_tx_queue_params to avoid open coded

 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 11 ++-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.h   | 10 --
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  7 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 91 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  6 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    | 34 +++++--
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  5 +
 8 files changed, 127 insertions(+), 39 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
