Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD49C77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijsm3hN4vZPBvSXa6DGRcbES0Cgm7N64jnHNuBjl6fs=; b=mktDiykYa6gN9f9F26ICLIP1d3
	tHXwxoGXtvYEfjHVaJ4zCEJnGlB3ZrOdC7yGaJ0VODKKBZltKkr/S3AW5hYdhtgbK1fRcz4NTBS1v
	dbzHo57Xv3q03gXA6asvXVaEG1+0IwMftMGku5S31cmX7PbXk3GSEogWeMAHA7/sOtFyHwmBUYeKQ
	3nJp3mK8MV8zlq/ZD//8+RCov4ve7KhUz1c4Yw7L0zC7w1RfY1ndAOe5W4xMOrhW5/47DeNFr4Rkw
	4CC1a/WGRA10uZOTA9qjJ2xAecDobWw2c1XUyCi1A6naoTxsSp6t9xBL4xfEqdL8wLg97Gn4vT1zk
	UG2Zax8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDnk-0099zo-1h;
	Wed, 17 May 2023 09:50:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzDnh-0099yC-0e;
	Wed, 17 May 2023 09:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684317029; x=1715853029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mtw2/tREMJ9jAsgNoVakn6fr09xbBwzqX6/cCqtFuL4=;
  b=NKMBLWNMeZozgDmKxqnhQt237v6APKhhFXReN5psxSEdULDfa7Ipf2Es
   GneM68eDaHVPfcDWpF2O0vkPx422vhTsrAfnMuPe5dKZgXWSKAjxvBDpR
   VWP+j5ZoxODPfVcxRYLULhVJ6OzbgDseALnRqnxaGMUqnFOGWOFogn/Se
   0OVL3lwm8dZ+7CFuYTJp39bgsZdrRVZKojvjKRQG/Drgp4am3Y1VaNhRJ
   D8fy+mV1oxTEUyQ3huWRupEx9cXoiWxyrbCeJPcT4Z+KHAYqgZqc3kKZQ
   /BcngRpHCQUErewFTkSkq+5KE1zJbsuKu9EZk1791w595YP44viG86pXb
   A==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="scan'208";a="215854634"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 02:50:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 02:50:19 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 02:50:09 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <oder_chiou@realtek.com>, <shengjiu.wang@gmail.com>,
	<Xiubo.Lee@gmail.com>, <festevam@gmail.com>, <nicoleotsuka@gmail.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<linux-imx@nxp.com>, <cezary.rojewski@intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>, <vkoul@kernel.org>, <daniel.baluta@nxp.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jarkko.nikula@bitmer.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sound-open-firmware@alsa-project.org>, <linux-tegra@vger.kernel.org>,
	<linux-omap@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/2] ASoC: do not include runtime_pm.h if not needed
Date: Wed, 17 May 2023 12:49:01 +0300
Message-ID: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_025029_328782_E38C2AFF 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi,

Series removes the pm_runtime.h inclusion in files where
APIs exported though pm_runtime.h are not used. In case
of files that make use of pm.h which comes form pm_runtime.h
added patch 2/2.

Changes were built with allmodconfig on ARM and x86_64 and checked
all the changed files were built at least once.

Thank you,
Claudiu Beznea

Changes in v2:
- removed cs35l45 handling
- changed a bit commit description
- added patch 2/2
- collected Jarkko Nikula's tag

Claudiu Beznea (2):
  ASoC: do not include pm_runtime.h if not used
  ASoC: use pm.h instead of runtime_pm.h

 sound/hda/hdac_regmap.c                                   | 1 -
 sound/pci/hda/hda_bind.c                                  | 1 -
 sound/soc/amd/acp/acp-pci.c                               | 1 -
 sound/soc/amd/acp/acp-platform.c                          | 1 -
 sound/soc/codecs/max98090.c                               | 1 -
 sound/soc/codecs/max98373-i2c.c                           | 2 +-
 sound/soc/codecs/pcm186x.c                                | 1 -
 sound/soc/codecs/rk3328_codec.c                           | 1 -
 sound/soc/codecs/rt5682-i2c.c                             | 1 -
 sound/soc/codecs/rt5682s.c                                | 1 -
 sound/soc/codecs/tas2562.c                                | 1 -
 sound/soc/codecs/tas5720.c                                | 1 -
 sound/soc/codecs/tas6424.c                                | 1 -
 sound/soc/codecs/wm_adsp.c                                | 1 -
 sound/soc/fsl/imx-audmix.c                                | 1 -
 sound/soc/intel/atom/sst/sst_acpi.c                       | 1 -
 sound/soc/intel/atom/sst/sst_ipc.c                        | 1 -
 sound/soc/intel/atom/sst/sst_loader.c                     | 1 -
 sound/soc/intel/atom/sst/sst_pci.c                        | 1 -
 sound/soc/intel/atom/sst/sst_stream.c                     | 1 -
 sound/soc/mediatek/mt8186/mt8186-afe-control.c            | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 1 -
 sound/soc/mediatek/mt8192/mt8192-afe-control.c            | 2 --
 sound/soc/qcom/lpass-sc7180.c                             | 2 +-
 sound/soc/qcom/lpass-sc7280.c                             | 2 +-
 sound/soc/soc-compress.c                                  | 1 -
 sound/soc/soc-pcm.c                                       | 1 -
 sound/soc/sof/intel/hda-loader-skl.c                      | 1 -
 sound/soc/sof/intel/hda-stream.c                          | 1 -
 sound/soc/sof/intel/skl.c                                 | 1 -
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c                | 1 -
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c                | 1 -
 sound/soc/tegra/tegra20_ac97.c                            | 1 -
 sound/soc/ti/omap-mcbsp-st.c                              | 1 -
 35 files changed, 3 insertions(+), 36 deletions(-)

-- 
2.34.1


