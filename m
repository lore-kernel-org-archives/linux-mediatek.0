Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977A0C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 01:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43DEE610CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 01:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43DEE610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+B7XvR/GY82WkBWZehygCBlNMJoBxpX2sjXUMLUQDA=; b=T32aGDN5inXiWB
	T4oJ5dgwtB85B5kNmTRBweDrqd/uDa/qnvQIsU6CwEEGJYsK12DbdUhc7qOBmotUVxRICdW8fhpoC
	bTenLt7dnlBt2zwvZ35qQ8rOt7oW5tqo2KJt2RTIxNTi5jqP7rAjDuM7xHx4YtlBuLgEzOgJWXklH
	2Dku3TjDLLILYnocuhzt2R1RqQ0pHec3IJGYyRYUp56pGxoVgnqL0kSB4bhvG9wD0vs3+iPnBwxre
	dAJRQj3oSGthn5iebzvfYR5/I2D65BEjEg9IXwWPne6AZp9Q2kgbCbcOaDz6VmVWvq/4nzLOL64ZU
	FehT3GVlrdzPhSMFNuJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAMQn-00EbxE-OS; Mon, 02 Aug 2021 01:07:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAMQO-00Ebsd-0U; Mon, 02 Aug 2021 01:07:26 +0000
X-UUID: e0ad2751c2a744d18a1e0ae68751e763-20210801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0OuvSL9YCQ725++uK9eQoWxM7t8Cdfu/TqI3dYjN9Z8=; 
 b=jqfESBCUCbjww1KAHXlHlyGMAkHrcE/z61CiphszCFhm4G530Pz6e69fsUbK8vCENmwbv3Y/cpFu9QZ2vL/qI80ggXolskRIGQk9hkagmJMCnt2oZYtB0gu/rfhB5qAJwayvrQG8NvKCtoiWKo6wu1flTsBoOnzHxUjAOPvscPA=;
X-UUID: e0ad2751c2a744d18a1e0ae68751e763-20210801
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1545718929; Sun, 01 Aug 2021 18:07:22 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Aug 2021 18:07:20 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 2 Aug 2021 09:07:13 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 2 Aug 2021 09:07:13 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 0/2] force hsa hbp hfp packets multiple of lanenum to avoid
 screen shift 
Date: Mon, 2 Aug 2021 09:07:09 +0800
Message-ID: <20210802010711.169080-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: DACDD96C008E7593C8B1363FF108A32B915E6E623A57F10BB73FB09D193EF5002000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_180724_095220_69872065 
X-CRM114-Status: UNSURE (   5.89  )
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

Changes since v4:
 - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
   "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".

 - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".


Jitao Shi (2):
  dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null
  drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid
    screen shift

 .../bindings/display/bridge/analogix,anx7625.yaml   |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c                  | 13 +++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
