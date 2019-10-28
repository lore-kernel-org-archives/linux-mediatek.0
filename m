Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74519CA9EC1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 11:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF70208C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 11:51:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aX/oBGnq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EF70208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLNUC1lmtqQs7e8c7XK34YsQOCwmE0EUjDjNTiPLXAI=; b=aX/oBGnqA6H7jf
	I+gJidEqcr6PATXDKLLktNZg9MDE60ARWokEX58ZUuMfxYI39uV1cgym3yi6/Eg4rti2BtdUIhzvm
	qg9LHnxcSB7HlvmQr/reAFF6bPF0N/KJoBc/wFYfKoXCHZkGDgfbLnLlthAE3UZktb+Sz6Iy5k8F8
	3DLNGE29P6SP4gjI0mgWCRVASynXDYuRpqblegffPvEs4O3AF64ySrN8d0Y2vQIXyQdYUtEiZ8O9Z
	mWIQodMNCXPl7vrim3BislIZUBhCv6NHge85S6aHj61GlZ1xFM1dzrJUT5wHzE2y3QGebEI4a0FAW
	zAhVSQ83eGb6Hq67SZag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP3Yc-0006Gn-3R; Mon, 28 Oct 2019 11:51:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP3Xz-0005iu-4l; Mon, 28 Oct 2019 11:50:56 +0000
X-UUID: b6e9cd83b64c4f3fa3f9f21598405934-20191028
X-UUID: b6e9cd83b64c4f3fa3f9f21598405934-20191028
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1000748249; Mon, 28 Oct 2019 03:50:42 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 04:50:44 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 28 Oct 2019 19:50:42 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Mon, 28 Oct 2019 19:50:39 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] add dsi pwm0 node for mt8183
Date: Mon, 28 Oct 2019 19:50:36 +0800
Message-ID: <20191028115039.96555-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 435FE06E00B94DC7D8F5816F936DD3FB2E393C851001A44BB8B8C43541987B822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_045055_184416_69B28D96 
X-CRM114-Status: UNSURE (   6.49  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v2:
 - add calibration property in mipitx and efuse.

Changes since v1:
 - remove "mediatek,mt8173-dsi" from dsi node.

This patch is based on v5.4-rc5 and these patches:
https://patchwork.kernel.org/patch/10938825/

Jitao Shi (3):
  arm64: dts: mt8183: add dsi node
  arm64: dts: mt8183: add pwm0 node
  arm64: dts: mt8183: add calibration property in mipitx and efuse

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

-- 
2.21.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
