Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71416ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=; b=13gibs6Uln14EHsrJ+b5K6ALrY
	jMFuGjuCFZBHs7gl40ShE0/RU/QLKhf7JxsA7vv0Zkc6p1eBhkjBU+88yty6t21rPMKi3udXjLbwY
	+eqGASUE2NFceMm00VAvHkPqQHiw033O56b1tcLrM/mYOtWSAcMMlXRJkwv2eQR1ft6ysKyHZQ5n0
	/DtyOJJiMTex+qWTS6tDjNzQbuit6+URhRoMHqGPEKqgD5gkvRX7znLEXzDAyvYVTQAstHQB31QSP
	JfmU7pqQHzZwHFrgzCmy7G0aRqK3IdzYG8iOMsQqyNvmNU+Wh0PhDSRVKvQfA47zkLOTMYPrqoHup
	sP5eVyXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKWE-00DFsz-CM; Mon, 19 Sep 2022 17:25:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaKWD-00DFrW-Hu
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 17:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=; b=WsmY0QPzQvr4nu4Tk+hVM36eDQ
	WVxCm0Ht6RcGlMjcq1gZ+ti/So7sCQ5mmHKeM4SPmQeLSLqQ1HuLheXSe1iidaJHBH4S14HRyUDv5
	dUn4HihXdzmPkDDNjVOx4P1coS6OAE5eTUT9DX5MtebAl/B7gUazlAXRT0Cf6Se9OqVBTILQSPXnn
	RmxKWCcCCPeZ2Fn6EJaljnKz5xJUxsDtAX+AOhB2flbmg3V7LBci42+GUEH4k5ilzdHbTXSxkjN4M
	Oki0Rsbt85PTNcynDy+EoNtzEpMnUkkWUk5hJ03NHQLphpWxnmZFsfMLtYegN29EDubNTEvjOhQRw
	gUpxwlQg==;
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK88-004rbQ-Bx
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id q21so106275edc.9
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
        b=h4xvs+f5cmaWKYK71+hYnOmPVkiLtaB2mRla9tuoCEJPd+4ppfNzN0FBFiwIs70U65
         tbJ9aJA3dpNgt1Ckv+Bx6Hc8Syb3OFhB4z+FJI0fxOKxNgoDOjZd8j6Uskwq0OWUm816
         O7xPp4SJYuri2o1ZZKVZOB4LzhA9nFL2qpDxRJhsPPzW8j/vsldo+OZmErddviwJRjTi
         p4lfIW565oRIN/c+Vrhth50HEka7xMLu+MKAjKA+FPbmPD21phAwhccqtGiVTtSD60Zd
         EGLplHMN2dasKn0QgJPqQZBi+CeACR4L5U4Dlj9odh9YO7SKHNRH5sQETerhK+QEqrcG
         P3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
        b=WFxgrQZOzGFsRX/slJ9V1oFo0kTBNx/LqIVdhRQGqOGjzxUJSp7j5gaPcLpzRDZefd
         LV+QF66QKM/Gtou3CD6j69ShsBMAo5M36iXPGmDWGPDTSzmtsWquco3J/zi/w8ArVdRx
         GSjup/GY/Hia3UZfxQGR/9lAcJAp1K2WF6RzG2+oq7ULKJllDCspjZQ+31gBPZGZoOMg
         1z7Lu8GPjVeYn/hQldDk39KZZonoT7OcgBPgOhgKFYtfOIQfWcP8xYQ/2ZbkcxuM5SUu
         a1LgOGv3i/02pay359/ic/BaE2sRVjn8+bFLtcaWKQXWAa1qz/cCLLTQgUQKjQWo1H/7
         syrg==
X-Gm-Message-State: ACrzQf1Bf64l7Ia4jv/HWNHqWOzEWWF9OAjDY/2oiQKl88OdxdrgfgkE
	4tRrRy907nzYiy7XVlYZTI24Sg==
X-Google-Smtp-Source: AMsMyM4nXsx/EGy8bNgRHqGUolsSurVZgmUHv5N2kQ+oMKWiHF7U6zG3vs9wXOsAsDPUMkE0zR3f8A==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id b7-20020a056402084700b00453943b0bf4mr11555407edz.301.1663606819619;
        Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:13 +0200
Subject: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-15-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_180024_422429_75CA7170 
X-CRM114-Status: UNSURE (   5.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..2c7ecef54986 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
b4 0.10.0-dev

