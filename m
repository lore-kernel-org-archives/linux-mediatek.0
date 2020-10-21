Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04590C4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 08:54:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801A5221FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 08:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwrv75P6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RbXkanGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801A5221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zesetAiJUC/Hh3LVl8rLRPatmvp5gsFZGVbfrPHsFVk=; b=iwrv75P6snk2LTy8w6zT1ONOjn
	mEXhQsBt6lSuscaq9V5B4qt9cskywNoqd984TkrqxELZNW8OU2/GyS3X8NsTp3uiXQqZqvHNwA11X
	wq+cnSkI3+feCbcIU15U6DHRm6cqW/es5gCgFM9nFDZxdqQ1e8Smz5PpfsGRc7jfeFt9AJpdHcTnK
	bIQ4RgHHfpqezOZkxzUBlht8GE83ra07ACbXy4dmtba9HVRJivRS5JdM5OeQbEFOo9r8DN/l+nEHT
	P1JRFwelmbYZXfkKXcSCtx7nNg8ZVh6V97uw4vxnMXxdw/BH33jRDfxfTc5lDF1aLt0tntWGG3hXU
	a4ELGDxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV9su-0008Pk-UZ; Wed, 21 Oct 2020 08:54:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV9sm-0008Ly-KT; Wed, 21 Oct 2020 08:54:09 +0000
X-UUID: 767f1de364854b6a82cb34ba3b3d3afb-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zaM/JuZ3fzlu2O0iBgAyjKGNvAslXjaq46Pi4xFcyfI=; 
 b=RbXkanGPWlK4tySdvwQ5xxXLUazu7+iXU92Ncrf3hjP6bLDg5DeYQCn+/NRpmXpFFu/UZb+cMkfN0QoquS4hd67Oka8StUdny0/iZuuYUACYu90p3y/zuj29dAQg75+5bTERs0SwBx0xcBLWuDc7IA3sobeuPUki9n9xBguwQB8=;
X-UUID: 767f1de364854b6a82cb34ba3b3d3afb-20201021
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 857105865; Wed, 21 Oct 2020 00:54:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 01:53:59 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 16:53:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 16:53:57 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/5] ASoC: Mediatek: Add support for MT8192 SoC
Date: Wed, 21 Oct 2020 16:53:50 +0800
Message-ID: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_045408_815571_9069D5C6 
X-CRM114-Status: GOOD (  13.07  )
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
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series of patches adds support for Mediatek AFE for MT8192 SoC. At the same
time, the calibration function of MT6359 is completed with real machine driver.
The patch is based on broonie tree "for-next" branch.

Change since v1:
  - fixed some typos related to dt-bindings in [v1,3/5] and [v1,5/5]
  - add vendor prefix to the properties, such as "mediatek,apmixedsys"
  - add a dependency description to indicate the required header files

Jiaxin Yu (5):
  ASoC: mediatek: mt6359: add the calibration functions
  ASoC: mediatek: mt8192: add platform driver
  dt-bindings: mediatek: mt8192: add audio afe document
  ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and
    rt5682
  dt-bindings: mediatek: mt8192: add mt8192-mt6358-rt1015-rt5682
    document

 .../bindings/sound/mt8192-afe-pcm.yaml        |  103 +
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
 23 files changed, 13341 insertions(+), 4 deletions(-)
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
