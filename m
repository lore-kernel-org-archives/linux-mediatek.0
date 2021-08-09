Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1817AC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:53:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9369C6023B
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 09:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9369C6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzJSQ3Op+4kW0Vuxa7tlV5Itok6KSRIuH+kBwEgT5+g=; b=ukH/cPvPorRCga
	35Est4xD3nLoxOIt20MqqPjuPJTi2x0rghkaVjVH5Zm7FQ8A85FgAVG9CgBO/4M+HWaX2I3En2UlX
	8y4/5W7br8h5OM5oDDpHvfVCqJMHCLssgj11ImtI+307Uv0E5PtfdByVM4LR6q+6cJv/KOp5eemrf
	VAMFGbswYo7hbqOe+OS9rMU2XeIFOnq+jBEvbYJ3D0RSrh1c9bL4HXKNSZTKJn91Ptg7FgLY7UWUc
	e6qkvgWktOoGcvD8iBRDrxN54KA/RPelhPyyri8qCBn9Mxviw+bqG0wzFW6aWpwwAxIdDyIcNEt6l
	3rDM/DvitKImED1gZPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD1y0-0005D7-JB; Mon, 09 Aug 2021 09:53:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD1xy-0005Bu-1Z; Mon, 09 Aug 2021 09:53:07 +0000
X-UUID: 87558bbd99d946e48dedbd843a303910-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wO6EFbxaIwCR21IQn0A/NtVK6gfl0W5bZunvFcieAcU=; 
 b=TD/3rpQ4495so3nw7Pd4vvqxqpHwnKXqnBrRsMqsO6CWa20zIgE+7uh1GQLVZ/5HfpJbmaJpiC1tkNg4u8twvAEdzUIht4CPDA9x0EC9lMihUkztYIIZJ92PLrrBpFZr/+mMrkaaV2UszV5nYwMXMlQ5DWkhVWWbZGPDlijI5Yg=;
X-UUID: 87558bbd99d946e48dedbd843a303910-20210809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1084700593; Mon, 09 Aug 2021 02:53:03 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 02:49:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 17:48:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Aug 2021 17:48:58 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v3 0/9] ASoC: mediatek: Add support for MT8195 SoC
Date: Mon, 9 Aug 2021 17:48:46 +0800
Message-ID: <20210809094855.7169-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_025306_142473_E3A6525A 
X-CRM114-Status: GOOD (  13.75  )
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

This series of patches adds support for Mediatek AFE of MT8195 SoC.
Patches are based on broonie tree "for-next" branch.

Changes since v2:
  - added audio clock gate control
  - added 'mediatek' prefix to private dts properties
  - added consumed clocks to dt-bindins and adopted suggestions from Rob
  - refined clock usage and remove unused clock and control code
  - fixed typos

Changes since v1:
  - fixed some problems related to dt-bindings
  - added some missing properties to dt-bindings
  - added depency declaration on dt-bindings
  - fixed some warnings found by kernel test robot

Trevor Wu (9):
  ASoC: mediatek: mt8195: update mediatek common driver
  ASoC: mediatek: mt8195: support audsys clock control
  ASoC: mediatek: mt8195: support etdm in platform driver
  ASoC: mediatek: mt8195: support adda in platform driver
  ASoC: mediatek: mt8195: support pcm in platform driver
  ASoC: mediatek: mt8195: add platform driver
  dt-bindings: mediatek: mt8195: add audio afe document
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |  184 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   39 +
 sound/soc/mediatek/Kconfig                    |   23 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   10 +-
 sound/soc/mediatek/mt8195/Makefile            |   15 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  499 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  113 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3283 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c |  217 ++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |   15 +
 .../soc/mediatek/mt8195/mt8195-audsys-clkid.h |   93 +
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  830 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   | 2652 +++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |  389 ++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  977 +++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2796 ++++++++++++++
 19 files changed, 12311 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/Makefile
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-audsys-clkid.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
