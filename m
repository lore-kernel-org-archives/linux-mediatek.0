Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D97C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 03:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bK/04hzbREP4PVgBgY3aaLnmQrWeIappsXHz2+2OJ4w=; b=Ibvu/fb8ZxA8UMfAtdrh3j8HxB
	EB8mqinsivPlm0r5+LKbccfs6R4d9OkwKq7e7ldPUyiMXfpvjoFBwkSbwyf+sCnTofoLorFaFJewq
	UfG7f8USAVO0Ewh/VDDV7uPbnFDyJf8zFHP5tldtyb8x9DenulMYYVMFRazC0wCyiilLkLZGG0NUr
	XiRhe0BaAdaoiAFs165SnyyMvuhTiCmL3Uw3T5/tWLLyr+4iyNt9DXGwaXgjQZvo3rWYQN/32PW07
	RtjUW+X7tH3VLaC/IaqyHClFbtVV33ZUjNH/eE2PIpILfgGvTaqvapIbGpoxXsLPK9LdYLgNM0LO9
	Eu3vUeOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzSwQ-00000002IYi-2ajB;
	Wed, 24 Apr 2024 03:05:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzSwK-00000002ITK-009M;
	Wed, 24 Apr 2024 03:04:57 +0000
X-UUID: 6c819f6601e711efac1957ae9f99f617-20240423
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=bK/04hzbREP4PVgBgY3aaLnmQrWeIappsXHz2+2OJ4w=;
	b=pUqIa7igyOJoFAlCDls/mES5bB7HNg+/061mI4B2dCD33pUoUG3BvUrgJizleHQrZCasmloC1Pq64MyPZ/cnXASZyqCTEWXtPSsSd60E0zhUaXWMfQsflV3QCS0Pw2FQiKuJBNniruLSU/wRVT1MKQE7R+j0wnYlH/RJ0n1bwSw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:bf81adb8-b3d6-45c7-ae3f-1398df21c10d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:cf30f191-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6c819f6601e711efac1957ae9f99f617-20240423
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 596033663; Tue, 23 Apr 2024 20:04:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 24 Apr 2024 11:04:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 Apr 2024 11:04:15 +0800
From: Olivia Wen <olivia.wen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Tinghan Shen" <tinghan.shen@mediatek.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jason-ch.chen@mediatek.com>, <yaya.chang@mediatek.com>,
	<teddy.chen@mediatek.com>, <olivia.wen@mediatek.com>
Subject: [PATCH v3 0/4] Support MT8188 SCP core 1
Date: Wed, 24 Apr 2024 11:03:47 +0800
Message-ID: <20240424030351.5294-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.239800-8.000000
X-TMASE-MatchedRID: oW+CQKgX/2R+YhdyenZTz7Gj3LN0+Ey9lIsQ0nJjgWNcKZwALwMGs+2V
	VVLUIzQwTiQecD9aKoRYo3G+rvxrNUkjllSXrjtQFEUknJ/kEl5q8/xv2Um1avoLR4+zsDTtB00
	/kkeBTwAaleYWbIcH4tivMLMhjTVTyRWDL5/tObbY4PhY0w6qGMUgcbg+pBgtlrwXq2t0/ejenY
	rAXROpoaDDDv6krQYM8lWpj+Ra1oh2a1GxGYqQBIlk9PZkM+7M8PZB/MwMuOGjrlS58dwO+A==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.239800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E8FEBF4C631EFB7E5D7428EE62BEAC47F881B0ECBFB26DEE7BF71404867064662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_200456_093052_7B36EDFA 
X-CRM114-Status: UNSURE (   9.21  )
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

Change in v3:
- split the modifications in version 2 into three separate commits

Change in v2:
- change the order of mt8188-scp-dual
- modify the struct mtk_scp_of_data on MT8188
- add MT8188-specific functions
- add structure mtk_scp_sizes_data to manage sizes
- change tmp_data allocation to share_buf

Olivia Wen (4):
  dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
  remoteproc: mediatek: Support MT8188 SCP core 1
  remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes
  media: mediatek: imgsys: Support image processing

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   2 +
 drivers/remoteproc/mtk_common.h                    |  11 +-
 drivers/remoteproc/mtk_scp.c                       | 230 +++++++++++++++++++--
 drivers/remoteproc/mtk_scp_ipi.c                   |   7 +-
 include/linux/remoteproc/mtk_scp.h                 |   1 +
 5 files changed, 225 insertions(+), 26 deletions(-)

-- 
2.6.4


