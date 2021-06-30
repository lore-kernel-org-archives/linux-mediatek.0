Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3548C11F69
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E8561CE4
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85E8561CE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AXBs3gzuxXpFZyzyPK5hHMhvI9gCGaSAf+9pyv5Ggl0=; b=ZwlTK463/jRpyH
	+4HdGQz2OTee2P827k/ZwWtFYdHIBXb9T9e7EpSnsY7nZ3JKRQ/qF/y4SnizZ0pvAu/fSUmxv6+BO
	qPKBrBl6DS1HuJ331+r8qZSWC9956ehtkFULC5DtHZa87Zu0YyeMHd8/wU2PUJigamP6Bqra3poG/
	vo+vpfBBDkxqGf4vBQYbJg28dOOXUU4EIbtA9LN5b4SapMiSwX6PJ0cFbxalregWMYOLsXChz8+A/
	4kyC0YL0Tegs8WvoiaQZXGyfpJeNhB2LmV1yGEZU7UdxIwDhpXAqlInY4WxPXlOewNFhb3oWJ578x
	hASUsOMDTv8U6HRBlsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUds-00D2hA-1N; Wed, 30 Jun 2021 07:28:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUdn-00D2fG-G8; Wed, 30 Jun 2021 07:28:15 +0000
X-UUID: bd4be77e79d246be8ee4fbe1c001e6b0-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7fRm+LyVQBByCpt1txqcrUyMZ/qWsapVibChrQ8qBRo=; 
 b=bQDcAgqPXuYr/Ra8eOJXRoNP3exain6MFgLawGsjIRxRmpZHwwsdqOz8MOays5pbfvQeCJlFEpgl8quVtgTkMMHzJ710GNqbMQLpkMqfEc0cwVUHaxr3oLPMTnwBVgb8NO7/2Dh9lo2JwWsTAmT5xb9YY/lZdt3c60YtDi2L15I=;
X-UUID: bd4be77e79d246be8ee4fbe1c001e6b0-20210630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 410580048; Wed, 30 Jun 2021 00:28:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 00:28:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 15:28:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Jun 2021 15:28:02 +0800
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
Subject: [PATCH v2,0/9] Support jpeg encode for MT8195
Date: Wed, 30 Jun 2021 15:27:50 +0800
Message-ID: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_002813_779989_08F83628 
X-CRM114-Status: UNSURE (   8.39  )
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

add component framework to using multi-HW for MT8195 jpeg encode.

kyrie.wu (9):
  dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
  media: mtk-jpegenc: Add MT8195 JPEG venc driver
  media: mtk-jpegenc: remove redundant code of irq
  media: mtk-jpegenc: Refactor jpeg clock interface
  media: mtk-jpegenc: Generalize jpeg encode irq interfaces
  media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
  media: mtk-jpegenc: Use component framework to manage each hardware
    information
  media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
  media: mtk-jpegenc: Refactor jpegenc device run interface

 .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 600 +++++++++++++++++----
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  69 ++-
 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 208 +++++++
 4 files changed, 786 insertions(+), 94 deletions(-)

---
This patch dependents on "dt-bindings: mediatek: convert mtk jpeg decoder/encoder to yaml"[1]

Please also accept this patch together with [1].

[1]https://lore.kernel.org/patchwork/patch/1445298/
---

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
