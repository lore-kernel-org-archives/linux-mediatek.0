Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28CEECAAD4
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Sep 2022 03:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJObzOkxqCK/zu3xiS1JDCbQmMq2BkxFrGab8445ook=; b=Uz1JaWwhvA7ueHpXJPJB0mgu20
	8r9xhhGJoKLY3Qcp1xDsgB2SfqRQKv8k/rv7hIv2NEQc0hJXFyJagHbqh6VVTtRKxWIpY7tHE4x6K
	6DoMdXC4BkrzFM64YWbKW6ymDkl4bcA35kOFSWDVwDz8KTc7rOf9Q73Zlsi9sNUMVrYE+Bf9h5tRK
	VKzrNfsp3Vtylt90aUg4d9PaEgvDKElWhpXms0bQmZ6h+5KIq20X4fwJsjr5tINte+NleDVL3SF4W
	B4r3PfO0hlw8/oQQKU8mJfartRDksK4vfc3f4I0pr3rGO5i9iEgpqPTVTGNENS/7Fz84KlQOzuHGA
	2Fyfr3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUK2w-00HJRg-0J; Sat, 03 Sep 2022 03:42:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUK2t-00HJ6q-NJ; Sat, 03 Sep 2022 03:42:13 +0000
X-UUID: 4785353b50794251b576ca6a236fc542-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fJObzOkxqCK/zu3xiS1JDCbQmMq2BkxFrGab8445ook=;
	b=tAA6dul/iLsIDZ4nSY9WTijX+CV3yTuYJHAW0infg2SCOfOfxh62WoemSKUoTt+BSnKAZR9foyts4BvyYS0Uu3+aZ83dveRuna5hjhqfglhTOOJUC0fJFHhwriIQb14gc3vGLpvl3FV8rDy8kOkka1QhG/o3uB6uJVvuC9NNM/c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d4e53fd4-4ba4-4481-ac96-0acb3de4964c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:4a457856-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4785353b50794251b576ca6a236fc542-20220902
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 955830309; Fri, 02 Sep 2022 20:42:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 3 Sep 2022 11:21:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 3 Sep 2022 11:21:55 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH] ASoC: SOF: Introduce function sof_of_machine_select
Date: Sat, 3 Sep 2022 11:21:51 +0800
Message-ID: <20220903032151.13664-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_204211_793050_20CA3AF7 
X-CRM114-Status: GOOD (  11.29  )
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

From current design in sof_machine_check the SOF can only support
ACPI type machine.

In sof_machine_check if there is no ACPI machine exist, the function
will return -ENODEV directly, that's we don't expected if we do not
base on ACPI machine.

So we add a new function named sof_of_machine_select that we can pass
sof_machine_check and obtain info required by snd_sof_new_platform_drv.

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/sof-audio.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index c18e723435bd..ea9663d448eb 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -785,6 +785,28 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
+static struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+
 /*
  * SOF Driver enumeration.
  */
@@ -795,6 +817,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
 
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
@@ -804,6 +827,12 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 			return 0;
 		}
 
+		of_mach = sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)) {
 			dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
 			return -ENODEV;
-- 
2.25.1


