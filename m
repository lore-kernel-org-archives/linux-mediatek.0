Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C990C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0AAVFnUhWh2styzdCIE1FEsSg40WAYGfK3WJ+kEBMnc=; b=KIykFNdvJ7N8KkeJOwbK9aY/mS
	YGDeqmaguNTUXhua/dVfEoI5mP8SXsZLiWky8SdoWXviHJQ4+adu4yRF3w1+69mIkchRhZSv+9BSb
	LfsBNn5wJW4URLk2IaUUCMfJRRrs1QISJFL1zR6krmJZ2kG7K8QyoWjqDHKw3bME6zPZp1DgPRIVf
	eHH6136mHAUDKKgfNe93UUGYC+Q+w5rMoOFZf6xSaQKKTsIC9+7QbA8haLNw+GHCShjAIajctMcqM
	gAsDLwY/Y5Y++W6OoFDnKeGBlY2GIDWOwtP0vAPq/+6mF+kekAo15m52+5bBgO3c46rQ61qk3c1E4
	GP/Ckaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYEH-002G4G-2g;
	Mon, 15 May 2023 13:27:09 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYEE-002G28-1S;
	Mon, 15 May 2023 13:27:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pyYDQ-0003Bx-34;
	Mon, 15 May 2023 13:26:18 +0000
Date: Mon, 15 May 2023 15:23:27 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Alexander Couzens <lynxis@fe80.eu>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Wang Yufen <wangyufen@huawei.com>, Lorenz Brun <lorenz@brun.one>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] wifi: mt76: mt7915: add support for MT7981
Message-ID: <cover.1684155848.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_062706_581848_CB480E11 
X-CRM114-Status: UNSURE (   9.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for the MediaTek MT7981 SoC which is similar to the MT7986
but with a newer IP cores and only 2x ARM Cortex-A53 instead of 4x.
Unlike MT7986 the MT7981 can only connect a single wireless frontend,
usually MT7976 is used for DBDC.
To distinguish the MT7981 Wi-Fi MAC, add new device tree compatible
'mediatek,mt7981-wmac'.

Changes since v1:
 * rename mt7986_* to mt798x_* where appropriate
 * WARN_ON(1) if neither is_mt7981() nor is_mt7986() returns true
 * add device tree bindings for mediatek,mt7981-wmac

Alexander Couzens (1):
  wifi: mt76: mt7915: add support for MT7981

Daniel Golle (1):
  dt-bindings: net: wireless: mt76: add bindings for MT7981

 .../bindings/net/wireless/mediatek,mt76.yaml  |   1 +
 .../net/wireless/mediatek/mt76/mt76_connac.h  |  10 ++
 .../net/wireless/mediatek/mt76/mt7915/Kconfig |   6 +-
 .../wireless/mediatek/mt76/mt7915/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7915/coredump.c  |   7 +-
 .../net/wireless/mediatek/mt76/mt7915/dma.c   |   6 +-
 .../wireless/mediatek/mt76/mt7915/eeprom.c    |   7 +-
 .../net/wireless/mediatek/mt76/mt7915/init.c  |   6 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  |  17 +-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  14 +-
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  13 +-
 .../net/wireless/mediatek/mt76/mt7915/soc.c   | 162 ++++++++++++------
 14 files changed, 180 insertions(+), 76 deletions(-)


base-commit: 0d9b41daa5907756a31772d8af8ac5ff25cf17c1
-- 
2.40.1


