Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B77C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:05:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0482A6128B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0482A6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VlNxC4UzLimoNtAqgRj1HWuwCyRg9m7apeummgcnNDA=; b=gZNvCcEQ5xibqQ8WfgIRvjuifM
	6YyICHuXOcpr7ZhRtIdlF3cqYZOsEKTBNUvvPY50NHqrTojMCbjIbeZonJEBqNuZSgZG6CeFcgG86
	rGGUX3Cvgt4ydnucsfFlFwVem3QqhPGpkGX0o40CEXDPxAUZUVf8Ye4rHqp0/u7/Dp2yOZJuh956A
	zhtJJjPtgWRmzarIj1I0RJz+hel5dpUZefW+/eaLwSJoRG5TGVYFFv9mgnvBiXyYkGLrh6ePo+LsU
	31aSLgtuZcQeMngAtAL27E3HhUsP0dby62PNaK9UMDq+nW5ZY9cutHYz3vcVUMHVMqrX7W5LlPf4f
	/OF4Dndg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxBs-006u6W-EU; Mon, 12 Apr 2021 14:05:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBU-006u1g-Tj; Mon, 12 Apr 2021 14:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=oy7m73Itz6GLLa16RTU9lrbdwy5/1UVzWP3apklqRbM=; b=UDNGWoC0R4z0S4Ex1tPbjTC/K+
 9DF1LYx6AV0jRxxmkvNX+eTUxJXIXW4apJDV3P4RwWvLd/4SZgRdMUE4slTIz5Qu9qh6kPL4MoUHK
 uagSWkM0HgKeCTA8gqjYReWjYKcwhNmzPWm5ZfcaUYvPIIEy0FqoZPoMw3MCqake7giNVksgZTqAb
 n1iyOavMRlPZwtjFBoLvQRzn5q0q3F/XUTj8V4NhAr4hLtLDDnnQZkMJNy1L5ejjUr5X01ZsoY5s0
 ceh+7VkAJ7z06pdgtRecgL2ciEi9k8YIWFwS1Rd7oWed4yYvMNKMzjvesIAr9WWrQsRS4nRiCFXr5
 n7/OCeyA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBS-006Hr4-6h; Mon, 12 Apr 2021 14:04:59 +0000
X-UUID: e74a34c405a847b094178fae526c87e5-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oy7m73Itz6GLLa16RTU9lrbdwy5/1UVzWP3apklqRbM=; 
 b=rEjaVGRMY1bnxgk6PgcWEAg9xVUrMk35SLvOpaRNV1MoNE98tVs8sTqdtGOBD6IzTxQWBxM10Njkb9LjZoH8xHpTuM2N8fh9tYUkUcAT9gLpiLmdXMt6ndl1UskKYp9L5sazeRl0Dvy1aKXw+8fNxlt30HgMxRWsFQ24y6Tj8Fs=;
X-UUID: e74a34c405a847b094178fae526c87e5-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 708188230; Mon, 12 Apr 2021 07:04:55 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:04:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:04:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:04:50 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 0/4] soc: mediatek: mmsys: add mt8192 mmsys support
Date: Mon, 12 Apr 2021 22:04:44 +0800
Message-ID: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 67328E97F3056148482F62F7740128E2AC02CFD2990A87D1B2F4B07527D542662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_070458_271449_CC8B223A 
X-CRM114-Status: UNSURE (   8.45  )
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

base 5.12-rc2 and
https://patchwork.kernel.org/project/linux-mediatek/patch/20210330110423.3542163-1-hsinyi@chromium.org/

Change since v4:
- use routing table

Yongqiang Niu (4):
  soc: mediatek: mmsys: add component OVL_2L2
  soc: mediatek: mmsys: add component POSTMASK
  soc: mediatek: mmsys: add component RDMA4
  soc: mediatek: mmsys: Add mt8192 mmsys routing table

 drivers/soc/mediatek/mt8192-mmsys.h    | 68 ++++++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  7 ++++
 include/linux/soc/mediatek/mtk-mmsys.h |  3 ++
 3 files changed, 78 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
