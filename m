Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B39AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 04:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AZL/4U3dA33LvS8NGPtfm3QUWpx91cAARIW+EUNlpMc=; b=Td2xLoyWoz9ipu/fZ1xH0sd8Ub
	dYWsNnWAp+nkysQ/nSRPIgq3VK9sJ6IrQfZ7+cQE34bBk+Fbo041Leq7F4kHQzHiKynDdtCas/HIE
	WGemp0sf3bM7fo+oBHlcNb/8hR8S6X1wNcqVDclKB9Eapu3wwUHc6Rrf+hI4BRSeJZ2vrVtS4rdmC
	Cnw/j+nu3t0EKp4KwqzwmiLlch74oADcThFo0cXgeQ1AO+Up8zbChwZOCBzfbJZr1HiY5UHCIXdAq
	YqSV9Vp2g19Ol2aa06ZgML8qxsSGJo4d1Gsrj9lXROpKfWIiIKu6vTXlN8aR3wz0cOIW75xWyiJHf
	aS7f5/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZUD-001sbn-23;
	Thu, 01 Jun 2023 04:00:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZUA-001sa9-0L;
	Thu, 01 Jun 2023 04:00:27 +0000
X-UUID: d3200730003011ee912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AZL/4U3dA33LvS8NGPtfm3QUWpx91cAARIW+EUNlpMc=;
	b=eqM0clQLpLZYDXLrZ/zaSBrKBlfymeufKJIlRwkQZq7jL8igxqH6tjKbE59xPo58hG+NFuOJ8JbSTEVAwziOzeVPBToBDSO722qq4Uk4/MNrabNYRx8D1hzQZ2IwRuHF8mx57MiWbDrvkRu7r2+Fx+1SeVT0CKpu4lvGlxBg7PM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:7ae7aed3-32a0-4fc6-b85b-6177c85e0c8c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:63c1043d-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: d3200730003011ee912e1518a6540028-20230531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1648772680; Wed, 31 May 2023 21:00:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 1 Jun 2023 11:49:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Jun 2023 11:49:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<tinghan.shen@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/1] ASoC: SOF: add mt8188 audio support
Date: Thu, 1 Jun 2023 11:49:38 +0800
Message-ID: <20230601034939.15802-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_210026_149549_74000F36 
X-CRM114-Status: UNSURE (   6.89  )
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

This series adds mt8188 audio support and dbg_dump callback for
mt8186 and mt8188.

Changes since v2:
  - resend the correct patch for adsp debug dump

Changes since v1:
  - fix typo
  - adopt reviewer's suggestion

Trevor Wu (1):
  ASoC: SOF: mediatek: add adsp debug dump

 sound/soc/sof/mediatek/mt8186/mt8186.c | 22 ++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  5 +++++
 2 files changed, 27 insertions(+)

-- 
2.18.0


