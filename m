Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB48DC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 09:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kx9OJIVdrtBW9BPot1utT7PmmneNqmH2VzvWFzhEFI=; b=y/YGOLelcVu4aZFr4bRdPtjatl
	6TSjPLYmelaVpbA9KCTqDmzKlkFkYXHBpK+x1b40g6Eed98vGb6opHYgCD/wUPTIel5IuSGmb6rH+
	zeCDETFoYeQ0S7R6B1KwFZHttcp6wp/E7wdokTPp19x9kL+rcxevoNeizbDBbmYKd0P9tJ0pozUcK
	lKkqMV0/U7Zzt4KoIU/rLTjXK6FefM9mD/DVe2D9Q2r3oBtYDlg0m0wzo/CCWrDGfbZ/JguLueK6+
	Vhg0X5OBl0UkCwHdPuYx9ccK3ztMq3mHlrBXK2PrF+6Yiu4B6zPpjFLny0N/A+Ic8T+sObU/6Oya8
	+xopA0mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHMXS-003rjp-8g; Fri, 29 Jul 2022 09:44:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHMXO-003riq-7P; Fri, 29 Jul 2022 09:44:07 +0000
X-UUID: fd8aeb305cd14aac870e582ee4cce16c-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7f0bdde9-7ce9-4ac6-976a-7eeab5ac2651,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:b050b0d0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: fd8aeb305cd14aac870e582ee4cce16c-20220729
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1554787995; Fri, 29 Jul 2022 02:44:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 29 Jul 2022 16:43:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 29 Jul 2022 16:43:21 +0800
From: Elvis Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Elvis Wang
	<elvis.wang@mediatek.com>
Subject: [PATCH 0/2] Add gce support for mt8188
Date: Fri, 29 Jul 2022 16:43:17 +0800
Message-ID: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_024406_291237_4F96B63A 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Elvis Wang <elvis.wang@mediatek.com>

Base on tag: next-20220728, linux-next/master

Elvis Wang (2):
  dt-bindings: mailbox: add definition for mt8188
  dt-bindings: gce: add gce header file for mt8188

 .../devicetree/bindings/mailbox/mtk-gce.txt   |    6 +-
 include/dt-bindings/gce/mt8188-gce.h          | 1079 +++++++++++++++++
 2 files changed, 1082 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8188-gce.h

-- 
2.18.0


