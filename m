Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59933C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TSWA2c3Xi1dtVaEa8KDUSW+aN0KMfR6GYmnYFgP7SS0=; b=E/Eq1iS5N88Kc5
	b6K6xJwLnA3mSLUYlPw5YFJOywC9+8GueSA0iOpHz6UdHBIBys8aviY3IQI2XmrnCKg2jQ1bT6pP5
	MxpUg0HFfExMbT7LTyDKhK9jhtBYjx78skcf/Koz8L2TKqnI36ws8Pioc7CJUSZBznP7bRq5gRnCH
	Y39vlJnZVd4ImVSzn5CqqVyNLtxjP5TeVR7u8OljfX3B2RzbKKrGZHxP/i615ojN60RMJZQiUFK9o
	wl+RA7yM5G+hcb9Pb7C/n1quyEhPKSYrqUs8T9oY1UV+Sr3LJ+rGo641u46c+PG/CXrXmrtaMDeWj
	otkyuFBgTWQ+/2mIoBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2ZO-005FCA-L6; Wed, 06 Apr 2022 10:07:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2Mv-0059eU-BM; Wed, 06 Apr 2022 09:54:30 +0000
X-UUID: a8e5d10281f6416b84848eb6dce6f9d3-20220406
X-UUID: a8e5d10281f6416b84848eb6dce6f9d3-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 892806573; Wed, 06 Apr 2022 02:54:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 02:46:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 17:46:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Apr 2022 17:46:55 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <yongqiang.niu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 0/3] Correct disp_aal dt-binding
Date: Wed, 6 Apr 2022 17:46:51 +0800
Message-ID: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_025429_416181_221128FC 
X-CRM114-Status: UNSURE (   8.97  )
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

There are several dt-binding error for MT8183 and MT8192. Therefore,
we send this series to correct them.
1. Correct dt-binding and dts for MT8183.
2. Correct dt-binding for MT8192.

This series is based on this series:
"add display support for MediaTek SoC MT8186":
Message id: 20220406030009.2357-1-rex-bc.chen@mediatek.com

Rex-BC Chen (3):
  dt-bindings: display: mediatek: Correct disp_aal binding for MT8183
  arm64: dts: mt8183: Correct disp_aal node compatible
  dt-bindings: display: mediatek: Correct disp_aal binding for MT8192

 .../bindings/display/mediatek/mediatek,aal.yaml           | 8 ++++----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                  | 3 +--
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
