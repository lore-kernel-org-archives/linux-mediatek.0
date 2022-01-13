Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F82C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 11:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LyhDtwCrG9sKTbPMKuTENnJVRx5wfk7UFy8AZXHXbLs=; b=lmu7x2RaWJR3bj
	HoVzgTuQ+ZJM4mYLtM0kEc5P5gdrfjV1QKtxYWrjpb+pSOcjxWt0Y5TiQ1bcUUW5eldaRBDm0YFxb
	zTb2TVEhxCJcSMvelcnuPoTyquUwXrwTsAcL+EybJ1PY/GeL5/INzzpGODKYQxZU6rWNd2nk8nh2R
	FNnjejMtz9npMIM1uxhP4IE7M8ZBSXeLeDYMxVC57on5wafBoS45kd8MixQZsKJLDuC7SaSWGlYJt
	qrJC7C2IXbu3NZ5BrUPVFtXxrbddrFVs9td6U9sZ6wjlGKK/zk1LsDWBg1RCl+A1bLgJ89IfMgYlj
	ZlMwYdCzKWvL19gSlCrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7y0h-005a9Z-1o; Thu, 13 Jan 2022 11:11:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7y0c-005a7a-R4; Thu, 13 Jan 2022 11:11:13 +0000
X-UUID: b0d0672d38274a2791c32623ee5256f2-20220113
X-UUID: b0d0672d38274a2791c32623ee5256f2-20220113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 291224118; Thu, 13 Jan 2022 04:11:05 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 03:11:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 19:11:02 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Jan 2022 19:11:01 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <lc.kan@mediatek.com>, <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/7] MT8186 SMI SUPPORT
Date: Thu, 13 Jan 2022 19:10:50 +0800
Message-ID: <20220113111057.29918-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_031110_922140_EC215561 
X-CRM114-Status: UNSURE (   8.69  )
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

This patchset adds mt8186 smi support.
mainly adds a sleep control function.

Change note:
v3: a) Add a new binding patch for renaming "clock" to "clocks".
    b) Reword the title for the binding patches, more detailed.
    c) Add the sleep control error path: if err, return directly.
       also change the log from dev_warn to dev_err.    

v2: https://lore.kernel.org/linux-devicetree/20220111063904.7583-1-yong.wu@mediatek.com/
    a) Add two patches for the "make dtbs_check" warning.
    b) Seperate the "sleep control" into two functions.
       And add a "TODO" comment while sleep control fails.

v1: https://lore.kernel.org/linux-mediatek/20211203064027.14993-1-yong.wu@mediatek.com/
    Base on v5.16-rc1.

Yong Wu (7):
  dt-bindings: memory: mtk-smi: Rename clock to clocks
  dt-bindings: memory: mtk-smi: No need mediatek,larb-id for mt8167
  dt-bindings: memory: mtk-smi: Correct minItems to 2 for the gals
    clocks
  dt-bindings: memory: mediatek: Add mt8186 support
  memory: mtk-smi: Fix the return value for clk_bulk_prepare_enable
  memory: mtk-smi: Add sleep ctrl function
  memory: mtk-smi: mt8186: Add smi support

 .../mediatek,smi-common.yaml                  | 32 ++++++------
 .../memory-controllers/mediatek,smi-larb.yaml | 19 +++----
 drivers/memory/mtk-smi.c                      | 51 ++++++++++++++++++-
 3 files changed, 75 insertions(+), 27 deletions(-)

-- 
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
