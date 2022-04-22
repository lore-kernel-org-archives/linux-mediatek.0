Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D507C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nEyKufgnrGzXjC8sZTkIrCjDDvruY9V+bIGfDeCAytY=; b=kCnzHvub1OMsem
	cA8j12UbNXNI0Tqq5a1ri3KMn1jp0YE/lH9+dNeOVsK2tkq3/v0IhbbD997D6isDfwuY+qdY1J080
	D3GbBPp/iAI0+Ac4/iT9gHOBXa2g/eGRNCtzjESlQiPEicwxqlxSAsvbdZt0Aeckki9WRwde+JrWT
	LTnhD3KhdFzM3JtZFN24sRAKUOM5kjYy0q4efY+6EUUGdqbq4fUxMxsbYTd6oO/lCx+OdeJp6xFKA
	aDS8vYw8Go+FYTEx6vY4y1z02ru5aISSa8J5P+CuOY1+wsaCi9wCS0XNMx0uedFibC0cIzBt9fkaS
	4fPQOOrjc7EjICt/IwHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhmIJ-00GIpH-BY; Fri, 22 Apr 2022 05:57:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhmIF-00GInu-QN; Fri, 22 Apr 2022 05:57:26 +0000
X-UUID: 50c171609b76412c88a14289643a130f-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:aea994fa-1057-4e1f-9124-75f56f0b4712, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:ced992f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 50c171609b76412c88a14289643a130f-20220421
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 23086678; Thu, 21 Apr 2022 22:57:18 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:57:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:57:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 13:57:14 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
CC: <linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/4] Add support of MediaTek mt8186 to SOF
Date: Fri, 22 Apr 2022 13:56:55 +0800
Message-ID: <20220422055659.8738-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_225723_895639_F754CCA4 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support of MediaTek mt8186 SoC DSP to SOF.
This series is taken from thesofproject/linux/tree/topic/sof-dev-rebase.

Tinghan Shen (4):
  ASoC: SOF: mediatek: Add mt8186 hardware support
  ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp ops
  ASoC: SOF: mediatek: Add mt8186 dsp clock support
  ASoC: SOF: mediatek: Add DSP system PM callback for mt8186

 sound/soc/sof/mediatek/Kconfig                |   9 +
 sound/soc/sof/mediatek/Makefile               |   1 +
 sound/soc/sof/mediatek/adsp_helper.h          |   8 +
 sound/soc/sof/mediatek/mt8186/Makefile        |   4 +
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c    | 101 +++++
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h    |  24 +
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c |  53 +++
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 413 ++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  80 ++++
 9 files changed, 693 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.h
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-loader.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
