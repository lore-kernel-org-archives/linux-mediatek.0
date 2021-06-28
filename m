Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BA5C49361
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 15:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DBA06144F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 15:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DBA06144F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cdjrlc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ppl2E5OUmhxJ1LmGpYAuVWFxQI/gHYQS2rK5JsIChdI=; b=DFtqdG2bk2IidX
	iKvpeQMU/D+UHTUVM0nHN4IFd8uCp40t+2THvPKZk+6TU5v6je334wG2EE5KL9oApLnzO+vEXzoqV
	+04Ze/R9sPQ+gxo5w4BAIqjDj/x+jbTBOXriaNpFlZuerD8jFHOUB/R3stjaTEO/4stjKIMArQELO
	p6qBJMbQbDpxAWWEl5lmcZFokemmDlJoqBHDIgdKNqO0wfRZQ5A38up0xhtEApZdCm2ueX3/HBDfc
	xsu9xJVXLBv2C6quqAyi83zlZoTBEhI9P0/uZobvZQMZSPnkfwky5CGqnEkBlU56l1rL7KB4r6XIM
	KbelJqryaqjt/WMMpnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxsu7-008Otd-Mo; Mon, 28 Jun 2021 15:10:31 +0000
Received: from smtpbg477.qq.com ([59.36.132.88] helo=qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxstr-008Onx-Lj; Mon, 28 Jun 2021 15:10:18 +0000
X-QQ-mid: bizesmtp33t1624892994t75xm1aj
Received: from localhost.localdomain (unknown [182.148.13.55])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 28 Jun 2021 23:09:42 +0800 (CST)
X-QQ-SSF: 01000000002000B0B000B00A0000000
X-QQ-FEAT: 3kJJdZsYhnGDDdPPXk7oYwte5A7zeiDvt5nVkr5Eazl7DEu94P4N1td54EZjZ
 d3ZCAWbJa+79anj3N65BuJcMoK3dO95NjkPC7G+W2GPBph5YGpARm4DodUs/cRLag0FmSKV
 AMadS7BzprdrlgSro2UE5JbAlQjlLo0QYamDkkip3dPZzZWr3B6nE22saao7nIo/8f+TjdY
 1TM97Gjobo/JoQSM5Qgi54BbOwL5PUcNRo3GC0RiI6pkIk9dIKkaks0fctU4vgqQgqWFMsQ
 CDb0IVZ+9gTrNdmK0Ccp1buTMhRpNgZEC6kcRTC3HgQBrTJVoDvDgiw+M=
X-QQ-GoodBg: 0
From: Jinchao Wang <wjc@cdjrlc.com>
To: linux@roeck-us.net,
	wim@linux-watchdog.org
Cc: f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, baruch@tkos.co.il,
 vilhelm.gray@gmail.com, shawnguo@kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, wjc@cdjrlc.com
Subject: [PATCH v2] watchdog: Prefer unsigned int to bare use of unsigned
Date: Mon, 28 Jun 2021 23:09:35 +0800
Message-Id: <20210628150935.29239-1-wjc@cdjrlc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgweb:qybgweb14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_081016_177483_769C3FA1 
X-CRM114-Status: GOOD (  18.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix checkpatch warnings:
    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>
---
- changes for v2:
- Solve the alignment problem and the problem of one more space after
- int

---
 drivers/watchdog/ar7_wdt.c          | 2 +-
 drivers/watchdog/ath79_wdt.c        | 4 ++--
 drivers/watchdog/bcm_kona_wdt.c     | 6 +++---
 drivers/watchdog/digicolor_wdt.c    | 2 +-
 drivers/watchdog/ebc-c384_wdt.c     | 6 +++---
 drivers/watchdog/imx2_wdt.c         | 2 +-
 drivers/watchdog/it8712f_wdt.c      | 2 +-
 drivers/watchdog/mt7621_wdt.c       | 4 ++--
 drivers/watchdog/omap_wdt.c         | 2 +-
 drivers/watchdog/pika_wdt.c         | 2 +-
 drivers/watchdog/rt2880_wdt.c       | 4 ++--
 drivers/watchdog/sbc7240_wdt.c      | 2 +-
 drivers/watchdog/shwdt.c            | 2 +-
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 4 ++--
 drivers/watchdog/w83977f_wdt.c      | 2 +-
 drivers/watchdog/watchdog_dev.c     | 2 +-
 16 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index ff37dc91057d..822719fdd944 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -57,7 +57,7 @@ struct ar7_wdt {
 };
 
 static unsigned long wdt_is_open;
-static unsigned expect_close;
+static unsigned int expect_close;
 static DEFINE_SPINLOCK(wdt_lock);
 
 /* XXX currently fixed, allows max margin ~68.72 secs */
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index 0f18f06a21b6..567e25df804b 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -68,12 +68,12 @@ static int boot_status;
 static int max_timeout;
 static void __iomem *wdt_base;
 
-static inline void ath79_wdt_wr(unsigned reg, u32 val)
+static inline void ath79_wdt_wr(unsigned int reg, u32 val)
 {
 	iowrite32(val, wdt_base + reg);
 }
 
-static inline u32 ath79_wdt_rr(unsigned reg)
+static inline u32 ath79_wdt_rr(unsigned int reg)
 {
 	return ioread32(wdt_base + reg);
 }
diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
index 8237c4e9c2a0..0b6b2b8d539f 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -58,7 +58,7 @@ struct bcm_kona_wdt {
 static int secure_register_read(struct bcm_kona_wdt *wdt, uint32_t offset)
 {
 	uint32_t val;
-	unsigned count = 0;
+	unsigned int count = 0;
 
 	/*
 	 * If the WD_LOAD_FLAG is set, the watchdog counter field is being
@@ -165,7 +165,7 @@ static void bcm_kona_wdt_debug_exit(struct platform_device *pdev) {}
 #endif /* CONFIG_BCM_KONA_WDT_DEBUG */
 
 static int bcm_kona_wdt_ctrl_reg_modify(struct bcm_kona_wdt *wdt,
-					unsigned mask, unsigned newval)
+					unsigned int mask, unsigned int newval)
 {
 	int val;
 	unsigned long flags;
@@ -197,7 +197,7 @@ static int bcm_kona_wdt_set_resolution_reg(struct bcm_kona_wdt *wdt)
 }
 
 static int bcm_kona_wdt_set_timeout_reg(struct watchdog_device *wdog,
-					unsigned watchdog_flags)
+					unsigned int watchdog_flags)
 {
 	struct bcm_kona_wdt *wdt = watchdog_get_drvdata(wdog);
 
diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
index 073d37867f47..95a0053a5f30 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -27,7 +27,7 @@ struct dc_wdt {
 	spinlock_t		lock;
 };
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
 
diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
index 8ef4b0df3855..7b408421bb38 100644
--- a/drivers/watchdog/ebc-c384_wdt.c
+++ b/drivers/watchdog/ebc-c384_wdt.c
@@ -32,14 +32,14 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
 	__MODULE_STRING(WATCHDOG_TIMEOUT) ")");
 
 static int ebc_c384_wdt_start(struct watchdog_device *wdev)
 {
-	unsigned t = wdev->timeout;
+	unsigned int t = wdev->timeout;
 
 	/* resolution is in minutes for timeouts greater than 255 seconds */
 	if (t > 255)
@@ -57,7 +57,7 @@ static int ebc_c384_wdt_stop(struct watchdog_device *wdev)
 	return 0;
 }
 
-static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned t)
+static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned int t)
 {
 	/* resolution is in minutes for timeouts greater than 255 seconds */
 	if (t > 255) {
diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index cc86018c5eb5..3b42e194e3a8 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -73,7 +73,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
 				__MODULE_STRING(IMX2_WDT_DEFAULT_TIME) ")");
diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
index 3ce6a58bd81e..2c18701ff883 100644
--- a/drivers/watchdog/it8712f_wdt.c
+++ b/drivers/watchdog/it8712f_wdt.c
@@ -47,7 +47,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Disable watchdog shutdown on close");
 
 static unsigned long wdt_open;
-static unsigned expect_close;
+static unsigned int expect_close;
 static unsigned char revision;
 
 /* Dog Food address - We use the game port address */
diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
index a8aa3522cfda..0c7e0b478d85 100644
--- a/drivers/watchdog/mt7621_wdt.c
+++ b/drivers/watchdog/mt7621_wdt.c
@@ -40,12 +40,12 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static inline void rt_wdt_w32(unsigned reg, u32 val)
+static inline void rt_wdt_w32(unsigned int reg, u32 val)
 {
 	iowrite32(val, mt7621_wdt_base + reg);
 }
 
-static inline u32 rt_wdt_r32(unsigned reg)
+static inline u32 rt_wdt_r32(unsigned int reg)
 {
 	return ioread32(mt7621_wdt_base + reg);
 }
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 1616f93dfad7..062ff05436ba 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -48,7 +48,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timer_margin;
+static unsigned int timer_margin;
 module_param(timer_margin, uint, 0);
 MODULE_PARM_DESC(timer_margin, "initial watchdog timeout (in seconds)");
 
diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
index a98abd0d3146..8ce915bf4a6e 100644
--- a/drivers/watchdog/pika_wdt.c
+++ b/drivers/watchdog/pika_wdt.c
@@ -77,7 +77,7 @@ static inline void pikawdt_reset(void)
 	 *           seconds. Valid ranges are 1 to 15 seconds. The value can
 	 *           be modified dynamically.
 	 */
-	unsigned reset = in_be32(pikawdt_private.fpga + 0x14);
+	unsigned int reset = in_be32(pikawdt_private.fpga + 0x14);
 	/* enable with max timeout - 15 seconds */
 	reset |= (1 << 7) + (WDT_HW_TIMEOUT << 8);
 	out_be32(pikawdt_private.fpga + 0x14, reset);
diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
index 49aff800824d..9ae678d1a47c 100644
--- a/drivers/watchdog/rt2880_wdt.c
+++ b/drivers/watchdog/rt2880_wdt.c
@@ -51,12 +51,12 @@ MODULE_PARM_DESC(nowayout,
 		"Watchdog cannot be stopped once started (default="
 		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static inline void rt_wdt_w32(unsigned reg, u32 val)
+static inline void rt_wdt_w32(unsigned int reg, u32 val)
 {
 	iowrite32(val, rt288x_wdt_base + reg);
 }
 
-static inline u32 rt_wdt_r32(unsigned reg)
+static inline u32 rt_wdt_r32(unsigned int reg)
 {
 	return ioread32(rt288x_wdt_base + reg);
 }
diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
index d640b26e18a6..53b5fcfd5f9e 100644
--- a/drivers/watchdog/sbc7240_wdt.c
+++ b/drivers/watchdog/sbc7240_wdt.c
@@ -75,7 +75,7 @@ static int wdt_set_timeout(int t)
 		return -1;
 	}
 	/* set the timeout */
-	outb_p((unsigned)t, SBC7240_SET_TIMEOUT_PORT);
+	outb_p((unsigned int)t, SBC7240_SET_TIMEOUT_PORT);
 	timeout = t;
 	pr_info("timeout set to %d seconds\n", t);
 	return 0;
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index f55533e0e045..2bc250676c9d 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -155,7 +155,7 @@ static int sh_wdt_keepalive(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
-static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned t)
+static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned int t)
 {
 	struct sh_wdt *wdt = watchdog_get_drvdata(wdt_dev);
 	unsigned long flags;
diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
index 7caf3aa71c6a..9b931953d9a8 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -42,7 +42,7 @@ static int wdt_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
-static int wdt_set_timeout(struct watchdog_device *wdd, unsigned new_timeout)
+static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
 {
 	wdd->timeout = new_timeout;
 	return wdt_start(wdd);
@@ -94,7 +94,7 @@ static int stmp3xxx_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&stmp3xxx_wdd, dev);
 
-	stmp3xxx_wdd.timeout = clamp_t(unsigned, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
+	stmp3xxx_wdd.timeout = clamp_t(unsigned int, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
 	stmp3xxx_wdd.parent = dev;
 
 	ret = devm_watchdog_register_device(dev, &stmp3xxx_wdd);
diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
index fd64ae77780a..90cac7fcb09c 100644
--- a/drivers/watchdog/w83977f_wdt.c
+++ b/drivers/watchdog/w83977f_wdt.c
@@ -102,7 +102,7 @@ static int wdt_start(void)
 	outb_p(DEVICE_REGISTER, IO_INDEX_PORT);
 	outb_p(0x07, IO_DATA_PORT);
 	if (!testmode) {
-		unsigned pin_map;
+		unsigned int pin_map;
 
 		outb_p(0xE6, IO_INDEX_PORT);
 		outb_p(0x0A, IO_DATA_PORT);
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab32485273..beae3f4078f4 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -57,7 +57,7 @@ static struct kthread_worker *watchdog_kworker;
 static bool handle_boot_enabled =
 	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
 
-static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
+static unsigned int open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
 
 static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
 {
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
