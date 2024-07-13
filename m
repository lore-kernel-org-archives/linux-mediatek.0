Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817C9C3DA45
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jul 2024 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VzCa+YyckBZTbKOSJCEYsxaUGUagmdTOiRqNzD0ASY=; b=Xs0KEYc+jjtJReK5Jc8mTjDTlx
	iEhARM0e+njj7WkLUGCQvAkMdvNEeP8lKNc4zXVpV2DbifhGv6HDXnAasd/5lzSI7xHPTGGpL+qJh
	jxo8ABfEwNNcPoywNmCmIm+3KJEidTgCzERSpLh4XOnv37QSuOs/FvwYEElh+cJvxFOrUgGru0uC0
	pRfNoi1V+5zpXv31EygyTLfuAOhKmgo6e/3epROF8eGH56OQV3Ktyz3RU4tZp6GzVboWrBTv3ev1P
	PXni00f9bm3RWXtld32QbE51GESjXlHgmKImm6rIeFpuBd/Y19QJd4XP9Y0EZvvvEeWMD3gxGTdjF
	p7GUOgGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sScMQ-00000002Yvb-2hWU;
	Sat, 13 Jul 2024 13:00:22 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sScMN-00000002Yua-1RGc
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jul 2024 13:00:22 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 46DD0Cca1269007
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 14:00:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1720875612; bh=7VzCa+YyckBZTbKOSJCEYsxaUGUagmdTOiRqNzD0ASY=;
	h=From:To:Cc:Subject:Date:Message-Id:From;
	b=mVaP40GbLc/0+2/ZYY3JZ3WuxdxwHS2JhRodwM4B59rpq+Iz2ywKLcP+Z2KOVlx52
	 rpqIVvRscFJjkrbOqVn7WgUaTHagKOOuGJTdn6YXEtXUj0oU/XMwkJZXdeUkssQrzs
	 0li3TJppHH+FylyErIIAW9zrtaQP2Pb3Zd1BZAz8=
Received: from miraculix.mork.no ([IPv6:2a01:799:964:4b0a:9af7:269:d286:bcf0])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 46DD0CQP703220
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 13 Jul 2024 15:00:12 +0200
Received: (nullmailer pid 516049 invoked by uid 1000);
	Sat, 13 Jul 2024 13:00:12 -0000
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] wifi: mt76: fix oops on non-dbdc mt7986
Date: Sat, 13 Jul 2024 15:00:10 +0200
Message-Id: <20240713130010.516037-1-bjorn@mork.no>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_060020_049069_13971F5D 
X-CRM114-Status: GOOD (  11.13  )
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

mt7915_band_config() sets band_idx = 1 on the main phy for mt7986
with MT7975_ONE_ADIE or MT7976_ONE_ADIE.

Commit 0335c034e726 ("wifi: mt76: fix race condition related to
checking tx queue fill status") introduced a dereference of the
phys array indirectly indexed by band_idx via wcid->phy_idx in
mt76_wcid_cleanup(). This caused the following Oops on affected
mt7986 devices:

 Unable to handle kernel read from unreadable memory at virtual address 0000000000000024
 Mem abort info:
   ESR = 0x0000000096000005
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x05: level 1 translation fault
 Data abort info:
   ISV = 0, ISS = 0x00000005
   CM = 0, WnR = 0
 user pgtable: 4k pages, 39-bit VAs, pgdp=0000000042545000
 [0000000000000024] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
 Internal error: Oops: 0000000096000005 [#1] SMP
 Modules linked in: ... mt7915e mt76_connac_lib mt76 mac80211 cfg80211 ...
 CPU: 2 PID: 1631 Comm: hostapd Not tainted 5.15.150 #0
 Hardware name: ZyXEL EX5700 (Telenor) (DT)
 pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
 pc : mt76_wcid_cleanup+0x84/0x22c [mt76]
 lr : mt76_wcid_cleanup+0x64/0x22c [mt76]
 sp : ffffffc00a803700
 x29: ffffffc00a803700 x28: ffffff80008f7300 x27: ffffff80003f3c00
 x26: ffffff80000a7880 x25: ffffffc008c26e00 x24: 0000000000000001
 x23: ffffffc000a68114 x22: 0000000000000000 x21: ffffff8004172cc8
 x20: ffffffc00a803748 x19: ffffff8004152020 x18: 0000000000000000
 x17: 00000000000017c0 x16: ffffffc008ef5000 x15: 0000000000000be0
 x14: ffffff8004172e28 x13: ffffff8004172e28 x12: 0000000000000000
 x11: 0000000000000000 x10: ffffff8004172e30 x9 : ffffff8004172e28
 x8 : 0000000000000000 x7 : ffffff8004156020 x6 : 0000000000000000
 x5 : 0000000000000031 x4 : 0000000000000000 x3 : 0000000000000001
 x2 : 0000000000000000 x1 : ffffff80008f7300 x0 : 0000000000000024
 Call trace:
  mt76_wcid_cleanup+0x84/0x22c [mt76]
  __mt76_sta_remove+0x70/0xbc [mt76]
  mt76_sta_state+0x8c/0x1a4 [mt76]
  mt7915_eeprom_get_power_delta+0x11e4/0x23a0 [mt7915e]
  drv_sta_state+0x144/0x274 [mac80211]
  sta_info_move_state+0x1cc/0x2a4 [mac80211]
  sta_set_sinfo+0xaf8/0xc24 [mac80211]
  sta_info_destroy_addr_bss+0x4c/0x6c [mac80211]

  ieee80211_color_change_finish+0x1c08/0x1e70 [mac80211]
  cfg80211_check_station_change+0x1360/0x4710 [cfg80211]
  genl_family_rcv_msg_doit+0xb4/0x110
  genl_rcv_msg+0xd0/0x1bc
  netlink_rcv_skb+0x58/0x120
  genl_rcv+0x34/0x50
  netlink_unicast+0x1f0/0x2ec
  netlink_sendmsg+0x198/0x3d0
  ____sys_sendmsg+0x1b0/0x210
  ___sys_sendmsg+0x80/0xf0
  __sys_sendmsg+0x44/0xa0
  __arm64_sys_sendmsg+0x20/0x30
  invoke_syscall.constprop.0+0x4c/0xe0
  do_el0_svc+0x40/0xd0
  el0_svc+0x14/0x4c
  el0t_64_sync_handler+0x100/0x110
  el0t_64_sync+0x15c/0x160
 Code: d2800002 910092c0 52800023 f9800011 (885f7c01)
 ---[ end trace 7e42dd9a39ed2281 ]---

Fix by using mt76_dev_phy() which will map band_idx to the correct phy
for all hardware combinations.

Fixes: 0335c034e726 ("wifi: mt76: fix race condition related to checking tx queue fill status")
Link: https://github.com/openwrt/openwrt/issues/14548
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index e8ba2e4e8484..b5dbcf925f92 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1524,7 +1524,7 @@ EXPORT_SYMBOL_GPL(mt76_wcid_init);
 
 void mt76_wcid_cleanup(struct mt76_dev *dev, struct mt76_wcid *wcid)
 {
-	struct mt76_phy *phy = dev->phys[wcid->phy_idx];
+	struct mt76_phy *phy = mt76_dev_phy(dev, wcid->phy_idx);
 	struct ieee80211_hw *hw;
 	struct sk_buff_head list;
 	struct sk_buff *skb;
-- 
2.39.2


