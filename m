Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84156EB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 15:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+qExpnrTRGuEbIJUgDN+ZcGb0QDRZ8RglubgpMI9PQ=; b=ifkYFwok7AxoU9suPwdy3D/fSu
	UOqI2nGL13We6cMgPIZHS+5rB4piqLo6XgnhRCONusvBD4LqKaALLsfrHDMnQKSZJoR/2lEyFwDq+
	UXLnc8WYkZ6rYarp5A/1JBqSCoTIm5Jd1fOOwJtiP8mlKPED6V6OCUCzQyeb8M6Ad+LRHsR+30fH9
	us9OsYgIg+456G7UhTI6nZmT6DWWKTDvj5WQxKbsVH7tzK/MPhF35zfbNxLz62E3q4GJXwv9uQHdJ
	+BWmCy+VQORjyZCQH2anxxx3nf9X5l1gnGJZIRrW48l6dWEosD+wN7hzq+URrPsj9OiS1htKSNrL8
	iMxUvK+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR4A-0021z6-2I;
	Thu, 06 Jul 2023 15:38:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR44-0021vN-0t;
	Thu, 06 Jul 2023 15:38:41 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2F37D6606FDA;
	Thu,  6 Jul 2023 16:38:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688657918;
	bh=HO4nDuWbgJLp3N3SyhPaXs/hZj7uYhYlvxsZ7dSo314=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hJsTH/a/arRPGkkgAo8mvSy/ygWuAwMYYF5AXrojN9/7jZ5ZS8WCtW7LnNpJNXn9/
	 qTPtU/K2hdX4e9NWlp/Irm+Rn0JiHnh7bgRUeZPjAhkOSrE3EfTUHhYy/Ncr5ofEFA
	 rHobrTrkQYVQ1aD6um1C68uTS6a5EQTFQlH6qy+20QVqudwgBvDnKH+VMaZVFScImS
	 beKNfpbQAHa6ukA1zFVF9KUuZKUeLWOl6t1NGvf+2VXDpncoOsntGLNo3jGlIDLVZt
	 IDcnGVvYs6ZXGPjU5+Xoo7/eAHIuFQYIaAVmHgFMqWXVC2vQeQVXbsekQ/anUbKwfx
	 Ev8+AgwIsiQbg==
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
Subject: [PATCH v3 1/6] thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
Date: Thu,  6 Jul 2023 11:37:32 -0400
Message-ID: <20230706153823.201943-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706153823.201943-1-nfraprado@collabora.com>
References: <20230706153823.201943-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_083840_448121_F9A971BD 
X-CRM114-Status: GOOD (  14.15  )
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

There is a single IRQ handler for each LVTS thermal domain, and it is
supposed to check each of its underlying controllers for the origin of
the interrupt and clear its status. However due to a typo, only the
first controller was ever being handled, which resulted in the interrupt
never being cleared when it happened on the other controllers. Add the
missing index so interrupts are handled for all controllers.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

(no changes since v1)

 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 1e11defe4f35..ba8f86ee12b6 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -451,7 +451,7 @@ static irqreturn_t lvts_irq_handler(int irq, void *data)
 
 	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
 
-		aux = lvts_ctrl_irq_handler(lvts_td->lvts_ctrl);
+		aux = lvts_ctrl_irq_handler(&lvts_td->lvts_ctrl[i]);
 		if (aux != IRQ_HANDLED)
 			continue;
 
-- 
2.41.0


