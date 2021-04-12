Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A56C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3BD56128A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 11:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3BD56128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DAw6r9QgbFkNJGFbMt/kgvWO6tCw/ArbeOZtl8urG0c=; b=Aurkxd9LGWy7qfIxTbzU13Owj
	gV507Q2LjQkKXW9uDhE9rO0K/mj0MzjIEP9a979GSswiLTJBtvuhhE1Shb4qp+GOOtpDu4gcYxfpY
	fVTk6Akq8G5eUifz5P1sbO36+wcDjK1RzQlvRlUqCMLdioVFa2l4tEgaPLlMaXag6QmldUK4cmWW5
	SGNAVcSaSFy/g2td4gRkr3hPR5y4S8EkKCLO4NgdFiLg6aQBr6D+9IMQkpOJXUCwN0qoAnHleViXC
	HScKsA9/bSDIQ+9zFT54PUl8aRSnDLAV4jQENW03LfofpfD/MAwT8/67UC504JsqNWd8vQqumpk87
	CLSZkDE+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVuc9-006WWP-6W; Mon, 12 Apr 2021 11:20:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuax-006WBd-UL; Mon, 12 Apr 2021 11:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=fjoKlRl/uU26FxJsUfX2rYAg4WgE9C/pPwRFE9wSkt0=; b=t2DJ8sYgqBEUJeKLDFzATFWi0b
 kdKScdXboadtT0hqhHGOhjAyUdoPPGPZskxnPHMfDzJlZuI8igG+x/XMEriDoQ7kGc7oqL92y9ygZ
 wwzm3dv4oD9TS0RNPbo7jkDV2B2g1l3EH2VZWMphfdr8VBun654DeUHC2SBx9tu7M3UKGvhg55sMz
 aFZuGV1qpNb4uV2OvbuQPDvj3RJb96meJ1vLi4RRGSiGGPt6iphTyRAZQErvSUbM+N+1fOoto+KFS
 jCpWtFD/ibYtN5kuybEeHpXl/X83LnYO1wTfO69PYfvldXppD/h3eSrZ75VBEQNbnqBTci0QyPHjH
 03l+BTCA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVuau-006AHx-F1; Mon, 12 Apr 2021 11:19:06 +0000
X-UUID: d8193c76930e404cbc373774a9ad83c9-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fjoKlRl/uU26FxJsUfX2rYAg4WgE9C/pPwRFE9wSkt0=; 
 b=hOEa0GKRyjV0PfU6/62mSDUoSiY4hq9Ml1dRy8bPaPkllDdIJAEWBqOhsPWmAp13ZlJ+d4ARcGV6rqFibAACm75/+gD4ryP4RwH51XfbbjCE2r/tK6Akpdx7NXWw4LDtcP+JxfOu6nz0aHrdipIUy3UPdsxL41sY3PBHP70Pc7w=;
X-UUID: d8193c76930e404cbc373774a9ad83c9-20210412
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 211053998; Mon, 12 Apr 2021 04:19:04 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 04:19:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 19:18:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 19:18:57 +0800
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
Subject: [PATCH v2,
 4/5] Revert "arm64: dts: mediatek: mt8183: fix gce incorrect
 mbox-cells value"
Date: Mon, 12 Apr 2021 19:18:44 +0800
Message-ID: <1618226325-31927-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CD9D7DFFDA5C3E00D8282061D9EE84930D41B1E7D05F90A954F39901EF15F43D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_041904_538084_1AE966E7 
X-CRM114-Status: GOOD (  11.19  )
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

This reverts commit e55c56df43dd11de4a6c08e3ea52ca45b51c8800.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a1..bc89283 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -541,7 +541,7 @@
 			compatible = "mediatek,mt8183-gce";
 			reg = <0 0x10238000 0 0x4000>;
 			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
-			#mbox-cells = <2>;
+			#mbox-cells = <3>;
 			clocks = <&infracfg CLK_INFRA_GCE>;
 			clock-names = "gce";
 		};
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
