Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09ADC35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 06:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9FC21744
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 06:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCpQdnqe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ck/AapoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F9FC21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G4Ydc0KKIMpb9dvg7fdwylTPctjNwOE1y1eloxBidZI=; b=NCpQdnqeO8LSiF
	qBf3GwjYEnwgvofFexZ3yxJxlfGKjNlHCwF2gTjqoZOWG7/PJmJrDuDeUp1P9E4fTQktU8FuhcPOk
	AaEa9EQJ8nn17xVGfMaYhCVPtW1E0ReYhFwu1JyJ6v8JVJHVYk1ZAeHOPl7hhB9xMj2lhyUOdzpqF
	+/01dMlA33+vpyf7VZ97d0gieA02ti5Nt+kpRNBcs41j4Eyg1HNADQkcfnwrqCEaqCzW6KIREdEzL
	F4WXB4gT7wjmiRhYFcdSIDNanrCDXvi47RglL3B1pWqE+nNM2KQW0COwcYGZsZ5gW2w3iovX+rBls
	aBuII4goN3YN3dzIAXAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6U9A-0002M2-5o; Tue, 25 Feb 2020 06:56:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6U97-0002LC-M0; Tue, 25 Feb 2020 06:56:47 +0000
X-UUID: dcea3b937e8047ddadba7c921f6be0da-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=pmuf7vvzpu765ixMqbePyvDNsg3g6qbRoBiCP+4dj5U=; 
 b=Ck/AapoJGvrRJ1GzlazX/beX0BYj5Zd5f2SeF7I6TkfGPjrR5xamq+06BK5EMM6c4eDAOfCw9Jzn7tudpXD/3e+vE2zboMc4o/Iva3TUAH/OkF0kVPIkYaF9cSoE8f6VRQwh3mZe1naQrp3hNg8eRZDBij4UXDb3Tp8OnOS+3c4=;
X-UUID: dcea3b937e8047ddadba7c921f6be0da-20200224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1711923885; Mon, 24 Feb 2020 22:56:42 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 22:47:25 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 14:47:20 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 14:45:25 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 0/4] add mt8183 dpi driver
Date: Tue, 25 Feb 2020 14:46:34 +0800
Message-ID: <20200225064638.112282-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A756B05E682182D02D9E9B215338CD2D8D14BDB3747DC244107AB7A279AE734D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_225645_726064_955A539E 
X-CRM114-Status: UNSURE (   7.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v6:
 - change dual_edge to pclk-sample
 - remove dpi_pin_mode_swap and

Changes since v5:
 - fine tune the dt-bindings commit message.

Changes since v4:
 - move pin mode control and dual edge control to deveice tree.
 - update dt-bindings document for pin mode swap and dual edge control.

Changes since v3:
 - add dpi pin mode control when dpi on or off.
 - update dpi dual edge comment.

Changes since v2:
 - update dt-bindings document for mt8183 dpi.
 - separate dual edge modfication as independent patch.

Jitao Shi (4):
  dt-bindings: display: mediatek: update dpi supported chips
  drm/mediatek: dpi sample mode support
  drm/mediatek: add mt8183 dpi clock factor
  drm/mediatek: set dpi pin mode to gpio low to avoid leakage current

 .../display/mediatek/mediatek,dpi.txt         | 10 +++
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 65 ++++++++++++++++++-
 2 files changed, 73 insertions(+), 2 deletions(-)

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
