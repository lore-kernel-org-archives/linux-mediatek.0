Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F886C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 13:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0KarWRj/STG27nZgpOI54bUTl13c//GmQx6q/vQuLk=; b=RSNKyrstjVYLlR
	RZm6LLrBLAAZGrvCT7CX/d+32CzAkRFuLnVO3+dYv/LZAzQbKJpn9Z1IxpXguP7t2Eu6pPmXnMz00
	+yOa2hjkWNAanKjkrX0OF4SPvufbAGC22PVc8sG880InnYEAfc+ieq/ATabBYG/HvK6CXrLL3u4hu
	xyq6FyB3INpH48QoJySEZFtmqQFwlut3zgc2QUHaieN9hUq0eTZ41GkeTqA3TI+teECO1unfhSjoJ
	2+LzfjUwqurexDdEKzQA8zko0bvt5LhA7V93/y9Wu9fhfIGdjCme4SvfXCiyQaFWZCFoyBOXdE9HP
	GgMkivzhIoMrnRY46fEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRwov-008q8k-BA; Wed, 09 Mar 2022 13:57:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRwoY-008pyP-8v; Wed, 09 Mar 2022 13:57:19 +0000
X-UUID: a79435b162bb4d14a41a115639757cd7-20220309
X-UUID: a79435b162bb4d14a41a115639757cd7-20220309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 603288267; Wed, 09 Mar 2022 06:57:08 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 05:47:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Mar 2022 21:47:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 21:47:04 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/4] Fix MediaTek display dt-bindings issues
Date: Wed, 9 Mar 2022 21:46:58 +0800
Message-ID: <20220309134702.9942-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_055718_389034_58EA806B 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK Hu <ck.hu@mediatek.com>,
 moudy.ho@mediatek.com, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The vdosys0 series carried a nice dt-bindings conversion of the old
txt documentation for the entire mediatek-drm driver, but some of
the issues in there weren't seen.

This series is fixing all of the issues pointed out by a
`dt_binding_check` run, followed by `dtbs_check`.

Change in v2:
- remove mediatek,ethdr.yaml file
- change include header of mediatek,ovl-2l.yaml from mt8173 to mt8183

AngeloGioacchino Del Regno (3):
  dt-bindings: display: mediatek, mutex: Fix mediatek, gce-events type
  dt-bindings: display: mediatek, ovl: Fix 'iommu' required property
    typo
  dt-bindings: display: mediatek: Fix examples on new bindings

jason-jh.lin (1):
  Revert "dt-bindings: display: mediatek: add ethdr definition for
    mt8195"

 .../display/mediatek/mediatek,aal.yaml        |  23 ++-
 .../display/mediatek/mediatek,ccorr.yaml      |  23 ++-
 .../display/mediatek/mediatek,color.yaml      |  23 ++-
 .../display/mediatek/mediatek,dither.yaml     |  23 ++-
 .../display/mediatek/mediatek,dpi.yaml        |   3 +-
 .../display/mediatek/mediatek,dsc.yaml        |  23 ++-
 .../display/mediatek/mediatek,ethdr.yaml      | 147 ------------------
 .../display/mediatek/mediatek,gamma.yaml      |  23 ++-
 .../display/mediatek/mediatek,merge.yaml      |  49 +++---
 .../display/mediatek/mediatek,mutex.yaml      |  27 ++--
 .../display/mediatek/mediatek,od.yaml         |  14 +-
 .../display/mediatek/mediatek,ovl-2l.yaml     |  26 +++-
 .../display/mediatek/mediatek,ovl.yaml        |  28 ++--
 .../display/mediatek/mediatek,postmask.yaml   |  23 ++-
 .../display/mediatek/mediatek,rdma.yaml       |  28 ++--
 .../display/mediatek/mediatek,split.yaml      |  17 +-
 .../display/mediatek/mediatek,ufoe.yaml       |  19 ++-
 .../display/mediatek/mediatek,wdma.yaml       |  26 +++-
 18 files changed, 262 insertions(+), 283 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
