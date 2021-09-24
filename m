Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4502C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5CDD60E08
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5CDD60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmY8lQjuVlETiDIVLVt79Y1rIAnoDTFVziSH7hZQoBU=; b=jL8D7Z7rNza9EA
	vZZFNd6JawlAqjfO1FcRxCjoVVBEFxHcu3AgCcJcuZMLHkw1We02p4HrN0KaLxfUfBHq3vGLQL+fA
	7+fonvehweifn44ucB69NH72gPrwz0G+87LxfzqgjKPJ/SBGSbBMX6tHctNGN9SgS5GEssXaz0Xbm
	8UDhy4E/ZJUkF+BSCu3Tq9U8pd1CRu2rB6wGSMinc+w8i9tgYIXAyw3pM+VPU5LY0XJbOynEOZQuX
	HNVuUhoRWzK1QTQVkAl/XlQgqGxFQ4UVvkdGl/mp8LuGfSejAoERzfY3XX0Y1IAuo6LA/t+nJgBXn
	nYGXR3peZ/frS9or2VTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTfua-00DN3A-2X; Fri, 24 Sep 2021 07:46:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTfu5-00DMrm-1R; Fri, 24 Sep 2021 07:45:54 +0000
X-UUID: 656eeae4e8e843039b8fa4c9682bfbee-20210924
X-UUID: 656eeae4e8e843039b8fa4c9682bfbee-20210924
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 223368838; Fri, 24 Sep 2021 00:45:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 00:45:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 15:45:45 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 15:45:44 +0800
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
Subject: [PATCH V4, 1/5] dt-bindings: mediatek: Add mediatek,
 mt8195-jpgenc compatible
Date: Fri, 24 Sep 2021 15:45:39 +0800
Message-ID: <1632469543-27345-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
References: <1632469543-27345-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_004553_098878_5C2FF97C 
X-CRM114-Status: GOOD (  10.41  )
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
