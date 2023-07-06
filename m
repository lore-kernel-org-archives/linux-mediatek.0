Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8ADC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7n6J9FnhQpGV+Db5R/CsM8VaQoCyxM0dcIqMik70fO8=; b=cQwjKJqgdoYVYqIA4e4wkuClob
	myPTKzlzSdXBysU39spRf7KqKauwKzfPR6YerYhp2bCN+98BYa4wrH368I51KGhMjtFtVKJzLOT41
	QuiWhDw4jj/guhqLFxwCXqFv7cmD+Ouh4LUr3xByZ1zobIKm/pOA1d5mF2/zXy7KBpqVva0ocsOGq
	/DcXk4/StT/jBMEAYggIvbT6nNR+5NhGvoqnLOp8QTYqz+ecS+5LIxfDMhljAr1evqm5JV8wiTkC5
	5qiAtCzPe/Yo0aZdV5cIfLeHgLNbkL7piwVpuDvlez7hhgRwosjbtXfTYh0yiQpTeMpQUKIzejCkk
	PEQ+U9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR4J-00227F-1C;
	Thu, 06 Jul 2023 15:38:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR4F-00222X-1X;
	Thu, 06 Jul 2023 15:38:52 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BAF7C6606FDA;
	Thu,  6 Jul 2023 16:38:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688657930;
	bh=cmWDOMtnLjeBZz0rySziJQizEHpaOTQr14x0H4Tr8Vc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItS+zNtoKSJJ3ss7q984TMNi7VVJlrctgRrn6FvY9ppk95zLHjDX7RbtcREmUXOUX
	 OKEj2M5m8wJOy7sWy1D3lItSiHWCevocJzEf53uW4x3sUQ0b536gemzJY07QMNWavG
	 G/nVZVD1N4uhT8e6C6Rcd7J7C2TEy8qAMlxFrSxuATSaAMkPGLY5x1p4E4/OgPZd+C
	 YOz9goVGaMcbnlPp1FPN63Unx1sRGpk7jvGmMHDj1GEMIOzlBzUDo5WIb//3EUubdh
	 5d79Bqvnlb98+nCiTTJNTYqJmHvb7mF1da9jZaKTzI5aNAPWvPpR8jrHmhM4RY7OPi
	 2dd9jSd0FwWdQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 4/6] thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
Date: Thu,  6 Jul 2023 11:37:35 -0400
Message-ID: <20230706153823.201943-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706153823.201943-1-nfraprado@collabora.com>
References: <20230706153823.201943-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_083851_669174_FE4AD49F 
X-CRM114-Status: GOOD (  12.20  )
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

Out of the many interrupts supported by the hardware, the only ones of
interest to the driver currently are:
* The temperature went over the high offset threshold, for any of the
  sensors
* The temperature went below the low offset threshold, for any of the
  sensors
* The temperature went over the stage3 threshold

These are the only thresholds configured by the driver through the
OFFSETH, OFFSETL, and PROTTC registers, respectively.

The current interrupt mask in LVTS_MONINT_CONF, enables many more
interrupts, including data ready on sensors for both filtered and
immediate mode. These are not only not handled by the driver, but they
are also triggered too often, causing unneeded overhead. Disable these
unnecessary interrupts.

The meaning of each bit can be seen in the comment describing
LVTS_MONINTST in the IRQ handler.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v2)

Changes in v2:
- Reworded commit and changed flag to use offset interrupts instead

 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index e7cbfe0426b5..e6dd4d120e54 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -65,7 +65,7 @@
 #define LVTS_HW_FILTER				0x2
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
-#define LVTS_MONINT_CONF			0x9FBF7BDE
+#define LVTS_MONINT_CONF			0x8300318C
 
 #define LVTS_INT_SENSOR0			0x0009001F
 #define LVTS_INT_SENSOR1			0x001203E0
-- 
2.41.0


