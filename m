Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBAAC49EA1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 12:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+68I2wt+mK5kj3jVcgGesLqev3xV/ggibaKNqaiJVLQ=; b=dzkvjqphBAnVkLtfS7LT+zORQP
	orZn/py/rJvNEHImUuG4pOwZMEW5NqoLG7mDQ+TTOqA+iuHzZ1ABv58msz4ha47Ew2cYr96Xo7W7I
	60hB41f3zdUxFVC+lQgGzf/bpSefJ5FeNphvdUW/A6I2Pm5am08Zx4tUKjiFGH2Jk0uYUDckuB669
	Z/qnLVG5wg4J/WEHRXlO+3DKad4vuqWc8c4GhZTfA3zTeyGt8sFgErUnmJWy9AgQYREd5Afyn0LWv
	mKoDnUAx9Lx5Ne6viGIQ05oqfFZvDiGjUave8EESKym4CFXO7KQfc6M61bjRFvsYMlSDw7Kf3/GMf
	VnKGFS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8Hd-000000011RW-2vY4;
	Wed, 31 Jul 2024 12:18:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ8HA-000000011Mr-2Klf;
	Wed, 31 Jul 2024 12:17:54 +0000
X-UUID: e574ee9a4f3611ef955bff358274dad2-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=+68I2wt+mK5kj3jVcgGesLqev3xV/ggibaKNqaiJVLQ=;
	b=NnxwHnNpkAti5Cm+B4GZCFRSlB2K9J4F6EoFhqCsvH0IbznjxJbQfTP28CBvxp63f+4Npx09mSx99h4pqvQIBoBVE+K+97bhFj5BBOrA/MAZjFNkN5TfzoSUAVoB2qCJ8HPZUesTO006S+2+FM4PdAgIR2ZYzsFg9OA+6BwLV+0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:a217e1f9-4b64-466e-a423-7b3f1affea4a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:55fa180e-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: e574ee9a4f3611ef955bff358274dad2-20240731
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <shun-yi.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016492435; Wed, 31 Jul 2024 05:17:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 05:17:44 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 20:17:43 +0800
From: Shun-yi Wang <shun-yi.wang@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Conor Dooley
	<conor+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, shun-yi.wang <shun-yi.wang@mediatek.com>
Subject: [PATCH v2 0/2] Support multiple reserved memory regions
Date: Wed, 31 Jul 2024 20:17:28 +0800
Message-ID: <20240731121730.1196-1-shun-yi.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_051752_650195_593714C9 
X-CRM114-Status: GOOD (  10.23  )
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

Changes in v2:
 - Modify description of memory region in dt-bindings document
 - Fix comments in v1, initial value and from '!i' 'i == 0'
 - Link to v1: https://lore.kernel.org/all/20240703115308.17436-1-shun-yi.wang@mediatek.com

shun-yi.wang (2):
  dt-bindings: remoteproc: Support multiple reserved memory regions
  remoteproc: mediatek: Support multiple reserved memory regions

 .../bindings/remoteproc/mtk,scp.yaml          |  8 ++++--
 drivers/remoteproc/mtk_scp.c                  | 27 ++++++++++++-------
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
2.18.0


