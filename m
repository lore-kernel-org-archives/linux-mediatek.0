Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8BC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KDdFS+mez5AyGO/RVz9iALj1ZbrMYxvNTfFnSz4paSs=; b=WKHPZ4pBGVob2+
	ZDjMaA42Rooet/Ju2QQEblAbqJHV2m3KBewzk7C6EdMy2I8/Yl9LrJThs0YSGLFEPKhvhkewMveXV
	n1pWyFbTY8TIqUstNbPX4zGz90cZIvOroxBU8IoqCqS+i2B7N2/R1xbELTB/H9AKr61csE+pyGep/
	nPv8XwNc6oJHPF+GLx+yeOXyR6tWfFpmJmo1DUBtkR1hFAgj/LtRjj+2yzoZ/oowOyEt2s3yFxwc1
	Pb9NBDbK6uLfUXNs8mjXXAHSdcDJRWe48a1pVVskd6fiNIUW1cBJ8gAY1O5lZRTe7uDBKb7sHgz71
	EJvRMG+ynNlQseSfx4rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd81C-002lWG-2A; Sat, 09 Apr 2022 10:08:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd818-002lVM-GG; Sat, 09 Apr 2022 10:08:33 +0000
X-UUID: b49c3e572b5c4dc98d8f8540685835c0-20220409
X-UUID: b49c3e572b5c4dc98d8f8540685835c0-20220409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 976058507; Sat, 09 Apr 2022 03:08:26 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Apr 2022 03:08:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 9 Apr 2022 18:08:22 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 9 Apr 2022 18:08:22 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <rex-bc.chen@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jitao.shi@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>
Subject: [PATCH v3,0/2] Add mt8186 dpi compatiable
Date: Sat, 9 Apr 2022 18:08:18 +0800
Message-ID: <1649498900-8412-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_030830_583275_72443691 
X-CRM114-Status: UNSURE (   5.44  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on 5.18-rc1

Change since v2:
1. Move mt8186 compatiable location.

Change since v1:
1. Put switch dpi Topckgen MUX action in mt8186.dtsi.

Xinlei Lee (2):
  dt-bindings: display: mediatek: dpi: Add compatible for MediaTek
    MT8186
  drm/mediatek: Add mt8186 dpi compatible to mtk_dpi.c

 .../bindings/display/mediatek/mediatek,dpi.yaml       |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                    | 11 +++++++++++
 2 files changed, 12 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
