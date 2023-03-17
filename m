Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 06:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qiisn0SZ8xnyE1jSZqMUYY2XLTR8PnkxfVYSGRLnZpk=; b=SHzbL+KyI5Tp/Mzxcxl0+2Cy3j
	d4gL6tSQe56Xi79zL174XMWnJ7iE8YMt34vXrTSy8CyNTWh3nc/2foXM/S7GiJlurrShusO8hbgRm
	qMQprJ/0XJZWk9dePFxmmysj2NaibsYq6vK9XyxCnporuVtAKt1P0mxCFdnU+ErSXBXwsoX181Swa
	yhTOQz6cCdZpCULmG8ia7VNc4/FSycYuyUaVWeTFNu4Om8odIKd7/7e8XWHrRZD2Wlxlk0OW3Udzk
	4Cy00oAB5mGRL3981UT+bRJlToquSympLt9lrTx5iABTO4RBm97wTszsFbyqNfrkw5ooWvVysuhi7
	E1OicIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3RZ-001BAb-3C;
	Fri, 17 Mar 2023 06:20:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd3RY-001B90-0Y;
	Fri, 17 Mar 2023 06:20:01 +0000
X-UUID: bcf9636ac48b11ed86fbcd8805c7ac66-20230316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Qiisn0SZ8xnyE1jSZqMUYY2XLTR8PnkxfVYSGRLnZpk=;
	b=U4KVvZ0NUgN8jKIfINJoNAiG/1dbiSH2xFNoei/pxscdhYUcHtnaWQuNT49dChkKJ92d2eFvPUOH/LPtaXyIr47EIhA1M0ER7buu5l2ADXgvXlM0a37eHVukKuJNhFNNJhy+aPL3b5WXFRGg2laho/YxUpHlzDgUVzt1SRkVlL0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.21,REQID:94858f76-decc-4bca-b1bd-02b1809d8c57,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:83295aa,CLOUDID:d82ba828-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: bcf9636ac48b11ed86fbcd8805c7ac66-20230316
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2127081795; Thu, 16 Mar 2023 23:19:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 17 Mar 2023 14:09:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 17 Mar 2023 14:09:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v4 0/7] Add and update some driver nodes for MT8186 SoC
Date: Fri, 17 Mar 2023 14:09:10 +0800
Message-ID: <20230317060917.15175-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_232000_210468_20E54DA9 
X-CRM114-Status: GOOD (  10.16  )
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

This series is based on linux for-next.

Changes since v3:
 - Add index for ovl in aliases

Changes since v2:
 - Remove some unnecessary linebreaks for some nodes
 - Use one line for some properties
 - Drop "Fix the fallback for mediatek, mt8186-disp-ccorr" patch
   (since this is applied in chunkuang.hu/linux.git/log/?h=mediatek-drm-next)
 - Separate GCE into another patch
 - Drop some patches which are appied in matthias github

Changes since v1:
 - Remove the unnecessary trailing number
 - Add aliases for ovl* and rdma*

Allen-KH Cheng (7):
  arm64: dts: mediatek: mt8186: Add MTU3 nodes
  dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
    fallback of mediatek,mt8186-spmi
  arm64: dts: mediatek: mt8186: Add SPMI node
  arm64: dts: mediatek: mt8186: Add ADSP node
  arm64: dts: mediatek: mt8186: Add audio controller node
  arm64: dts: mediatek: mt8186: Add GCE node
  arm64: dts: mediatek: mt8186: Add display nodes

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 296 ++++++++++++++++++
 2 files changed, 304 insertions(+), 3 deletions(-)

-- 
2.18.0


