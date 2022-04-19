Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C70C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ytsSiNouttporTTe+jwPZFGJTU1zH7HYFPXNYZhzsVg=; b=m96sTpajnh31pJ
	Cn6ZLkEnGtddhmZbErUkQjHrG4qACYNYgnJQFK0xc0hcytcvxLIGqBnWqEHQP0RxbVG1rXyIG2gk3
	bV2ZWQBjulAZ/rbiuXtMb3HHCnZSReej/9HfuwTPGp3JGBu17L2kTpS0lWoOyY64MyUe2Y43BZVYd
	6AR6l/ABOvab9jeaLq/qZlcUcG3W9iHcya0cdp1CIX7JYAmQoF6tCWrrIX6iSKv+t5z8FYCBWaLbQ
	p5wMRm+P+mv3pK8TSasn8feu59OwbjIJuPsqOf1gNnDHZ9CuB5xoEq/6qismLOs7ZcvoEh0FxdCjV
	ItSoSj+KydsTMxUboGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nge2D-001D45-Nc; Tue, 19 Apr 2022 02:56:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nge2B-001D3D-Ar; Tue, 19 Apr 2022 02:56:08 +0000
X-UUID: 417d1faea1e94c3c9356f65d49ff3359-20220418
X-UUID: 417d1faea1e94c3c9356f65d49ff3359-20220418
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 179706463; Mon, 18 Apr 2022 19:56:02 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 19:56:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 19 Apr 2022 10:55:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Apr 2022 10:55:59 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/2] arm64: dts: mt8192: Add audio-related nodes
Date: Tue, 19 Apr 2022 10:55:55 +0800
Message-ID: <20220419025557.22262-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_195607_412879_50537559 
X-CRM114-Status: UNSURE (   7.41  )
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

Take audio-related nodes patch from series 20220330133816.30806-1-allen-kh.cheng@mediatek.com/
This patch is based on matthias.bgg/linux.git, v5.18-next/dts64

We add another PATCH for updating clocks and clock-names in the bindings.

Allen-KH Cheng (1):
  arm64: dts: mt8192: Add audio-related nodes

Jiaxin Yu (1):
  ASoC: dt-bindings: mediatek: mt8192: complete clocks and clock-names

 .../bindings/sound/mt8192-afe-pcm.yaml        | 165 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 135 +++++++++++++-
 2 files changed, 286 insertions(+), 14 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
