Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B53C54FB9
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 05:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SakHYGlnJTkESNc4jc3OYlJVVY65U2yDXuFC27guwwE=; b=keIHnDpF4n+wi7RWnkI+Tinl+g
	miH6LCcOnu9/uvqGCtDgw0TkM4T98lhVtuywZdIY/CWE8eLwYAk8wfKUN2fOxiFRnIiFYig68d7j3
	EajZYnfY/OeoAzirF6AnBpNjA6i72uUpy/H2PP1x/YzkV3JCGTIUOVb3MSYJlojuiH+K54rLwdKoA
	q8xdu02h0uYVFc4SGmg3y2Xeg5pKyDmj52qZ9vWv+iuJcDtWe3UoG/BRsYeIu5Yp+R9yAwtNOBORp
	vYrvoRW1Y2mJYl44lI5kJIxlr2xgF5v5FGVHSwcOsTpoQw8oKSbVRLPDrjn3VPD369Jc+0dnATm8V
	ZGfi3S/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ras-005h3d-0X;
	Fri, 17 Nov 2023 05:40:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3rao-005h21-2V;
	Fri, 17 Nov 2023 05:40:40 +0000
X-UUID: d26a007e850b11ee86758d4a7c00f3a0-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SakHYGlnJTkESNc4jc3OYlJVVY65U2yDXuFC27guwwE=;
	b=sFf5faKY5f7AlBZoZs9ccrUWkzp4ak9bbZDOz7n6e1tIYBjIMxpGCwOkj3tyEm/Po1pvlRXKhGNWMrQZdafvmI64R7v/2BEUMvuQ+rFXRqasJJtpKauqKVhXKTKQbLRmAZOZ9j4OjYskdSRgcFOHB6u/4N8QLBFuAaormWi2CPs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:42ecea56-e1c1-48e6-9b15-f294669f047d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:987f7f95-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: d26a007e850b11ee86758d4a7c00f3a0-20231116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1358667071; Thu, 16 Nov 2023 22:40:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 17 Nov 2023 13:39:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 17 Nov 2023 13:39:56 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Garmin Chang <garmin.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v3 0/2] Migrate MT8188 VPPSYS 0/1 to mtk-mmsys driver
Date: Fri, 17 Nov 2023 13:39:32 +0800
Message-ID: <20231117053934.10571-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_214038_819016_302D9637 
X-CRM114-Status: GOOD (  10.83  )
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

Changes in v3:
- Separate binding patch from driver patch

Changes in v2:
- Refine commit message
- Refine commit title

Hi,

The purpose of series is to separate MT8188 VPPSYS-related binding patch
from the original mailing list mentioned below:
https://lore.kernel.org/all/20231116080129.20617-1-yu-chang.lee@mediatek.com/

These binding files reflect VPPSYS' dependency on mtk-mmsys for mediatek
MT8188 platform.


yu-chang.lee (2):
  dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
  dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.18.0


