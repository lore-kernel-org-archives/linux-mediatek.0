Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D5AC433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:06:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C83D20708
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 06:06:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QWA9tH6C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QvIr2DJt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C83D20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=si9MytukCSuW1SQ2Z3ppVKmrk9JR5swtclXeq56Ux5A=; b=QWA9tH6CM6QCOrD/WOtfYnA67
	dLUK+wniXD8IZwtyI2AakjoVc298G/KWyYPZDVjHlx6ZJB0MSwh4Vgcuv0lo5UDMfzzAe0ryXfTDf
	idAQnO0kM+Wt1/NySJAWd3nDbAGotb7b4cbcMiZrb3H9AfIfBIiKSXIrH7cUrYvSMs98NTUbJxD8V
	8/pIRXqYi+sY20lNcQhr4wKV0p3hWVcYi72xpeWETIy7WGm332qLwdkA5OD6UqgNOCHxM3drcyaaY
	uafyEu1o4x4VkTdQ03liYnPN2SbJj1EHpPKpJi9JB7YJLorD7vSeKzkRYlAF1/nrG++MnIUhNSKi+
	i0/qCNagg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6SrW-0000cT-E2; Fri, 14 Aug 2020 06:06:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6SrN-0000a1-R5; Fri, 14 Aug 2020 06:06:39 +0000
X-UUID: f389ce4930034f83adddb847c71d9289-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0XoGyuqMVNHrbbEMVkbN3uy8qbQMTXKiMupXqryMcII=; 
 b=QvIr2DJtbIV4LHGLRvuvE8q4PSxYvv0B2GDnTBHhhaGybcu8XgDFzR7P9LNEIKN26F9wLjuhefIDkeJ0iP0ul3hVV6WMPHlkk9ja+cZoj3TauJDFe20xF0b8BHIkPYpv2By7sjOcH7BdlT03XRhWdDZDMSkEV/LnGI7unD0IczU=;
X-UUID: f389ce4930034f83adddb847c71d9289-20200813
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1615231259; Thu, 13 Aug 2020 22:05:28 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 23:05:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 14:05:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Aug 2020 14:05:24 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v4 2/3] dt-bindings: serial: Add compatible for Mediatek MT8192
Date: Fri, 14 Aug 2020 14:04:53 +0800
Message-ID: <20200814060454.32200-3-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200814060454.32200-1-seiya.wang@mediatek.com>
References: <20200814060454.32200-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_020638_235227_FDB49EE5 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This commit adds dt-binding documentation of uart for Mediatek MT8192 SoC
Platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 Documentation/devicetree/bindings/serial/mtk-uart.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mtk-uart.txt b/Documentation/devicetree/bindings/serial/mtk-uart.txt
index 3a3b57079f0d..647b5aee86f3 100644
--- a/Documentation/devicetree/bindings/serial/mtk-uart.txt
+++ b/Documentation/devicetree/bindings/serial/mtk-uart.txt
@@ -19,6 +19,7 @@ Required properties:
   * "mediatek,mt8135-uart" for MT8135 compatible UARTS
   * "mediatek,mt8173-uart" for MT8173 compatible UARTS
   * "mediatek,mt8183-uart", "mediatek,mt6577-uart" for MT8183 compatible UARTS
+  * "mediatek,mt8192-uart", "mediatek,mt6577-uart" for MT8192 compatible UARTS
   * "mediatek,mt8516-uart" for MT8516 compatible UARTS
   * "mediatek,mt6577-uart" for MT6577 and all of the above
 
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
