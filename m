Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA176C3F2D7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 05:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60802064A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 05:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lICQ3bvY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OyNBrK10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60802064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mkUtZNqQnJLVzzT1726vDX1rbltOHzVuYHvkIKaN8zk=; b=lICQ3bvY+88f7v
	C8hZK7+SEQi1Y2OLpgvsrxdV9E2gNZHzT7Y5t8Ew1xSm+7J6CP2qJuHNS+vXF4sBRGPeE4fjtAhVc
	lZkzoDw1+qWG6qaKwJY56Cu5YQXz/gBHxsLpSt3Ga7uI+qn/82b1+kh/crOsB2fFTCEelYskIDZYR
	2JLUoO+QQOwJcay4uHm7xo5L3XwGPSiSw8cP/ug4IkXWQCZ2ME1Ym70V1aTT4JltfONLmojKjJVAL
	vUMczaE5lqMyiA1x2uU91eGOB2Eox9pKBfZYy6mBQ503gsFVbc23M4rRvaeqYstQ71U6uNeFGcidt
	pzEVyBGFa37QCLzncrUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j90Fs-00013z-RU; Tue, 03 Mar 2020 05:38:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j90Fq-00012u-1u; Tue, 03 Mar 2020 05:38:07 +0000
X-UUID: 14dfea65dfc44a83a91adc1e2811b5be-20200302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=38YX+l28Zy41XgygYxcUNL1rC8VyK8Gyz4X920RtfiQ=; 
 b=OyNBrK108YKO5DbtLCJYsFg5hG7og3qC5aLmxHchL4J8/Gu1a66JQ3pO0YSeLkk2wj6sA6iz2nlEUtWio1DMAFiKKKyueDJPyEBMZnsWC8QWEsRzqZZSS7Pwa2ssqVSIA5LnmFwSRpLHe31LMJY1aG+GT3ibkrQDdhmvC8dcFBY=;
X-UUID: 14dfea65dfc44a83a91adc1e2811b5be-20200302
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1016522523; Mon, 02 Mar 2020 21:38:03 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Mar 2020 21:28:01 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 3 Mar 2020 13:23:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 3 Mar 2020 13:28:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 3/6] dt-bindings: display: mediatek: dpi sample data in
 dual edge support
Date: Tue, 3 Mar 2020 13:27:19 +0800
Message-ID: <20200303052722.94795-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200303052722.94795-1-jitao.shi@mediatek.com>
References: <20200303052722.94795-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8738D68F04DD779C3FF5C35B5432C8B06436CA13C2030E58F4827DA4FC02124B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_213806_110121_61BBFCE2 
X-CRM114-Status: UNSURE (   9.20  )
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
 srv_heupstream@mediatek.com, Rob Herring <robh@kernel.org>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add property "pclk-sample" to config the dpi sample on falling (0),
rising (1), both falling and rising (2).

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index 77ca32a32399..4eeead1d39db 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -19,7 +19,8 @@ Required properties:
 
 Optional properties:
 - pinctrl-names: Contain "gpiomode" and "dpimode".
-  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
+  pinctrl-names see Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
+- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example:
 
@@ -37,6 +38,7 @@ dpi0: dpi@1401d000 {
 
 	port {
 		dpi0_out: endpoint {
+			pclk-sample = <0>;
 			remote-endpoint = <&hdmi0_in>;
 		};
 	};
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
