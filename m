Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42682C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 06:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TVOHeZKGL3sobxh4kDVlBABQi3b4xv5GTR26ps/uG+M=; b=BONqRVyP8M8H/JwTEGe95MJtZi
	plWxXtqnPIuXHSctgmtj+Be2QQhz0oOzjOQmfxhrRXDOpFHdLqaa8BpLD55v99Jv97frdC+MthJIR
	gWcA0QMhPWo4jABMDO5tChueMpEnuBx6Ug7ceNdNkYr7OgECrrj9CGR6pPwYsR7Uyj8Yu4lY9PbI5
	a0s1qvNR+D5XjHyKNpU+JFqaP/OkH2+2nmqo/YiCeRcx7oNfsk6TpTBvAfHFKEJ6sXku+maexm/pv
	5GEU1/dtZHbXn8JdISCJPWjU8QnWGErPeBmoh501WDt+61hIp4BQsMI6yGxUfRwITeCWxNsUT8SzE
	HADbdWBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQ2N-004QT2-1p;
	Fri, 25 Aug 2023 06:11:15 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQ2I-004QS8-0h;
	Fri, 25 Aug 2023 06:11:13 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VqW0QDj_1692943852;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VqW0QDj_1692943852)
          by smtp.aliyun-inc.com;
          Fri, 25 Aug 2023 14:11:01 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] thermal/drivers/mediatek/lvts_thermal: remove unneeded semicolon
Date: Fri, 25 Aug 2023 14:10:50 +0800
Message-Id: <20230825061050.7002-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_231110_463686_41BC817C 
X-CRM114-Status: UNSURE (   7.82  )
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

No functional modification involved.

./drivers/thermal/mediatek/lvts_thermal.c:595:2-3: Unneeded semicolon.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=6228
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index effd9b00a424..4a5324aa503f 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -592,7 +592,7 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
 
 		lvts_sensor[i].low_thresh = INT_MIN;
 		lvts_sensor[i].high_thresh = INT_MIN;
-	};
+	}
 
 	lvts_ctrl->num_lvts_sensor = lvts_ctrl_data->num_lvts_sensor;
 
-- 
2.20.1.7.g153144c


