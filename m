Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DB0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DIJD7g2BeC9GjB80h3phv3fUcb0nRz8kKJOmNMwHt9Y=; b=F1IpjPPocVf5nt
	GcXW2KgoUmopOfqvSQlDeQLc9DR+eqBRvW4KWinrrAuV0Km+8rJJAlsl5ar4b+/akzBUS5FpGzJuf
	PXq6/9cDD/rrr0wPGE5bdty0bky3xn95xv2YPljDsIAjHkKiMtffr8dquRyRPihs85J6A0Qt2eaHi
	ho6Rd3Relnrg6u225RBSCB4T6ZO8KIYQ1mgSMiHZ2Jule+bYV/I/9k4FhCyqEX/ztI2qNoAxHalgw
	RvMyDePMZCh3+qqjR6URstGJuGjRkiz+QuMgNUsT1qQCIpMNUnsJ1RUpIu/j+JAtFsp2mEqCfcddu
	q3mrgMj2dBMJZ9sFUSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrhQl-000yEu-1A; Mon, 29 Nov 2021 14:14:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrhQM-000y6w-1c; Mon, 29 Nov 2021 14:14:31 +0000
X-UUID: c6ed035c9f2f48b7babf344a86d7f62a-20211129
X-UUID: c6ed035c9f2f48b7babf344a86d7f62a-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1162938429; Mon, 29 Nov 2021 07:14:22 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 06:11:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: Update MT8195 machine driver
Date: Mon, 29 Nov 2021 22:10:53 +0800
Message-ID: <20211129141057.12422-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_061430_111237_3AFD900E 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

This series of patches adds support for RT5682s headset codec in mt8195
machine drivers, and SOF support on card mt8195-mt6359-rt1019-rt5682 is
also included.
Patches are based on broonie tree "for-next" branch.

Changes since v1:
  - remove patch3 and patch4 in v1
  - add SOF support on card mt8195-mt6359-rt1012-rt5682
  - add new propertes to dt-bindings for mt8195-mt6359-rt1019-rt5682

Trevor Wu (4):
  ASoC: mediatek: mt8195: add headset codec rt5682s support
  dt-bindings: mediatek: mt8195: add model property
  ASoC: mediatek: mt8195: add sof support on mt8195-mt6359-rt1019-rt5682
  dt-bindings: mediatek: mt8195: add adsp and dai-link property

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   4 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |  14 +
 sound/soc/mediatek/Kconfig                    |   2 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      |  29 +-
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 347 +++++++++++++++++-
 5 files changed, 370 insertions(+), 26 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
