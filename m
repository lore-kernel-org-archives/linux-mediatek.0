Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFFCBC432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 08:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B396360E78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 08:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B396360E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lrGkSUDJYJVEamQ3Pt81gWjb6Dyq/9jr3vUQSPQlRnM=; b=wzbZj7Ob2b66q8
	E99KuSJlYA6qioNhqp8oB7ESQ2Xs9/9+jJhDwW9TTV7Gu+FNGym6zBTFxt1i5DMqwuuJ1GQjDS+YG
	uzEK2oJ1Bhd5LdU2LXu81JnrRWvsMiQ+EWB1HHWY8S0p+9cvPBIJvW6cG4Rg+ZTzBrUF7mjHZI088
	ukCgNnsL2rY51+pLzSbMFoU3M91HDFz4XMhpY8FMqkbDFtvHdCIH+jhCdTXGbT2G8nc64uJXQoA2/
	QqeMq0GSmboL1JrD7Tmg+APBTNPuEU5SYkLkgFNKmJ+E3ASP1h4/Uldls0QADjzTl3KbBm1e9q4Ak
	2tPbcC5DylxPjKgRuuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGdf7-007it9-7M; Thu, 19 Aug 2021 08:44:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGddv-007iVH-Rf; Thu, 19 Aug 2021 08:43:25 +0000
X-UUID: 5d2e4c18c0f541db921424385c3592d4-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FzXHmsGDl6fPZw3DqiZAMlc0KTFGJ7X+ABlH18nOK6Q=; 
 b=cA+8WqTNPwDWUVpguYfM4K/vFVIdxuEIsurZbMVzNgll3fUkJILOzZMvA3qtjqhyEarTEaP4LU/4PgY7OMddVrJ5LPbNxRofHiksN9UhZ5rkT7OpiHjjwsd3l+bnRQR+IJXZELAP2r1Z3OTPEeIKwzarwO9CTs/XCo9wngjaMpY=;
X-UUID: 5d2e4c18c0f541db921424385c3592d4-20210819
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 694291015; Thu, 19 Aug 2021 01:43:09 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 01:43:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:43:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 16:43:06 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v5 00/11] ASoC: mediatek: Add support for MT8195 SoC
Date: Thu, 19 Aug 2021 16:41:33 +0800
Message-ID: <20210819084144.18483-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_014319_960904_7F988169 
X-CRM114-Status: GOOD (  14.19  )
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

Changes since v4:
  - removed sof related code

Changes since v3:
  - fixed warnings found by kernel test robot
  - removed unused critical section
  - corrected the lock protected sections on etdm driver
  - added DPTX and HDMITX audio support

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

Trevor Wu (11):
  ASoC: mediatek: mt8195: update mediatek common driver
  ASoC: mediatek: mt8195: support audsys clock control
  ASoC: mediatek: mt8195: support etdm in platform driver
  ASoC: mediatek: mt8195: support adda in platform driver
  ASoC: mediatek: mt8195: support pcm in platform driver
  ASoC: mediatek: mt8195: add platform driver
  dt-bindings: mediatek: mt8195: add audio afe document
  ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and
    rt5682
  ASoC: mediatek: mt8195: add DPTX audio support
  ASoC: mediatek: mt8195: add HDMITX audio support
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-rt1019-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |  184 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   47 +
 sound/soc/mediatek/Kconfig                    |   24 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   22 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   10 +-
 sound/soc/mediatek/mt8195/Makefile            |   15 +
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  441 +++
 sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  109 +
 sound/soc/mediatek/mt8195/mt8195-afe-common.h |  158 +
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3281 +++++++++++++++++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.c |  214 ++
 sound/soc/mediatek/mt8195/mt8195-audsys-clk.h |   15 +
 .../soc/mediatek/mt8195/mt8195-audsys-clkid.h |   93 +
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c   |  830 +++++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c   | 2639 +++++++++++++
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    |  389 ++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 1087 ++++++
 sound/soc/mediatek/mt8195/mt8195-reg.h        | 2796 ++++++++++++++
 19 files changed, 12350 insertions(+), 5 deletions(-)
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
