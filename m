Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hgFFtg0cq0n7MFavbvSu6Pu7ckY4KcehLukkp2XzPJg=; b=QA0zPCkdUyNqCtqXKYfxVoJ6nv
	1gcBg0cbLEQ6XNMlLK7yaTxGAvuKFkShU96lvj7IuY/7WHfr2Cb+8g1gwyGMVVDe2I0XZ2tYh5xmU
	tTmE2bMTOYL6VBjYZgOJpzH6f1LkznvhjFRV/6KeCOzoX7h02UhZNF/gjD/znt70hyObyc6v8Ao86
	J5Gb+caGBJyM4EvENn8VtjdbjbSHJ7fFB72zT69ZtrVj1lOELLYnJeOE8m4oZUBZHfUYNVrudGHBQ
	uEjHkNpHv9jO3SBEhhCvrNJmbyVIOpMGzmsUIg5ZGluqQeqYAojBJEoQrrBa63H7wrV6SQsEaxmtD
	qQ+2ggBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oltto-008fhi-G9; Fri, 21 Oct 2022 15:25:28 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olttm-008fh6-Hj; Fri, 21 Oct 2022 15:25:27 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1olttk-0001TX-RT; Fri, 21 Oct 2022 17:25:24 +0200
Date: Fri, 21 Oct 2022 16:25:18 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/2] dt-bindings: pwm: mediatek: Add compatible string for
 MT7986
Message-ID: <Y1K53n7LnjoMoIfj@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_082526_605025_24EAC6C0 
X-CRM114-Status: UNSURE (   8.70  )
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

Add new compatible string for MT7986 PWM.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 554c96b6d0c3e0..6f4e60c9e18b81 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -8,6 +8,7 @@ Required properties:
    - "mediatek,mt7623-pwm": found on mt7623 SoC.
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
+   - "mediatek,mt7986-pwm": found on mt7986 SoC.
    - "mediatek,mt8183-pwm": found on mt8183 SoC.
    - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
    - "mediatek,mt8365-pwm": found on mt8365 SoC.
-- 
2.38.1


