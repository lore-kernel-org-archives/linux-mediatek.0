Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3389DC43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=; b=AccoocBa0XfYBHiJ2HPeH7bAoJ
	p8U02w5MTbx+t6REoiviWdt8U0i/KvE3TFJlzf3EM1iNsRenek5X6DE8RqwX25s1qC7omLoogyzNw
	CmO6lI6vT9Gow8wYfWfO+p2o2U9loiNMir2W56LvMS0xI1vIuFyE16tS5Af25RVbpig6XVFxpd9lU
	nLfuWq32idBsUXhXtBu5AvQ+d6/P6FY4BdzHK1YcR15W275jLnzXGq3uRWqzCcL755T58OJ41F7KK
	1OYhvuWZ28r0cl/XMolOzvhnrzOOYlQuCXQ0TdZPp6pWSlHOiAl8+n2a7J44NtXQyB/sFx0iEVUGn
	Vh9FlkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAO-0000000HIeG-1W7R;
	Wed, 08 Jul 2026 14:22:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whTAA-0000000HITN-3kJl
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 14:22:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cca24023edso11206525ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520530; x=1784125330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=hzRRsXqgfnU3u7ihg/4yZkCaqNrdYiV4RRVLLjcuNrYMJdLXhvtmOOCpG9afZbvqbl
         eVE8yUc0hSuAZBp3aS12qoZ67v3nuBOw0IvHnNgIlQ7AGa7Z+DSkBsP3+GZA6P5ZuY8h
         kXp2wcm87kRxz/bm+2EuI9JLUw3MVp/+/4Ca+Hr7nLOEBqHgh6rgEiXWDjqK3IxF+NLh
         yNAcP9hNhBoZUt6HZc+hSjqAjc4RFlZDpiL625SJMY9ODTdKXLw+0/RWgXpPHbypv8lp
         TJLfSTC4i3O9xnG09lofr+L1gvtmbsO4LH31eO1OdbQBTZjMVZJsBa3vOqTISORabF96
         X7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520530; x=1784125330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=sXi2b9Pj1uFLK5LXnNrJ+nJFXArPMAnDJbfdWHgSUV42K751hWcgl2DJ0m377BzrES
         sPuPRThsbVFEoVy/jwjDOQsG1vDqO4u6x57h6RJG9fEgHqxxZ9AwxuEz+9QJMrC6/1Yg
         NOtQO82L2aeMnJRk468Lt+WJkYiq/K2Ua/KMndSxTQ/k87skO4l+6W5+rcjwM+hEi1if
         zfGn6Phh1oEEmJgXg3cOf+IoWCkE8nBwVH9pHYQOY0PCZr75o8CZX6aCcc1YeOj+T1Vk
         dh3PA4qqGIO++aVm0WsXq3vRom4/0wb3sbWN+qsKwk3yS7TFR6+7FH9ld5zECosDB+vq
         d5qw==
X-Forwarded-Encrypted: i=1; AHgh+RoHlIyYDYYiA6FSSq092Xt2vEuERnTjtItZjGQ/+wKt0xEUsOyTpWxojn6EePtwOn7cTLxTCbuAzRmeA3U6yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YykEJp9W8SwFYoybngqIfwwff9QcKB8YjPS6/XIhZjhYUTjnDB3
	1nKxaDCWsRyRx1gNyFG+tRMnffqPZ9mMv7XJ7lFNUUYLWp8CGY78OobB
X-Gm-Gg: AfdE7cnpsg2n25ADwqoTTzEAkrjZExAX8k19Jy4DetNevJcaXsPfF4HDBH8J7pSTeSX
	811CT4JhLmhZSLXal8RY3scUSC14fn96Lnbe6CknzjwG7FRhxHKp4nlMIXsEmAujPDUewOLfr7Y
	17hLq11iwlPPfa2tIZOze222u8qg7sdIs+Km25jYC2HK0K4f5xhWWHhRy9oqrFg5V0+AS4qlMww
	77Q+b/xACaKKN9k7SsWmaLNwGROLjNIqfT8UYm/M37V102pAT0tbE8b2UVe6DvtJ3umMkmPhEXK
	+VLMRwApW1Hih2Xi99GfJrMTc35gNEFe45+EnyCYpC8k9rjrq5cQTVFLr1wprH+KfpaHqUIJegk
	y8EYjdrwXH2kWZhcAmGhUKnDZgY+7i8BNDJNRH47M2aEIdcHlT90vGsg3WMO78+ySxja9OfyaZX
	O72yW9Srvt3ggDV08jpGY8lcpfXCWoSILlmMhjncVBigLB4vk=
X-Received: by 2002:a17:902:d58d:b0:2c9:97a7:71b1 with SMTP id d9443c01a7336-2ccea5828acmr29807815ad.44.1783520530129;
        Wed, 08 Jul 2026 07:22:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:30 +0700
Message-ID: <20260708141734.578926-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_072210_924693_A239138B 
X-CRM114-Status: GOOD (  12.45  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 6bc636c86f42..053ccb92c726 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -416,12 +417,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +502,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


