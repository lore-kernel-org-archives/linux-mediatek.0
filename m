Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A39C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 13:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=btXwkf2JrGHdtklkT+xFBkZRLOkZ1MesASflaIOwMR4=; b=4W9+TxcLuctT5l
	koE568FQxr3h/EQSDoOkSkRgsX0zK8/3Ud2o+vIKerjgBF8rP46QD5xDQXco6G4EpEZfduHXLmiiM
	N/1/nGwYXJth0WXcAEnJjszvqqy04ROnqSTb8WMvIxTM1NjTpvEgo0nvBhdJSbXvdPbe6gT789Vo/
	7H3TQX2DPwAb3PIIrnWqoOg8rbvp13yN9BrVGZsBiWNm71uwyzafxFNatn0PtfIO6F7+S9O9gc+Q5
	YsWQP/rte01Z2+8V6c+DdJsakDw1jsQl64s/ocAK0IGG7cfIk6qgW/dyNRzJP/1e+/3DFcGGnk+wh
	FR0Rj4lGUYvf46JH6G6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhtGE-000aYV-3s; Fri, 22 Apr 2022 13:23:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhtG0-000aTx-Si; Fri, 22 Apr 2022 13:23:34 +0000
X-UUID: b186b81e695a41f296259445b6a2ff20-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:83f38773-bfcf-4651-a3b7-5a54bf2b2876, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:bc05a1f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: b186b81e695a41f296259445b6a2ff20-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2140858508; Fri, 22 Apr 2022 06:23:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 06:13:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 22 Apr 2022 21:13:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 21:13:18 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/1] dt-bindings: timer: mediatek: Convert binding to YAML
Date: Fri, 22 Apr 2022 21:13:16 +0800
Message-ID: <20220422131317.25410-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_062332_977968_4101FF3E 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Based on tag: next-20220422, linux-next/master + [1],

In [1], mt8186 compatible should be applied, but I don't find this.
I convert binding to YAML base on [1].

[1] https://lore.kernel.org/all/98be733a-62b0-4cf6-ab27-992ea49da5b1@linaro.org/$

Allen-KH Cheng (1):
  dt-bindings: timer: mediatek: Convert binding to YAML

 .../bindings/timer/mediatek,mtk-timer.txt     | 42 ----------
 .../bindings/timer/mediatek,mtk-timer.yaml    | 79 +++++++++++++++++++
 2 files changed, 79 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
