Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EABEC87FCB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 15:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=70O96yXxB+ih/4k6nnxW4eOY9OCDT/QCv9QTGV2KEJE=; b=eH9PpxGvpE+xba
	DqE99wyN3Gk7SdKVd68gzGkT4h1vIKk5Uh5x8r5h0a9mliXD8Kev9zEq4KLXcnYDZ4lzzuGJkSohc
	czrejy9ejSNnic3T2Rl4Kueao6ti82HEkx+FPoKz3TLzEwCmT4mQ5JKvHSBvYJ8A6Gku5knm8eqH4
	fZJ6ez5woqm+l1vV/DMUnJ8gq8V28u4XJjN5/wIHyFZNJ034Es8NGi3Ve+/MjBmGrk2VrwGzWuClb
	CGudlXSySHM+lte+nJANzmj8UnrEFuaD5uyfFcVG9yvCTPonxxMUCSnZRwoIlwhmrkF85xIgQ2fmR
	cJQQ8ge0SUhyvVA1Omzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8fw-00000001qRT-0U89;
	Wed, 30 Jul 2025 15:25:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8dQ-00000001q0v-1LRf;
	Wed, 30 Jul 2025 15:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888946;
	bh=DoJw/kBMLDNroRE3RSQK+64VUd1PxTsq2rwbzF9VyiQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MYe94KOXTKC0AKh2+RMJL3dBYBxmV7VFAu0St8ow2+iQVp/FaQVggoHBGiCC/jRXz
	 j82C0MmFZIBKPmtMxDL/85QOzisB/bzEyG08D02p+ThH5CkOYPYUx7odwtLnlb58bX
	 iMMmAwckivbgCtsZ3zlEgq6II+7+O6fQbHYGcRQazhtmx7fI/UZ9U1DfjiB+XEWHXR
	 ISDTk1ZrE48M5V6DjEUQn1iI1huJYlmNAREFxMWCoeTC3kveCWCLTBNh4UYSIai6li
	 ZLASUgSvc+vLb3Xns88SL4TrV4qoo73ibMxEZHZIzDQ+UUv2/g9sGy9DrJAkvMvld1
	 e7FYlm/IWS05w==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D779117E129D;
	Wed, 30 Jul 2025 17:22:24 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v2 0/9] Add thermal sensor driver support for Mediatek MT8196
Date: Wed, 30 Jul 2025 17:21:19 +0200
Message-Id: <20250730152128.311109-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082228_510828_34ED4C21 
X-CRM114-Status: GOOD (  11.21  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series extends the MediaTek LVTS thermal driver to support the
MT8196 SoC.

MT8196 requires a different implementation of the lvts_temp_to_raw()
function.

To support this, the series introduces:

- A new struct lvts_platform_ops to allow platform-specific
  conversion logic between raw sensor values and temperature
- A variant of the lvts_temp_to_raw() implementation
- Platform data and controller definitions for MT8196

Link to v1: https://lore.kernel.org/all/20250721081459.16278-1-laura.nao@collabora.com/

Changes in v2:
- Added a warning in the probe function for temp_factor==0
- Reworded message for commit adding the lvts_temp_to_raw() variant
- Replaced mode macros with an enum
- Fixed eFuse binding to reflect compatibility with MT8186

Laura Nao (9):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller support
    for MT8196
  thermal/drivers/mediatek/lvts: Make number of calibration offsets
    configurable
  thermal/drivers/mediatek/lvts: Guard against zero temp_factor in
    lvts_raw_to_temp
  thermal: mediatek: lvts: Add platform ops to support alternative
    conversion logic
  thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw variant
  thermal/drivers/mediatek/lvts: Add support for ATP mode
  thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit
    calibration data
  thermal/drivers/mediatek/lvts_thermal: Add MT8196 support
  dt-bindings: nvmem: mediatek: efuse: Add support for MT8196

 .../bindings/nvmem/mediatek,efuse.yaml        |   1 +
 .../thermal/mediatek,lvts-thermal.yaml        |   2 +
 drivers/thermal/mediatek/lvts_thermal.c       | 326 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |  26 ++
 4 files changed, 333 insertions(+), 22 deletions(-)

-- 
2.39.5


