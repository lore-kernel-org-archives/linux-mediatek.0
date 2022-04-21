Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 04:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZAxHahtur6kT/yk+brfKBlHydQfRQlq5adoT/+Bs3A=; b=oFdqi3ma2Rua9z
	ytub05QoHxTv0kkNYv5UQNSxIeWj0aLJeqY1pQRWLZncGg398VwU+Se9tUKmFV1Y+1zDzznUrZlNd
	7RhR0Bohdgna2U4fNqPgo2Qa1yCSlB5bbKTdMEsA3D/G7gMphqnRbDEbTNxYL63l+R+RpZ1pxZJvt
	I4vhtLWn0wl+F2xkFI/4NQ4rSRpKRoL1xyJo+yGKcnyOwGSAKobwjszAyI3wf1WYMdDgxDUb0Mr6E
	1RTSEpQbpN7ULnSQWHZXmOWoRb7ui9t3CrBHtiB4u+ZSHQUwqE9EF0gKW3NiJDwdw9YYsQ0KZz4uc
	ejtAQzuhgOEoU5oW6kxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhO0v-00BNi0-U1; Thu, 21 Apr 2022 04:01:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhO0Z-00BNZq-V6; Thu, 21 Apr 2022 04:01:33 +0000
X-UUID: cffbcd8ff4ef45ffb4d929b7d4048028-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a2e5e0c2-421a-4b8c-afa8-3700e27b4303, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:47296ef0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: cffbcd8ff4ef45ffb4d929b7d4048028-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 806827648; Wed, 20 Apr 2022 21:01:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 20:51:14 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 11:51:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 11:51:12 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/4] Correct power domain for encoder
Date: Thu, 21 Apr 2022 11:51:07 +0800
Message-ID: <20220421035111.7267-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_210132_022700_EE530FB7 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Base on current mediatek encoder driver, we don't use larb driver to
control power. Add power domain to mediatek,vcodec-encoder.yaml.
Alos we pick missed PATCHs from 20220117070510.17642-14-yong.wu@mediatek.com
and add power domain to encoder nodes for mt8173 Soc.

Allen-KH Cheng (1):
  arm64: dts: mediatek: mt8173: Add power domain to encoder nodes

Irui Wang (1):
  dt-bindings: media: mtk-vcodec: Add encoder power domain property

Yong Wu (2):
  arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
  arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes

 .../media/mediatek,vcodec-encoder.yaml         |  7 +++++++
 arch/arm/boot/dts/mt2701.dtsi                  |  2 --
 arch/arm/boot/dts/mt7623n.dtsi                 |  5 -----
 arch/arm64/boot/dts/mediatek/mt8173.dtsi       | 18 ++----------------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  6 ------
 5 files changed, 9 insertions(+), 29 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
