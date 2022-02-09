Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF44C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 06:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mNV5F91ww7e9+vpE0/hs+qVbOld1zyJZlT608Bv6lYY=; b=dj+pJDCkbXbE8M
	IFnk/uf1RPV8xNXfVDaRCbn6eEtpgkphl+VIqLM3+Ci1P8WnGg7UN15FlPIz8tAylZZgU6FUnQjOB
	Hk/YeTvJT2HAoYgkp05VV0oF5PcqWmLjbDhIqQXGwoiDZ2xuQ9yWmUWJQQzf34goVU8/ibMxcYAlR
	/bQA0DXz2u1gCY+yIi6VXFZpDwekf/TLjTjZiCuhp6+xPjFRFDBvQ6uC3hkjI84dWUzHEQaB6Ubja
	O6+P4q0O5LW4EJDGPTUdFexjEB9aiNgtiHOn680qQhUq8KK1kQOXn30RW7Gg1iJfquZxNkdH5fFpv
	1R3XkzwVxVXyGs7sYfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHgFw-00GKGT-Eg; Wed, 09 Feb 2022 06:15:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHgFs-00GKF6-EB
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 06:15:07 +0000
X-UUID: f47b7b52f6464b5686955d8629a5176b-20220208
X-UUID: f47b7b52f6464b5686955d8629a5176b-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 917716637; Tue, 08 Feb 2022 23:14:56 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 22:12:03 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Feb 2022 14:11:59 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 9 Feb 2022 14:11:59 +0800
From: Bo Jiao <bo.jiao@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Bo Jiao <Bo.Jiao@mediatek.com>
Subject: [PATCH v4 0/3] add mt7986 support
Date: Wed, 9 Feb 2022 14:11:54 +0800
Message-ID: <cover.1644386694.git.Bo.Jiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_221504_509144_EFB08536 
X-CRM114-Status: UNSURE (   9.58  )
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

From: Bo Jiao <Bo.Jiao@mediatek.com>

This adds support for MT7986 SoC which integrated multi-band
4x4 WiFi 6/6E.
Detailed link: https://www.mediatek.com/products/mediatek-filogic-830

Bo Jiao (2):
  mt76: mt7915: add support for MT7986
  mt76: mt7915: introduce band_idx in mt7915_phy

Peter Chiu (1):
  dt-bindings: net: wireless: mt76: document bindings for MT7986

 .../bindings/net/wireless/mediatek,mt76.yaml  |   33 +-
 .../net/wireless/mediatek/mt76/mt76_connac.h  |    5 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  |    6 +-
 .../net/wireless/mediatek/mt76/mt7915/Kconfig |   10 +
 .../wireless/mediatek/mt76/mt7915/Makefile    |    1 +
 .../wireless/mediatek/mt76/mt7915/debugfs.c   |    8 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |   28 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |   85 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.h    |   13 +
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   54 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  209 +--
 .../net/wireless/mediatek/mt76/mt7915/main.c  |   21 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   81 +-
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  125 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |   44 +
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  277 +++-
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 1201 +++++++++++++++++
 .../wireless/mediatek/mt76/mt7915/testmode.c  |   35 +-
 drivers/net/wireless/mediatek/mt76/testmode.c |    5 +-
 19 files changed, 2003 insertions(+), 238 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7915/soc.c

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
