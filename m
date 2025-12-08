Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08763D3B7F2
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ioJR3HvY95MFa1H5oC3LXKyjjKQkofpBY9nnFT13BBI=; b=qB+3H1lf0ZEAe/+zf+f0l7YIpg
	pH9rvxjtImIT2CoEiTYLNAAICUapFWnErArHSXcu9y4XGMG4OrsygFh3WDEL09IAHV/udz+LdxToV
	5ErUZ5fSIKPkB5ay+BGAgbUmu6Go/xDmTmD8sdJfzZMabeh6dIe2cO8vTkIeTjXU130bMDvNwa7zN
	UQ6vc4ZcXcq0Z8RqNLqvhphqnGFOhQAs8+01auxlCgic63rgW0UR8Twwf4etuExEiIXY+gghLGnVV
	RwM+roqSD31qNo4UuTCP3O4sRPY7yFwWgoXcHozgeeFhb3HQrl9O2loOqgwv0CwhKKJx4NLh1eFhn
	S2R1ZZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc0w-0000000DAi2-0S21;
	Mon, 08 Dec 2025 14:14:58 +0000
Received: from mail-4318.protonmail.ch ([185.70.43.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc0t-0000000DAhg-2FRQ
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 14:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail3; t=1765203293; x=1765462493;
	bh=ioJR3HvY95MFa1H5oC3LXKyjjKQkofpBY9nnFT13BBI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=H9KbloPedYf7OIR2JF3t4gOjdYNJSBfVqOecIP+7iJyElugXv94uwr5dkhx15qAHZ
	 1lZAg8pgJK6QOxtfxI0Euqw1VPYSDpJ9Ja6si23Z0fl00evZ54r6GYhXEXn7CEmYlJ
	 vn4zUR72wtFh7m/ascm91e6uB/0LztkhNk7OPYVJ7rXYOuUbNoA1l+fIv6qTeBFW7V
	 fzIWeBSqXyIX5bQEMD3EvwVZpxpseSsQoH0/2rGmMp+2GBy2RvMJUcoZPSOS4ztcz9
	 XUCBV46U7qtK3j7o8megKkomdlC7fhrtfX+t0VJZfJWUoEicReQ9Fq6HlDEvfPsbLV
	 LK4fX+Kkyz3jQ==
Date: Mon, 08 Dec 2025 14:14:50 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH] mt76: mt7996: increase txq memory limit to 32 MiB
Message-ID: <acfe2e25768b414518be2db22b1d3ba6f5db6fa1.1765203249.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 03ab75c6190e4ee54eaadf543b2174c48cc519a7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_061455_747524_3E343675 
X-CRM114-Status: UNSURE (   4.59  )
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

Prior to this change, both 2G and 6G radios would fall back to the
mac80211 default of 4MB which is not enough for high data rates.

Signed-off-by: Chad Monroe <chad@monroe.io>
---
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net=
/wireless/mediatek/mt76/mt7996/init.c
index 00a8286bd136..b5ea997fd75c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -523,6 +523,7 @@ mt7996_init_wiphy(struct ieee80211_hw *hw, struct mtk_w=
ed_device *wed)
 =09ieee80211_hw_set(hw, SUPPORTS_MULTI_BSSID);
=20
 =09hw->max_tx_fragments =3D 4;
+=09wiphy->txq_memory_limit =3D 32 << 20; /* 32 MiB */
=20
 =09/* init led callbacks */
 =09if (IS_ENABLED(CONFIG_MT76_LEDS)) {
--=20
2.47.3



