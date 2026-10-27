Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51260606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 19:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTPyV23H;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=vyQu4x15
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cJlwniNIJ0xDoWOsli3cb6MLnfn7HwEBdaBmsbX5UP4=; b=JTPyV23HPhE6AcqUJmmeLSw6jV
	xM+HBM7/nECUTGiASfR5L/VIbt9pPDdXQtBjXd8zv08iCNbtvCx+eQDkLssx9R6yVfnGUDZhAR8Xf
	Eq7p0FP01MNeZx4I5DPliGrZO0xyuYVWg9wDK4Hf4pi7MTYBRHMxhd5y3yM6Byk3LTUQGUILkGO6b
	4kB/ERoBoRMP/V+YMKYLFaLHQ0QkH51a+4s/LBs2z4EWbqTidUR9ihMBTpPW3Yc6c03DEXTV5HuF1
	tNLSMQju31RzUvQlsBAyz9UFEuzDwUm3jxgKx72W7MTr8Bc4XXo+xG7zaVnL/5lylVUVqNBVQEQjt
	1Exp+T9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJH-00000005hAz-3ZOx;
	Tue, 27 Oct 2026 19:58:15 +0000
Received: from out-129.mta0.migadu.com ([2001:41d0:1004:224b::81] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLnJC-00000005h8y-2XYf
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 19:58:14 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6ZXRmxti2ps4BKs1nT0dZJAbH3VLUW48J2CzoUJpFrU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793131087; v=1; x=1793735887;
 b=vyQu4x15r7e/QOuYozY4EnyUrIaWa0/x18Yd0SD2JdpqRAnOiYDtgahM7VlVuB9SFXkgtTxD
 UPNYeBOK3I5Ca5xEI/vDqET6g/3EAiD9OpSZwG9OwNc2MU8+UpgIa/nAJ4pWdOheCM0tO9a+mTa
 OU0vVFhrpTzfHk95n6QVB0RjZxvb5kwAC0uYTH54DDNbJ1BggSw221cJPB6tanGlUsgEV0dZ3Ir
 nJbhCYiCLBN9os1icIp/OeV3/ZCjJuoAvwjixdvU3DenaM19AY4W6dt9j0FZy+sGUtd+utu7fzy
 2BBILM1i+paX9YqpV4dSG7tClbXUsTIoWOpBtGkh0+kNQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c273b73cd2621e85;
	Tue, 27 Oct 2026 19:58:06 +0000
X-Mizu-Trace-ID: c273b73cd2621e85
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
Subject: [PATCH wireless 0/4] wifi: mt76: mt792x: make active monitor work
Date: Tue, 27 Oct 2026 12:57:59 -0700
Message-ID: <20261027195803.711995-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125811_939739_1A24DD4A 
X-CRM114-Status: UNSURE (   6.38  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Active monitor on MT7921, MT7922 and MT7925 never gets a channel, and
since 7.3 every mt792x refuses it.

Patch 3, Mark's change from the morrownr/mt76 tree, passes every mt792x
monitor to the driver as its own vif, as MT7927 already does. Patches 1
and 2 keep the sniffer armed for such a monitor, and patch 4 offers
active monitor again. This replaces the revert I sent in September [1].

	active otherbss monitor, channel 6    stock      with the series
	MT7921AU (USB)                        refused    87 beacons, passive 87
	MT7922 (PCIe)                         refused    88 beacons, passive 86
	MT7925 (USB)                          refused    87 beacons, passive 87
	MT7925 (PCIe)                         refused    88 beacons, passive 88
	MT7927 (PCIe)                         refused    86 beacons, passive 88

Passive capture is unchanged, and on MT7927 it now survives a scan.

Patch 1 needs 180b57e3a455 ("wifi: mt76: bypass DPD on a scan channel
while a monitor is active") from mt76, not yet in mt76-fixes.

[1] https://lore.kernel.org/linux-wireless/20260903200947.27051-1-lucid_duck@justthetip.ca/

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
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 70 +++++++++++++++-
 .../wireless/mediatek/mt76/mt7925/testmode.c  |  4 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 10 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  6 +-
 11 files changed, 167 insertions(+), 24 deletions(-)

-- 
2.56.0


