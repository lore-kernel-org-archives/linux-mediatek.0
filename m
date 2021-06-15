Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5306FC48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A3761601
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A3761601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcXz60SenqmgmOWxVJzXfxMkPwOfRev6iJwV5eWwJ6o=; b=1dZ7yZ46RESrjY
	TmOahnFBcJhVWI+oJ6I87Odiy5XHkE6Mmw43wVwx+vJHrAvWx/yHGOyoy3GSPaKA4Kt2/Vc+L5Gqk
	gI4HZv5SX1/6SiLqMiVo8uzGt00JPDuPW1VinAzfmvHiMwh+0ZF824gKE4cqA7C9RbtAH+LltSJPy
	Fi8BL3bfSnHGR30Bo6il0hyT5zbPBTWg254KsOD9wZlx40XpxaVtzPBm79of6b5hZh9rqCHH+jGYs
	c7kbUeFhQKL3pohivCpQsqUXE2QLq0dYTjRCvdMCb0s4KPm2ZqeBdEYijnDMv2q2MzRdRmPpi2rMC
	HxkFxGsM+lhWRzKLgeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltAtC-000vbL-Dl; Tue, 15 Jun 2021 15:22:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Oy-000E8e-GN; Tue, 15 Jun 2021 13:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=UFHFQzXaFvXp32V6c/APqIj8TTCBgpIT3Iqxq2wSmSY=; b=X7Hr1OHhK2TAOhdIlKLMNSFCtK
 p+PS3GCGxnxkgjnJr2miX+Fr3S/1VYWZypm/CZlzcdTY60U+ulO3rI8jssGCTUYRTe1OOxYnY7XDK
 f9PO6yvNBq2OIydpYgKRIjJ6R5cBPefRTqA7Ws1/AWquLcVvEvZUY/ZWhxTTogr3eojm+D8j2srsg
 sICJ1ksUfzQ2Ue7VyslHbkxwxVeG6xxxqpuf1urXegIRxmsAp/0n+2zDiHRfTUNsIC3tsAmNjIprr
 Gyk59Qq0E2hfzXP53322rvsuKtk2C8UHct8kQBnNJpJsD89iX5Rht2KahvZrKs9uN5VCrS6XNGrSC
 B/7AQ7pw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lszJr-007HXM-K9; Tue, 15 Jun 2021 03:01:02 +0000
X-UUID: 03038a47e7054d8f80bc1db6bfd1b8d0-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UFHFQzXaFvXp32V6c/APqIj8TTCBgpIT3Iqxq2wSmSY=; 
 b=OIOnqcvj36orpxy5hNn9H0A33DKgW5Og88sOf5MEu6clwHIewLJYsXxAHD39qvl0XUDz1s7vNSLg0JJ0OMESR8502kDKwEm5ElwpCy/xJOWW1EC9y77ySOQYMcr/QhRh1pCXY2dPvJIWwjvnEIsjWJmMZpl7W37UD0l7jrPnO9Y=;
X-UUID: 03038a47e7054d8f80bc1db6bfd1b8d0-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 19557378; Mon, 14 Jun 2021 20:00:44 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 20:00:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 11:00:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 11:00:39 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Wenbin Mei
 <wenbin.mei@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Subject: [PATCH v1] dt-bindings: mmc: change compatiable string for MT8195 mmc
 host IP
Date: Tue, 15 Jun 2021 11:00:33 +0800
Message-ID: <1623726033-16073-2-git-send-email-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1623726033-16073-1-git-send-email-wenbin.mei@mediatek.com>
References: <1623726033-16073-1-git-send-email-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_040059_038033_A4352722 
X-CRM114-Status: GOOD (  11.61  )
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

MT8195 mmc host IP is compatible with MT8183, and currently it shows:
properties:
  compatible:
    oneOf:
...
      - items:
         - const: mediatek,mt8192-mmc
         - const: mediatek,mt8195-mmc
         - const: mediatek,mt8183-mmc
which means the compatible string in the device tree would be:
	compatible = "mediatek,mt8192-mmc", "mediatek,mt8195-mmc",
		     "mediatek,mt8183-mmc";
The bindings is wrong and that isn't the result we want.
instead we want:
properties:
  compatible:
    oneOf:
...
      - items:
         - const: mediatek,mt8192-mmc
         - const: mediatek,mt8183-mmc
      - items:
         - const: mediatek,mt8195-mmc
         - const: mediatek,mt8183-mmc
which would give us:
	compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
and
	compatible = "mediatek,mt8195-mmc", "mediatek,mt8183-mmc";

Fixes: eb9cb7227e5c (dt-bindings: mmc: Add compatible for Mediatek MT8195)
Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 8648d48..adaba90 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -31,6 +31,8 @@ properties:
           - const: mediatek,mt2701-mmc
       - items:
           - const: mediatek,mt8192-mmc
+          - const: mediatek,mt8183-mmc
+      - items:
           - const: mediatek,mt8195-mmc
           - const: mediatek,mt8183-mmc
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
