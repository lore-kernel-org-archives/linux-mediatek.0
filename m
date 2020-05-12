Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D098CA90AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 19:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C5E20731
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 19:39:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OyTMLoL3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0w44dNpd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C5E20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EH1ic03oQaryI6Hui7eVpnRP9F+dxls8qX+LMuH1h8A=; b=OyTMLoL3Dz0rbV
	IaRg60ZqHFUOmvVfgvetl8j+176gvKqZokVRoLmpMxKLmthR84Do7xng/1nLcGY9lrqQDBb6sKE9b
	eF5GQN2xyqhhs4CiUrdNjICtqJ9Stg2gQ7mk7mUMGDiJSPkzVGDhvdn6agO38SnmUjoFm/nxe85BT
	SbFROdBjR9Y4u1552x8DBqKBPJPLF3IYL3kmkwesm1nqRYugwHg1W0ndTak36DtTc7FkApSLH/6FN
	7GJ3ZJaG5INLW+g96tu5F88fE/Z5PixbnBtkF87Mnejosgo64YgSKs6z5A9qhc4dGyujfQRGegUHl
	KvR69IJ8xXmd8hql4m4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYakN-0003Pp-Dl; Tue, 12 May 2020 19:39:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYakK-0003Ow-S7
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 19:39:22 +0000
Received: from localhost.localdomain.com (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B67120740;
 Tue, 12 May 2020 19:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589312360;
 bh=cEO2UxS+58IVwrtFxpvwa4vTrrz+8SPKSk8iWUrc3Hs=;
 h=From:To:Cc:Subject:Date:From;
 b=0w44dNpd/1VkDBn68+V3GYcYgpz8ALBmsu7Uf6RbxcH8Ki107RNA9Ep5ZUUyZGJS7
 ZV+YeiutSbLsjtmTi422s+LJpAfm2EDA7m4kVPsEcG10i6u5NVG1q9SsigRsLNb0wU
 gLD+AXvTWOJsjBbmIWo0kx1kkG2vYGQJvLv4vL74=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7663: fix the usage WoW with net detect support
Date: Tue, 12 May 2020 21:39:13 +0200
Message-Id: <b2f1eeb63059e5b337a1f1996f0fd9890fef1955.1589312203.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_123920_930174_0C72F66F 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

mt7615_mcu_sched_scan_enable should be taken along with
mt7615_mcu_sched_scan_req to have proper scan plans initialization.

Fixes: bd39bd2f00c3 ("mt76: mt7663: introduce WoW with net detect support")
Co-developed-by: Wan-Feng Jiang <Wan-Feng.Jiang@mediatek.com>
Signed-off-by: Wan-Feng Jiang <Wan-Feng.Jiang@mediatek.com>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 96bf39a4a3da..ef50b9a885f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -3351,8 +3351,8 @@ mt7615_mcu_set_wow_ctrl(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (wowlan->nd_config) {
 		mt7615_mcu_sched_scan_req(phy, vif, wowlan->nd_config);
 		req.wow_ctrl_tlv.trigger |= BIT(5);
+		mt7615_mcu_sched_scan_enable(phy, vif, suspend);
 	}
-	mt7615_mcu_sched_scan_enable(phy, vif, suspend);
 
 	if (mt76_is_mmio(&dev->mt76))
 		req.wow_ctrl_tlv.wakeup_hif = 2;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
