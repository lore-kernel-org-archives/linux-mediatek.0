Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BAEC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 01:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Y4hXZVXbTEkPR4cCFHEBR55hGJrDqCDArvwkQjxBQo=; b=MiXCZNLfb71/JGqUSRO+m9ILkB
	C/IhyMSxvjSj8NstW4ws0MvMQSQz3RJWZImCNI4nB0ysYeEwW6/WD15FA4kd3YZuftFTr+HW73gQq
	Sg7Qps6VX9aSF0GEZl+4Ad9yhLbZ+NtCD2+TD609dmYtlDMzKV0BrG/1m7OsBTsHuKJZy+wwccc3h
	6sBoLFoAhpuKiiwDNaDOcskFQ3g+iiR3/9fNizJK1U9JeNBjs4ha05TmNnTpQFSL8gEp6w3qycVQg
	EFtcN5ORtHA09ipYDvHcGJ3R0vuRG8sXw4eByfELGN9jnTonwgI8IKHy/QjajwZlvK/iKVUTYr4Uo
	EMggjmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wpw-0000000EZJL-2clI;
	Sat, 27 Apr 2024 01:26:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Wps-0000000EZIU-0tIG;
	Sat, 27 Apr 2024 01:26:41 +0000
X-UUID: 2d9df04c043511ef9a78ddf43a9225dc-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=7Y4hXZVXbTEkPR4cCFHEBR55hGJrDqCDArvwkQjxBQo=;
	b=GiYjisLuWyBza2WbQ9K0yQTIggArSW0itM6oBdzxenQWnwi0p9939kq6v0Sdf6Qjksxs2qJDVwgGrcpHwJ4YxoV24hNhKe63n83jBWxO0vtkaYGk6gf+iWry9TfdWM0XXl1z4nrf6RsoktnRslllbaqdEuSSVX0EJeQW0WwQ/7U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:22af031d-9b68-4e7f-b584-bd4896ac0a77,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:82c5f88,CLOUDID:4fc72a83-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 2d9df04c043511ef9a78ddf43a9225dc-20240426
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1118931411; Fri, 26 Apr 2024 18:26:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 27 Apr 2024 09:26:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 27 Apr 2024 09:26:25 +0800
From: Zhi Mao <zhi.mao@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Zhi Mao <zhi.mao@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Heiko Stuebner
	<heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, Alain Volmat
	<alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, "Mehdi
 Djait" <mehdi.djait@bootlin.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, Bingbu Cao <bingbu.cao@intel.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <shengnan.wang@mediatek.com>,
	<yaya.chang@mediatek.com>, <yunkec@chromium.org>, <10572168@qq.com>
Subject: [PATCH v2 0/2] media: i2c: Add support for GT97xx VCM
Date: Sat, 27 Apr 2024 09:26:11 +0800
Message-ID: <20240427012613.6621-1-zhi.mao@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.994900-8.000000
X-TMASE-MatchedRID: lpk7+cih7u+uhCBFl/b63m3NvezwBrVmwlZ2GSFD7LgGW3hFnC9N1Zg1
	FOMOQofR/3dN/c325otYXsJ+nWY7U2GN6M1vhJ4HnVTWWiNp+v8oUVkB7ifJnkYvSDWdWaRh5ym
	1cSfxndgf7I0n0nPgmhEDxWyR0o1w0YRMm/X9bI7uykw7cfAoICoTaU3L23VCmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1NZUO7I4U77G2E9Z8Xt3x1m4/XbB7QDM08NNZ3gvDJuiTg/SxOb1RkL/p6
	fATk3/mps857/V1yTmjhQ++Yq0mfrMADF+wG8K7js0+30OcemTzYaPZALfIbSyZdUr8fx4fMbuy
	vvGhtIDNwMS8lpRKBQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.994900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 53D9ACFF09AC5D5F0B61D020EA0B2910A5294ABA315F4ED34E9C71352FB5C4062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_182640_286505_45DF7B96 
X-CRM114-Status: GOOD (  10.28  )
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

This series add YAML DT binding and V4L2 sub-device driver for Giantec's GT9768&GT9769.
GT9768&GT9769 is a 10-bit DAC with 100mA output current sink capability, designed
for voice coil motor(VCM) with I2C control bus.

This driver supports:
 - support pm runtime function for suspend/resume
 - support camera lens focus position by V4L2_CID_FOCUS_ABSOLUTE CMD
 - used in camera features on ChromeOS application

Previous versions of this patch-set can be found here:
v1: https://lore.kernel.org/all/20240420011840.23148-1-zhi.mao@mediatek.com/
v0: https://lore.kernel.org/all/20240410104002.1197-1-zhi.mao@mediatek.com/

This series is based on linux-next, tag: next-20240424
Changes in v2:
- dts-binding files:
-- remove "|-" after description node, and remove a blank line

Thanks

Zhi Mao (2):
  media: dt-bindings: i2c: add Giantec GT97xx VCM
  media: i2c: Add GT97xx VCM driver

 .../bindings/media/i2c/giantec,gt9769.yaml    |  55 +++
 drivers/media/i2c/Kconfig                     |  13 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/gt97xx.c                    | 436 ++++++++++++++++++
 4 files changed, 505 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt9769.yaml
 create mode 100644 drivers/media/i2c/gt97xx.c

-- 
2.25.1




