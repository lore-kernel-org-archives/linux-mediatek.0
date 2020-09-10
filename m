Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724ADC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D834221E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F5sA6enh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D834221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gzV5jHF9ELbv4bZSoe1301Of29kleRwKRdbOlBP/ix0=; b=F5sA6enhLEBNEvGwf/D+jij9Xv
	o1WctLf+LGs+d0BKxKQmqFJ5LRWzfqwStJWKkXHYSBkT5u3DoMMXIcXDBBfIuaflTOB5gDwtVcfou
	jNCnzkI8q8HiQ+Mldx9uC6Lmdhz7lcNKfgJWDzslPCX9ZAR5lrc+xPcyfLVx/RgmI4p6S93WNZoaW
	DEzgale6QHnAPvb9a3+bVf48jO+UwqxnRigB56t5cP5jex4kivAz6a9je1EWq5f45c+Zlm/Z6dzBY
	QdCngTHZPjVcgBIGEJmopvpYi1HYBHOp6S83MnLCEE8hqy5fd4WiafRLAALzdf+iRkWmFR38tjcCu
	PXB7IZ3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGSn9-0001S2-Ir; Thu, 10 Sep 2020 20:03:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGSn6-0001RS-PC
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 20:03:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 426C529B6F0
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org
Subject: [PATCH] ASoC: core: Optionaly add the component driver name to the
 component name
Date: Thu, 10 Sep 2020 22:03:08 +0200
Message-Id: <20200910200308.9125-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_160332_905294_7CA3EB91 
X-CRM114-Status: GOOD (  11.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, lgirdwood@gmail.com,
 dafna3@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, ranjani.sridharan@linux.intel.com,
 enric.balletbo@collabora.com, dmitry.baryshkov@linaro.org,
 kernel@collabora.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The ASoC platform driver for Mediatek MT8173 registers
several components with identical name. This cause an
error:
"Directory '11220000.audio-controller' with parent 'mtk-rt5650' already present!"
when adding debugfs directory for those components.
To fix this, the function 'fmt_single_name' can receive the name
of the component driver and concatenate it to the name of the debugfs
directory for the component.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 sound/soc/soc-core.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 74df22486e30..f470e713b030 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2227,7 +2227,7 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_card);
  * Simplify DAI link configuration by removing ".-1" from device names
  * and sanitizing names.
  */
-static char *fmt_single_name(struct device *dev, int *id)
+static char *fmt_single_name(struct device *dev, int *id, const char *component_driver_name)
 {
 	const char *devname = dev_name(dev);
 	char *found, *name;
@@ -2263,6 +2263,12 @@ static char *fmt_single_name(struct device *dev, int *id)
 		*id = 0;
 	}
 
+	if (component_driver_name) {
+		char *tmp = name;
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s-%s", name, component_driver_name);
+		devm_kfree(dev, tmp);
+	}
 	return name;
 }
 
@@ -2327,7 +2333,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	 */
 	if (legacy_dai_naming &&
 	    (dai_drv->id == 0 || dai_drv->name == NULL)) {
-		dai->name = fmt_single_name(dev, &dai->id);
+		dai->name = fmt_single_name(dev, &dai->id, NULL);
 	} else {
 		dai->name = fmt_multiple_name(dev, dai_drv);
 		if (dai_drv->id)
@@ -2460,7 +2466,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_list);
 	mutex_init(&component->io_mutex);
 
-	component->name = fmt_single_name(dev, &component->id);
+	component->name = fmt_single_name(dev, &component->id, driver->name);
 	if (!component->name) {
 		dev_err(dev, "ASoC: Failed to allocate name\n");
 		return -ENOMEM;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
