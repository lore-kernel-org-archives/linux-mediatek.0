Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02182CD37B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 03:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgh4kXOHFXEc3qCTI/+4wVGwX7AikCgijnTQL3F2cUk=; b=aMi+odZ08VBVDW2PPdqm0y7a1a
	Fj7mm+qfcXmQNYP4MDOqY5KCX0UIISk6BYfVLJy3/nEMCGOyybOP3sQU5D9Uek+jMaDPvwPHYfe8C
	rC8/TBLhDbC4TGcJaF7LKmxzkcVjjHhiDvZNtdTD0rWgmflt8rPKDlWs8XE/3Y86SI8AjuytA+L/1
	9v39wma9LTUVrpUTneyAMgVc3uHkngommx98I+oUg12HAMduxZRedcD2RH0TBTD4lhnCR3AgtETay
	8A+7nLD3shAoiBAA+4Q/ogtO30FwB0+1gNUsTjvOq1TzE7eNIpHc3S9r6Xx+3eQXeELapqFhFj2Ck
	dUlIXpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi4mf-00EHjc-03;
	Mon, 18 Sep 2023 03:18:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi4mZ-00EHiL-37;
	Mon, 18 Sep 2023 03:18:45 +0000
X-UUID: 102af2e255d211ee9b7791016c24628a-20230917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vgh4kXOHFXEc3qCTI/+4wVGwX7AikCgijnTQL3F2cUk=;
	b=R8rN+VbBj1Dwxu4ZlrG+uzlwn6K8JpBM5ZkfiW2SHC6wJxTa2XFJj87RXDOnRw4r2dcAXStoAxIsRjMd+0H/n9MdaAFJKSOdSzx2LGKGOVh3TZ3gmf6Spvr+TXLrdZVnaVUoKyI8y4WuGecepYNjwxbM/5a3v2F8IJgaq/q1r3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b89adae2-a04e-4e25-a62d-14a07c60b8b2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:12a523c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 102af2e255d211ee9b7791016c24628a-20230917
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chun-jen.tseng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 466477496; Sun, 17 Sep 2023 20:18:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 11:18:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 11:18:36 +0800
From: Mark Tseng <chun-jen.tseng@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Roger Lu <roger.lu@mediatek.com>,
	Kevin Hilman <khilman@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<chun-jen.tseng@mediatek.com>
Subject: [PATCH v2 0/2] soc: mediatek: svs: add support for mt8188
Date: Mon, 18 Sep 2023 11:18:33 +0800
Message-ID: <20230918031835.12352-1-chun-jen.tseng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.249200-8.000000
X-TMASE-MatchedRID: mjDuVRm881CUYaO/E+T/Q8AmcZEx8XHJ54m13cMa9kfWg0EDsqI9u2At
	OV4y6PIstYR/uNxnStGIJs0Up7vkWEkjllSXrjtQFEUknJ/kEl5IWseC5HlebfoLR4+zsDTtjoc
	zmuoPCq3LxWxHiETnAqXBRwU+MZ6cIVBGY5mPz3niochOHUKjBdoezZIWeg6s
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.249200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 8AB97ADD7380B801EB8549EFF00F59C90940052D9F358D6A038726E2BFAA0CF82000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_201844_004132_57795C3F 
X-CRM114-Status: UNSURE (   8.56  )
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

This series supports MT8188 Smart Voltage Scaling (SVS) hardware which
used as optimization of opp voltage table for gpu dvfs driver.

Changes since v1:
  - thermal name change to lvts
  - fixed voltage bin flow
  - using svs_get_efuse_data() replace nvmem read API in mt8188 efuse
    parsing 

Mark Tseng (2):
  dt-bindings: soc: mediatek: add mt8188 svs dt-bindings
  soc: mediatek: svs: add support for mt8188

 .../bindings/soc/mediatek/mtk-svs.yaml        |   1 +
 drivers/soc/mediatek/mtk-svs.c                | 184 +++++++++++++++++-
 2 files changed, 181 insertions(+), 4 deletions(-)

-- 
2.18.0


