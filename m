Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B719C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TKvXkFAZyvbZuksuVzZbWzQOJy7NcwNKrV6IteeJV0=; b=ITTgrlVTiw6Ft6
	iYfzFUznpZtmdRuFyq6agiyN9W/ou2Y167id9HksgcYoJYaWlcGx5KDlzR6IOW7g+BS3TV4YY/Hvl
	edlzyI2M/sXM2ISnMqblOLOHqpkX7auZKSAWMFIirdeew9P8dLBsZTuvyEjIlfq0IVs64mgCNu2Go
	Vqzy8twSvPmPDr+xUumV168LDXalDOy1TEiUppvtzNIClGpmXnvdI2ZQ/BwjTnBR9LkdRMDpocwRd
	X0HlI4VEbwEwTonIYFg4lbsw4E1FXBfu9u7B8BNB/jB82+lRchT+n0lIlpkFCgzgNVLSDjSveNaxh
	NSAWymIyuQ45Dn3iuDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk0ld-005qq9-Tu; Thu, 28 Apr 2022 09:48:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk0g9-005oDh-Mu; Thu, 28 Apr 2022 09:43:19 +0000
X-UUID: 194f4f1a8c6b4e569e44544a0ac996ab-20220428
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:29b32c9d-eef8-4354-9c36-efddfce2f62d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:45ad082f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 194f4f1a8c6b4e569e44544a0ac996ab-20220428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 338182466; Thu, 28 Apr 2022 02:43:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Apr 2022 02:33:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 28 Apr 2022 17:33:57 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Apr 2022 17:33:56 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
Date: Thu, 28 Apr 2022 17:33:37 +0800
Message-ID: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_024317_787318_D22A017F 
X-CRM114-Status: GOOD (  16.11  )
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

This series of patches adds support for Mediatek AFE of MT8186 Soc.
Patches are based on broonie tree "for-next" branch.

Changes since v3:
  - [v4 09/18]
    - remove DEBUG_COEFF debugging code
  - [v4 10/18]
    - simplify the logic of the code
  - [v4 13/18]
    - split out the MT6366 bits into mt8186-mt6366-commom.c
    - fix build error of "error: 'struct dev_pm_info' has no member named 'runtime_error'"
    - fix bug of adda dai driver
    - add route for pcm interface channel 2.
  - [v4 15/18]
  - [v4 17/18]
    - commonize the configuration of the codecs
    - move MT6366 common bits into mt8186-mt6366-common.c

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

Jiaxin Yu (18):
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

 .../devicetree/bindings/sound/mt6358.txt      |    4 +-
 .../bindings/sound/mt8186-afe-pcm.yaml        |  175 +
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |   71 +
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   71 +
 sound/soc/codecs/mt6358.c                     |    1 +
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   22 +
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c    |  651 ++++
 sound/soc/mediatek/mt8186/mt8186-afe-clk.h    |  106 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c   |  244 ++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h   |   19 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3005 +++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.c |  150 +
 sound/soc/mediatek/mt8186/mt8186-audsys-clk.h |   15 +
 .../soc/mediatek/mt8186/mt8186-audsys-clkid.h |   45 +
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c   |  873 +++++
 .../soc/mediatek/mt8186/mt8186-dai-hostless.c |  298 ++
 .../soc/mediatek/mt8186/mt8186-dai-hw-gain.c  |  236 ++
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    | 1355 ++++++++
 sound/soc/mediatek/mt8186/mt8186-dai-pcm.c    |  423 +++
 sound/soc/mediatek/mt8186/mt8186-dai-src.c    |  695 ++++
 sound/soc/mediatek/mt8186/mt8186-dai-tdm.c    |  695 ++++
 .../mediatek/mt8186/mt8186-interconnection.h  |   69 +
 .../soc/mediatek/mt8186/mt8186-misc-control.c |  294 ++
 .../mediatek/mt8186/mt8186-mt6366-common.c    |   59 +
 .../mediatek/mt8186/mt8186-mt6366-common.h    |   17 +
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 1003 ++++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  979 ++++++
 sound/soc/mediatek/mt8186/mt8186-reg.h        | 2913 ++++++++++++++++
 32 files changed, 15028 insertions(+), 1 deletion(-)
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
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-reg.h

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
