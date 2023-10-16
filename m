Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93D0CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KsyXyyXTHOyOdmz3S8iHyUqrbJ+hJX4JxNhwpe7/0co=; b=UCcKKLA2doSsIW5bo1r0tjbcyM
	gBMM9BL4FwZWNYiecj3b4PrF+lBgOnkIT0ykImurbEn51x5AO2NMdwn78O2z+oupmcSGz4XDGfabY
	AvrVMHKpj4bCUQqJXJhRZh+jMEI9w4+PJZUoE63nP2M6gFhcwSTazhiJMru7CzuNEtqtb4KZubjcr
	1TRRk5D4jIN0BFqxmjgFm34H/8il1BEjPnjlrT29qmAaqmyCniF+1ktn5o8MPRpQIK7Us6yUzfRHz
	l6ETkeU5Wg22siqKnLbWnmjexrBPtrm1iU84CgTQ9cbx/PoInsY2kQumDUfk+2y4d61HrZVAZXDkw
	1NJzd5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJcD-008wNU-2H;
	Mon, 16 Oct 2023 09:10:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJcB-008wMT-1D
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 09:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D50C060DC0;
	Mon, 16 Oct 2023 09:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6D1C433C8;
	Mon, 16 Oct 2023 09:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697447418;
	bh=XCjwwQVr6jl38xcwubSN4H5Ycb70YzrZh+Ybb+/Y1fY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ls7UztXeXzfyUsAlYFS5QKYgkv4eDX/BO+Zkm3lkJ0bnSaIzrhQ58S27nfIPoNHUe
	 mvhudjLNSgdHUQ1Y2zSbDuwW7H+uTjWMfFgV3fTnjGzQCmpsJili3TRrNSWM0RL9MN
	 bIs6Px7Dh6NugSjpN6xoXZSVHqpdaUyLpLRzsIoTqdlPRUwXmGNymxcUXlBMauR6Rw
	 CRnVJYpNAzAV9ot5n4662OIZaQlP9sIwg6LE7LDiOmKmsBoJmwjzQgf/rbrJuazTt9
	 eQck/qdNij5d064l/uoMfZDENLd55VjmazdB2pYCqF6dAIJNoMB4EpSs70whPA54bg
	 giISUJzgn6+WA==
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
Subject: [PATCH v2 09/12] wifi: mt76: mt7996: use u16 for val field in mt7996_mcu_set_rro signature
Date: Mon, 16 Oct 2023 11:03:42 +0200
Message-ID: <3c72c4ecc67fbe86cae9173e44753d86e9ab2690.1697445996.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1697445995.git.lorenzo@kernel.org>
References: <cover.1697445995.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_021019_455121_16635016 
X-CRM114-Status: UNSURE (   9.27  )
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


