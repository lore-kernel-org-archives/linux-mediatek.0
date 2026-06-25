Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C8ECDE001
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BofeMr5SJas+mlT8C0E5IvVa/LjMCWkJI7bAD3WK+OY=; b=jsYl/aaWgZb2BcfBFC6Vt+tz+0
	mStJEjweWcqk4/TYP0Vov0hH682Qzwvyr9sWRZtk2NTXlSn/NEOaJgbmWSm37KGwiIdM0frVtqttO
	oEQgLUt+qMRZqYpLgJ2+Ym3C/kykcjoA7wgjArEt/oGE4bWK05//ihAf4Ey0Xm7B86yTmxlIFAwTP
	eslIF4muThyQbgH5o9Hednfzn4F12oEHtzv7kCSQa7qb0E5fVW5eB5YPDJYFSHKmjAZYbRcJvWc+V
	aubwCxTTx1ERV/Tsm3y8v7qstEzYilNxMni3VW0xz4X7papsR7HejnkS+TS4Tq9l2hQH4rkPYW8Tq
	VonfT0zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciua-00000009A4G-3Hio;
	Thu, 25 Jun 2026 12:10:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciuZ-00000009A3r-3eLf
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 12:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4466241871;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25803C2BCB3;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782389427;
	bh=Dty4ExmM2WYiI8hqciFmMkMhflmLtlNOEVWDhBzCpHg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IrNwxMCmX95bEcOtuwvenoN7AU8ewQblmMoRHwIe74sBPi7SMpLhbJd7TO2y/7jW7
	 9sK08DfeldhFCgD84P4Rk3WSvmtJixPZb4jwKkafKGuUHRDE4aPBLPKCbwwpHPsoAf
	 iSPdQVZ+WDC20xcAuj66G8fzxKRVGH1kYyn04p/DbZrmKHEo3BDnAna3EFs5rzYemO
	 QANb5voKwaMOjE6ie96zepx31sQSgAR4+vanxk8elko95b0Bv+TYGD83BIdPq6Rej0
	 6B5JOwE6uXJtjWa8RvBT3t6QX4fqTNN/BA9+aL6qzJc9Zr6hGOgVKfB7Q2zw6fQS/G
	 W3SFFKku+AsWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CFBCDE000;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Date: Thu, 25 Jun 2026 07:10:26 -0500
Subject: [PATCH 1/2] wifi: mt76: mt7915: bound the device EEPROM address
 before the EFUSE copy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-b4-disp-16f99062-v1-1-aee52ecf61b9@proton.me>
References: <20260625-b4-disp-16f99062-v1-0-aee52ecf61b9@proton.me>
In-Reply-To: <20260625-b4-disp-16f99062-v1-0-aee52ecf61b9@proton.me>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782389425; l=1655;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=aZWlM27FhqoCfxmJEBrSyxbvPm89MZy5+yTxeP7W7hk=;
 b=0XZxwtAAOcq9Lmc4I1vnT7NeXbySG07w+iH8wO2HoPrfrbVh26jz+Gl81dv8m+OnjffMpuH4W
 ipASWDIUA4eCst0lPXtaJ/mvw4EWP7L+kYUMqbw4MnzXPpEd0Dq/j3V
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

mt7915_mcu_get_eeprom() copies a fixed EFUSE block into the driver's
dev->mt76.eeprom.data buffer at the offset reported by the MCU response
(res->addr, a device-controlled __le32) without checking it against the
buffer size. A malicious or malfunctioning device can report an arbitrary
address and drive a 16-byte out-of-bounds write past eeprom.data.

Reject a response whose address would place the copy outside eeprom.data
before deriving the destination pointer. Devices that echo the requested
in-bounds offset are unaffected.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Cc: stable@vger.kernel.org
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 4a381d351e61..f39eae3c4c1c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2909,8 +2909,15 @@ int mt7915_mcu_get_eeprom(struct mt7915_dev *dev, u32 offset, u8 *read_buf)
 		return ret;
 
 	res = (struct mt7915_mcu_eeprom_info *)skb->data;
-	if (!buf)
-		buf = dev->mt76.eeprom.data + le32_to_cpu(res->addr);
+	if (!buf) {
+		u32 addr = le32_to_cpu(res->addr);
+
+		if (addr > dev->mt76.eeprom.size - MT7915_EEPROM_BLOCK_SIZE) {
+			dev_kfree_skb(skb);
+			return -EINVAL;
+		}
+		buf = dev->mt76.eeprom.data + addr;
+	}
 	memcpy(buf, res->data, MT7915_EEPROM_BLOCK_SIZE);
 
 	dev_kfree_skb(skb);

-- 
2.43.0



