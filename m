Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3522AC47DA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 04:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lAETidl+Wl8rX9fUWkjIkcQ01vBdcd3CEgjPvhm/LgI=; b=HaAe+0gK+r5Epfn9tVApmBLUWe
	PhjuO2ZpKZwYTKTaWMWZNFs1ua4zpEHxnlqSEbONcURyMN8eBrwh6BPXjRWaOSl5oyb+mqQZJJr9w
	Ts1ZdnIP4pTt1JtyVTdrN+Eoe7lo10kqqLU/l9VhhQMs6i8I4OPQv7KMjv0lZSXd8WXmIUChozgjc
	aOsccV8H/GSS6+xNPMguhq28xQTTAjXLxhGGvLGAuGOCwHS0j1+Q7RhwnkUaNLVNL6PB8C3uIlV1Z
	UNQa93N219ndG2AxWjmFJ+RPJwx+1M+f0AdyG0If3gNs8I3T4uPeguJybwZn10d0j3QFdtQqfHJCx
	PYensTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2Q-00FrDo-0E;
	Thu, 11 Jan 2024 04:51:30 +0000
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2N-00FrCJ-15;
	Thu, 11 Jan 2024 04:51:27 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mt7986: excise kernel-doc warnings
Date: Wed, 10 Jan 2024 20:51:26 -0800
Message-ID: <20240111045126.13768-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix kernel-doc warnings for enum (anonymous): the enum values are not
documented, so don't indicate that the comment contains kernel-doc
notation.

pinctrl-mt7986.c:68: warning: Enum value 'GPIO_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RT_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_RB_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LT_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_LB_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TR_BASE' not described in enum '(anonymous)'
pinctrl-mt7986.c:68: warning: Enum value 'IOCFG_TL_BASE' not described in enum '(anonymous)'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312110210.x3vxq42A-lkp@intel.com/
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pinctrl/mediatek/pinctrl-mt7986.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -16,7 +16,7 @@
 		PIN_FIELD_CALC(_s_pin, _e_pin, _i_base, _s_addr, _x_addrs, _s_bit,	\
 			_x_bits, 32, 0)
 
-/**
+/*
  * enum - Locking variants of the iocfg bases
  *
  * MT7986 have multiple bases to program pin configuration listed as the below:

