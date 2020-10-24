Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE51C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B360022281
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 07:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0IdPC9f1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GhZhxCzy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B360022281
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+hoSKLtmVBTNUKPXGXhpq+mt39FCBxohhtJz0GWOONs=; b=0IdPC9f1in1vUxxIgHVofmDwHh
	boLNIjaCEy6R9Uzd4cto7iawghqgT1zma2n1WYZInZZUzVYEbuG1ZtXVtLAqo6INMJLgV+w4RaXi+
	M7jKP3Vyrtxw2Drark1sn8vNrv4yAgDJGQQBVlh2AtDrI1FeDYpO4LMGNjzoAKbBxORc4Tl/WSW+g
	Tuyk82yv4HCG3BLgFWVsVSu+47UUDA0PontyMhqaJg2tSJfffLe/Zju69lT9PsbQQiO4RzoQjwj+F
	GcLjI3hGA6CEA3Jc3Adpf50NhFagZZzvXHP5SjT9Xa8Vdaz7stuh11glME7JAzc44SCEZiLIcgjvX
	cIolvqRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWESR-0000Bx-KO; Sat, 24 Oct 2020 07:59:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWESI-00009f-VY; Sat, 24 Oct 2020 07:59:16 +0000
X-UUID: 5b7c0e161a77497589b94784e7f97e23-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1KN7hszEVP8/uxqUi6+D3V0c7StohRofr7IFpn3sG2c=; 
 b=GhZhxCzynm5wZkGdrbiDIfTXkG8pQ5ZclT8zPW4zlu1dAabOuoH7PE+xQQ4sV2V20U/veXybwHi1DYV0gJg9YG7dFB2f1T7HwMvfPJv92jkUIxFLCoQ0rzIMcvJSMAznmWhx9GgCMQoroxts+TNdBGQ8YrYauRlatuoBKGRL6Gc=;
X-UUID: 5b7c0e161a77497589b94784e7f97e23-20201023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 394322343; Fri, 23 Oct 2020 23:59:04 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 00:59:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 15:59:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 15:58:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Date: Sat, 24 Oct 2020 15:58:50 +0800
Message-ID: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: F3D02353B6E2DBA61C4A25150A69708FA218C2A4FA07713F8F03CC2CC6454B682000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_035915_293586_B9313715 
X-CRM114-Status: GOOD (  12.80  )
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

Change since v2:
  - split the dai driver files as a seperate patch
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
  ASoC: mediatek: mt8192: support add in platform driver
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
