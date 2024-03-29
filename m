Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FD3CD11DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWT+G9FFAF2rey9UvB7e6ddHPLFLiWLFCfOJDuJbV1M=; b=IQASoS0Xh+9CGlc78y34RUY1wp
	iP2eIDhqxuLNBjGf5QChmBtkfUaXTBPI3Mh1znyFxgIJHUcG1e/0hP2yjj73ifqO5nEhw5rk8ln5Q
	CkotJRCcBqkRnL4Q2Ln8EahKvaJXCqBFCQrU5B65x4Pw0kf/7WRRjc/X2ghka8NsFa7p0ZsYTzlWZ
	yYup19IWDge/gIFCaVI16+Oi6yoazYHcdtwlrBtUOTFEbc9Tt6uHihd4cNRCUvUTMTAm5CLWFB8gz
	hnYZ2xuvnxOq5sfwssStsebsoLcufDL3k8wQLZ6aGHz2JEOhulxYBto8xveplPd8LEaxqSpI7gmP4
	+4efIJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBRq-00000000OAr-08ks;
	Fri, 29 Mar 2024 12:35:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQJ-00000000NIr-1BSQ;
	Fri, 29 Mar 2024 12:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB37D6190D;
	Fri, 29 Mar 2024 12:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F0EC43394;
	Fri, 29 Mar 2024 12:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715586;
	bh=4fg65O1FuQRomrbX9eU2W2hmBoGbIhKA8D1UBF0ceD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/7M6ic8J4G8Wn5MQv9wX/AJ1f6lulUs9VqLFM1Tff4O1JlpobKdKqTexAnDW2gvS
	 kcLWst3RcU/M9lSNG8stPct6YujoS7GHjJr48i25SRPLrD4p1T9vVHGVh1OcBpHIkb
	 1dzp2mcvxkFWyBV+9+a8Cb1sIB14WAoKwZYDNtjiIJ5hmHuoYKyeRXIfVEG3JlkAcn
	 kaTt1jaU7CjD44lBnbkyCeZAw0ujimJDn0Um+L+JnbWtI3y77hI/x8APCv26C90wtp
	 adP6XvID3eqkdCoXP59nbRrZoTjY9eaHs5GXBNkd9ePrkzlq41n8nXA86vWLxoHv4K
	 pg8ZFe/kplnyQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 31/31] Bluetooth: btmtk: Add MODULE_FIRMWARE() for MT7922
Date: Fri, 29 Mar 2024 08:31:50 -0400
Message-ID: <20240329123207.3085013-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123207.3085013-1-sashal@kernel.org>
References: <20240329123207.3085013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.83
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_053332_283950_473D31E6 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 3e465a07cdf444140f16bc57025c23fcafdde997 ]

Since dracut refers to the module info for defining the required
firmware files and btmtk driver doesn't provide the firmware info for
MT7922, the generate initrd misses the firmware, resulting in the
broken Bluetooth.

This patch simply adds the MODULE_FIRMWARE() for the missing entry
for covering that.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1214133
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 809762d64fc65..b77e337778a44 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -288,4 +288,5 @@ MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(FIRMWARE_MT7622);
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
+MODULE_FIRMWARE(FIRMWARE_MT7922);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 2a88ea8e475e8..ee0b1d27aa5c0 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -4,6 +4,7 @@
 #define FIRMWARE_MT7622		"mediatek/mt7622pr2h.bin"
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
+#define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 
 #define HCI_EV_WMT 0xe4
-- 
2.43.0


