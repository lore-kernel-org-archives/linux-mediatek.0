Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D70C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6M7tsRq1McwevoC/wsmEOvxRxaR5kRAQ/J850hqbntI=; b=HriT19vQebVa3Y
	8nnnm5hf0MjwKDsRjD9xsjRPdyy3WFkuMzVBXg122u1QhnrGsvJUmW/VC/7l9QJeETAT8x8cDEBrf
	QAp3x+x2fLIu1b7udr/dKyEzdnQ5/U+f9TaOONU70BFI3V43d7hIbJXoZZ39EbCoAjpXyyO3tgZls
	tK8gIJmfBvFVZ9Iu322XkV5yD1fygKei1HjcCnxrs/g2X6oRhut5V/DxfTxRpgjQtZ/XvwwBVuOm8
	mOameJTi8J6d0hA6mGLl8KqkcPVetuR6GRD1L6FvjxQqPH5hXXwD2g4Vy4EqNeynW9sDTPuswWFuK
	05xDugXwfNDVeKgg4M2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxkx-002p61-0m; Tue, 15 Feb 2022 13:20:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxkk-002p46-Uo; Tue, 15 Feb 2022 13:20:24 +0000
X-UUID: 02d8d5de788b425491fd8fed877fe5dc-20220215
X-UUID: 02d8d5de788b425491fd8fed877fe5dc-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1562046194; Tue, 15 Feb 2022 06:20:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 05:20:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Feb 2022 21:20:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Feb 2022 21:20:12 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <enric.balletbo@collabora.com>,
 <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [0/2] Add mmsys reset control for MT8186
Date: Tue, 15 Feb 2022 21:19:50 +0800
Message-ID: <20220215131952.27861-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_052023_015340_B1B91CC7 
X-CRM114-Status: UNSURE (   7.22  )
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

This series is based on mmsys patch for MT8186 on [1].
[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220215075953.3310-4-rex-bc.chen@mediatek.com/

v1
1. Add a new variable in mmsys driver data to control different register offset for different SoCs.
2. Add MT8183 reset register offset.
3. Add mmsys reset control for MT8186.

Rex-BC Chen (2):
  soc: mediatek: mmsys: add sw0_rst_offset in mmsys driver data
  soc: mediatek: mmsys: add mmsys reset control for MT8186

 drivers/soc/mediatek/mt8183-mmsys.h | 2 ++
 drivers/soc/mediatek/mt8186-mmsys.h | 2 ++
 drivers/soc/mediatek/mtk-mmsys.c    | 7 +++++--
 drivers/soc/mediatek/mtk-mmsys.h    | 3 +--
 4 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
