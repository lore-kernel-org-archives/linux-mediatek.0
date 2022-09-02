Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63524C6FA81
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 04:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8ywcpytW9+OpMuNWQtzTY6IgtinF6jzWEGtK+dsF/k=; b=cvHU76xHlDDbYy59LJ69vUHU6a
	YOebaQcMhyQedSpJ8oJk+joby2pJ9OK5oaN8ByjKfJSrsOa4XG6X+j0Llff4grCBnyBb9BP2d3ve/
	FwM5RyAuHONGIQUXZakmi2AUHmZezoGNTtEGD80Hg++pQxizzcgd1hSr4nWe0bDPJYM7eQnCqGKr2
	s05Vjy1KQt1dltB+ZT7iw9J6TQrmiGa7hI/chRRKZHNp6ZYuefUASSSTzkMjbyvGbgiNzXgRAdpMz
	5NGxi8PbIQccgsdJHngnsMa9hAsk9kk7ifnPdMRB59DQNdTo42ictcUgwztZBOLeRNqkDJBVuo0vO
	0B2aD34A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTyHT-00099v-HQ; Fri, 02 Sep 2022 04:27:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTyHR-00094z-1S; Fri, 02 Sep 2022 04:27:46 +0000
X-UUID: 4dce972a88e5414a85b187ac4f0279e1-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=O8ywcpytW9+OpMuNWQtzTY6IgtinF6jzWEGtK+dsF/k=;
	b=uj3PGtg1vq9n5ZQu62whGkrs8WxuAFphNi4ABqaVKsGDHN7+X5cI5bBpbDcXVpOA6cnSj/8zqoxKkPeX35tIce4I/nsSwwQDXiwB/Jel3HJe7PFTOTg0gqYzlOasSMTpcaHEy1ZL45euZ8hSMwwY0BAIDbvWuSy8wjEgAmsgRSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1b7c380b-51ae-4b78-bf54-411e2e411035,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9617e720-1c20-48a5-82a0-25f9c331906d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4dce972a88e5414a85b187ac4f0279e1-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 679593958; Thu, 01 Sep 2022 21:18:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 11:57:52 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 11:57:51 +0800
Message-ID: <9b3d787387685f2153fe7c99b77a8b8b482f8954.camel@mediatek.com>
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
From: chunxu.li <chunxu.li@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<sound-open-firmware@alsa-project.org>, <tinghan.shen@mediatek.com>,
	<linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<yc.hung@mediatek.com>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <daniel.baluta@nxp.com>,
	<angelogioacchino.delregno@collabora.com>, <lgirdwood@gmail.com>
Date: Fri, 2 Sep 2022 11:57:51 +0800
In-Reply-To: <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
	 <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_212745_104679_6CC26F9D 
X-CRM114-Status: GOOD (  28.66  )
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

On Tue, 2022-08-23 at 19:50 +0100, Mark Brown wrote:
> On Fri, 5 Aug 2022 15:04:47 +0800, Chunxu Li wrote:
> > From: "chunxu.li" <chunxu.li@mediatek.com>
> > 
> > Change since v1:
> >   - remove the callback of_machine_select defined in sof-priv.h
> >   - move sof_of_machine_select to common code, and called in
> >     sof_machine_check
> >   - rename .board field to .compatible in structure snd_sof_of_mach
> > 
> > [...]
> 
> Applied to
> 
>    
> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git__;!!CTRNKA9wMg0ARbw!wdXixJVRiZEF4J6bn68hzN7GZ5gAa67otOgycstenmVEsECqFl08ZMVP2aJBGVuvQg$
>   for-next
> 
> Thanks!
> 
> [1/2] ASoC: SOF: Introduce function sof_of_machine_select
>       commit: 6ace85b9838dc0162b474dbbbb6b388e7561f6a7
> [2/2] ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
>       commit: 2dec9e09e955dfc4b7843fa4f9c09e7ee8931b1d
> 
> All being well this means that it will be integrated into the linux-
> next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual
> testing
> and review of the tree, please engage with people reporting problems
> and
> send followup patches addressing any issues that are reported if
> needed.
> 
> If any updates are required or you are submitting further changes
> they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when
> replying
> to this mail.
> 
> Thanks,
> Mark

Hi Mark,

It looks like the patch didn't applied success.

The patch link is 
https://patchwork.kernel.org/project/alsa-devel/patch/20220805070449.6611-2-chunxu.li@mediatek.com/

the merged link is 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?id=6ace85b9838dc0162b474dbbbb6b388e7561f6a7

In sound/soc/sof/sof-audio.c the changes are:

 #include <linux/bitfield.h>
 #include "sof-audio.h"
+#include "sof-of-dev.h"
 #include "ops.h"
 
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev,
struct
 snd_sof_widget *widget)
@@ -784,6 +785,28 @@  int sof_dai_get_bclk(struct snd_soc_pcm_runtime
*rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
+static struct snd_sof_of_mach *sof_of_machine_select(struct
snd_sof_dev
 *sdev)
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
+			sof_pdata->tplg_filename = mach-
>sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach-
>fw_filename;
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
@@ -794,6 +817,7 @@  int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)) {
+		const struct snd_sof_of_mach *of_mach;
 
 		/* find machine */
 		mach = snd_sof_machine_select(sdev);
@@ -803,6 +827,12 @@  int sof_machine_check(struct snd_sof_dev *sdev)
 			return 0;
 		}
 
+		of_mach = sof_of_machine_select(sdev);
+		if (of_mach) {
+			sof_pdata->of_machine = of_mach;
+			return 0;
+		}
+


But the real applied is only one line as below.

 #include <linux/bitfield.h>
 #include "sof-audio.h"
+#include "sof-of-dev.h"
 #include "ops.h"



