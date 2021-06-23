Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8692C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:13:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7635661164
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7635661164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TDa/7F3YDbNaALS9yk0XJ0b2b6o6nAa1KHLIMjtTMDg=; b=TbBoYPaAZON0cg
	7zIiHzsJFV66oq++3zdl5PZQIyuYKEQMwrcPEHyWo5H0/jP0zyrhjwEydKoqwz+NXajScjpQkf2z/
	qItzV9civ6Ats/VI7ncObXSqyAQnMeXuH5hDEAW2KKfMRjpj6AXytFwccD6TfTotw7eiADEbeh9VX
	sFsJ4jjhqsIioWp07DUSNA1S1zZgsnbXmWkLTkMsOGNCY0LrXIKIc9eNwFvPwjWd5p8qwOcljpsWR
	Y2ZmsUcZeL5HWo6Sew39ETnQij1HJzNwRbuc/qNgw6xO+hzDl6+WPMce4v8mISuCef88ruqvX5c+3
	lCW4FN81D+LbhzldqmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvx4b-009gjG-Gd; Wed, 23 Jun 2021 07:13:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvx4Y-009ggD-Og; Wed, 23 Jun 2021 07:13:20 +0000
X-UUID: 24a05a8c1d9c442f9d044679dece796d-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=attWr2f9v7xCWakyDFwYiWVmIyWbLjOhD3YCiknlSig=; 
 b=hY2f8GzMhcXhjMEQAzZdOjVWWFa2WGdnfetHAs4THJJSAIN92V5nPBYPohBwxVekJ+D7obuNczwzkFPXxz+HNdxROAVz30BZBxbe4cywoqAkSsgfmYJXWNszBzPbqWtFKgY5ZrBTDyERX6NBvIWJpedyQC7iewEgaKfenCbNLoU=;
X-UUID: 24a05a8c1d9c442f9d044679dece796d-20210623
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 978835670; Wed, 23 Jun 2021 00:13:12 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:13:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:13:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:13:07 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH 0/3] Support jpeg decode for MT8195
Date: Wed, 23 Jun 2021 15:13:00 +0800
Message-ID: <1624432383-2428-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_001318_828666_1EBBE2F6 
X-CRM114-Status: UNSURE (   8.63  )
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

add component framework to using multi-HW for MT8195 jpeg decode.

kyrie.wu (3):
  dt-bindings: mtk-jpeg: Add binding for MT8195 DEC JPG
  media: mtk-jpegdec: use component framework to manage jpg DEC HW
  media: mtk-jpegdec: design SW algorithm for using multi-HW of jpegdec

 .../bindings/media/mediatek-jpeg-decoder.txt       |   4 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 603 +++++++++++++--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  32 ++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  | 305 ++++++++++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |  14 +-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_reg.h |   1 +
 6 files changed, 704 insertions(+), 255 deletions(-)

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
