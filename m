Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F201C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 10:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D22E160F58
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 10:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D22E160F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=37fc3bsNBJPqOfXAp7poz2X/lFy7Z2w8k/yJIs9qYzU=; b=jDaf8/WYJEIKYG
	nSe/mArgrsnSz4Cc/nm5RG5ewShtcIqW7dPGMUAVUMnINmaffr9mkovjbbdz8aB6nHc2utrbfBXnr
	OhZFPU591nC2oaTjF/5ZDPDIxwPDFP/wLA2Fz8/3wHgT+Xxf55jWeNodr6eQgCMsXdShQY8zmO2Kx
	qWN5AjKLCoABs+PyP1WV8qAF9pRRDRnkL4tjSmYGv2fcGb9ogiF+epwKRRpA6xFZmVGembgina3lz
	Pe/1li741sQGlQvb5JSgcCJiivcvR+qog2Z5uiMZoNbxUK6xd2zYZTVJgJmWVhDItcCI69sYNfc3O
	/yIByZRch6Z0QgNAmohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miD6J-004n85-Gz; Wed, 03 Nov 2021 10:02:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miD5X-004mg0-6I; Wed, 03 Nov 2021 10:01:48 +0000
X-UUID: 92f4baca95894cba9d6ea2829c7a3d87-20211103
X-UUID: 92f4baca95894cba9d6ea2829c7a3d87-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 827934959; Wed, 03 Nov 2021 03:01:43 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 03:00:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Nov 2021 18:00:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Nov 2021 18:00:44 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 0/4] ASoC: mediatek: Update MT8195 machine driver
Date: Wed, 3 Nov 2021 18:00:36 +0800
Message-ID: <20211103100040.11933-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_030147_284476_E0283CF7 
X-CRM114-Status: GOOD (  10.81  )
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

Thes series of patches adds support for RT5682s headset codec and
create a new machine driver for SOF support.
Patches are based on broonie tree "for-next" branch.


Trevor Wu (4):
  ASoC: mediatek: mt8195: add headset codec rt5682s support
  dt-bindings: mediatek: mt8195: add model property
  ASoC: mediatek: mt8195: separate the common code from machine driver
  ASoC: mediatek: mt8195: add machine driver for MT8195 SOF support

 .../sound/mt8195-mt6359-rt1011-rt5682.yaml    |   4 +
 .../sound/mt8195-mt6359-rt1019-rt5682.yaml    |   4 +
 sound/soc/mediatek/Kconfig                    |   2 +
 sound/soc/mediatek/mt8195/Makefile            |  16 +-
 sound/soc/mediatek/mt8195/mt8195-common.c     | 398 ++++++++++++
 sound/soc/mediatek/mt8195/mt8195-common.h     |  33 +
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 591 +-----------------
 .../mt8195/mt8195-mt6359-rt1019-rt5682-sof.c  | 557 +++++++++++++++++
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 551 +---------------
 .../mediatek/mt8195/mt8195-realtek-common.c   | 161 +++++
 .../mediatek/mt8195/mt8195-realtek-common.h   |  34 +
 11 files changed, 1267 insertions(+), 1084 deletions(-)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-common.h
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682-sof.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-realtek-common.c
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-realtek-common.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
