Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BDCC32771
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Sep 2022 04:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yJdS0/iD611Z0qXT//tqsqB6YYs0XIBQmGDntx2ksWQ=; b=FBRD/c0Ig09evPh/mH84NDcxvP
	MVLFZH3M5D23o/MyUyyRXPZ4ziR4d8cwc3sXUvTMpI7bWDCPByEYiZeX/a2BAEtCIzI7TVvGfQi+z
	ljKC9GJ4jrAvnoCP2a3r3h4mkVthfpuUCHj3gFH/I1TolsdBYnD8WEw/iB37amNVUdlgFJMFlWmsj
	7kaJVYUgOKA3+KeMGPn7QGYCiGkuI33vIfprWb2buSTBFmofa/wZS2nxuGas80Ds0Worx1K43B6JH
	W9mUsb3aUT8oV5hSGIn1/fbXJuj+NW2ro5t5s0aioIQJLasyBgaqDYnFKlZ5DEpncRG2IQgZGYpyN
	EsgT9ceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obwQh-006JDA-7N; Sat, 24 Sep 2022 04:06:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obwQe-006JCg-TH; Sat, 24 Sep 2022 04:06:14 +0000
X-UUID: 18fe7bc9128943868f943e0cb7df08df-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yJdS0/iD611Z0qXT//tqsqB6YYs0XIBQmGDntx2ksWQ=;
	b=t9SaBDBg6UcFpiVxMfPQimo0vhQoKcMaEHExFxR7sow8pcG7+5ixGce+pd9AVCGZtdHFFnB0Skwr+sOuYBAOMMZ1TKpKC4rALh938Yo0epM0JyBQCk1zt6VZPrpndOdXUEMHylgmuO4smztYNOucLTppldeXm7/dZKK84TpaYso=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:16a2adbf-f457-4864-a680-440280e741fc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d6840ee4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 18fe7bc9128943868f943e0cb7df08df-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 6746073; Fri, 23 Sep 2022 21:06:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 24 Sep 2022 11:36:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 24 Sep 2022 11:36:03 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
CC: <matthias.bgg@gmail.com>, <yc.hung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<sound-open-firmware@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, Chunxu Li
	<chunxu.li@mediatek.com>
Subject: [PATCH 0/2] ASoC: SOF: mediatek: mt8195: Add dsp_ops callback
Date: Sat, 24 Sep 2022 11:35:57 +0800
Message-ID: <20220924033559.26599-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_210612_962339_D9E04C97 
X-CRM114-Status: UNSURE (   4.78  )
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

ASoC: SOF: mediatek: mt8195: Add pcm_{hw_params,pointer} callback

Chunxu Li (2):
  ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
  ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback

 sound/soc/sof/mediatek/mt8195/mt8195.c | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 
2.25.1


