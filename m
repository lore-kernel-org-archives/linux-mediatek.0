Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857B0C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=; b=tEHhoJd7/lLrdS7FjqSDED2Etd
	56Jc9W+sF0MXpH4X3ZhRGYs6CI4UzaxJbLADWOU/dQ/X9o73NDCuivOQWeq16819p3uhdsPLeWXQw
	ifAiv9hCzkcwcIAV9ogeBQ8Gka+vsh75GHiyWo2NyDh6h6yWa9w68Mw8HRJOnZ9vTbWkndku2o7Jk
	MzZYJ024jujmr7ubetE0x/6oUHp0ED9XhsE+1lLHsiGdH/PBVlnclUQ2KX7dsSrIzZZaI461CEcMp
	0sv+ecsgzVwEvACxuNoA78mMjPzauX9ei/XAUxf7nmo7VtGdS5qEAQZKe/OwB8L9MSiK43k+DAzxe
	NPABkeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS71-0000000G0Nl-2aYX;
	Tue, 30 Jun 2026 06:38:27 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weS6y-0000000G0Kw-35Sf
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:38:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84783bce476so1652902b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801504; x=1783406304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=OOyFCijC49gXdN/LPVmZ99uQhSalsgfgnNyYCx/hHNF80QHi8KJHfxvUmc4R6NTZ8h
         QpS6k6eL5papokp6pW5hUSsBUWYd/nIDjEllbGHw+WRyyPaBSHTIbm1V3IyoSV3s0bgo
         Ta+Jsmhu8Tu20QTt01KzgZRdm4mJvnbsNSczlS/ULux9E2yJEwtA05LNjvL76e5hb04b
         YIBeCZ18GcqiX4olBjzjzollQbEJW/pWTSejKwXD7vRjMz49vRkyy/4b9QEiLKxfONxX
         p2rPHjzJyg4vcqY66WC71Ods74uqxVoa1QnHsxiQcpcdOFcaQYAcEtnvbRSuKo5/hMtk
         kHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801504; x=1783406304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRKzJ39vfI/VxfM8xDjRWpeEOzGtJPnQVVzERHr8+NM=;
        b=SF/iSPCRc5g+/i7LCPqCh+eW9nGH6EiFQDomKYsbV/CflOqOxsXmrtbewmZTmICJ6o
         RuLvwS2e5pjkY28OdubRY5Dky9tb6juEzco+lXAD/l1+jF8xyviaaCYrvpMtO7QcW2g7
         Ghm5Od7PvQTSAu9pGCsVziAEP61R5RpJvRT6ZAWrX4LdaVA9YCYQqaYaYPVGDmmjno3X
         ASMrpu+4pA0mmn3tlNKEiz19XPinOnJF5Cp8xvJ/ZHO6/7yPByfurl7E1Y9QEpb8k50+
         tuaAtk0FoOZpIjCsSI5rNjuV3LhUIL3cBwDPKwSa5vNYj8wlhBEPbEFyZgGeGh7/dsMk
         WEjg==
X-Forwarded-Encrypted: i=1; AHgh+RrssypgO1oByf1ZTXy3ihMRjsJ/krFDIFJRFDnK4x2Sj2986CZiJAdSyub0I4EahprLXB5lhHBjVzTgQuwbuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPSva6+IEelFZbrLIyJLN+F+HfVHwmQlELTIprIt60wBEpfj8n
	Ee/9iZNnlscpLvhjOfwOnen32UIA9Dqc3b9qMqIBt+37pJYCerJlDG3/
X-Gm-Gg: AfdE7cl6JLQDjobUMg7iu7UUh0wgfi+f7C0GiRoPr2W4uu90JPltgCbEI9SvZIud01I
	Cpdddoat6STouAHIh25A0kiJS0y+G9DSjnjdkI/d1kfeAnrkdnNDeFH67SZfYYyLm6edPqwxNay
	BIgaH9YSngeCPRxbCvh/XOJMTEEaVQ9VrQ1kRPLT7HCVMtH8srZBXxF7EPb2E+gKiJHc1StaOup
	PN8prGdpqDzqF2mwtLfb5LwyDLgOC+XweAptNjYHXITuJ1yPR/BaWSrLwCiMbvIEjTrn5evPgsD
	2Goh+vppNeKswvnYd8C+PHeNt/lnzmmy6Ysh7dqq73HTELaCHBRKkn1Yrs3RRUsqiFOP533u/EH
	UQspf3MO4j5WRMnKufO8Kn9Kw5U6nB1JCn9JP7y4TKrjsglAOqi5LnUUVOzwaayF3e+rr2p4h98
	XFjeAA0g2wQ2TO4X677GVQXwvER1OppV62iq6BmHRWS84g/wY=
X-Received: by 2002:a05:6a00:1ca1:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-8479f233abfmr1895233b3a.30.1782801503940;
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:23 -0700 (PDT)
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
Subject: [PATCH 23/27] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:45 +0700
Message-ID: <20260630063449.503996-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_233824_788772_5C06DED3 
X-CRM114-Status: GOOD (  11.89  )
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


