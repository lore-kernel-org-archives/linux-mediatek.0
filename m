Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CEDC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lpv9HfQqedJZ/7/otnpcKeuvMelketPSFMtA2YH1PHA=; b=1+Onjpe6WEpeYWWL8goclY4Evp
	f3ydyg967YGmqbcARJqXjU53v3Bovcs7GY/c+HeJItF6Phqmra3yjCZhHbuN1wc56POh6efoSQAot
	PUM1Ismsb3a3UzuCrTjCCA9KKt1TorFlPB6DC1YFz+ANkdS+1HbwZdU+JdfBR6oAshP5/uFJlusSX
	fi+TGTYhi9Pm+WXlvCGkAW1nUvfX+7lWsWA65cdHFHRa7F6ngYzne9nkjTE0qRHHJAW5DQt8m47s1
	cmpASorHn1gVjV1G48iffjc+Xz5lvPNIF0KGNqrBJM/d3h6pFatI+QZX/oMOoZmeTWMxeHX3DFLg+
	c7bXEVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuIz-00H0TQ-1b;
	Wed, 20 Dec 2023 11:00:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFuIw-00H0Sy-25;
	Wed, 20 Dec 2023 10:59:59 +0000
X-UUID: e79a3bbe9f2611ee958cff29c719f35b-20231220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=lpv9HfQqedJZ/7/otnpcKeuvMelketPSFMtA2YH1PHA=;
	b=TR2HaB/1u95Zl7n6b4va7znamDdNukvA2rheWUO1rMBb6ZQJZUkyTFwl2AzF5zA3ulFwKZVfhxb0urcLqKVyeFvobB6yqedBWm2mPIf1mklbE1kjjApDpjZWhMdwebOeIylah6VEq7W8CbRJFtXqJetNeB3irDls7kae41XbF/E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:8e9fb788-9ec2-4cb6-a68f-dc3741379eb8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:f3fffa81-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e79a3bbe9f2611ee958cff29c719f35b-20231220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1494872302; Wed, 20 Dec 2023 03:59:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Dec 2023 18:39:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Dec 2023 18:39:15 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v3 0/3] mtk-socinfo driver implementation
Date: Wed, 20 Dec 2023 18:38:58 +0800
Message-ID: <20231220103901.22180-1-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.051100-8.000000
X-TMASE-MatchedRID: 5uxxxxIslOUBCIpkUn74FFz+axQLnAVBvhf/zJ92tsM+g2HSynO/Ai1I
	Luqb6ETyrx9lhxQSjNj/9P6O6iNEwAtbZsj4NhjsydRP56yRRA9YN1akkye0qJjk0EbtghtXRRZ
	I1R6hQzaMENdLhjEPNHATsg8MODVIHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWQR6jb3O2ykjy2X
	W59h7n3fWw4LXPaC9RJ7gxsQJMEE/KjZl3Lxot3yk1hlElDPyLpAdG928vJNq5yrMeSpGIIosfp
	jK6aPvPwZBgUyJVEbl6Fw8/PpTMRaVvmiAyeA2kc5MSfkiJFI5p3LlElBHTlw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.051100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FB31B32945D164C7005F3AE2971644E26B50E308F7FF16388E9ABCAFF8E3EE382000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_025958_712408_09F3087F 
X-CRM114-Status: GOOD (  10.73  )
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

v3 changes:
changes dts:
1. remove socinfo node so mtk-socinfo can be registered from mtk-efuse
2. add unit address to mtk-socinfo nodes

mtk-socinfo.c:
1. add static to previously global variables
2. remove the check on soc_dev in mtk_socinfo_remove
3. Drop .owner from platform_driver mtk_socinfo
4. Instead of probing from devicetree, socinfo is registered from
mtk-efuse

mtk-efuse.c:
1. Add mtk-efuse name to nvmem_config to avoid confusion with future
nvmem nodes
2. register mtk-socinfo from mtk-efuse

William-tw Lin (3):
  arm64: dts: Add node for chip info driver
  soc: mediatek: mtk-socinfo: Add driver for getting chip information
  nvmem: mtk-efuse: Modify driver for getting chip information

 arch/arm64/boot/dts/mediatek/mt8173.dtsi |   9 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi |   9 ++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi |   4 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi |   8 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi |   3 +
 drivers/nvmem/mtk-efuse.c                |  11 +-
 drivers/soc/mediatek/Kconfig             |   8 +
 drivers/soc/mediatek/Makefile            |   1 +
 drivers/soc/mediatek/mtk-socinfo.c       | 186 +++++++++++++++++++++++
 9 files changed, 238 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c

-- 
2.18.0


