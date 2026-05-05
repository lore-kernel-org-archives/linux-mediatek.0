Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2199FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=; b=mL4+5wFwL2f09QyKtHwFOnL2GR
	QZvKGSg9AxkKzKYehrQroB5EhVADtWM5wSy9bm04XDnSzidHjMg/oCin+ZflS6bmVlum5/i7RXRtB
	md6R8WOOF9HgGeDQ7F3syn8u3XGrhuv5niuilpJ8HUpU5RGhOnSTQUGrqNMHbVrq/WtNKksNpBltG
	oovBXly2OF/RFOOmlwjiaCBPZrlkUx13sQ/NNY1pQ//T5UHOuYXgOmLrfore5vSaf/YRZD1uRDHgL
	ijnlO5DD+XLuYwPSnAgEnGjImdSevVY8NGVyoWe7SSLMePVWTnHztFm2rumKLppheeT/iIFELRTWg
	hrxJTDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpH-0000000GAOO-3n4z;
	Tue, 05 May 2026 12:24:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpF-0000000GAMu-2PrA
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 12:24:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so75582885e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983871; x=1778588671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=;
        b=HsjBwTUmmy7TGj7K8QhqUy9Jso8RMsCPEYj+sdWfyboPpQ95RXLXqnACAnG5SnO1bI
         4F/sQa5w3Vd0nB9+oqA6o5HtS+sh7mYJps3C/AsJNRZD7rnWbBgpL52846qCo2TltB9N
         mdbKRZYMxJ73kQ3g7/YrMeb7yROieOqU0ZVx7FPHAHHWXpbS9igxu+3QXz4gUoYSBAAE
         w9Tzkcqdxhrois0M7RHHZCJgyaPFvFI56TC6wT1zT1g2N5LdlSkc/BKg9bJMDFlXOUAb
         Y+C9X3yPAm2N+w4jKQHJ2ai1QEinzyIL5rdqVA/IdxW3xGaOZLxNT3wBUXxltqvFQS5x
         KewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983871; x=1778588671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJN4xgktXM6wJnQx9ssoJ0Unj4TTmMJ3sFePOxUzWmw=;
        b=elam25o9aKVjFzntSzXSsnK+hkb0ZwuNNc5IQbfVt0xiAALkOBP4HD0vaJfQhUT/yR
         0BW4FieCu6PCWc3g9/RHQ1FqOQlPLYGdfSY3/SvpoY0hytUpIrkYP/RUM0JICb+LRiZa
         5dMm5eEte5oB5unzDg9GP1CABmYbjBDKAr2c0j8+JjeZJsaJctNjD33ccjrQuHqjwhKc
         slHaE9o8yhW2Jg0RFIqIE02KHl9WrxLxtEydf+/dbTRa6T57zFEf/B9q2ICV3PeFa8Gx
         1WgXBS8Wxy4hv/Phk6d32/pB8lFcBOf24QvM4gbryPR/MXov83gRqscwUSxtGlpq9mFV
         OetA==
X-Forwarded-Encrypted: i=1; AFNElJ/tEmBiWvb0JQFaVACJ9cnFJYo/LWqV3Bm0ft97JK6HnS8X4WU/f5G6HAejPvi+jKUGo+LHmIMNcx+mw1sGQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkE7ohmEhOiz2NTONaO5SrUgDzIE3XOVwBXDxFwPrkZl0lzQpM
	NTbfpJtIlf0dzI6gK5VrqkQ2mTUFEOP4hGLsz2y8irCa9myLOD1IU1MR3DnviQ==
X-Gm-Gg: AeBDieuTwfO+OQX2z6TmNrCel0RVxQq//ZD3hmmLnh9OMQ90urtAMPmpJ8SkZ787dXD
	lOEMK1Ut43B2D8CWRqY53dhTLlHknDYRe+6iNYjkhrUWKdtSc63GjMoBUrMMrxMwkz9l2YjRlWo
	WrAr0PFqiSxoJxfVrGuQkPWyH62bHTq22FCHjlC42kZtP+iuahs6vTlFX9PUgF+3NsRyl+SrSi/
	6rhiJdKct+xOVNkmkfpPE0Qz046rQH1t2ClP9XdHb3J432l2wn6BPoP+ezqY5bN4j0RWlIE2+dC
	t2zoS1PX8y045leehyojlp5WYVMFQ1gPx9F588wDaE87HL5LqS+CBu5Kx6e1XQZHbhpCqIJWSxB
	cPyWzVGIFrnaQuDYqKCH0e5Qp0wN+OTeHPMS4nXRtd0v4DLp9DXKVD2dbU3A0Je4S9mmpZkLBMd
	Ad1eJ2HFyOk3FfBDQykORi5VLMfh92PVRLRuVQHXFsmT09ozWAff0lxCnO8V7NswMOWIXexiSvA
	df+Z4M=
X-Received: by 2002:a05:600c:4f05:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-48d188dcc95mr48291535e9.9.1777983871233;
        Tue, 05 May 2026 05:24:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45054b03df9sm4170411f8f.24.2026.05.05.05.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH] MAINTAINERS: add myself and Lorenzo Bianconi as Airoha SoC co-maintainers
Date: Tue,  5 May 2026 14:24:13 +0200
Message-ID: <20260505122416.2609-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052433_664883_28CF9617 
X-CRM114-Status: GOOD (  13.44  )
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

The development and integration of patches for the Airoha SoC stalled a
bit lately with the result of some patches getting lost, not applied or
even flagged as accepted, archived but never merged. The Airoha SoC, given
the similarities with the Mediatek SoC, all goes through the mediatek tree
and it's understandable, given the amount of traffic, that some patch for
a different SoC are missed.

To help and improve the situation, add myself and Lorenzo Bianconi as
co-maintainers of the Airoha SoC.

While at it also change the status from "Odd fixes" to "Maintained" as
there is an active effort of maintaining this SoC.

Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0ef0b9ce5..bd814f20213d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2385,9 +2385,11 @@ N:	owl
 ARM/AIROHA SOC SUPPORT
 M:	Matthias Brugger <matthias.bgg@gmail.com>
 M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+M:	Christian Marangi <ansuelsmth@gmail.com>
+M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
-S:	Odd Fixes
+S:	Maintained
 F:	arch/arm/boot/dts/airoha/
 F:	arch/arm64/boot/dts/airoha/
 
-- 
2.53.0


