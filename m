Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14237CD4842
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 12:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=; b=NsI5CDSE4XQs6nGq5M3knotRYe
	07Iij8Pgh/sf4vTlAG708lxJKtIqkz8mYDb3PdauBOHn4WpTsxwiiqx47kF0MXuLRsl5DpHjAmXg8
	gt9HAVY9kTCQuT0C8SmJ/fqPAoK47ta8xxQH0+vCFH6ZNwu3L77WefMwxrWZvKljG7iUxcOEvdXej
	tDrCrpmg7SQpaSI7TI+fq5xaoCK45JHsC9darGRJ6MJ8rCgXhyHFdbSidRpiRwzN5Nv4UOVWa1r6M
	pmYjzYN/ujy/sIoAo65DtgSWqmnNhfsFyDRzOCovfZmaQONuuZRBCF0vxx/DLkAbw9LfoSTT2lWS7
	w6LUeLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPSw-0000000DTjA-1P6y;
	Mon, 11 May 2026 12:10:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPSs-0000000DTgp-3ITL;
	Mon, 11 May 2026 12:10:28 +0000
X-UUID: 5f70d70e4d3211f1bf888deae2ea5f9b-20260511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wxp2NTpjEGAl1WZuVMHNm69/goC1fsF9Ilh4ewlLsms=;
	b=Phz4EIASYeia2G6fqxZ1qVAGtzKmeuilHB2xNvodI1N8hrUnnUuP77LIK70CgrpFifGjisbedQGa4hZamGENHQIJtrmC0eq7nQ08Wc1tgtQZVZqmAzIuf739XSGoqNIfm+7siAZXcY+YqwzCJXZf1OGvs+kbdAe2zE804IHovdg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:331e15b1-8290-48e4-be37-6a396dc84cfb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:c4cb6d45-8360-4d24-8500-9b9380fa4b0d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5f70d70e4d3211f1bf888deae2ea5f9b-20260511
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <arnab.layek@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1557240932; Mon, 11 May 2026 05:10:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 11 May 2026 20:10:14 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 11 May 2026 20:10:14 +0800
From: Arnab Layek <arnab.layek@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Arnab Layek
	<arnab.layek@mediatek.com>
Subject: [PATCH v2 0/1] dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for MT8188
Date: Mon, 11 May 2026 20:10:03 +0800
Message-ID: <20260511121004.2984149-1-arnab.layek@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260506133157.3283204-1-arnab.layek@mediatek.com>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_051026_833641_70A41C4F 
X-CRM114-Status: UNSURE (   8.64  )
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

This patch updates the MediaTek SCP device tree binding to support
multiple memory regions for MT8188 SoCs, addressing review feedback
from v1.

The MT8188 SCP requires two memory regions (SRAM + L1TCM) while other
MediaTek SoCs use only one. This patch follows the proper pattern of
using conditional schemas with explicit descriptions.

Changes in v2:
- Use conditional schema (if/then in allOf) to restrict multiple
  memory regions only to MT8188 variants, keeping maxItems: 1 as
  default for other SoCs (addresses Krzysztof's review)
- Add explicit item descriptions for each memory region (Main SRAM
  and optional L1TCM) instead of just setting minItems/maxItems
- Apply to both top-level and patternProperties

Based on linux-next, tag: next-20260505

Arnab Layek (1):
  dt-bindings: remoteproc: mtk,scp: Allow multiple memory regions for
    MT8188

 .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.45.2


