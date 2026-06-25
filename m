Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC98CDB479
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cF3+jafvYSrDPDBtgYwVywOYLEr7NhgJgh0vNIVDrWY=; b=ZZOJSLMWTyZpVW5+T3ftnJeJ9N
	aOPbOe7OJPo0ltbGGT385sfek7jwAu1pFbylfbua7bg9a3hS0S4WPY97sFZ132aHnBTFz+pM98ZkA
	ziLhbzJszkbtKbEdXpmNl8fWF9mAKmTIsZStOntylWDQzh1erpfOedDRKbr48sCnEaYsgMLjQZkMo
	Ip1G3gxkkS3a+EO8TQv9rP+YE87+SpTzd8UcyM5TMyEIdHsJ3S7oXYCyaO9x2CyZizAZVih7VFO43
	dNb0USKuX0wmyE1qpkOE9C0XBPODbDukaMDWlNAtX97qBfhbDKS47k8pRKsaY8FdtsqKIrhOyaGLz
	SN57F6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciua-00000009A4X-3hXH;
	Thu, 25 Jun 2026 12:10:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wciua-00000009A3t-0Z8b
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 12:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 616C6600C3;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 150BCC2BCB4;
	Thu, 25 Jun 2026 12:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782389427;
	bh=aEqGl/t2oeE3z5GCNLJYJ3vk5L2f28hG2tdsN4d5BLI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qS4jsolariue/Qa5Yhu/dzHltsP3icGVPnQ4OcO2wQdkYLCDeC0SrPcTo/OawaO3u
	 qFC5xGZVAsARGHikM+dk528euNhbeLaMwgoO4bOWLVN4VBzWp6KCI6faaFRSPtP7ML
	 3zfN1q2i1E5RIZiRsvVOqd9CW5JK4syGKlMnuO92FuKDy/6P23cwF0xGoMPwjKw3BK
	 8+mo+Z9vui1DDdbGuoa8P84GOWrva4CECt8pJo8VS06Uurkmf/gNY3i2YoBv7r/EOm
	 5TrEZjd01D23FkSr9PfEhoXXPTpdRgBrq5UsUZMA+ajYSrm/fpBDslVnFWIbZmyG8O
	 qNgaUp7O13KSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED9BCDB479;
	Thu, 25 Jun 2026 12:10:26 +0000 (UTC)
From: Bryam Vargas via B4 Relay <devnull+hexlabsecurity.proton.me@kernel.org>
Subject: [PATCH 0/2] wifi: mt76: bound the device-reported EEPROM address
Date: Thu, 25 Jun 2026 07:10:25 -0500
Message-Id: <20260625-b4-disp-16f99062-v1-0-aee52ecf61b9@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEaPWoC/x2MQQqAMAzAviI9W9iGVuZXxIOzVXuZsoEIsr87P
 CaQvJAlqWQYmxeS3Jr1jBVs28B6LHEXVK4Mzjgy5HoMHbLmCy1t3leDhpkseQ5+CFCzK8mmz7+
 c5lI+pfRdiGIAAAA=
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782389425; l=1450;
 i=hexlabsecurity@proton.me; s=proton; h=from:subject:message-id;
 bh=aEqGl/t2oeE3z5GCNLJYJ3vk5L2f28hG2tdsN4d5BLI=;
 b=WbuVeuUOSSAzABLV05jlMQnSZpj/raKBFDPyhwD8be073heZMHbwiVoYI6fAQpTaqNsazavWJ
 23UyCJqyU2hAq4LnYOQK+5yYicaiaORXEMLHfn0uQiomcyovRq4UWmY
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

Both mt76 get_eeprom handlers copy a device-reported EFUSE block into
dev->mt76.eeprom.data at an offset taken from the MCU response (res->addr /
event->addr, a device-controlled __le32). They clamp the copy length but
never the destination offset, so an adapter that reports an out-of-range
address drives an out-of-bounds write past eeprom.data -- 16 bytes on mt7915,
up to 1024 on mt7996. Both patches reject such an address before deriving the
pointer; a device that echoes the requested in-bounds offset is unaffected.

It is adapter-side only -- there is no unprivileged user path -- so this
hardens against a malicious or compromised device, not a remote attacker.

An out-of-tree KASAN module that reproduces each handler's destination
arithmetic faults the unpatched path (slab-out-of-bounds write past
eeprom.data) and runs clean both with the bound and on an in-range control.

---
Bryam Vargas (2):
      wifi: mt76: mt7915: bound the device EEPROM address before the EFUSE copy
      wifi: mt76: mt7996: bound the device EEPROM address before the EFUSE copy

 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 11 +++++++++--
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c |  9 ++++++++-
 2 files changed, 17 insertions(+), 3 deletions(-)
---
base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
change-id: 20260625-b4-disp-16f99062-0dd6169db97b

Best regards,
-- 
Bryam Vargas <hexlabsecurity@proton.me>



