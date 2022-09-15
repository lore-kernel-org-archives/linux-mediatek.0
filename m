Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9DCECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YkxDDvQTqV0T2kgqiwptXOrxnydc9XfbPvm55Lt05Q0=; b=L/L/QTaS2anRN6aEEMXiwxFn9c
	cPIsQy4aCBj6bhILc9YsTYImxU79HcBK+41aNWPx7rg+kHpDxwDOCacwqi+GWPw9Z7dvk37U0g7L6
	X7hH6qUNTpSM0shRNOxuNo+MRctY5Q0ExZvewEGRt5cCNvkns1m0YIcCFHFjo7ArIVRaNgYOJxZdL
	XZn2VWZbm9GC9xClMJlFkdAAAh89NqW1idNYvEsyb+r9++6uWp4uBd+Z/BMKPGt3bo736XiUEu/eR
	4v0UlJcg7Xi3VfXv9cuhaVPI+UgzjhYuCXT3fVgY918x6gtwugqxPv9UqpFPBEMBWAbBvKemRKhHk
	/5khxBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYi2D-001oJn-O5; Thu, 15 Sep 2022 06:07:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYi2B-001oIj-ES
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 06:07:37 +0000
X-UUID: 23fbaafcb44c45f4851eaec32f639770-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YkxDDvQTqV0T2kgqiwptXOrxnydc9XfbPvm55Lt05Q0=;
	b=ASFl1ntJ19L2r1GeyWqCH/VEpjcJpSPBKqPPaMRwYPiRL3eKRJlxPLF2e41v1FNjxQ6lxOVQIckNw7XGgFPqgDAO90OSjRfOPZvkbymD3e8vOeeJvA+EU/bC/wQGK8VmTHWZzeQdYKm04Po82lzf4nLjpELDp1iFNsew7dXH1ZI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c7d548a4-073b-4876-8965-e51f4665029c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:5dc0b47b-ea28-4199-b57e-003c7d60873a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 23fbaafcb44c45f4851eaec32f639770-20220914
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 169930021; Wed, 14 Sep 2022 23:03:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 15 Sep 2022 13:32:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Sep 2022 13:32:36 +0800
From: <sean.wang@mediatek.com>
To: <stable@vger.kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Deren Wu <deren.wu@mediatek.com>, "Johannes
 Berg" <johannes.berg@intel.com>
Subject: [PATCH 5.19] wifi: mt76: mt7921e: fix crash in chip reset fail
Date: Thu, 15 Sep 2022 13:32:35 +0800
Message-ID: <404d2f5ec663128342541fa392a47226a46e5634.1663219530.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_230735_516774_5F8C3259 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

commit fa3fbe64037839f448dc569212bafc5a495d8219 upstream.

In case of drv own fail in reset, we may need to run mac_reset several
times. The sequence would trigger system crash as the log below.

Because we do not re-enable/schedule "tx_napi" before disable it again,
the process would keep waiting for state change in napi_diable(). To
avoid the problem and keep status synchronize for each run, goto final
resource handling if drv own failed.

[ 5857.353423] mt7921e 0000:3b:00.0: driver own failed
[ 5858.433427] mt7921e 0000:3b:00.0: Timeout for driver own
[ 5859.633430] mt7921e 0000:3b:00.0: driver own failed
[ 5859.633444] ------------[ cut here ]------------
[ 5859.633446] WARNING: CPU: 6 at kernel/kthread.c:659 kthread_park+0x11d
[ 5859.633717] Workqueue: mt76 mt7921_mac_reset_work [mt7921_common]
[ 5859.633728] RIP: 0010:kthread_park+0x11d/0x150
[ 5859.633736] RSP: 0018:ffff8881b676fc68 EFLAGS: 00010202
......
[ 5859.633766] Call Trace:
[ 5859.633768]  <TASK>
[ 5859.633771]  mt7921e_mac_reset+0x176/0x6f0 [mt7921e]
[ 5859.633778]  mt7921_mac_reset_work+0x184/0x3a0 [mt7921_common]
[ 5859.633785]  ? mt7921_mac_set_timing+0x520/0x520 [mt7921_common]
[ 5859.633794]  ? __kasan_check_read+0x11/0x20
[ 5859.633802]  process_one_work+0x7ee/0x1320
[ 5859.633810]  worker_thread+0x53c/0x1240
[ 5859.633818]  kthread+0x2b8/0x370
[ 5859.633824]  ? process_one_work+0x1320/0x1320
[ 5859.633828]  ? kthread_complete_and_exit+0x30/0x30
[ 5859.633834]  ret_from_fork+0x1f/0x30
[ 5859.633842]  </TASK>

Cc: stable@vger.kernel.org
Fixes: 0efaf31dec57 ("mt76: mt7921: fix MT7921E reset failure")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Link: https://lore.kernel.org/r/727eb5ffd3c7c805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
index b0f58bcf70cb..106c88b723b9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
@@ -345,7 +345,7 @@ int mt7921e_mac_reset(struct mt7921_dev *dev)
 
 	err = mt7921e_driver_own(dev);
 	if (err)
-		return err;
+		goto out;
 
 	err = mt7921_run_firmware(dev);
 	if (err)
-- 
2.25.1


