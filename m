Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34163C4708F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:14:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F040461375
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 07:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F040461375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5pZ/E8md8DH/O3XsywqETm6CYNHhFvhypuJKn3q99k=; b=uh+n0GfEmVzy/7
	2GPucLsly1OLzSFuARPva29Fjwrk5OBuxDH6NDi4/WSq3Xmbr3fPQ+QZUKLxe8/xPGZ1r0UN/cMsq
	bRabBFbOUfxe1xcIYxdH+/CueLez8p/9HTwf0lKAqpzOxLafIebjnNiowo0A8/jgqccbo0gLlNFM4
	VfCrZt+T74uZ6qkE5k5tM3DkC7NjPhtp++M02cNTHiIa5buOYZgvA0jZqabk2+fM6M7AVydhu/XF5
	OtVbXTbfdXOQG1+QD/KCwzMYXj5OFTdDXFr4F8d5mx4r3J4vydcf9iVKITTbf5t1CdpCqZqfoEo2s
	mx2NQablOfLKT0L5Tu6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loL5D-002EDm-0Y; Wed, 02 Jun 2021 07:14:31 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loKm7-0025bl-Rz; Wed, 02 Jun 2021 06:54:49 +0000
Received: by mail-pf1-x42b.google.com with SMTP id t28so1413294pfg.10;
 Tue, 01 Jun 2021 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Crx9sLZBvOfFAmJqEn4FIAmK6q+0yYB5yGvDbssvRNg=;
 b=GeJrLFeBJdz4hF9XAH74L8gv2akvyIEAgScrms+tlJ1YkqOAMuP0CLPwlL5CBWpHzi
 0AIAt0zUwDWlHT3Ntq4DxJoDd4spZY+MOhdXMywWtKrcsS38mGNTwKg0qgyt5Negg+PQ
 jrNOQ0/Qf6B4xrW11D5JRjuS//5+KMvSuAOGXIrMKXt+L5HyTeLAYCaMMmCUDb7hbFQQ
 7HO59iOTIRZujWpWTauWaCvOh/RXDRFbB4HZWjy6Rv5l4XBfzEC7To4DDjADdKNvnWKX
 3ql4VoBzyQX/JbWOqQuGApkIvAA42qdL4ZxS+QdV75la5mCDGKEn+3ULC80YhW++5pGk
 iehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Crx9sLZBvOfFAmJqEn4FIAmK6q+0yYB5yGvDbssvRNg=;
 b=ssgU/IiXu7Em9ZQ7fZLKK9kxlLfx1d0vkIqCxNy+E8xByarD4KWrxHsZCmvf2l55vr
 sTBYMxinQJeVz58UHoooYh2mpGkMQJBT99NMvz0Di55w82NNJk3mq5XaZFGODS10yELK
 IZwfwe7Nmmhu7PYTxnoAB+k9J/ifY80EsKrP50P2/4MfI9yVWjEi3ZdeOOsxp/diaX5P
 uBpCiCdK07P1X6kEeu1+lplCYIbJiT9exmJB5P8TT161REMc9QRLNZUikKufY2rMkw+C
 3PD3foa4uhtu07oJowMQo+Tsubqhr5dFwQ8hoYHLjDWAc+KVloNlekt47PPg70dKFMYq
 RdCg==
X-Gm-Message-State: AOAM533cw+hHFtomZ1aChSWoUgR4+lQeodg2LOaEvs1z3NA0TuBYPMxK
 b0MqbPNn5mF0knMAA+b9d/g=
X-Google-Smtp-Source: ABdhPJzCU+z70LQ0ilBeUwva54QO79RDKIyharRgeqqOfn0NKm2jtN0GuGXPy/u2+hWVZTSur4OVTg==
X-Received: by 2002:a63:7945:: with SMTP id u66mr20236610pgc.200.1622616887025; 
 Tue, 01 Jun 2021 23:54:47 -0700 (PDT)
Received: from localhost.localdomain (1-171-13-27.dynamic-ip.hinet.net.
 [1.171.13.27])
 by smtp.gmail.com with ESMTPSA id h6sm15190351pjs.15.2021.06.01.23.54.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Jun 2021 23:54:46 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, gene_chen@richtek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, gene.chen.richtek@gmail.com
Subject: [PATCH 2/2] regulator: mt6360: Add power off sequence config for
 default-on power
Date: Wed,  2 Jun 2021 14:54:35 +0800
Message-Id: <1622616875-22740-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_235447_983359_6302BCAD 
X-CRM114-Status: GOOD (  20.58  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add power off sequence config for default-on power.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Hi,

Originally, we think it must write in platform dependent code like as bootloader.
But after the evaluation, it must write only when system normal halt or power_off.
For the other cases, just follow HW immediate off by default.
---
 drivers/regulator/mt6360-regulator.c | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 4d34be9..6625f8f 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -9,12 +9,17 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 
 #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
 
+#define MT6360_REG_BUCK1_SEQTD	0x117
+#define MT6360_SEQOFF_REGNUM	4
+
 enum {
 	MT6360_REGULATOR_BUCK1 = 0,
 	MT6360_REGULATOR_BUCK2,
@@ -45,6 +50,9 @@ struct mt6360_regulator_desc {
 struct mt6360_regulator_data {
 	struct device *dev;
 	struct regmap *regmap;
+	struct notifier_block reboot_notifier;
+	/* Only for BUCK1/BUCK2/LDO7/LDO6, these are default on power */
+	u8 power_off_seq[MT6360_SEQOFF_REGNUM];
 };
 
 static irqreturn_t mt6360_pgb_event_handler(int irq, void *data)
@@ -394,10 +402,28 @@ static int mt6360_regulator_irq_register(struct platform_device *pdev,
 	return 0;
 }
 
+static int reboot_notify_call(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct mt6360_regulator_data *mrd = container_of(nb, struct mt6360_regulator_data,
+							 reboot_notifier);
+	int ret;
+
+	if (action != SYS_HALT && action != SYS_POWER_OFF)
+		return NOTIFY_DONE;
+
+	ret = regmap_raw_write(mrd->regmap, MT6360_REG_BUCK1_SEQTD, mrd->power_off_seq,
+			       MT6360_SEQOFF_REGNUM);
+	if (ret)
+		dev_err(mrd->dev, "Failed to apply the power off sequence\n");
+
+	return NOTIFY_DONE;
+}
+
 static int mt6360_regulator_probe(struct platform_device *pdev)
 {
 	struct mt6360_regulator_data *mrd;
 	struct regulator_config config = {};
+	struct fwnode_handle *fwnode;
 	int i, ret;
 
 	mrd = devm_kzalloc(&pdev->dev, sizeof(*mrd), GFP_KERNEL);
@@ -434,7 +460,16 @@ static int mt6360_regulator_probe(struct platform_device *pdev)
 		}
 	}
 
-	return 0;
+	fwnode = device_get_named_child_node(pdev->dev.parent, "regulator");
+	if (fwnode) {
+		ret = fwnode_property_read_u8_array(fwnode, "mediatek,power-off-sequence",
+						    mrd->power_off_seq, MT6360_SEQOFF_REGNUM);
+		if (ret)
+			dev_warn(&pdev->dev, "Use no delay immediate off by default [%d]\n", ret);
+	}
+
+	mrd->reboot_notifier.notifier_call = reboot_notify_call;
+	return devm_register_reboot_notifier(&pdev->dev, &mrd->reboot_notifier);
 }
 
 static const struct platform_device_id mt6360_regulator_id_table[] = {
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
