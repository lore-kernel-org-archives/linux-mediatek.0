Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA4BC44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 04:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JWW74AmImRLmdesZdoy1+m1+TdvbqosVmdq9Fea4fTA=; b=XunZ2RivIX/MYIxmllpo1yhm6Y
	2KF68V6Sstd7l+xiZFCyODTSSUvcepi7rcQN6zRhkqDARFsgvhp1JdtEAd1r9Mkz0e+XxrD2BtyvR
	ybD2Tx2iY8zS+QEeEa6C3tJ7C+d7AGCKS7F1w2eXbZYWdvUYxWMhkucRWC8VhK1AYrrULPQQ8K9fw
	OWDpQCM78oL4H868xUTNaiNF3FW0O+92oElHSi7rSnTwu0vmW8WRnulq5VvXiL2XuYvWgTyQ5R0cF
	1X3oWDfxTYHlnb5KfhQfc9eNyCXykcSldErZwF2gBjccMzimO4WFBWcOwTz/3675u8MrV9f4x9una
	qVNpXeQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrUw-0000000DkW3-0DL5;
	Wed, 15 Jul 2026 04:45:30 +0000
Received: from mail-yx1-f49.google.com ([74.125.224.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrUt-0000000DkVe-2jqh
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 04:45:28 +0000
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66810946e63so828524d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 21:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784090726; x=1784695526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JWW74AmImRLmdesZdoy1+m1+TdvbqosVmdq9Fea4fTA=;
        b=ny3MXYC4Bt/6bisKL7DoyOG7jgbedvKCd+AS0al3u47M6o91DdL1bXoxXP3Hyq9udv
         OZGGaAVLVjfDD28zkS97k9UO62BvT520K5O5OSb91FvqAOzyEuysVUMbYwEPLykwuI17
         9PCFdGF6MWTzD6ilm26ryYuelx6QAGx0/FAc6PzZIPDmJGkqU5IGqiVUTtxhPuKi/85W
         MQw9lIAwY9iUNAu8pDRPlsvWPCZb64y+nUwUiCqIGgISIw/7OzMpQYQBF6zFpJC0SdhX
         8BuO/gSeXDD5zQ5RMye8vXP0vCQJ3M37s9fWRlNAWxLrKAqe/WvKDik7ffA74XCmEHi3
         IVfw==
X-Forwarded-Encrypted: i=1; AHgh+Rp93G4+MJTBbNtM0nV2JDJw56TlMkM2ywCLA1Uhh/3h0ys3UlNr+Cr9o6mHPg5wyLrDBGwJnMgHwOAB9kZuOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJYvErr2TA1ZVWCCHeP6f9n9h11gqim0lvaPq3ISpoluNkAxnf
	s1Yl28WCMRspfIJr/uBoSNSmfgCBTp5sOcF067xr8/VZYeHRfFR20E4i
X-Gm-Gg: AfdE7cllmtyksFuSVj26sfl2aAhxL8p9ILIsqI2dysGGkhLosNSaFtp8xmGN6sWtao5
	RcgdRzilgEZRLi2k6FX+j8CSXRPAaRv1SqjNQZ166n+i+r1Qv/mn9H5YUxbns+Jib7MmHtapqKD
	7eiHzvZ7DhFvzFhtV+LHkm/dQEzoV29g6rozGuoEdAnKea5ZgYlV1NW1xLPq6T5tNH2qCsB1FX9
	woEqbVGSYYdWmixrKRXmZPe0vX0bXbuLclqP2YxMxXNf4fSLWHI2EHA8pDZT5+QSpyUaPiIoIVI
	yvlUg/0T3FUQYJlaLImA8hqhSHw6Vy9+CA08/bV7P5BC38a2MZmeRVeaeJHJleuJY++JLSm4W5J
	DB+SBGWTlYmoS3AdXRxzoL9QMzYbaA2pzG35XFw478RnuHAuS+400Wb9D9lMosp2gqTEBoueln7
	tau1GKKzC2vEzuCD4=
X-Received: by 2002:a05:690e:440c:b0:660:a41d:d180 with SMTP id 956f58d0204a3-668029bb4c1mr3288750d50.21.1784090725993;
        Tue, 14 Jul 2026 21:45:25 -0700 (PDT)
Received: from Mateus-Laptop ([2804:7f3:4a10:896d:88ce:72d6:47ee:a87d])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667874c2d15sm17941180d50.0.2026.07.14.21.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 21:45:25 -0700 (PDT)
From: "Mateus B. Cassiano" <mbc07@live.com>
To: nbd@nbd.name
Cc: lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	"Mateus B. Cassiano" <mbc07@live.com>
Subject: [PATCH] wifi: mt76: pass LED define via ccflags-y in driver submodules
Date: Wed, 15 Jul 2026 00:44:32 -0400
Message-ID: <20260715044431.1207-2-mbc07@live.com>
X-Mailer: git-send-email 2.55.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_214527_703319_727EB0E9 
X-CRM114-Status: GOOD (  17.38  )
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

Commit d2b01fbc329b ("mt76: pass LED define via ccflags-y")
converted the top-level Makefile from the deprecated EXTRA_CFLAGS
to ccflags-y so that -DCONFIG_MT76_LEDS keeps working now that
kbuild no longer honours EXTRA_CFLAGS.

However, ccflags-y (like EXTRA_CFLAGS before it) only applies to
the kbuild makefile it is set in and is not inherited by
subdirectories pulled in via obj-y/obj-m. The mt7603, mt7615 and
mt7915 driver subdirectories each set their own
"EXTRA_CFLAGS += ... -DCONFIG_MT76_LEDS", which is now a silent
no-op. As a result, CONFIG_MT76_LEDS is undefined when building
mt7603/init.c, mt7615/init.c, mt7615/pci_init.c and mt7915/init.c,
the IS_ENABLED(CONFIG_MT76_LEDS) blocks are compiled out, and the
mt76-* LED class devices are never registered for these drivers.

Convert these subdirectory Makefiles to ccflags-y as well.

mt7996/Makefile never carried the define at all, even though
mt7996/init.c has the same IS_ENABLED(CONFIG_MT76_LEDS) checks for
its LED callbacks and GPIO mux setup. Add ccflags-y there too so
mt7996 LED support is enabled consistently with the other drivers.

mt76x0, mt76x2, mt7921 and mt7925 contain no CONFIG_MT76_LEDS
references and are left untouched.

Fixes: d2b01fbc329b ("mt76: pass LED define via ccflags-y")
Link: https://github.com/openwrt/mt76/issues/1077
Signed-off-by: Mateus B. Cassiano <mbc07@live.com>
---
Notes for reviewers (not for the commit message):

Previously submitted as https://github.com/openwrt/mt76/pull/1090
before I noticed that PRs on the GitHub mirror don't seem to be
reviewed.

Tested on a D-Link DIR-882 A1 (dual MT7615 radios) by building
OpenWrt at commit e4c35c2eec66 with this change applied to the mt76
package: the mt76-* LED class devices appeared again under
/sys/class/leds. The same result was reported on different MT7615
hardware in
https://github.com/openwrt/mt76/issues/1077#issuecomment-4557037203

The mt7603 and mt7915 hunks are the same fix applied for consistency,
but I don't have that hardware to test.

mt7996 in particular enables IS_ENABLED(CONFIG_MT76_LEDS) code paths
that appear to have never been built with the define before, so it
would be good if someone with mt7996 hardware could confirm nothing
regresses. I'm happy to drop the mt7996 hunk and keep only the others
if preferred.
 mt7603/Makefile | 2 +-
 mt7615/Makefile | 2 +-
 mt7915/Makefile | 2 +-
 mt7996/Makefile | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/mt7603/Makefile b/mt7603/Makefile
index 57d28591..5e7ab30f 100644
--- a/mt7603/Makefile
+++ b/mt7603/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
-EXTRA_CFLAGS += -Werror -DCONFIG_MT76_LEDS
+ccflags-y += -Werror -DCONFIG_MT76_LEDS
 obj-m += mt7603e.o
 
 mt7603e-y := \
diff --git a/mt7615/Makefile b/mt7615/Makefile
index 9274c006..8b8eff3f 100644
--- a/mt7615/Makefile
+++ b/mt7615/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 
-EXTRA_CFLAGS += -DCONFIG_MT76_LEDS
+ccflags-y += -DCONFIG_MT76_LEDS
 obj-$(CONFIG_MT7615_COMMON) += mt7615-common.o
 obj-$(CONFIG_MT7615E) += mt7615e.o
 obj-$(CONFIG_MT7663_USB_SDIO_COMMON) += mt7663-usb-sdio-common.o
diff --git a/mt7915/Makefile b/mt7915/Makefile
index 6b0058ca..7ea5b05c 100644
--- a/mt7915/Makefile
+++ b/mt7915/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 
-EXTRA_CFLAGS += -DCONFIG_MT76_LEDS
+ccflags-y += -DCONFIG_MT76_LEDS
 obj-$(CONFIG_MT7915E) += mt7915e.o
 
 mt7915e-y := pci.o init.o dma.o eeprom.o main.o mcu.o mac.o \
diff --git a/mt7996/Makefile b/mt7996/Makefile
index 69d2d4bb..28ecee3c 100644
--- a/mt7996/Makefile
+++ b/mt7996/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
 
+ccflags-y += -DCONFIG_MT76_LEDS
 obj-$(CONFIG_MT7996E) += mt7996e.o
 
 mt7996e-y := pci.o init.o dma.o eeprom.o main.o mcu.o mac.o \
-- 
2.43.0


