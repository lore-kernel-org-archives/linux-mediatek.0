Return-Path: <SRS0=nyHv=HT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6DBC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Feb 2021 21:00:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FA764E45
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Feb 2021 21:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FA764E45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PcCAlQpnUQAVZ2vGR29JN9TFyOBtdSWNrKyV+0fPmJg=; b=Z6fXNNNKFz+GH+PFMbtcRoslgg
	vyvQNKc+wU881mINTAVKhtkl5wVYmAmDtlnTb5aRR4YyYmiE1LMuMyQlubg0/7afjKQBfzLEeABjx
	F6k8w7yD8Eb+UsUpOx3GUCCocV2G9jQF1K4sOFzOgFuMSoR9gmoMgd45nppMAbHBWPgYi2ydHV4/2
	rtcNRWrjt4D5fMHKH1Vd/IBn788S0iS3SNZspDYSx9PhYWQ5AuuUg3CEPXSb6YMhoUZzIw4mrzrtq
	W02QZrHl2zTiCFlvMcfvaUgxElmVhkaZcyPu6CY0LgrYQr3+b6MXqBRxBsGS539AZCzaHNQaIH/nw
	0Fl7Xegw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCTvb-0004Pu-Pq; Wed, 17 Feb 2021 21:00:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCTvZ-0004OD-7Y
 for linux-mediatek@lists.infradead.org; Wed, 17 Feb 2021 21:00:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id v62so5105572wmg.4
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Feb 2021 13:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvaxP01fXW2011ehS9LhieDsJ7uIvVK/63xeZZP7Nq4=;
 b=dayfpS1ux0p+igYf4Zk1yTMOllrNLO8ZCTwTQ58p/4DKftJpBGledA0yS/1t+4PInP
 D4B3TD5BsTNUqumlY0NanLZJqnFNTksfM4SEE5IfyoqDhVTDool0AqneCHVEwB3vZ7gd
 bUlR478TF6GowcHnF5D9Lh0zdAe8KDs6sky7MOc5M9Nk83qvAAd1nh3573fSxJ5WKc7A
 7vobl7dTQiP092+d2fL1CHO469jDmoHfwaPPkOedIF80yTF76dOYtyX2JJofDEK7dusS
 9zq5D4yqV9Mt3HqpxqmGun3+3FJBfvrbisumg6j3lUOqdaVfD5/PUxZHQwElVM+xmmMf
 DoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HvaxP01fXW2011ehS9LhieDsJ7uIvVK/63xeZZP7Nq4=;
 b=jzMppwfPiEZurdCy9Jr/XkXkUQwTidKIbWHwMkRx0oy8qGszMPPsdS2rzyRBWO7bcb
 W8Pjl6vpPYmSdGil56OTtrpuT6ekjNBxLDvNlixKb00Z7RVgI0DMvq0/ickaKmsnFrWi
 bs6yznWoaisKABDXDiqTyq6Om63yMSq+eBLyELq+UpbdlGj54Jg4ecMDauFkaN+r7m8h
 k8aRjOpNb59a3CQHRgzDdadHOxM7gVqGIzPTdbGcQrddu96qNWLztJqToSpPaLOcYUTM
 To5Ulv3qXgV3ybj4M49JalzZCfqb5S3CYQHgYHQk/ZQvkRBWhuImxjZjkJeqq3311ODe
 g9Ow==
X-Gm-Message-State: AOAM530uVbkw6enrpmGo9GdBrLs1HYkP13Wt9Fi+/77BvTXHu4eYq8ev
 bb38StpnrKXIeYFV9cx18k6muw==
X-Google-Smtp-Source: ABdhPJxt/AxJFjVbv2FOJHM7b+QucXIKyT6iLc6VNmIhtakJ96SDtbVYTAi/dltJPvblGoY+aUmpSA==
X-Received: by 2002:a1c:7301:: with SMTP id d1mr597667wmb.33.1613595602384;
 Wed, 17 Feb 2021 13:00:02 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id m2sm4140264wml.34.2021.02.17.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 13:00:01 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add mt8183-pumpkin
 board
Date: Wed, 17 Feb 2021 21:59:43 +0100
Message-Id: <20210217205945.830006-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_160005_468135_2517F086 
X-CRM114-Status: GOOD (  10.19  )
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
Cc: devicetree@vger.kernel.org, mkorpershoek@baylibre.com,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8183 Pumpkin board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 53f0d4e3ea98..8f5a625cfb3d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -123,6 +123,10 @@ properties:
           - const: google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8183-pumpkin
+          - const: mediatek,mt8183
 
 additionalProperties: true
 
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
