Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681BDC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 06:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8IZzO+mOpfrBWdJYvNSqM18e12S2fKclk8r352xBKQY=; b=X9rW7Pqjyld+nvHA+XomPzI5gw
	v0lfxO5QL6KWFrw+6iI49tAtXTCgKGkRwqe8mKGMj8oCAyEzuXWOoXwLeVljLYwVGwluqDtp1gXJf
	9Cb8lroGWby/iC2sKAE+cGMxHbunaGUPzc9dQ5yUmt9QbUTnIzwYrdQyTc7OhmXfkzYj/iw7cPa6F
	TvXbUHi4qRm5lEwKp55FAQOxH1cH4sFPTVFwSjUKvZ98EZ0gfvom2gsAzKLZ78QkPPaN1YvSAZFJ6
	mevIPY8EXYNH1+WgO/42bQZZjbaCaOrMSUv1sJSHpcYYVJxE3Fe04TS8VNQe9Gz4BFYkXam4TVFvm
	Yt2haAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMRt-00000007cIf-35l2;
	Wed, 27 Mar 2024 06:07:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMRq-00000007cHy-2jUG;
	Wed, 27 Mar 2024 06:07:44 +0000
X-UUID: 50351aceec0011ee96d5dfc950b7243d-20240326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8IZzO+mOpfrBWdJYvNSqM18e12S2fKclk8r352xBKQY=;
	b=HcP1G+T6V7iczm9B++VZyr6FhvNgMSScfxNRqezj1cGx39IIuTWlUpZ6p8XnkVLViSJY46K6kCi0FtVe/PhjJ0Ech8RYTHh5+BQ07vMRvQJEKU3xVPZGdlvaNYX7tFTN99vvo53HRyZkbxatvnaaPfzO6yOpqumdqgeBJACNGv8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6ce9b312-dee0-44e2-a60f-2ccf028b2102,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:f8067c85-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 50351aceec0011ee96d5dfc950b7243d-20240326
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1791225088; Tue, 26 Mar 2024 23:07:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 27 Mar 2024 13:57:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 27 Mar 2024 13:57:34 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"MandyJH Liu" <mandyjh.liu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <fan.chen@mediatek.com>,
	<xiufeng.li@mediatek.com>, <yu-chang.lee@mediatek.com>
Subject: [PATCH v2 0/3] pmdomain: mediatek: solve power domain glitch issue
Date: Wed, 27 Mar 2024 13:57:29 +0800
Message-ID: <20240327055732.28198-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.489800-8.000000
X-TMASE-MatchedRID: 5DngdSbII22YvtVftxNfQUvrB8UvzFr4BdebOqawiLuCsBeCv8CM/Sse
	9qdFFe49mI8EBZ3uTGtSzpXv5ekotFrgS5K/qcaqDko+EYiDQxFQCOsAlaxN7w6QlBHhBZuwkwm
	4GnFKyckb7ifYusSVqcMHFIKAT3DiXSJ4c3nT+QcZXJLztZviXLLiLKO9VZOiGNAPebYwJ/sNir
	voD95MYraIKdGDLjghSHd+RjLgi2MWk4/JZEVmwAPZZctd3P4BSjyMfjCRfaObKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWyPbu28yjM4gPvrALLbNcROH7ySOIYRUM7/nX4aM2lhoCh/NuaNOQW
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.489800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B131BB1C8C2F0B0239F1DB47012190F48CFE42F64402C447803B73104D73C13D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_230742_758146_2E018558 
X-CRM114-Status: GOOD (  10.58  )
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

Hi,

This series aims to solve power-off failures and occasional SMI hang issues that
occur during camera stress tests. The issue arises because, when MTCMOS powers on
or off, signal glitches are sometimes produced. This is fairly normal, but the 
software must address it to avoid mistaking the glitch for a transaction signal.

The solutions in these patches can be summarized as follows:

1. Disable the sub-common port after turning off the Larb CG and before turning 
   off the Larb MTCMOS.
2. Use CLAMP to disable/enable the SMI common port.
3. Implement an AXI reset.
For previous discussion on the direction of the code modifications, please refer
to: https://lore.kernel.org/linux-arm-kernel/c476cc48-17ec-4e14-98d8-35bdffb5d296@collabora.com/

Change in v2
 - fix commit title to "pmdomain: mediatek:"
 - add dt-binding definition
 - remove unused function


yu-chang.lee (3):
  pmdomain: mediatek: add smi_larb_reset function when power on
  dt-bindings: power: Add mediatek larb definition
  pmdomain: mediatek: support smi clamp protection

 .../power/mediatek,power-controller.yaml      |   4 +
 drivers/pmdomain/mediatek/mt8188-pm-domains.h |  69 ++++++-
 drivers/pmdomain/mediatek/mtk-pm-domains.c    | 168 ++++++++++++++----
 drivers/pmdomain/mediatek/mtk-pm-domains.h    |  13 ++
 4 files changed, 218 insertions(+), 36 deletions(-)

-- 
2.18.0


