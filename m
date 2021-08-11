Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9274EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:38:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2189160F11
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2189160F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gImOh6RsRGVoeRlPeZSgvmYVd0hnX2pLVkCzpx3/AQQ=; b=I6UjA0hq0bG5DU
	c14kqq5W3cFfib7V6YsTNMjTUjA6eDVmUykIaqLBhuJrJ+B1SxI3PaUDzv/5EL9ozpuFEOARlTyhc
	uGm+WeRNUPGyr0BaPDmvRX0FSo5vSOx7nPDGgZT5XRa7msQjQsYuQnsmvsbQUIJjvsOs0lG9fa4Rb
	5udn6tUu+L3z+f4gCepf61TC5ZHKGswp6C7gYiKNMdqRWtiT0otH46c1nt0tbONzkGTfLrKZpwQkT
	sEZ+xmsBHwrwg4YsD5nyrGhKJnl05cj6zSI4/KvbrPwIukOhnaSToIEh1HDaiKbDzKIuXHQ9oJeUY
	AdSVR0lNv+Tajoo8I45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDf4Q-005U9L-GZ; Wed, 11 Aug 2021 03:38:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDf4L-005U7G-2C; Wed, 11 Aug 2021 03:38:20 +0000
X-UUID: 328da7f3ddc047418cb8042b066cf80a-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D2OjpobmcN3FImKEiFqWUbxOzDxkLAi0VDtqVeEdekQ=; 
 b=A0RRtDd3YYXH+5oJT42wylmbBdeEv7ghYVJln/Qnj80mm3OWv6HYJP3CzkN3KxqiFagsrB15fo0+bTQ795k82opa5jLACoXSr1PCymtHbQNDKo3qtehI2pyDUKcEo8cRgEaJLfRMHw3Lh1gnak37iYify16X/u352WIteCdWa0k=;
X-UUID: 328da7f3ddc047418cb8042b066cf80a-20210810
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yt.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1669815833; Tue, 10 Aug 2021 20:38:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 20:38:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 11:38:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 11 Aug 2021 11:38:08 +0800
From: YT Lee <yt.lee@mediatek.com>
To: <yt.lee@mediatek.com>, <roger.lu@mediatek.com>, <matthias.bgg@gmail.com>, 
 <eballetbo@gmail.com>, <khilman@kernel.org>, <robh+dt@kernel.org>,
 <drinkcat@google.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>
CC: <srv_heupstream@mediatek.com>, <fan.chen@mediatek.com>,
 <xiaoqing.liu@mediatek.com>, <charles.yang@mediatek.com>,
 <angus.lin@mediatek.com>, <mark.rutland@arm.com>, <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <linux@roeck-us.net>,
 <louis.yu@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
Date: Wed, 11 Aug 2021 11:37:48 +0800
Message-ID: <20210811033749.30490-2-yt.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210811033749.30490-1-yt.lee@mediatek.com>
References: <20210811033749.30490-1-yt.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_203817_151743_CC2511D7 
X-CRM114-Status: UNSURE (   8.93  )
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

Add new binding documentation of the mt8195 svs.

Signed-off-by: YT Lee <yt.lee@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
index 59342e627b67..fdd656448454 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -23,6 +23,7 @@ properties:
     enum:
       - mediatek,mt8183-svs
       - mediatek,mt8192-svs
+      - mediatek,mt8195-svs
 
   reg:
     maxItems: 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
