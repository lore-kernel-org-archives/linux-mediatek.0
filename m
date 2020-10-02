Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD543C47423
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 07:36:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 532032074B
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 07:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oD22xOLH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V/6XVGwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 532032074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wm07+oJK1hHooalCoW5lU21ek5oZJRPIwONPWPFqyEs=; b=oD22xOLH8LBmVOHK5uzrwbOBUk
	tjs53s6EcjWmN84qGjsi9Vj4wyvBPItNnPMCJSwmS2nEDafMxWkerJEuw9KpsNTexTgeCmbkBRXJ1
	hvJB+kay5cb01g4HqAsEWMl170UgGL14lWXLfpWEfKmj7SCbsp9QRZRPBQGkq/AFqUlcdP9ZPH+tg
	oaNE13UuKEVotCfUWfcRethWuZWliyUhzpyO2fqxJ6hp9ceihTBZv7fbg2Jg/kOiKz+NT3mOlRBZF
	cgjVx07E4QhG0OV2XgUi27V7FMag8iVD81IYppy1oP/sGBSFLg+QbLL6wvv0qDckbITLXbYKNTSZQ
	MBjRHIYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOFbk-0008Mk-3a; Fri, 02 Oct 2020 07:36:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOFbf-0008KY-Dd; Fri, 02 Oct 2020 07:35:57 +0000
X-UUID: b630c1e530d347d79e69d43442d50206-20201001
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tSTbcz+8NPRTtUx2y3/q+diK0LB8S9KMXCc3KL3u6wY=; 
 b=V/6XVGwOMOMiDDui3y45u4kxO3Wfpomx1AWP+1Lq+7WuZnIidswLUEUd9u5+NXAeaOxO6qSiJrF+iBQrBA0HMeUrFd8XJasDwfZuXel3zMNCemexcFqPj9Ayoe5gLDoKrDN+44qE/+iFLLPuCLe754yd+zyIJI2PoFVWRNNrJUI=;
X-UUID: b630c1e530d347d79e69d43442d50206-20201001
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1881733850; Thu, 01 Oct 2020 23:35:47 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 00:35:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 15:35:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Oct 2020 15:35:42 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/5] ASoC: Mediatek: Add support for MT8192 SoC
Date: Fri, 2 Oct 2020 15:35:37 +0800
Message-ID: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_033555_590078_323A7C5C 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 maowenan@huawei.com, kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series of patches adds support for Mediatek AFE for MT8192 SoC. At the same
time, the calibration function of MT6359 is completed with real machine driver.
The patch is based on broonie tree "for-next" branch.

Jiaxin Yu (5):
  ASoC: mediatek: mt6359: add the calibration functions
  ASoC: mediatek: mt8192: add platform driver
  dt-bindings: mediatek: mt8192: add audio afe document
  ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and
    rt5682
  dt-bindings: mediatek: mt8192: add mt8192-mt6358-rt1015-rt5682
    document

 .../bindings/sound/mt8192-afe-pcm.yaml        |   98 +
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |   44 +
 sound/soc/codecs/mt6359.c                     |  110 +
 sound/soc/codecs/mt6359.h                     |    7 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   13 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |    1 +
 sound/soc/mediatek/mt8192/Makefile            |   16 +
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    |  669 ++++
 sound/soc/mediatek/mt8192/mt8192-afe-clk.h    |  244 ++
 sound/soc/mediatek/mt8192/mt8192-afe-common.h |  170 +
 .../soc/mediatek/mt8192/mt8192-afe-control.c  |  163 +
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  306 ++
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 2389 +++++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 1489 ++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 2139 +++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c    |  409 +++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  778 ++++
 .../mediatek/mt8192/mt8192-interconnection.h  |   65 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 1058 ++++++
 sound/soc/mediatek/mt8192/mt8192-reg.h        | 3131 +++++++++++++++++
 23 files changed, 13338 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8192/Makefile
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8192/mt8192-reg.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
