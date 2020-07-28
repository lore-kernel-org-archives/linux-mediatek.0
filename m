Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D42CC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 13:52:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E32C206D4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 13:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Panwki2m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UJgCERl7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E32C206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DQx+CknMCXW3/Aea/084WNChC8+HHxbCi7hqoOQ8alg=; b=Panwki2mCXNLKJho8A8z5P+yg
	THiwKs5J5yCL2iN2JRZME0+NFpu1f8ZDIeE3KsswmAvxNQ9NixHAv7rl2CvWbjznFZ+yURW6fwYSU
	biO7b+mbyqSvdcmsOd+vetdPioM32whsRWtVQaqW04WvGAmGpEJCB90x7Y2HH3VITowhh2RIWZH3n
	qlI886nGKwU/vF7M0FcXDj0ySi9na8X8nG7VFvlgcNedLz2LnMU8QNYDstegBnE2RSioj2wo+u0CX
	/sRCxiEzHovSz/F8yh54ptwGWrUmRXYaEW3YlFveE3+O2F9e02mekgcrfpHdh4Vsqr3yV33PvyIFW
	ngQOUBOtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Q2B-0003Px-Qn; Tue, 28 Jul 2020 13:52:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Q1y-0003J4-TS; Tue, 28 Jul 2020 13:52:36 +0000
X-UUID: 4338265427eb45958d2c5d9d5662d6ed-20200728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6JOhCoUtOoNK1a+Sr6LjVOqd6OgdvIqN6AmXnjDucFc=; 
 b=UJgCERl7JwVmkse5JpuVJ9kgyYLbouQyk2tSMVeWZ+jVJH9PAsUVq4dDAcbOnEsIPm19I8gNhWEUWjl50X4YxArfXFhkzIUJkdlYhWSzfe5DofKEKRk5q7KpjACBUxWYXPe20lIgTKGerFkXLEsp5Q7LvZTJTCRTQulYpyCtoQk=;
X-UUID: 4338265427eb45958d2c5d9d5662d6ed-20200728
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 84783314; Tue, 28 Jul 2020 05:52:25 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 06:42:26 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jul 2020 21:42:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 28 Jul 2020 21:42:25 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 2/3] dt-bindings: serial: Add compatible for Mediatek MT8192
Date: Tue, 28 Jul 2020 21:41:48 +0800
Message-ID: <20200728134149.19758-3-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200728134149.19758-1-seiya.wang@mediatek.com>
References: <20200728134149.19758-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_095235_115495_0E06078F 
X-CRM114-Status: GOOD (  13.61  )
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

Change-Id: I2189d57755107545d7b82d47f49c510b9bc72fa5
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
