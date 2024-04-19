Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392D9C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k8xgKHGOLk22YTxlkQUseLp0TL4Lfi+IptzX72z60f8=; b=YtmY0ZVjJGvdmtbKLMZ2kJ9yET
	e8Hc5MlvkfdoQ0IdFUIY2Uwy8cICMuYDZcNsQCgp9+onZVDEm/cA4gWj32AAlLZArNIsbybLPuHKq
	7rMbbpreTqmuIDqgO4fHPHdxDu4hZz5kNlZsal0w+v8RCfuL0Qr5rMNYzWQMMxli/aC7WMVihFNEy
	4Zg+R50IZOUy1q/bAvoE2pfRISWfnqWGkeMVWNXCJzbgYghYVWsdh2yrlb5WEe9SKYABlpj2KBrXf
	W9zm1EzR5hcDxdANhgsujmo592SCyE80C55Symoh8T6kzt9ZBN1x9YG9iWk7JtFVyxN/mNs/EysL7
	REjyRBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjpM-00000004xz0-3qG9;
	Fri, 19 Apr 2024 08:42:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxjpH-00000004xxs-46QG;
	Fri, 19 Apr 2024 08:42:34 +0000
X-UUID: c078b234fe2811eeac1957ae9f99f617-20240419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=k8xgKHGOLk22YTxlkQUseLp0TL4Lfi+IptzX72z60f8=;
	b=q62PXFxppyKkS6FZTIeMXnZwsU/mn6tl9kU09cOQCARSagviOzFs6YsuoOq57ef0corxqV1h1J3OV9DNqcbzC0QLliMdAHhZWgvzeraRK28ogAnhpy2IJdu/gnhEjwbaMDtoubbr8fiOmZQwnWZwSAXTkYTnHEtnG0P2jhP80uE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:a7dd191a-9445-4c86-9670-2e63957c6fe5,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:82c5f88,CLOUDID:a4f71bfb-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c078b234fe2811eeac1957ae9f99f617-20240419
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <olivia.wen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1747948168; Fri, 19 Apr 2024 01:42:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Apr 2024 16:42:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Apr 2024 16:42:23 +0800
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
Subject: [PATCH v2 0/2] Support MT8188 SCP core 1
Date: Fri, 19 Apr 2024 16:42:09 +0800
Message-ID: <20240419084211.31901-1-olivia.wen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.099800-8.000000
X-TMASE-MatchedRID: 5QkmdD6LvPJ+YhdyenZTz4sKNaNh88CQsEf8CpnIYtnfUZT83lbkEBFx
	R5JQAS6O4wnhOb+JR+SAMuqetGVetiVvu9chHp+mavP8b9lJtWr6C0ePs7A07Q2y0JeZ/zscoZw
	wICyeoD3MM3a3XeTtKmFz8X6dP8PZtV04mbdKF8YOwU2/CT+xV0ZNgzs5p1AvtSF30+HwrkKm6E
	3e35F4TGLSbfA3MPr6dmtRsRmKkASJZPT2ZDPuzPD2QfzMDLjho65UufHcDvg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.099800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 07CE3AA0174AD91AB9808404EAB492C91087E1EB2468EADC569D868CE0F9A4722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_014232_050663_DA45B74D 
X-CRM114-Status: UNSURE (   8.31  )
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

From: "olivia.wen" <olivia.wen@mediatek.com>

Change in v2:
- change the order of mt8188-scp-dual
- modify the struct mtk_scp_of_data on MT8188
- add MT8188-specific functions
- add structure mtk_scp_sizes_data to manage sizes
- change tmp_data allocation to share_buf

olivia.wen (2):
  dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP
  remoteproc: mediatek: Support MT8188 SCP core 1

 .../devicetree/bindings/remoteproc/mtk,scp.yaml    |   2 +
 drivers/remoteproc/mtk_common.h                    |  11 +-
 drivers/remoteproc/mtk_scp.c                       | 230 +++++++++++++++++++--
 drivers/remoteproc/mtk_scp_ipi.c                   |   7 +-
 include/linux/remoteproc/mtk_scp.h                 |   1 +
 5 files changed, 225 insertions(+), 26 deletions(-)

-- 
2.6.4


