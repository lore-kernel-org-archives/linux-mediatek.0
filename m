Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78DCC41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Dec 2023 08:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hDfXE4WCQi+Uero5L+lW8qc0hThlhEk0Ed8UxNuZT+I=; b=c4kj9g0BkKHNE3mL4Ro3x6PHPv
	lKJhaz4Vtp+r8v0N3ytGQ0kH7bGZmGYkLgOOFo8BAD/bT8Q5ZwM/JjhiXdN3aXvEpebTi5A+FYU1w
	BS6Shxqfs1FCoZKyDwhGXihqJT5IXhDhYmxuHWRYCtZsdlXZGo8z1ra4GAQ+oBCxt9g1MoWsoIp8P
	897wwupbxvyDKRe5Fs29zTDtFDc0lstpp2tokg5YS7SSyUfeUq9gXEQ2eeOCNWNZDP5ddxB5LyuZ/
	OfWtQFrQifdxqszMrujKERCDeMyI1ahUJfnR8IgYiozF5XM6hNkqhk7qJiM8YtogMdlKuCc8ILygu
	8LeNEhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaZQ-005GFv-2b;
	Fri, 22 Dec 2023 08:07:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGaZO-005GFU-2U;
	Fri, 22 Dec 2023 08:07:48 +0000
X-UUID: 2fe97710a0a111ee958cff29c719f35b-20231222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hDfXE4WCQi+Uero5L+lW8qc0hThlhEk0Ed8UxNuZT+I=;
	b=W81i5+2LZshrKyn6dJM6H1y8xe0660aIQJPK+iPRQE8LSBGLYyNLJYpS/JTlN959GDaohISTE6swsm6hoH6ml8weRsY6gsxbl0n37/2omj02yGaa+5lwSy3TEwI7PF2nn5WW2X28/GSsrMEpnefrrowVxTbhxT+gEYL53qCeDyk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:a675d0fe-973a-4f11-882d-ef9a5957e873,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:c0e60e82-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2fe97710a0a111ee958cff29c719f35b-20231222
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 537320738; Fri, 22 Dec 2023 01:07:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 22 Dec 2023 16:07:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 22 Dec 2023 16:07:41 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v4 0/3] mtk-socinfo driver implementation
Date: Fri, 22 Dec 2023 16:07:36 +0800
Message-ID: <20231222080739.21706-1-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-0.842800-8.000000
X-TMASE-MatchedRID: 7hQvYNNB0HPWs8uZun5F1rMjW/sniEQKrHCvytg5b477efdnqtsaE3Eg
	VCNNH68CDsWHoENn2KjwPnw702GJdY9Tk4aumaegydRP56yRRA9/aDoolm3GXTUsHjosUACSpJ3
	fC5uBqTYv64ytQjJ6boAy6p60ZV62fJ5/bZ6npdiujVRFkkVsm/MduS02EQgU8/TDBOKE/2l7+b
	tbM8Xu0GHsScaHxHAnBFOZmXZ6eOlkq0WS0Z/fHzGLhAPJMyqX2pkibEig2Kh+r27YUi2tGo6H7
	DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09quxzcuGDedhg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-0.842800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B7149D06EF9F63AE59B600D4E190A5935EEA42D1487B99C5F9A655F1EAEFA0892000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_000746_811863_6B332991 
X-CRM114-Status: GOOD (  10.43  )
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

v4 changes:
dts:
1. remove phandle from socinfo-data for all platforms

mtk-socinfo.c:
1. use module_platform_driver instead of builtin_platform_driver

drivers/soc/mediatek/Kconfig:
1. add dependency for MTK_SOCINFO

mtk-efuse.c:
1. add remove function

commit message:
1. update commit message by following reviewer's comment

William-tw Lin (3):
  arm64: dts: mediatek: Add socinfo efuses to MT8173/83/96/92/95 SoCs
  soc: mediatek: mtk-socinfo: Add driver for getting chip information
  nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse

 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   9 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |   9 ++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi |   8 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi |   3 +
 drivers/nvmem/mtk-efuse.c                |  21 ++-
 drivers/soc/mediatek/Kconfig             |   9 ++
 drivers/soc/mediatek/Makefile            |   1 +
 drivers/soc/mediatek/mtk-socinfo.c       | 186 +++++++++++++++++++++++
 9 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c

-- 
2.18.0


