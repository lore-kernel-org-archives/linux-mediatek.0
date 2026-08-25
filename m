Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE00FC61DB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=094oeYqvVGEeC3pIXlNPJGOJ+FtzVIk0eaOqn9g8krg=; b=j3H89pZRDufgAQ1k2oRwJkm/Y4
	c1FDho5acjBDV6wvsqthJX8uqlTJziBYTlFXthIc5NFg3wnF05DmSFhjNkOKB9A0WK3yJQTmSTc3C
	Ua2uryZNjxaXyJK8xAeSABePEoWv47ZrhojL87LFsOroSEtv2kiDT+MwmMeSp9EvDNPZ7uPHkdNF2
	SdvEGZAlDDTnNUGdx4Pz4bh7B1Yh6h4bHLNhZOj2Y+Jvfpjuix2vN1YIpOOOkp6DvV6rWl3SVWuVQ
	6DPeZ5PTS03bueogHwJAkPYmSZBZySUX7Zp+AwZukQ0rXPkOwZpzeL09s5qTRnfXMCFNV8xMKnskP
	88g8FSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyviA-00000001HqG-3RFc;
	Tue, 25 Aug 2026 18:17:26 +0000
Received: from out-19.mta1.migadu.com ([2001:41d0:203:375::13] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvi4-00000001Hkw-2gGZ
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 18:17:23 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pKWQSQwhloU3UCIEHsjSAI70zbgmQD2DReSgXVQRLss=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787681836; v=1; x=1788286636;
 b=EJ/mOqoZ+3MOkD16zga+8Vp/045+ISk8lKiwywgT2lvax744TV/6PjPdxT70FPnL61gPofM2
 iboyQMF+4T36bLBFEfCpvKxR6MH2hD39JfikYHbih/8yH8s+6yjNrW6PzCkTGzOiHINVPe3oxga
 6rFBXSxPZrBdVeYWeGWZxzePEn0gPDi0mQ+Oiq+nRAAmL9eRXKy+PLpgAeYHcEWPGCUOQCq2Lje
 GdhXSjnp0f/Dnn4u/MHljGWlIe5paNbIVH90OLFNHw00qGO1Tf1EGx1vgXnMOmxXuaZfz20dQfv
 mhCDAtjzr23pFgoF+ge2vERKlH+XAbuEd0BEoXNfI0duA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id c14991048ca0b0d5;
	Tue, 25 Aug 2026 18:17:16 +0000
X-Mizu-Trace-ID: c14991048ca0b0d5
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH wireless] wifi: mt76: mt792x: fix NULL dereference in ACPI SAR init during probe
Date: Tue, 25 Aug 2026 11:17:12 -0700
Message-ID: <20260825181712.28548-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_111721_210303_A947DA79 
X-CRM114-Status: GOOD (  15.60  )
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

Some laptops carry a MediaTek power table in their firmware, and the
driver reads it to set a transmit limit for each frequency range. It
only fills in the ranges themselves when it registers the device.

The startup step that does this existed already, but it never programmed
anything. These two commits made it run a regulatory update instead,
which sets the limits on the way through, long before registration. So on
a machine that has the table the driver reads through an empty pointer
and the interface never appears:

  BUG: kernel NULL pointer dereference, address: 0000000000000004
  RIP: 0010:mt792x_init_acpi_sar_power
  Call Trace:
   mt7921_set_tx_sar_pwr
   mt7921_mcu_regd_update
   mt7921_regd_update
   mt7921_run_firmware
   mt7921e_mcu_init
   mt7921_init_work

Skip it when the ranges are missing. They are applied again once the
device is up, which is where they came from before.

Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/linux-wireless/aoyxqHYvSuaBeubf@soda.int.kasm.eu/
Fixes: 9b80bd9cab40 ("wifi: mt76: mt7921: add regulatory wiphy self manager support")
Fixes: e9f3f1cc133f ("wifi: mt76: mt7925: add regulatory wiphy self manager support")
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---

Reproduced on both chips before sending, an MT7922 and an MT7925, and the
fix clears both. Neither machine here ships a vendor power table, so I
supplied one through an ACPI override in the initrd. It also wants recent
firmware. The June builds do not turn on self-managed regulatory and
nothing happens; the builds now in linux-firmware do, and then it dies
exactly as reported with no interface at all. Patched, both come up and
scan normally, and the injected limits still show through in the power
table afterwards, so the skip does not lose them.

With that table still in place and the fix absent, backing out the mt7921
commit on its own also boots clean, so the table is not what causes this.

 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd7956e4a..b468051fbe68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -323,7 +323,8 @@ int mt792x_init_acpi_sar_power(struct mt792x_phy *phy, bool set_default)
 	const struct cfg80211_sar_capa *capa = phy->mt76->hw->wiphy->sar_capa;
 	int i;
 
-	if (!phy->acpisar || !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
+	if (!capa || !phy->acpisar ||
+	    !((struct mt792x_acpi_sar *)phy->acpisar)->dyn)
 		return 0;
 
 	/* When ACPI SAR enabled in HW, we should apply rules for .frp
-- 
2.55.0


