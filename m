Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A664C61DFD
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 01:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UIVsOugu84Ado7CneCytr9bUGlnN6yS3G08cw67K9fM=; b=YT7/6Lj0MJa0H4phE1GYpJxwaz
	DMzoGqab2298ka+HYOh14UjcM5PCDo2TeoFV67pL4AY482iEHT9bajF76G/e1qg4oEuzt1cAnkIWl
	1piaJTZ7eMWw9e2Zg3TNLLGrJZkv32B5vkcgO+I5vo2cDmGzdR0zYuWgxb7iUtkBXA7nlqAAnytEw
	ASDNSpLjAM6mZ5NC7zwDHeuPrr3BZIhwjk5fJLNKML7F/hXr/q5AVoEJuVZFaM6fgM0aaU8S0tQAb
	9HIOfahKsbfgMQZcB97tpnCUnrmWb19eHSRBjEoimuR1MzPS2G9hv5+vYp5iNX4sVdsGRX/NYm/cE
	inqb4fEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1D9N-0000000Ambk-1H8h;
	Tue, 01 Sep 2026 01:18:57 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1D9K-0000000Amay-0eYx
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 01:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788225534; x=1819761534;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p8nIpbpyiaG388Be9/KJrxTpGbDEHmqCr+KR9sCE9vQ=;
  b=boOWpUuMartGjwa38uZr1XiyVl/YEkY4GzuyA3TUFrYBzyzqMe7WMvKr
   I7QFASUlC6Jz2KrWQVznS49sLhyyY2D4pMDsYDTFw4LIEIHTU4XaZldal
   db1d0LSIVNVSouSdxv1n9VQD9XJMFGKEDZFwClCymxEesPetBGIeFN/Dn
   ZceJfML/5826RkshmFeipK6ow7KGCuJtQU3Zs2QMD9siJbRvihTnVe0BG
   juEXZEMdhqEID84hln9lzxW+F8FI2ukochYNSsLUeUg2kpO00vzGxvuan
   VIbw1HDAuWG9e2yxh5Z2jNR4O1fGgPwW3J+ep3kmXFwim+UCJNLq2pUVS
   w==;
X-CSE-ConnectionGUID: ZJB8F37/QcqA8fq7/vfdOA==
X-CSE-MsgGUID: Oq1deAUyR6Sl6pVLgxEyyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="91155355"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="91155355"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:18:53 -0700
X-CSE-ConnectionGUID: mWznGrphRYmgSsFb1fdAAw==
X-CSE-MsgGUID: pnbh2Y7YS82O+JvYACfT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="267630766"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:18:50 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laxman Acharya Padhya <acharyalaxman8848@gmail.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	stable@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7921: skip CLC records the driver does not know
Date: Tue,  1 Sep 2026 09:18:40 +0800
Message-ID: <20260901011840.416787-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_181854_236594_CBB07158 
X-CRM114-Status: GOOD (  13.09  )
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

mt7921_load_clc() fails the whole firmware load when a CLC record
carries an idx beyond phy->clc[].  Record types are added by firmware
over time: MT7922 firmware 20260724 (linux-firmware 20260810) ships a
record with idx 3, the slot commit 9b80bd9cab40 ("wifi: mt76: mt7921: add
regulatory wiphy self manager support") assigns to MT792x_CLC_REGD.  A
driver without that entry now gets -EINVAL from mt7921_run_firmware()
and the device never registers.  Every stable branch the validation
commit is backported to has a three-entry phy->clc[], so this firmware
takes MT7922 Wi-Fi down there; before the validation the same record was
written past phy->clc[] into chip_cap instead (UBSAN report in [1]).

Keep the length checks and skip unknown record types, as
mt7925_load_clc() already does.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2515420

Fixes: 9417c5818a01 ("wifi: mt76: mt7921: validate CLC firmware records")
Cc: stable@vger.kernel.org
Signed-off-by: Junjie Cao <junjie.cao@intel.com>
---
Greg: 9417c5818a01 carries a 2022 Fixes: tag and will be picked for
every stable series with a three-entry phy->clc[]; on its own it turns
the current MT7922 firmware into a probe failure there. Please take the
two together or hold the earlier one until this is in.

 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index a118a301564c..264f7dbdfa78 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -483,12 +483,15 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 		clc_len = le32_to_cpu(clc->len);
-		if (clc_len < sizeof(*clc) || clc_len > len - offset ||
-		    clc->idx >= ARRAY_SIZE(phy->clc)) {
+		if (clc_len < sizeof(*clc) || clc_len > len - offset) {
 			ret = -EINVAL;
 			goto out;
 		}
 
+		/* record type newer than this driver */
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			continue;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;
-- 
2.43.0


