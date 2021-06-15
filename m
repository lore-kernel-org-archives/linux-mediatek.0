Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101AFC48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 22:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BC4610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 22:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BC4610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2Naeu/yesdYTph49HoYsgQ3thuNcKdH2Q8OdIBhkPlg=; b=mVRVFwv2gepg5C
	PFgzGQBQYDY5iGOvyUGm7vpnf3UJeKdGKKzbmD2Upx0iXSW5fN92jXuYKylabM4BFNeNRij/mgYfP
	VhpkcajlY/DHZy47YA13BGP8U1Nn/QgHtnzmy2phiWP1Q97zoVqQh4Ch0EPekYOjsMM9LjWAkqyW5
	gt0bh442VVOtZmS4nwOLED5ltqCxKyHIuZEBaLSm80KuUgQpia5LGUps3pkOKw0/40XyKBNtMpzSz
	EucSwcfTxeGbs6CX5g+r+4cqDILx1mwa6guMI3LQIc8Qhv+ixJCCrUQv9P3vKg82eBsP0fT1qKrxN
	z3VUYY4+9dzZTKY595mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltI0B-003j1p-4C; Tue, 15 Jun 2021 22:57:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltGem-003Akh-Mp
 for linux-mediatek@lists.infradead.org; Tue, 15 Jun 2021 21:31:38 +0000
X-UUID: 440e54815a304117868b9254903e054d-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kFwZvjU+u3LjaZLRnaCe+Rg38SM3ZF3MA79ZaPQ6mTQ=; 
 b=NJJqIWoC6FoAaCPqONMCclIgcoy1n6JyEn5HCp8zvQmV3Ws+VFaAyZgtA3tiBblqA8AjUpb5mas3be9hsLCzroGjZicdVqFIRIuTRopq8fxHYEbYV7XmAtHL/zvMSB07/+isljH5WuuDwCEG3NUfuQt2OD7sDjoQCLau2YcFeg4=;
X-UUID: 440e54815a304117868b9254903e054d-20210615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1395892370; Tue, 15 Jun 2021 14:31:32 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 14:31:30 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 05:31:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 05:31:11 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: mt7921: fix kernel warning when reset on vif is not sta
Date: Wed, 16 Jun 2021 05:31:10 +0800
Message-ID: <f2fd5eab61a26c43d668cfc06d943f7bf514db36.1623792576.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_143137_086933_04B7D86D 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

ieee80211_disconnect is only called for the staton mode.

[  714.050429] WARNING: CPU: 1 PID: 382 at net/mac80211/mlme.c:2787
ieee80211_disconnect+0x108/0x118 [mac80211]
[  714.116704] Hardware name: MediaTek Asurada rev1 board (DT)
[  714.122303] Workqueue: mt76 mt7921_mac_reset_work [mt7921e]
[  714.127877] pstate: 20c00009 (nzCv daif +PAN +UAO)
[  714.132761] pc : ieee80211_disconnect+0x108/0x118 [mac80211]
[  714.138430] lr : mt7921_vif_connect_iter+0x28/0x54 [mt7921e]
[  714.144083] sp : ffffffc0107cbbd0
[  714.147394] x29: ffffffc0107cbbd0 x28: ffffffb26c9cb928
[  714.152706] x27: ffffffb26c9cbd98 x26: 0000000000000000
[  714.158017] x25: 0000000000000003 x24: ffffffb26c9c9c38
[  714.163328] x23: ffffffb26c9c9c38 x22: ffffffb26c9c8860
[  714.168639] x21: ffffffb23b940000 x20: ffffffb26c9c8860
[  714.173950] x19: 0000000000000001 x18: 000000000000b67e
[  714.179261] x17: 00000000064dd409 x16: ffffffd739cb28f0
[  714.184571] x15: 0000000000000000 x14: 0000000000000227
[  714.189881] x13: 0000000000000400 x12: ffffffd73a4eb060
[  714.195191] x11: 0000000000000000 x10: 0000000000000000
[  714.200502] x9 : ffffffd703a0a000 x8 : 0000000000000006
[  714.205812] x7 : 2828282828282828 x6 : ffffffb200440396
[  714.211122] x5 : 0000000000000000 x4 : 0000000000000004
[  714.216432] x3 : 0000000000000000 x2 : ffffffb23b940c90
[  714.221743] x1 : 0000000000000001 x0 : ffffffb23b940c90
[  714.227054] Call trace:
[  714.229594]  ieee80211_disconnect+0x108/0x118 [mac80211]
[  714.234913]  mt7921_vif_connect_iter+0x28/0x54 [mt7921e]
[  714.240313]  __iterate_interfaces+0xc4/0xdc [mac80211]
[  714.245541]  ieee80211_iterate_interfaces+0x4c/0x68 [mac80211]
[  714.251381]  mt7921_mac_reset_work+0x410/0x468 [mt7921e]
[  714.256696]  process_one_work+0x208/0x3c8
[  714.260706]  worker_thread+0x23c/0x3e8
[  714.264456]  kthread+0x140/0x17c
[  714.267685]  ret_from_fork+0x10/0x18

Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index fb4de73df701..0a2df295596a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1269,7 +1269,8 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
 	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
 	struct mt7921_dev *dev = mvif->phy->dev;
 
-	ieee80211_disconnect(vif, true);
+	if (vif->type == NL80211_IFTYPE_STATION)
+		ieee80211_disconnect(vif, true);
 
 	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.wcid, true);
 	mt7921_mcu_set_tx(dev, vif);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
