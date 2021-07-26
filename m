Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AC6C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:20:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2DC60F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 11:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA2DC60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QDzZR82JsYuUmG3azeDXt0E5614N6CLtfB8kzNng4Wg=; b=LrVAimjH5RW7OX
	wabCeV4weoqfiu2aRQCNT8usbtV4X/700fgYVvSGIpqda1mIQPQhxVjWrMyChv4+1/NUoGt2wqigK
	Dh/QtnrCkd6WTv9pKYGGYCRYi4zWp4y4qsKRlMHD+b8tXl351Z+vnlUjZRPqtLcQuQKp7OVJrc5+W
	U3ojJusXIHI43B5GKmK1yCN/n+WBEQVbN01gbgZCPFhwKxeZyGbvQzSRhLKJys5pa5QzR7d0IA5Kb
	GUKDeOasS1pUmHqbqkmT/hbwpW7yV9hzusINcns2X/BsMpJZONg4+ueEEhlLWQ1E51oAjtW5yH3Sa
	cO2HOk1Yymw17lCS9kcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7yeX-00AyjP-K4; Mon, 26 Jul 2021 11:20:09 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7yeB-00AycC-Py
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 11:19:49 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e14so11188964plh.8
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 04:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcy/qtkkiK7UjSfWP1fK7FSTP1jeUYmZqbE4rjgeDZo=;
 b=nxXu/cb7lqQ0xcne5Q9FiIRI/FlMMkHZgMvc7pXPxsxGrUsf4h387Mip2jlFjfFIvW
 xNZn9vlDYcjAPdyAXdftKFBKzCrc6PZl8Bomt9x6uCBFDCKDKxwk3TzYsX3cvh/qtXNk
 IZ5HOy3NAbaGyGLoCs8C4IvMc3N0o//ne6k9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vcy/qtkkiK7UjSfWP1fK7FSTP1jeUYmZqbE4rjgeDZo=;
 b=HS1p85nBh9GijxBzD5WjfTUNMehnILXYzWCefV2WU7oeJqyXIRmBqqAHEa20qQun9N
 wX6No5VXSzGIf57euMV93oK7fb99shG5cjbBn23wjl/0gkU9FjtGBZ/UTBpbqLhZ8lkI
 SXzaIktnAD0JSAi8okiAsaGiJFWDllZ5/cmXurQ6m1sLEex3eKMt4vW3ekELvuUvqgxT
 6ckzWsIaxhPesTx4l/slQd6TDn6fuIgHOIieuCvrMuK3O70bxMpq3GEtNaMaIt7g+o36
 xuS3D/eTqZhM7A1Z0pA1lQGFeyB2qhZsOqnBBO4/5dZXswP3tehE0q8ywpMb6wdtnqIj
 wr1w==
X-Gm-Message-State: AOAM531rsbaLqnLNVqpVf4qhSPmXDfM2Hw4IcGrfRypxB2m9vMwE2h0J
 sLOEDsRNgAL67oHnf3ELZ3c7pw==
X-Google-Smtp-Source: ABdhPJx8aNBhyrJBVcN6CEdp0jeeHRROLel4R3XbbG0babm5xfUipZKyTH6KacoIEaVqh5+UOe67ug==
X-Received: by 2002:a63:e841:: with SMTP id a1mr17876872pgk.197.1627298386871; 
 Mon, 26 Jul 2021 04:19:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b02:54ad:f521:5496])
 by smtp.gmail.com with ESMTPSA id b10sm42070578pfi.122.2021.07.26.04.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 04:19:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Use real world values for
 drive-strength arguments
Date: Mon, 26 Jul 2021 19:19:41 +0800
Message-Id: <20210726111941.1447057-1-wenst@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_041947_946171_C8521168 
X-CRM114-Status: GOOD (  13.30  )
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

The original binding submission for MT8195 pinctrl described the
possible drive strength values in micro-amps in its description, but
then proceeded to list register values in its device tree binding
constraints.

However, the macros used with the Mediatek pinctrl bindings directly
specify the drive strength in micro-amps, instead of hardware register
values. The current driver implementation in Linux does convert the
value from micro-amps to hardware register values. This implementation
is also used with MT7622 and MT8183, which use real world values in
their device trees.

Given the above, it was likely an oversight to use the raw register
values in the binding. Correct the values in the binding. Also drop
the description since the binding combined with its parent,
pinctrl/pincfg.yaml, the binding is now self-describing.

Fixes: 7f7663899d94 ("dt-bindings: pinctrl: mt8195: add pinctrl file and binding document")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml          | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 2f12ec59eee5..e17a399e0904 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -80,10 +80,7 @@ patternProperties:
           as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
 
       drive-strength:
-        description: |
-          It can support some arguments which is from 0 to 7. It can only support
-          2/4/6/8/10/12/14/16mA in mt8195.
-        enum: [0, 1, 2, 3, 4, 5, 6, 7]
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
 
       bias-pull-down: true
 
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
