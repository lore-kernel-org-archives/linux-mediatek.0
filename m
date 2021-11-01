Return-Path: <SRS0=DXFh=PU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9534E60F24
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Nov 2021 12:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9534E60F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5SDzIwChHO3ejAdC1lOv/UB8f9NSxXIlV2hUx3wQHs=; b=OHcXxcXvcEm/nQ
	4ZCP+cEUyLHZ2aBbmmxOYy8D45yMeqly4VtXDb7RcSbKNutJeQWINn9JtcHhgIUeAtQoPfqGPXYZb
	BoFOu5k0whMTzXZ/ORYV/IcCb9OTx9bFil/BPWtuIHR62LWivk8sXtQ1Dxctd48qy7nQ8/CGMxRtT
	7u+D5jfElv8iT7EqioilmHwKDjgl2up7KYnw5Z9F1FZAKRL8AED3Sm25v8867bWVQ2Sw1PCMR37zb
	F/nGcegJpYYDq5FZmWXwgoLi5ibUh1acNJgsLnMWke6FbeiZTV7vXCw8FZESrrYI6HZ2CHjm9zc/w
	VCgA67nnHJnTMSSRKZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhW7B-00GJ8Y-Ov; Mon, 01 Nov 2021 12:08:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhW6d-00GIvh-My; Mon, 01 Nov 2021 12:08:04 +0000
X-UUID: b0c3da65ccc24b4d8efc73e414651d8b-20211101
X-UUID: b0c3da65ccc24b4d8efc73e414651d8b-20211101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 242825058; Mon, 01 Nov 2021 05:08:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Nov 2021 05:07:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 1 Nov 2021 20:07:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Nov 2021 20:07:55 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <xia.jiang@mediatek.com>,
 <maoguang.meng@mediatek.com>, <srv_heupstream@mediatek.com>,
 <kyrie.wu@mediatek.com>, <irui.wang@mediatek.com>
Subject: [PATCH V5, 1/5] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Date: Mon, 1 Nov 2021 20:07:46 +0800
Message-ID: <1635768470-24178-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
References: <1635768470-24178-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_050803_766755_3C385C05 
X-CRM114-Status: UNSURE (   9.39  )
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

Add mediatek, mt8195-jpgenc compatible to binding document

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
V5: no change
---
 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index fcd9b82..e93ccf5 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -18,6 +18,9 @@ properties:
       - enum:
           - mediatek,mt2701-jpgenc
           - mediatek,mt8183-jpgenc
+          - mediatek,mt8195-jpgenc
+          - mediatek,mt8195-jpgenc0
+          - mediatek,mt8195-jpgenc1
       - const: mediatek,mtk-jpgenc
   reg:
     maxItems: 1
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
