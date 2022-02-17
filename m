Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JMwnt4dDYybLR55vus+Q5DdDY3zTXkXe8xtyPgVLCwI=; b=sz31NDoPKm5IlV
	FiPi9YxDhdLc0CHGNO+Mx6d5b2U+Zy7G1Db5lw9B+fQweQcqo0kEc7hUVgSjWNGrvbKIONSx3cXQg
	5VghAZkEMGrUDkHn1VTMb+O1nT/oegYTwZY85afO8IE6+AKbUNt3I6D/2RGF3OboYYIss8VOYyD+Z
	NSzrC5s6aT2Pp3Xod9wNzwU962CWBaZu0rgIhBsEn01hpjYXAhhot+HdyTW5qm3qIj4jLlqsrj0Sh
	T//oB+Qp7i/8Mw9Sg0biTzN2T1pFqgsu/yd2ZV44Ry0AiXDkwf4N36b89odept6OsgjhD9r/0c9sO
	oVMmCJ9LsDDT9UqBC/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKc8E-009PCy-VX; Thu, 17 Feb 2022 08:27:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKc82-009P8P-Jv; Thu, 17 Feb 2022 08:27:08 +0000
X-UUID: 701a461f485e4dafbf7d1622f15049e9-20220217
X-UUID: 701a461f485e4dafbf7d1622f15049e9-20220217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1611077617; Thu, 17 Feb 2022 01:26:58 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 00:26:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 17 Feb 2022 16:26:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Feb 2022 16:26:55 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v2,0/2] Add mmsys reset control for MT8186
Date: Thu, 17 Feb 2022 16:26:24 +0800
Message-ID: <20220217082626.15728-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_002706_678131_6456CE34 
X-CRM114-Status: UNSURE (   7.72  )
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

v2:
1. Change variable type from unsigned int to u16.

v1:
1. Add a new variable in mmsys driver data to control different register
   offset for different SoCs.
2. Add MT8183 reset register offset.
3. Add mmsys reset control for MT8186.

This series is based on mmsys patch for MT8186 on [1].
[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220216084831.14883-4-rex-bc.chen@mediatek.com/

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
