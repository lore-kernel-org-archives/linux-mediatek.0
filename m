Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5F6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 11:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vS8hQTlNVH9MhN3RvCv54s6g1Fx7Jmupeu84eDVbJPE=; b=pP0zYy1OWnTKEMByzlUUc7MmJ1
	q2USFPa2gcDq2u5cJSSi6P1pxNCgnyIvtDr3LMg2UTqfehTXXCcaxmtRqlpdLox4Wh8dEzJ1jBCmh
	2VRaft72gPeFp3BWYG3J6ORDxUZmK47nUUGsaEW9P0wc5TpEiYYlB/u3kNaS66WOzEfLbSoHKhBXM
	a2l37x7kBwm20TN3hu6S7BxIZtQW4VXZf2VxNPMP1E4/g3UmUyx80lEUV0jaQ4GgTyYf3ZR0E197X
	q710GHJRpUEnTwjolTJo8HE1QJhIyvYMeTYU3t7CHJvBW6r/lLWgyv2gbO/6bdqceDzH7VcxUvhnZ
	4+pCJlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyY8-0000000A4QM-3FvL;
	Wed, 03 Jul 2024 11:53:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOyY5-0000000A4Oj-1eCA;
	Wed, 03 Jul 2024 11:53:22 +0000
X-UUID: d545d102393211efb2966dae1f787272-20240703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vS8hQTlNVH9MhN3RvCv54s6g1Fx7Jmupeu84eDVbJPE=;
	b=oVv7at7sgDBeUqLbY9m9mcSMa6836ceMoNDf/V+pTfj8GUVCO/W0jOJXy/X6hk2v0UwoGqGpG4HrOQJYiZqCocg9UX2f0sUTMtH25yA3DUfMzP+od9nRxTtuyQ7ACarNXz0XSTY4odNnhcU9vKkBNYW3+rsBvjZacjZlRRiml9g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:ff83ec91-1b72-4a53-8458-f3469f2fc4d4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:fd79050d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: d545d102393211efb2966dae1f787272-20240703
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1583757424; Wed, 03 Jul 2024 04:53:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Jul 2024 19:53:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Jul 2024 19:53:13 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>, shun-yi.wang
	<shun-yi.wang@mediatek.com>
Subject: [PATCH 0/1] Support multiple reserved memory regions
Date: Wed, 3 Jul 2024 19:53:07 +0800
Message-ID: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_045321_477537_507C5626 
X-CRM114-Status: UNSURE (   7.49  )
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

From: "shun-yi.wang" <shun-yi.wang@mediatek.com>

Besides the reserved memory region for SCP, there are additional 
reserved memory regions for specific hardware use.
Currently, only a single memory region is supported.
Modifications are made to support multiple memory regions.

shun-yi.wang (1):
  remoteproc: mediatek: support multiple reserved memory

 drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

-- 
2.18.0


