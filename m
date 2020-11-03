Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68433C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:05:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D8322384
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 08:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jzAXYu5d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J2pwWnbe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D8322384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oH8OSJoKYrjdQlaETMK9/L8boG3+iYyHKRgizJef77A=; b=jzAXYu5dayn60DummLqiDXiW8B
	4U8914oCIVZLekZ4vjDLPny/k7KKRyIiJxOjI5yNo3j4BjkXpsfCQHGkWVQj369I6KkdQt6nU9TEL
	Q9WZj/ibVU2qzRMVxghddlivHCYDg/Pn20F1VxUcqu1dMb0XcdEeRo7oaEKvg5sitEPiBvnrhSsVc
	AjJdsgA04cuAAlkfA2lUIJyjZYX8UtG1WWfxhkRINCFe7FiJIyCK7LarPBv9J+dJ/1UCRTbb+0v2N
	zrTyjzxufq7CcT4J2ikU9lSa/ACphwihVH4HG6OTqkD7AdwXlqsukLe+qb2onfs3buEBne3+EyI2u
	hkzNYCZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrJG-0005uP-PG; Tue, 03 Nov 2020 08:04:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrIo-0005kL-6d; Tue, 03 Nov 2020 08:04:27 +0000
X-UUID: 47a1dd2df33042c89ddcaf2b41552e10-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0QBSEOMZBWHt6e5tK2HT31+z/BJjLgKUQg5qu0chQ6Q=; 
 b=J2pwWnbenV6tkSKAcpwga2IFdve5wPBz/3AMbBvaOBl2mAb+ACZyTo+CyCXWSXCct2E/VmGNKwkyrhYFSXmkRlewMSYaIIo3pxoo2FRMbsW1VzBlskiv/bpO1MXVRibUImyBPG1jEKGEDs1W+jHo4mzpHZ2MHPdQ2jq72gAPfIo=;
X-UUID: 47a1dd2df33042c89ddcaf2b41552e10-20201103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 766109322; Tue, 03 Nov 2020 00:04:24 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 23:59:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:40 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Date: Tue, 3 Nov 2020 15:59:29 +0800
Message-ID: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_030426_443387_59F2320A 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series of patches adds support for Mediatek AFE for MT8192 SoC. At the same
time, the calibration function of MT6359 is completed with real machine driver.
The patch is based on broonie tree "for-next" branch.

Change since v3:
  - use normal conditional statements to improve legiblity in [v3,3/9]
  - remove mtk_i2s_hd_en_event as there's trace in the core
  - impove mt8192_i2s_enum and mt8192_adda_enum

Change since v2:
  - split the dai driver files as a separate patch
  - fix dt-bindings to GPL-2.0-only License
  - remove unnecessary preperty descriptions such as 'maxItems'

Change since v1:
  - fixed some typos related to dt-bindings in [v1,3/5] and [v1,5/5]
  - add vendor prefix to the properties, such as "mediatek,apmixedsys"
  - add a dependency description to indicate the required header files

Jiaxin Yu (9):
  ASoC: mediatek: mt6359: add the calibration functions
  ASoC: mediatek: mt8192: add platform driver
  ASoC: mediatek: mt8192: support i2s in platform driver
  ASoC: mediatek: mt8192: support adda in platform driver
  ASoC: mediatek: mt8192: support pcm in platform driver
  ASoC: mediatek: mt8192: support tdm in platform driver
  dt-bindings: mediatek: mt8192: add audio afe document
  ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and
    rt5682
  dt-bindings: mediatek: mt8192: add mt8192-mt6358-rt1015-rt5682
    document

 .../bindings/sound/mt8192-afe-pcm.yaml        |  100 +
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |   42 +
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
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 1471 ++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 2110 +++++++++++
 sound/soc/mediatek/mt8192/mt8192-dai-pcm.c    |  409 +++
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  778 ++++
 .../mediatek/mt8192/mt8192-interconnection.h  |   65 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 1058 ++++++
 sound/soc/mediatek/mt8192/mt8192-reg.h        | 3131 +++++++++++++++++
 23 files changed, 13291 insertions(+), 4 deletions(-)
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
