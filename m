Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D914FC7EE31
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hEfAOvZJXLtdoX37aHyT09q7nlqO9HPu0KdVdJ5LDDc=; b=nNWrFfxR48lL5u/RsKWxxK03Pv
	9DpKzIWKNY7v/0GjSn0lCvbQuJxdUIxnE1r+6p9emzuha9p0M5XCvy/9W/wX+Lo0rTxK+dAf9mIMd
	PVT31/v8GuEor4/n+8U0mmKEqudwBC5IdAEnD9Z51VZ1YCdwLpApMttiOJ33XXy1IYhs75qT8qa75
	Bq3bc7jF//PoVPuFH28/o92af30O0kbxE0VecQrfkXKz9du8zgUULCUmNo7FRIsNjc1oVh1AaMPnl
	rJ3A4lV2PhjzI+pUdPDB1/PNRz2WTCXTE1Fw2J8e8mf45YyPJj76zHZiEBHnx+lWTPpfcnnpbEnGp
	+AmFZbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKEf-00Fqa0-Px; Wed, 01 Mar 2023 11:03:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKEN-00FqVH-15; Wed, 01 Mar 2023 11:02:45 +0000
X-UUID: 802e88c4b82011edbbe3f76fe852e059-20230301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hEfAOvZJXLtdoX37aHyT09q7nlqO9HPu0KdVdJ5LDDc=;
	b=Zm+OPMeLf5MzQ5BuPcFdPCddPFkY1CYUugR67Rj5OyMJhkEdlx0kRa9rgot4uJ7dnbqbHD79dNO3kmyrcMGJc68o+7a0EVAO34UrDRZP5ECQLEwHtu4TPcxsR2vAwxJ7t4UwYcFhgE6rdpeqki20M6T2yF5gMNSQ4Wq65gwu1qY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:bd02923e-d62a-45eb-82ee-d0505f3d48bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:cc65fd26-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 802e88c4b82011edbbe3f76fe852e059-20230301
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1044094777; Wed, 01 Mar 2023 04:02:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 1 Mar 2023 19:02:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 1 Mar 2023 19:02:02 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] ASoC: mediatek: add missing initialization
Date: Wed, 1 Mar 2023 19:01:58 +0800
Message-ID: <20230301110200.26177-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_030243_113008_14B31006 
X-CRM114-Status: UNSURE (   8.98  )
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

Fix dts parsing problem in mt8188 and mt8195 etdm dai drivers.

Changes since v1:
  - split the patch into two commits and add Fixes tag.

Trevor Wu (2):
  ASoC: mediatek: mt8188: add missing initialization
  ASoC: mediatek: mt8195: add missing initialization

 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 3 +++
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.18.0


