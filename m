Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6808AC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 10:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsyXyyXTHOyOdmz3S8iHyUqrbJ+hJX4JxNhwpe7/0co=; b=cMXNcTFgHNeBoTezJB+La1k2G4
	mBBBLpZuTcL1ssOOYwPmDU4v4YEQ/fyivDygwwkGaRuK3q5nb1tTCCYBIWpi8gZ9Iunop+Q6KuCY9
	xIaaMM6dh6KEu81porExtzO/ilXWYPpQP8eYW3ZhEGY7g4zHse4I8d8uEh1Oym6kV/njnWdraR9DF
	JT4IuWtQg32KfY1YEm4KkJuHOvLCZtScuxSt59bxPKV4uES6FEgdDLXaUHIRWUPAROhjBUcGWdA3j
	rz2VXCGyV4SHobqPEjvoEojZPlQGEqLTAPVcb5+oGdXhf481dPwe/CbQE31eK5p9akbZSSs9UjPr6
	TdQXxy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnQ-001mW2-1C;
	Fri, 20 Oct 2023 10:32:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtmnN-001mUO-0R
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 10:31:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7F555CE36A0;
	Fri, 20 Oct 2023 10:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63496C433C9;
	Fri, 20 Oct 2023 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697797914;
	bh=XCjwwQVr6jl38xcwubSN4H5Ycb70YzrZh+Ybb+/Y1fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8VdptcAIDN9x/prleh6Rk2Ttdbj4QJRD9eBGNi6A/Pi35CQcDpjmd+X6hFAbyFTU
	 zj+Al4BIWY4XrzSvtoT4Z5znf3RZpMgtt2jRNfjarVvj4l2tYxh3NtznliUz1R/9CD
	 66MRXari/71VjAulC8t7Mc4J3Ro5uPYBO8oDNqXgV2L2q/l9IzzYAeqjE4z+bx+eeH
	 j84ETkqttgSRDAlo9j4MEeweEvkCzQdD1T1Zij9qy+cE9Ty5A9jiJR5ZpDZDln0yV1
	 4GaO785XjOhnfhkSPGpCHT02uRwfgBCkP7PWyxh3022QG68ErcGo9FvjIenC+eZ6NB
	 I3Bqxgg8x1/mg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: lorenzo.bianconi@redhat.com,
	linux-wireless@vger.kernel.org,
	ryder.lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	shayne.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/13] wifi: mt76: mt7996: use u16 for val field in mt7996_mcu_set_rro signature
Date: Fri, 20 Oct 2023 12:30:56 +0200
Message-ID: <78b1ae679ad5555ce94cc28a0b7ef950ae7b24c8.1697797423.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697797422.git.lorenzo@kernel.org>
References: <cover.1697797422.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_033157_344298_D705B57C 
X-CRM114-Status: UNSURE (   9.36  )
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

This is a preliminary patch to introduce WED rx support for mt7996
driver.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index bf917beb9439..3ecdc09323c5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4019,7 +4019,7 @@ int mt7996_mcu_trigger_assert(struct mt7996_dev *dev)
 				 &req, sizeof(req), false);
 }
 
-int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u8 val)
+int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u16 val)
 {
 	struct {
 		u8 __rsv1[4];
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index ccb6c5763956..d4425c133ced 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -397,7 +397,7 @@ int mt7996_mcu_rdd_background_enable(struct mt7996_phy *phy,
 				     struct cfg80211_chan_def *chandef);
 int mt7996_mcu_rf_regval(struct mt7996_dev *dev, u32 regidx, u32 *val, bool set);
 int mt7996_mcu_set_hdr_trans(struct mt7996_dev *dev, bool hdr_trans);
-int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u8 val);
+int mt7996_mcu_set_rro(struct mt7996_dev *dev, u16 tag, u16 val);
 int mt7996_mcu_wa_cmd(struct mt7996_dev *dev, int cmd, u32 a1, u32 a2, u32 a3);
 int mt7996_mcu_fw_log_2_host(struct mt7996_dev *dev, u8 type, u8 ctrl);
 int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level);
-- 
2.41.0


