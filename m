Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD98CCD4F25
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=; b=nJMUnRQdY+9A9317rDgWGIOUSB
	ZH5x1hLE9SWYYIJMxN+t+qMJ/Dcz3BFf79vto1DeMwcWQRVk159sGDwD5e5c487kQ0a61GTTirhPn
	xybrVK4/k+SImcO/QG7b/TiGfDARcokfdDoNy7CTF2k2ARksRli3h/hkMsu9Ct1+aETqdA3Tq2wzR
	hboibs0IqMmrf65QLgd/Ff694eW0VDTgDHfCaXDVr4ygwWQVVnXJRHRxeVFvN7rsZAguTZswpC4UH
	+LXgglnUzPdZ2bvUopOXdexK+SNhAU6z+JJ+q06KvcPSy2czcDixmLQugajKVDHSdrpB6bJbIP2nE
	yXbGAz6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT42-000000059ny-4BuG;
	Thu, 14 May 2026 10:13:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3y-000000059j6-3EOu
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 10:13:08 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3521862b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753586; x=1779358386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=iFDUmJvTgrTA2QPjM4qyqEdi4a90b/jI1rdS72JCwYSz1W4PXMxNGJXDune+UASIFy
         y6A7Lr1+f5Prz/D5lxvzgPxgsShINXwleWewEvHOFt7DZO3qS3hEaJxNBa5ZGWmH9xV2
         Iv/bk+dnIuHbx3g5OA3l9iZsx2WqFYIwGvKz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753586; x=1779358386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=Va6X8rONsZ41JFa1+f6zdIe5bvAPYVfDA3Zq1Pmk5wj4w0hPAkOeqyxMZIl4JSNFYg
         OkjeQCljvRt0Q5Eop9NQyU0hyn0RlCmIpRZuWuuDn1SQNoDcoLT7Yieoc+Xyjj4SkRhv
         fouwEt5Jky6OFGRP3wciWWVZ6laTLseOZZUVSSnkGU52ARW6ubbecM4aZH3+enUGAA/B
         vQDzV1YT34eO6iSnvRNHNvciKTRrhohfLxjoHcJDcjb9uO4X/DUmDiaDCFTStcP39UOe
         BoZ6CdGYGYXfxJEhK2if148MXLY46CWcUOxsTpmM7BDU9nJ07clqvato0Z1LI9fvvwhZ
         MbAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NVuxF0ZSxgBPNh6bXP01Lhbqk9sCibbi3+ncKP8D/cV9BL0lYDZZT3SbMnPSGPMEYwGQIdAuFJRTamU0csw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPSbDD9ZoyI5lgT8IkLD02VlwiYEUDFNMtx+uUvTz7+u/h1PCb
	pK5YqZspOCGubtmGvW/Z44z9PRvyUIFQ45BBX6++VnUwQd0rS0RQmLxuxwnQXJRdxQ==
X-Gm-Gg: Acq92OE+cP50j4yuVq/rxIzJs5R3xgrR3VlFcY8y4K+DeHXNWbzMdAQXsBBY4c3+6C/
	8LuNbFKnA5Uny1jAuge9n9mDf2oYZaP0X9usztQv4UUcfEgx8x9vxDtERsEVxYZMAWCtRySG92x
	Pa9V4h8i7P8Xj1Q/bOJIbRqN9rzkoDLE/5R4gPgIAYuiGY+TTfpxmgcbgpBvclatH2MqUamlSWz
	dKYaEI85Ajh1+esAiHsRT+i4eRzLMAcoNkQLxKwfbG2u53z8qBVntQbZv9Ubs+cm8zEFvsUcOb7
	ViAg/vxenvTBHbsS4Cv/ysduEdkQ81XNRKCzrFS2kqpTQRtYauY51574Lk8cSGzk6LcjWspJ7NR
	FZDc03cXRkvV0LLdOdJDeuldOUr9BBlc/UybbAW/bxB4/SgWbla8cIYj5SKqIm4jyTazuRnQknN
	zQI8hMKQf1WT8p57COYLrX8Dw+VAi9crAD6olWqVNhI64i2psUNzZt0LTMZJQ2INTOQNGobjSN2
	BP5kaPf
X-Received: by 2002:a05:6a00:e11:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f0431542fmr7743449b3a.50.1778753585633;
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
Date: Thu, 14 May 2026 18:12:49 +0800
Message-ID: <20260514101254.2749300-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031306_810136_12909EA0 
X-CRM114-Status: GOOD (  11.65  )
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

For JEDEC compatible SPI NOR chips, there should be a single generic
"jedec,spi-nor" compatible.

Drop the model-specific compatible from the flash node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 84b89b317890..3c8b4c2f6f23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -631,7 +631,7 @@ &nor_flash {
 	assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D8>;
 
 	flash@0 {
-		compatible = "winbond,w25q64jwm", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
-- 
2.54.0.563.g4f69b47b94-goog


