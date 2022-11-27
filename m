Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225CFC4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOZoVt4W+lcxF9f/uabO01wFDTt/KZZXxvtLpd6GcEU=; b=aGlzTUDPLAiY+LlD9/1Hh/AiAM
	0VnB86lorJfTckQhq1S68S3LbJW2IV0x0YBeQhCc6Xt5dmpYFOiqqeRBpffXeDDx+4ehZMQhO/Hf9
	OcuvriX7gmfGLnkDivvngo7HfbguWGw/VElwdiOriQarqwdU7uyUxLBizUNWCIUAchPkpWrfzW+89
	CuZV/H8bdYoeHKCdpkPHOD76DwfRBP4MDrTCM90Si1Gr23yA+NehR6zQFU4ySOtvaxV9jfePtJWp/
	p9SkKxtFldETGHJes/0xf4OJAaFC4RHUE1EQ8vpTlRjvGhT2nxVxbtJy9zAvYJpZuTxn8dFIV1opz
	ySJ49C+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOTG-00DYHE-TQ; Sun, 27 Nov 2022 20:41:50 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOSZ-00DY1O-Kz
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:41:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id z4so11041387ljq.6
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOZoVt4W+lcxF9f/uabO01wFDTt/KZZXxvtLpd6GcEU=;
        b=OFOl6Tiuk2EJnZ+H7210boETaHKYs5EM+OlbSujUfTjA3Blu82yWfJYE7AOXExUQDA
         cf14LqDa7er8/vucmRje1ik314TFQI053W14ZScQBqJnx/YopkUQKKcIY469gCMRPLwC
         +Um+QoGkb0LY1F28qYshrA2sRIWl60kKjoSx0PyQ9C0SFN4uiBHbCdx6OEVkq/qUu/id
         yZH8svuG6lP2jIQ16SWBrbACLs6jdjeCJrV5uoikCWqfxofjy6jHZOTpqBMd1M6IcoI5
         5fpWncOz9Sa3qNXHR6LngkYFqdQtCzX00c1+g0fXWuXydxC0vZCW7LtQdDfVss4VN13m
         A3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOZoVt4W+lcxF9f/uabO01wFDTt/KZZXxvtLpd6GcEU=;
        b=E30ZUPmbkTb9bzSZ80Ra5OjfAK7ey0NITcHal6greZ53lkc3xWtRQlVKsl7dqIFUCd
         0FYxfeuXwNixj5dlyUBg0E+PKmHy/nxz3qSONuDX3G3DzSXPxMByxC7u3kkZElRaqvsO
         GfcC3MMzdcRhnmzdbKBDiCy8OhlbldXslfiXAm9KqLYf8z6P0KeGPTT32hY0RCDX6diS
         3r1yRkKO518F4woyPd10cF6gaHMrBWbwfnen08wa/0udsJh1caJQqn6T7mbZ0lVJEDYr
         0H3kIITHLbcOz/Mxnq5ZV0M80S41lD7iUlrR66esyK3157XvluDIz5ohVPBWcK5KmBxD
         nx5g==
X-Gm-Message-State: ANoB5pnQflf7wYhqGvnv4KKZY2jfFGlBkA1WUe2vhBqW2vx5YAYRezRh
	t4U1uvKUMRJBY59eK23XSt1y1g==
X-Google-Smtp-Source: AA0mqf4PbVbjiI63poW81OvqdUlewSeDUZ8M7xGwA3CsG0+c4K+ZxOuzuyxbwV+a7yxTRjNplz75kA==
X-Received: by 2002:a05:651c:1551:b0:277:6132:ec9b with SMTP id y17-20020a05651c155100b002776132ec9bmr14385014ljp.466.1669581665800;
        Sun, 27 Nov 2022 12:41:05 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b002773ac59697sm644607ljb.0.2022.11.27.12.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:41:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Nikita Travkin <nikitos.tr@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Gene Chen <gene_chen@richtek.com>,
	Bjorn Andersson <andersson@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Neil Brown <neilb@suse.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/6] dt-bindings: leds: lp55xx: switch to preferred 'gpios' suffix
Date: Sun, 27 Nov 2022 21:40:55 +0100
Message-Id: <20221127204058.57111-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
References: <20221127204058.57111-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_124107_729108_8B002FEC 
X-CRM114-Status: GOOD (  10.52  )
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

The preferred name suffix for properties with single and multiple GPIOs
is "gpios".  Linux GPIO core code supports both.  The DTS has mixed
usage, so switch to preferred naming:

  omap3-n900.dtb: lp5523@32: 'enable-gpios' does not match any of the regexes: '^led@[0-8]$', '^multi-led@[0-8]$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
index dfaa957eee74..9a38e5ee43fe 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
@@ -43,7 +43,7 @@ properties:
       - 1 # internal
       - 2 # external
 
-  enable-gpio:
+  enable-gpios:
     maxItems: 1
     description: |
       GPIO attached to the chip's enable pin
-- 
2.34.1


