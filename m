Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09112CDE000
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awllAxmt9GN9pmpw1m8uWwiGZYriStEgUiAf2wOOfjM=; b=NW6tHNe5b3ItRnO9LuRnuRkhhv
	bdodTDOAKhLGxR+7otLC6lvGz4z7xbX+/OaJ7ExGyClkTWveXjJvHCp1gniLjwhgnDE72IaIIRUvJ
	bsmCAetBIkBGixrvycrhPob8fAZvjw2UuG/7GprZ9OOAICqQYswIEibHSJB9KVLkIxhbuJiLYUTzV
	O1goif/gOdaqh5Cco9Xh5ANe7Fwea/X0Z6t8wiorGjbUDq4pnEhmb0y8GDbS/hEJbN3QmlNgkCD3C
	sYUXe33gBCC4okgaSl2iPGGnI0V47iGK/+i7HjV03tbMoPPFeD9+EQ/S5djgFxkp4Xbuz1MZSBrAG
	RI8ItK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciua-00000009A4L-3T7R;
	Thu, 25 Jun 2026 12:10:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciuZ-00000009A3s-41xv
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 12:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AFAE4188F;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4070FC2BCF4;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782389427;
	bh=ba/68qyLW4RJgqhb23CSgIV/K9uiVqn6kZrVBreVKm4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IcbDSo0759wPfaItgWUYu6iNa0PiJe8/f0a2fRkgIkghvRn4Ywa1cHiegqcS8TpMc
	 ky6ARcjXOFGnGPLNXBVNQWK3Fo2OdUZpAvy+M5qu2AObGIrm32q9TZylhKsROnTQuZ
	 lJrjCjM7qdFz3RSzbNNKIVavB1PyILN2en91Huyd/5C6OrNuBsBK2HPqU0pdHypCwr
	 /8L4OAEjHOynA989XxMjJ6GWpVc2nB5cd/HRY6bnppfJE2ZTKQ6OQioPzQJ4ZrkCGo
	 DEnvAT6tgW1Tf2+UV65ccsLYb/vfVapYUBR1Jo78X4T/dYATgpfD2KJINXpzaHwjqs
	 lg7clX9MHMA6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 344BCCDE001;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Thu, 25 Jun 2026 07:10:27 -0500
Subject: [PATCH 2/2] wifi: mt76: mt7996: bound the device EEPROM address
 before the EFUSE copy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-b4-disp-16f99062-v1-2-aee52ecf61b9@proton.me>
References: <20260625-b4-disp-16f99062-v1-0-aee52ecf61b9@proton.me>
In-Reply-To: <20260625-b4-disp-16f99062-v1-0-aee52ecf61b9@proton.me>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782389425; l=1841;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=5P3fKrvZnuhhzy5SyS2bn1gs3Kjjy/aad3X2rpiBcW8=;
 b=TzCsJWAssrI7MlgIxRUv7fUA8WIpBL8zgXK9SEJ+kpD7XCKVFah0X2W0VMmAPNTcyBz8sGKgd
 EwFEZjQZrSUA/ZEhUDno/MD/fCtQkyxLt0J5Z8GlzaSOiITTVCGO6/4
X-Developer-Key: i=hexlabsecurity@proton.me; a=ed25519;
 pk=dmppBMZNLLoPzxHi9l8tZDzEZUunPbgsYqIZYXeUrL0=
X-Endpoint-Received: by B4 Relay for hexlabsecurity@proton.me/proton with
 auth_id=814
X-Original-From: Bryam Vargas <hexlabsecurity@proton.me>
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
Reply-To: hexlabsecurity@proton.me
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bryam Vargas <hexlabsecurity@proton.me>

mt7996_mcu_get_eeprom() derives the destination of the EFUSE/EXT block
copy from the address reported by the MCU response (event->addr, a
device-controlled __le32) and clamps only the copy length, never the
destination offset into dev->mt76.eeprom.data. A malicious or
malfunctioning device can report an arbitrary address and drive an
out-of-bounds write of up to MT7996_EXT_EEPROM_BLOCK_SIZE bytes past
eeprom.data.

Reject a response whose address would place the copy outside eeprom.data
before deriving the destination pointer. Devices that echo the requested
in-bounds offset are unaffected.

Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index f119f023bcd5..01c9adbca68b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4345,11 +4345,18 @@ int mt7996_mcu_get_eeprom(struct mt7996_dev *dev, u32 offset, u8 *buf, u32 buf_l
 	event = (struct mt7996_mcu_eeprom_access_event *)skb->data;
 	if (event->valid) {
 		u32 ret_len = le32_to_cpu(event->eeprom.ext_eeprom.data_len);
+		u32 block = mode == EEPROM_MODE_EXT ? MT7996_EXT_EEPROM_BLOCK_SIZE :
+						      MT7996_EEPROM_BLOCK_SIZE;
 
 		addr = le32_to_cpu(event->addr);
 
-		if (!buf)
+		if (!buf) {
+			if (addr > dev->mt76.eeprom.size - block) {
+				dev_kfree_skb(skb);
+				return -EINVAL;
+			}
 			buf = (u8 *)dev->mt76.eeprom.data + addr;
+		}
 
 		switch (mode) {
 		case EEPROM_MODE_EFUSE:

-- 
2.43.0



