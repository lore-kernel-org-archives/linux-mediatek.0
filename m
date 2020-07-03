Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63726C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3440B207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HgnZSuzs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="t1lidZgr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3440B207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyfAEXxS7pNMwX8fyDAlR0hEG7COBNwFN3pVuCz+O9U=; b=HgnZSuzsbCzo/BCtKFaoRUgeHp
	YSTlTPZOXdgHjujV9LwPugEgGNtxcvYi+2Ev6AyA06588U0/eXkgn1u3MnwnvommYW+zcd05jvBHA
	qPIGZujSvb1wSWFtqaBZCoUkoptqTGEfWaurIC4EMXZvP265suUibVQkeHXS+pvVmQDSQW80vi0lz
	LvNcYFEOD7DekntyvaxcVRDvh4/jttXGAkQ/LC24kriFZFVBgHhyJguKFqT79FROJDlaV0qXmDjqg
	VmjFNcEsn909HaECusIQJguHuKvsggqhsL7FJDTxB5a2oxRhsJ0UXi7ywmIZlBGCM+PG0Y7xX7HFa
	Fp/w47Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGrn-0005n7-UX; Fri, 03 Jul 2020 08:16:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGrl-0005mX-R5
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:14 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC6A7207DA;
 Fri,  3 Jul 2020 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764172;
 bh=csOdxvZRs9Vf3niv9eWXECJwCoMjHlNr7IeUEa5QgQg=;
 h=From:To:Cc:Subject:Date:From;
 b=t1lidZgr3UooVLx35xE771JZKsccWGDWf2/qnYos/qyopYyJri9Wo3JTIu4eB6nrp
 uVhbJ5fm/KtjMSYCVgipbznzFRs5FiLuQH0Jd+Utg1k+pp7xRddFlZNiCP0bmrRRGq
 0oGF+2nU4jLYbT+29yFHNwL7VmSJj6kB85HlWGFM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 00/22] add runtime-pm support to mt7663 driver
Date: Fri,  3 Jul 2020 10:15:39 +0200
Message-Id: <cover.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041613_952289_6176DDA0 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series enable runtime power management support available in mt7663 offload
firmware in order to put the device in a reduced power consumption state if
idle for a configurable period of time. mt76 driver wakes the chipset up before
tx packets, accessing register map or sending mcu messages.

Changes since v1:
- rely only on mt76 mutext in mt7615_acquire/release utility routines

Tested-by: Sean Wang <sean.wang@mediatek.com>

Lorenzo Bianconi (22):
  mt76: mt7615: avoid polling in fw_own for mt7663
  mt76: move mt76 worqueue in common code
  mt76: mt7615: add mt7615_pm_wake utility routine
  mt76: mt7615: introduce mt7615_mutex_{acquire,release} utilities
  mt76: mt7615: wake device before accessing regmap in debugfs
  mt76: mt7615: wake device before configuring hw keys
  mt76: mt7615: introduce pm_power_save delayed work
  mt76: mt7615: wake device in mt7615_update_channel before access
    regmap
  mt76: mt7615: acquire driver_own before configuring device for suspend
  mt76: mt7615: wake device before performing freq scan
  mt76: mt7615: add missing lock in mt7615_regd_notifier
  mt76: mt7615: run mt7615_mcu_set_wmm holding mt76 mutex
  mt76: mt7615: run mt7615_mcu_set_roc holding mt76 mutex
  mt76: mt7615: wake device before pulling packets from mac80211 queues
  mt76: mt7615: wake device before pushing frames in mt7615_tx
  mt76: mt7615: run mt7615_pm_wake in mt7615_mac_sta_{add,remove}
  mt76: mt7615: check MT76_STATE_PM flag before accessing the device
  mt76: mt7615: do not request {driver,fw}_own if already granted
  mt76: mt7615: add runtime-pm knob in mt7615 debugfs
  mt76: mt7615: enable beacon hw filter for runtime-pm
  mt76: mt7615: add idle-timeout knob in mt7615 debugfs
  mt76: mt7615: improve mt7615_driver_own reliability

 drivers/net/wireless/mediatek/mt76/mac80211.c |  17 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   6 +-
 .../wireless/mediatek/mt76/mt7615/debugfs.c   |  74 ++++-
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   9 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 186 +++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 271 ++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  51 +++-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  42 +++
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |   4 +
 .../wireless/mediatek/mt76/mt7615/pci_init.c  |   4 +
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  17 +-
 .../wireless/mediatek/mt76/mt7615/usb_mcu.c   |   2 +
 .../net/wireless/mediatek/mt76/mt76x0/usb.c   |   6 +-
 .../net/wireless/mediatek/mt76/mt76x2/usb.c   |   7 +-
 drivers/net/wireless/mediatek/mt76/usb.c      |  20 +-
 15 files changed, 587 insertions(+), 129 deletions(-)

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
