Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C02360A262F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 17:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMTOX6lL;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=stzhKg/l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WPz9ZJgzuBEKAb5zeoxlqov20rYNodQR3Ms4u1ebahc=; b=dMTOX6lLwAbcB/kg1gwILk1tum
	C71GbJIeBS7kkrQ/KPVzp/kQvJ+3WioeMl1bL89n3NjaJlQomnDYffAKBosSumewR+DE2bU30fWp7
	wtXx/VoF/vwWa8GVFwT4Ih2NuMNPcBpMu3r5j/myc18GHF3CILweZNCh7eqF1m1M4mqCS+d7SBmE+
	pR7UhJLlLxFUxFBLnSvOEdlaoxqsG2dK1XUuMtzx+MsT/J8NVv2I4Lf0vDHLTcLSSE3cCyAlC9U8X
	Zj3moSq+k/MQEWkAyVJYA005LwKNreBv8EJdxW3l+thdA0COZMbiWmMWdJX58MEUD0RwzZDt/YD2a
	sCudi8AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURxv-0000000Fc7o-3f01;
	Fri, 20 Nov 2026 17:00:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURxa-0000000Fc4t-0uX7;
	Fri, 20 Nov 2026 16:59:39 +0000
X-UUID: c2b59e12e50311f1afed4741b24580c9-20261120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=WPz9ZJgzuBEKAb5zeoxlqov20rYNodQR3Ms4u1ebahc=;
	b=stzhKg/lXJuWIyXK2ULsXiAQAYbZaBut71had5pah6Px331bnnH71ukNHEfNQA3hLbXzeaTXSddpz2RXM2rYON33uNidNTnT0P0x7AUcZ8nMVx3Y1+nVbfd999TTzBf7uBkGT9H52I4P5JyLeUw504p9L6UEithVnVoi9Fomgt8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:85bfd918-7cd8-4d0c-b89d-30a077dadcd7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:edf39266-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c2b59e12e50311f1afed4741b24580c9-20261120
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shubham.paralikar@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 146350089; Fri, 20 Nov 2026 09:59:33 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.53; Sat, 21 Nov 2026 00:59:16 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 21 Nov 2026 00:59:16 +0800
From: Shubham Paralikar <shubham.paralikar@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Arnab.Layek@mediatek.com>, <Fred-WY.Chen@mediatek.com>, Shubham Paralikar
	<shubham.paralikar@mediatek.com>
Subject: [PATCH v4 0/1] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Date: Sat, 21 Nov 2026 00:58:31 +0800
Message-ID: <20261120165908.3204369-1-shubham.paralikar@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_085938_299772_7DD3DCEF 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT8901 and MT8971 boot with ACPI firmware and both describe their
GPIO/pinctrl controller with the same _HID, NVDA9221. The existing
MediaTek Paris pinctrl drivers only probe from devicetree, so neither
SoC gets pin control, GPIOs or EINT interrupts.

This patch adds pinctrl-mtk-acpi, a small ACPI probe helper for Paris
pin controllers, and two SoC drivers on top of it, pinctrl-mt8901 and
pinctrl-mt8971. Each driver matches NVDA9221 and passes its own SoC
data to the helper, which reads the "ChipId" from the controller's
vendor _DSD and returns -ENODEV when the device belongs to the other
SoC, so the matching driver binds.

It also extends the shared Paris, common-v2 and EINT code for ACPI and
for these SoCs: resources mapped by index, ACPI _AEI event interrupts,
fixed-stride pin register layouts (MT8971), skip-listed EINTs (MT8971
PROCHOT), wake-event EINTs, EINT-only virtual GPIOs and bus-hold bias.

v4 reworks the driver structure following AngeloGioacchino's review of
v3 and fixes the problems reported by the Sashiko AI review of v3. The
full changelog is in the patch.

Known issue: MT8971 suspend behaviour of EINT215 (PROCHOT, owned by
firmware) is still under investigation.

Build tested on arm64 with both drivers as modules and built-in, with
W=1 for drivers/pinctrl/mediatek/.

Shubham Paralikar (1):
  pinctrl: mediatek: Add MT8901/MT8971 ACPI driver

 drivers/pinctrl/mediatek/Kconfig              |   33 +-
 drivers/pinctrl/mediatek/Makefile             |    3 +
 drivers/pinctrl/mediatek/mtk-eint.c           |  217 +-
 drivers/pinctrl/mediatek/mtk-eint.h           |   16 +-
 drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1471 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mt8971.c     |   91 +
 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c   |  153 ++
 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h   |   17 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  124 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   31 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2296 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h | 1646 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   95 +-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |    2 +
 include/linux/gpio/driver.h                   |    5 +
 15 files changed, 6162 insertions(+), 38 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8971.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-acpi.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.45.2


