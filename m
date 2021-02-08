Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C4C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 01:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5632464E24
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 01:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5632464E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSDIfr1aKw3IyGdlSt8GobPLYhtNTJy0cjps1c8XKKI=; b=nn9YuBT9hgDwX6juJLRE0loVbG
	Qn5z7zGv7ai0LM6EbDkiQvEt8lmtJPGMVZvpdKL7dQw1F5XO/qi/ke1DaS4tUimw1+PAM9bZVilIh
	oei/0VYmeLmJ00jhyaLT5KIzlmxFIM3MRZxlwTUOgaJMlJINrgpz8vzUtlLU7CZygi/TZoXAswbHe
	BGnlnQA3ymNtcVSdQp7CNPJysUJ3UmrgBp85fJepAP4IefokxGhZiZPkO/6lfqYIn0c4Jl47mF/41
	sHCjAuJ6EwgV5qy+H50Xj3oOkVxlen3GSMZjzn/j7DR1BpJcnFZQo2P497AIr2y2qU/AO3bfVXKjk
	kgxLJ9zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8vKc-0005Kh-5C; Mon, 08 Feb 2021 01:27:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8vKW-0005JJ-Lb; Mon, 08 Feb 2021 01:27:10 +0000
X-UUID: 570e4cd8d6dc4ac793d56e39656f199e-20210207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=sl//92WDlRI2iEMumUvSdGMbgPdcEp2dTyyazCq87oA=; 
 b=MmAcPged8+tE2u5qb47KIkPBmuauPKQd/N6Cv4ZrKdsJVlARb/Bi/tHwdXpNo1c+CaYgcnONmxMhJm9Ogf4j/5nBukuhxpGhCVrTZTzoQEgoWcrfcdWFbizCBk2JKU2sjZQqnD6JELdn6EvYdjG7VBGCiUKfm0TDENdc0TM1qVs=;
X-UUID: 570e4cd8d6dc4ac793d56e39656f199e-20210207
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1665172673; Sun, 07 Feb 2021 17:27:00 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 17:26:59 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Feb 2021 09:26:56 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 8 Feb 2021 09:26:55 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/3] Add check for max clock rate in mode_valid
Date: Mon, 8 Feb 2021 09:26:50 +0800
Message-ID: <20210208012653.196060-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 389C30CDCE24BD49C6B921257EB9C1BAB2683597C6C1DC3A254BBE6F08A763CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_202709_490062_0CED2883 
X-CRM114-Status: UNSURE (   7.44  )
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
 srv_heupstream@mediatek.com, shuijing.li@mediatek.com, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v1:
 - fix build err.

Jitao Shi (3):
  drm/mediatek: mtk_dpi: Add check for max clock rate in mode_valid
  drm/mediatek: mtk_dpi: Add dpi config for mt8192
  dt-bindings: mediatek,dpi: add mt8192 to mediatek,dpi

 .../display/mediatek/mediatek,dpi.yaml        |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
