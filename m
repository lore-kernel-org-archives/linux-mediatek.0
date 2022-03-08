Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E8AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JsybC8h6vnUbfueWEWbIGiqenYJkBzQN35/SzSyQ7yE=; b=EGIw2Xsvc0HvpU
	zCKZp71x+SK7NjCiPOtxnkMNaHzVmb/KIcGja7kUR07tTsDuWeSu2dAssju8Nzxe17crEklvTP2Gp
	6JdbDt09KfTLr4ru6CE+TX7RlsuK2toGf1qS5ybp+4oNICmGsAsNbbEKfD6rhIFKcrgCCBXOXHq1M
	DfEc7gsf3KednqwlgWlYpyK+IXltYHxJKEDysu7mI9pO1V82SksdigEt/6/32ktv143dAp5E+FE5l
	zMv0SrwQUTAV55BIW4x5mxJJIuzlrxlDR8ZH/Ye0XvUdzvial3g+G4fbxka1E1XkBIsddx01GRAzO
	sVLjngtTCI2aEh7DrQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRUKQ-00351a-2b; Tue, 08 Mar 2022 07:32:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRUKN-00350i-8N; Tue, 08 Mar 2022 07:32:16 +0000
X-UUID: cc0a3095afb34203a99cf56ca76f02e6-20220308
X-UUID: cc0a3095afb34203a99cf56ca76f02e6-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 181894854; Tue, 08 Mar 2022 00:32:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 23:24:41 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 15:24:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 15:24:39 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <aaronyu@google.com>, <yc.hung@mediatek.com>
Subject: [PATCH 0/5] ASoC: mediatek: Add support for MT8195 sound card with
 max98390 and rt5682
Date: Tue, 8 Mar 2022 15:24:30 +0800
Message-ID: <20220308072435.22460-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_233215_307223_8E5A2650 
X-CRM114-Status: GOOD (  11.37  )
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

This series of patches adds support for mt8195 board with mt6359, max98390
and rt5682.

Reset controller is included because mt8195 etdm is used to play sound via
max98390 before kernel boot.

In addition, the common part of machine driver is extracted for 
simplification.

Patches are based on broonie tree "for-next" branch.

Trevor Wu (5):
  ASoC: mediatek: mt8195: add reset controller
  dt-bindings: mediatek: mt8195: add reset property
  ASoC: mediatek: mt8195: common code for mt8195 machine driver
  ASoC: mediatek: mt8195: add machine driver with mt6359, max98390 and
    rt5682
  dt-bindings: mediatek: mt8195: add mt8195-mt6359-max98390-rt5682
    document

 .../bindings/sound/mt8195-afe-pcm.yaml        |   10 +
 .../sound/mt8195-mt6359-max98390-rt5682.yaml  |   61 +
 sound/soc/mediatek/Kconfig                    |   16 +
 sound/soc/mediatek/mt8195/Makefile            |   17 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    |   16 +
 .../mediatek/mt8195/mt8195-mt6359-common.c    |  398 +++++++
 .../mediatek/mt8195/mt8195-mt6359-common.h    |   30 +
 .../mt8195/mt8195-mt6359-max98390-rt5682.c    | 1058 +++++++++++++++++
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      |  406 +------
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  409 +------
 10 files changed, 1618 insertions(+), 803 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-rt5682.yaml
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-max98390-rt5682.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
