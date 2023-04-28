Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22E6C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 19:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEkhhkaYLCppVBjylgDTKdDafZ7PTt5JklFPUhPnK6c=; b=MxW3VpufAWHie0+6vOEOUjkY0Z
	M2ZpYuT041G9q5nutsa3A4Bdn+lAouBBJgBUXCMEo81hmLQzwTD6oLzztfeCa+aoGxdo8JKXH8gaA
	euLjgHD1uAmXTMeL7ZFudaK+hcoNb5GbwNH6dnU62xYtWuuGXABxj1y1GjJi6DsMlxfS8ikLcYTqZ
	ulZRv+arQ6Q6JwwS8Kk1sNoUO221kjo/1624sPc2PBY+Pwq7kM+vojzULXa/N7CDLeNNFU/UuT0sx
	6P16HO85C+KbOoRdTioG33eezBPYiXShCT9J8sEctthAsJT7z8vcrCmTotr5dZDk8JWjszbx7ncnd
	0Udx6wZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAj-00BfUW-1N;
	Fri, 28 Apr 2023 19:54:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAU-00BfMD-1d;
	Fri, 28 Apr 2023 19:54:11 +0000
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3748066032CF;
	Fri, 28 Apr 2023 20:54:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682711649;
	bh=qCAjiE5j9EjfpbQvxb5vblMTGK9ocfii2bzneXSlr5U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BCdTxO1YUgbH2MXRuUFjFat6l8VH4JlcIQNNP7JvLgUsLMqXuwf5riMEs2ft1YUzz
	 J9XiS/YcfFVAqGdeT7ZA4WL7Q3QnWuSPyuTPlh5vqs9a6kPWXHYJctllEpavb9ugb2
	 7egpM9O0ucEl0Zc87wWz5OUdvrcHzuYW1yWfRs0Z0kAGPwxqLTbkPQRXxZ8KSKTEYq
	 l0T9jfzXlTz7CAwoLHxKlMHe12aD+cZl0VFt5cIVA7ZMzgPq7i8YibUzBdt7zLhNue
	 c7NqizvXgwhZpt5pRPCjiJkhm7+ymTZpWka7YPEnvUh9VscGpJYp3m0KBJEyveXvnO
	 mtnDE2mMC2d6Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/3] thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
Date: Fri, 28 Apr 2023 15:53:47 -0400
Message-Id: <20230428195347.3832687-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428195347.3832687-1-nfraprado@collabora.com>
References: <20230428195347.3832687-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_125410_681994_427DEB0F 
X-CRM114-Status: GOOD (  12.03  )
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
* The temperature went over the hot threshold, for any of the sensors
* The temperature went over the hot to normal threshold, for any of the
  sensors
* The temperature went over the stage3 threshold

These are the only thresholds configured by the driver through the
HTHRE, H2NTHRE, and PROTTC registers, respectively.

The current interrupt mask in LVTS_MONINT_CONF, enables many more
interrupts, including offset detection and data ready on sensors for
both filtered and immediate mode. These are not only not handled by the
driver, but they are also triggered too often, causing unneeded
overhead. Disable these unnecessary interrupts.

The meaning of each bit can be seen in the comment describing
LVTS_MONINTST in the IRQ handler.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 29d10eaa8dfc..300ce22a7471 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -63,7 +63,7 @@
 #define LVTS_HW_FILTER				0x2
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
-#define LVTS_MONINT_CONF			0x9FBF7BDE
+#define LVTS_MONINT_CONF			0x84804A52
 
 #define LVTS_INT_SENSOR0			0x0009001F
 #define LVTS_INT_SENSOR1			0x001203E0
-- 
2.40.0


