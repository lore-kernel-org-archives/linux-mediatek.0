Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD10DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 15:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cSxjMzcWtuIcBbYLCDeC+0xqMfny8A/BapZmp72Er60=; b=NXgrn6/RIHYqgr
	GJ9pbnC5bdNWqX19x0UD3V8ZtkiUjy9gIjUb8sdAha7vMML62eOkT3KcWfuHd6H1nCb7e/ajZ6/6Z
	BZk7hvMdmmKHxGuB4/Y3pONNs8d3Iw6bQsMfrahYxkdxPAIflMyACZ7Ncg+vY2WQrObCuheJTkSjq
	Db4BZ0Dtx58ECd0IlRgOxYH6QxQpKdEgxLekgMGbPDRHklzxCVCfLnYCNUI8/qo8EtPRO6SRis6Ck
	kQk8oEngLkutDbkBuEbwMWKTl7tcOBF/c3KM7amERSdUU1mYxOO+iqrgZoQUie6ue6TA21EwY8DXI
	t/0blFmXHAIh+MpGtvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTQ1Y-002z3G-Dk; Sun, 13 Mar 2022 15:20:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTQ1U-002z1A-Hr; Sun, 13 Mar 2022 15:20:46 +0000
X-UUID: 4f09784f99064809afa9236ecc9d9cdb-20220313
X-UUID: 4f09784f99064809afa9236ecc9d9cdb-20220313
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 147222187; Sun, 13 Mar 2022 08:20:39 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Mar 2022 08:10:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Mar 2022 23:10:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Mar 2022 23:10:24 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>
Subject: [v3 00/19] ASoC: mediatek: Add support for MT8186 SoC
Date: Sun, 13 Mar 2022 23:10:04 +0800
Message-ID: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_082044_608740_0DF2FAF2 
X-CRM114-Status: GOOD (  14.85  )
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

From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

This series of patches adds support for Mediatek AFE of MT8186 Soc.
Patches are based on broonie tree "for-next" branch.

Changes since v2:
  - add a new compatible string "mediatek,mt6366-sound"
  - modify the log level for simplicity
  - use dev_err_probe(...) instead of dev_err(...) in dev probe()
  - optimized the logic of some code
  - use BIT() and GENMASK() macros to descript the registers

  Thanks for AngeloGioacchino's careful reviews.

Changes since v1:
  [v2 01/17]
    - add a new ID to the existing mt6358 codec driver
  [v2 03/17]
    - modify log level in DAPM events
    - use standard numeric control with name ending in Switch
    - return 1 when the value changed in mixer control's .get callback
  [v2 05/17]
    - ending in Switch to the standard on/off controls
    - change to "HW Gain 1 Volume" and "HW Gain 2 Volume"
  [v2 09/17]
    - return an error in the default case rather than just picking one of
      the behaviours when do .set_fmt
    - use the new defines that are _PROVIDER_MASK, _DAIFMT_CBP_CFP and
      _DAIFMT_CBC_CFC
  [v2 10/17]
  [v2 11/17]
    - the clock and gpio are aplit out into separate  patches

  The source file's GPL comment use c++ style, and the header fils's GPL
  comment use c style. We have added "Switch" after the names of all the
  controls that just are simple on/off.

Jiaxin Yu (19):
  ASoC: mediatek: mt6366: support for mt6366 codec
  dt-bindings: mediatek: mt6358: add new compatible for using mt6366
  ASoC: mediatek: mt8186: support audsys clock control
  ASoC: mediatek: mt8186: support adda in platform driver
  ASoC: mediatek: mt8186: support hostless in platform driver
  ASoC: mediatek: mt8186: support hw gain in platform driver
  ASoC: mediatek: mt8186: support i2s in platform driver
  ASoC: mediatek: mt8186: support pcm in platform driver
  ASoC: mediatek: mt8186: support src in platform driver
  ASoC: mediatek: mt8186: support tdm in platform driver
  ASoC: mediatek: mt8186: support audio clock control in platform driver
  ASoC: mediatek: mt8186: support gpio control in platform driver
  ASoC: mediatek: mt8186: add platform driver
  dt-bindings: mediatek: mt8186: add audio afe document
  ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and
    max98357
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357
    document
  ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and
    rt5682s
  dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s
    document
  ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs

 .../devicetree/bindings/sound/mt6358.txt      |    4 +-
 .../bindings/sound/mt8186-afe-pcm.yaml        |  175 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |   47 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   47 +
 sound/soc/codecs/mt6358.c                     |    5 +
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   21 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  651 ++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  106 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  244 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3001 +++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c |  150 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |   15 +
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  878 +++++
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c |  298 ++
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  |  236 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 1355 ++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |  423 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c    |  726 ++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  695 ++++
 .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
 .../soc/mediatek/mt8186/mt8186-misc-control.c |  295 ++
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  924 +++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  900 +++++
 sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913 ++++++++++++++++
 30 files changed, 14782 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
 create mode 100644 sound/soc/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hw-gain.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-src.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-misc-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
