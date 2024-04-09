Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E8CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x0vDLrBotUt/dTylU7AlK6TRk0Q6bNiy0Q1EKapuxVI=; b=Or7L+AttosArR8lL/MGuwOQ7S0
	hfsmPqq0MAwTAg3ANAT8Qb7RazsMVQG4hSASm81toMfhyJhNpm2eTwX6odXuMzzAoX5XNYi0z/7tz
	frQ2T6cEkBdt+TPM11mOONy9vjNmsLStY8oUyHFcJv697R+yhKDzh9yBbIud1caw01T/rct/KuDSS
	27GTzYIWldKvqD2Qlx3nu4UMEcAmZLyIpPU59wGEWR0lfan1R4w3UpV/flRdQJ/b0KhXtjKH9wU8r
	y6lxeS+azWelIkmn79HVPH4MbWwn3P3kSD7NIf3ddvgK9vX+AwsE9CaVLZAEu+2SNIxmOVwN3R9tH
	6Bwtow7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8cm-00000001RIm-1Wib;
	Tue, 09 Apr 2024 10:22:44 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8ci-00000001RCf-2ZpJ;
	Tue, 09 Apr 2024 10:22:42 +0000
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(744429:0:AUTH_RELAY)
	(envelope-from <chiaen_wu@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Tue, 09 Apr 2024 18:21:58 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 9 Apr 2024
 18:21:58 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Tue, 9 Apr 2024 18:21:58 +0800
From: ChiaEn Wu <chiaen_wu@richtek.com>
To: <pavel@ucw.cz>, <lee@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<peterwu.pub@gmail.com>, <cy_huang@richtek.com>, ChiaEn Wu
	<chiaen_wu@richtek.com>
Subject: [PATCH] leds: mt6360: Fix the second LED can not enable torch mode by V4L2
Date: Tue, 9 Apr 2024 18:21:54 +0800
Message-ID: <d1d1419bb322e2b0f40d34edd3a66979015b668c.1712657386.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_032240_939081_CE7CC3B5 
X-CRM114-Status: GOOD (  13.94  )
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

V4L2 will disable strobe mode of the LED device when enable torch mode,
but this logic will conflict with the "priv->fled_torch_used"
in "mt6360_strobe_set()". So after enabling torch mode of the first
LED, the second LED will not be able to enable torch mode correctly.

Therefore, at the beginning of "mt6360_strobe_set()", check whether the
state of the upcoming change and the current LED device state are the
same, so as to avoid the above problem.

Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 drivers/leds/flash/leds-mt6360.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index a90de82f4568..1b75b4d36834 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -241,10 +241,20 @@ static int mt6360_strobe_set(struct led_classdev_flash *fl_cdev, bool state)
 	u32 enable_mask = MT6360_STROBEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
 	u32 val = state ? MT6360_FLCSEN_MASK(led->led_no) : 0;
 	u32 prev = priv->fled_strobe_used, curr;
-	int ret;
+	int ret = 0;
 
 	mutex_lock(&priv->lock);
 
+	/*
+	 * If the state of the upcoming change is the same as the current LED
+	 * device state, then skip the subsequent code to avoid conflict
+	 * with the flow of turning on LED torch mode in V4L2.
+	 */
+	if (state == !!(BIT(led->led_no) & prev)) {
+		dev_info(lcdev->dev, "No change in strobe state [0x%x]\n", prev);
+		goto unlock;
+	}
+
 	/*
 	 * Only one set of flash control logic, use the flag to avoid torch is
 	 * currently used
-- 
2.42.0


