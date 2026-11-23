Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E753606A32A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cttaQBL;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=bl5wmz5o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v8zKp58yyLFt3dB7QJADCCQYCEc5lgjCH9XzEzv79aM=; b=1cttaQBLop0883XdxeHHWaxlDn
	393Fri0FwrdJqkZrkyy09RQiGlvzyt5u195V6nhiU7Ql2F9BAowWcrMr/BBUjPiX/S7a96sTCpom1
	64t0dLkLaH8E51OgqdD4PSS5B2TR4pgebTr87g3ZYBtSR3dWAtOLGC50NCsTpcEJRWEz669Jebz2F
	6l9F9+OTONjvvvKV8dYncDjwkjY1VWd7Ij8xaV5/SMsoKqU4IpIJhiMZjynDEMFiKVF56M+A8Tabf
	W1PMYys5pfOfDJehrg3Gwl1YfIwW+VDuuUvP/zOIQnrcDG7LzVBHIjZM1LaabTsTacGHUZWwthQz7
	/oKcDcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVry-00000003x7m-4BpV;
	Mon, 23 Nov 2026 15:22:15 +0000
Received: from out-227.mta1.migadu.com ([2001:41d0:203:375::e3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVru-00000003x39-1Fwl
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 15:22:14 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TuoKZdA/7wPsWYl6vUS1ef609FzzX3aYXg+j/s/iJcI=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795447326; v=1; x=1796052126;
 b=bl5wmz5oc1BN295M8MSurI2gCWDsbryODxrb3TT3azp0ATY/Hpoewjts4OygVuGSXD9+V85S
 xJn1HWUOHoUeaQq5pv7VuQ14E3xi8GfCNCgAkb6aQgaACd96qLwjSZS3jEWJ8/kqF1oThbZ4WxR
 l+C3i5nwO4Cr1WP7HTW9ukbASakTm1wqvbtsqSXs008c+NbytxYZ9VJ+vGN2KnIy7U4qIDm7eg0
 lg1OKmBMeQztGnOrttYhACaPzw1+VI1PGT3WnCcnho1yjV87lpS0stC8X5OTZbGfTK1aRx+OPHe
 +lt2doWmlC+DgZ2bq5ItxgaV8HDFGP7WPLo/i94bqsFdA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 305311556e50466b;
	Mon, 23 Nov 2026 15:22:06 +0000
X-Mizu-Trace-ID: 305311556e50466b
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Mark Anthony Agarro <markanthonyagarro@gmail.com>,
	Alex Gavin <a_gavin@icloud.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next v2 0/4] wifi: mt76: mt792x: make active monitor work
Date: Mon, 23 Nov 2026 08:21:50 -0700
Message-ID: <20261123152154.99634-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072210_705979_94740099 
X-CRM114-Status: UNSURE (   5.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before 7.3, an active monitor on MT7921, MT7922 and MT7925 never got a
channel. Since 7.3, every mt792x refuses one.

Patch 3, Mark's change from the morrownr/mt76 tree, passes every mt792x
monitor to the driver as its own interface, as MT7927 already does.
Patches 1 and 2 keep the sniffer on for these monitors, and patch 4
offers active monitor again.

  tested on         MT7921AU and MT7925 over USB at both speeds, MT7922
                    over PCIe; MT7925 and MT7927 over PCIe on 7.3.5
  active monitor    hears the AP as well as a passive one
  passive monitor   unchanged once a channel is set; with none set, it
                    listens on the radio's current channel, as on MT7927
  after a scan      a monitor on MT7927 keeps capturing

Suspend with a monitor up needs Felix's mac80211 fixes [1].

v2: rebased on mt76; patch 2 also covers mt7925's power save code.

v1: https://lore.kernel.org/linux-wireless/20261027195803.711995-1-lucid_duck@justthetip.ca/
[1] https://lore.kernel.org/linux-wireless/20261110185436.2015505-1-nbd@nbd.name/

Devin Wittmayer (3):
  wifi: mt76: mt7921: keep the sniffer on for real monitor vifs
  wifi: mt76: mt7925: keep the sniffer on for real monitor vifs
  Revert "wifi: mt76: mt792x: do not advertise active monitor"

Mark Anthony Agarro (1):
  wifi: mt76: mt792x: pass monitors to the driver as real vifs

 drivers/net/wireless/mediatek/mt76/mac80211.c |  5 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../wireless/mediatek/mt76/mt7921/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 82 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   |  5 +-
 .../wireless/mediatek/mt76/mt7921/testmode.c  |  4 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 76 +++++++++++++++--
 .../wireless/mediatek/mt76/mt7925/testmode.c  |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 10 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  6 +-
 11 files changed, 169 insertions(+), 28 deletions(-)


base-commit: afe54fd58a8781c1e96b81e42bbb67851a61ed18
-- 
2.56.1


