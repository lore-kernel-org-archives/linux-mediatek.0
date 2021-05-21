Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE63C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:52:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FF0261353
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FF0261353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBPcXTjgmQ83k3rPHa5gBAFXqf1P7vWkA8FnqDMAm6A=; b=kwqeN5h8cb43QTWc/wSbze/Jbn
	sxlqGA/cA5ICDmOQ2dlH8+S0A5ppFbJh911TwLwN0rhv0yBzRCk6mqzzwF4+Wu+ubK7C2wIzoST9D
	0I3aq1Bv9f0kzehl/ZXmqPtS982rfZvh6WLrcnf4s6fa720+mFFgjFWqB1voQlORSn8u8xqZtlbh4
	iL55MDkDGPOYbh4h2sNEE03s5M4JbApAQq4D7goTfNofTYjLl08lq/a/SFnFG7Ie+X90EoVRlOOg4
	yvNcmJJJGcyDTNLiH2JyTy1NDWgX5Qslp55XkAIw7SkqaYvD9nEJmYm15BU+TXrx3pHZ+JVH3iXQk
	y7evBnbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0tD-004XdV-Ne; Fri, 21 May 2021 08:52:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0sm-004XSw-Ui; Fri, 21 May 2021 08:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dKatBfeVTfSyxthCKGydA7RpsPmWu1+vZkk+mQgx8MU=; b=yq2bua802UNCAibF9A5mcpXof5
 st39yyBtfFCd/S9fAm/poGxzQ6RoDcU8OG26Q0ng9JLCVdOZccVz+Qv72h7q6j3fk8KvJApHCaHmR
 ZiPVthYtCAWoKjwlzmATrJLOGDC5a7PXf8R3DP+RAgRPUWDlNy6LfrR7ZONjOaUxiY2u0Hhyu2mlo
 yr8o7vSlXsBN2gk1i2RAEsmPJX0LWtkuaoYkBMZyIaiuXMo2t2IFYaYJSrrGAmWxsnqyISSRYBI3e
 qJ4CsL6q9Q1UMl5Xd9pG7XHEw7HILxFLkULuXmSdyhmqiHBISS+pgcelWW2T2mHXc2Fd46PIVVEDX
 4g/pRMQQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0sk-00Gxfl-EZ; Fri, 21 May 2021 08:51:47 +0000
X-UUID: 5e4f2d97dbc04983ad5b8874a8d32095-20210521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=dKatBfeVTfSyxthCKGydA7RpsPmWu1+vZkk+mQgx8MU=; 
 b=XyAg6LRS0obQd9OLhesLp0OdfIdC26yn8QnS1yfP09IotQkDBvXmd6dmjQnXg88TxwRsY2PCa/akD2dCdZQMV7vijQNU2W/WvNiEcmeZyVEdVl0Z5/f9kouSs8jGNfgYU+ADVRVqT9S+oLAFeOORlHhnDqhfY8v1S2oDtjkvJvo=;
X-UUID: 5e4f2d97dbc04983ad5b8874a8d32095-20210521
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 404650189; Fri, 21 May 2021 00:01:49 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 00:01:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:01:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:42 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,0/6] Support H264 4K on MT8192
Date: Fri, 21 May 2021 15:01:33 +0800
Message-ID: <20210521070139.20644-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_015146_511072_8A70F5DF 
X-CRM114-Status: GOOD (  10.12  )
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

Add MT8192 H264 venc driver and support H264 4K encoding on MT8192.

Change notes:
v4: rebase on Linux 5.13-rc1

Alexandre Courbot (1):
  media: mtk-vcodec: venc: remove redundant code

Irui Wang (5):
  dt-bindings: media: mtk-vcodec: Add dma-ranges property
  media: mtk-vcodec: Support 4GB~8GB range iova space for venc
  dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
  media: mtk-vcodec: Add MT8192 H264 venc driver
  media: mtk-vcodec: Support MT8192 H264 4K encoding

 .../bindings/media/mediatek-vcodec.txt        |  3 +
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 +
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 89 +++++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 17 ++++
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  4 +
 5 files changed, 78 insertions(+), 36 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
