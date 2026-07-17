Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDBC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=; b=xS14R9Axe/F+JBBqnW6mdXWyyP
	OupnmWaznAtvf7O0j2Sik/Np8mZpL4ZGsVvro0uvKpmJuBYxxb18JcJiMsziYuxiCA5dgu1Ybm2a4
	CazRjbN9ivFrsHfS5DOrUCLAjDWzrNduCj9P6Lj43wHplDRB+uAdSYRuQZa+2aM2mioaglNMGLUU5
	++ze5VPmFHDUUQKfSz8Pg1k3kVG/tA9b5Y9m76AzHBvK6JS85WtkTRcDhRlV08IGLO2XgJ1s1F7ja
	D+ym/wEb+RVsfK0GpiQFaJBNQKu4bvMtlY004RxQAU+w7BIx9qXVQwBdYN7nbY2Nde9Y9De9M6nnC
	fvTkqxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHQ-00000002ZjW-2ZqZ;
	Fri, 17 Jul 2026 15:15:12 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHK-00000002ZdW-1Ruf
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:07 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so13118355a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301305; x=1784906105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=nFcrlOjfV4MNGzMihmh2fFG2GHMzk+W+ih3GuBNfZEpUNvBma3kBZprwFezjXJVD5x
         0vwtTDorRdyAHSZIM1PNM2TXkDiTbedPPhTWDifsSVqY7BfgvEL5+MwJZQSluy3QIvez
         VUx+kIFpq0gFGrfQ6jmIRU+mIuS3XGFsO9oaZlsoWeNa9Wjx9ip8mZ3jkcXol4fXJ1ck
         JDKCJf0JyV/HbaE1gOMUFVFSfzMXiGiOP5vU0TDmk+e/QLJ1BSGCjniXKg/wD+62Wmb2
         xc+WSN2G/uXZlnoi1RBKeD12WFzbJR92IuSzcu5d9XH+aBnq81zQz+ewzEGjfDsIXpov
         ywdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301305; x=1784906105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kCSbtpTfn0tjI5mWiKnAehObxNB5ridQJcKUxITI8TU=;
        b=IhwZjqPSHCNB2rrfqlbacwsBtt4A/60qxIqcTEqg5ZweDmNttnGbZoeFoFqQo/7pRe
         mAhEC+zG/ZvqXMFYA4KgQAvF7xBCSyfCvEJ1PEsktIAsutW/NOt45u5t5SZJTitRc3Gb
         9RyeQN4WiddamRr4X5u0FJyK8qYD70hwHDD54DuELRVA2mWq2ml8l1jmVXzdfOCmYCvP
         h3glO8Z8AlZoMU1at8wAxl2zOWIn4qZm2F758z6Se2fWfytKF9hFyH6raUZa4drkr2vx
         r++e+Au4gQZJVEyWWnnWzbrZ0hzf8qGo5fZW+YNdiuzWQ4XsIlTRXSS+l85fqeto2oHJ
         sOSA==
X-Gm-Message-State: AOJu0Yy9HoJEMokYQ+3kATu2JviXxgfT+f+xR9T35wdAWgTB5szhTwOu
	+8J2YvzCXToTKumCxcumC8l2zTDpmRsgJKrb9QZ5kfoWhgRa8qKHOy66fgYqFaxr
X-Gm-Gg: AfdE7ckeKXACisHFJSDwkFZpa53Cm39URsRGxRmBR4UiXP83keSZMp6LDNi8DClETmS
	kipp+ZNm4hYvOW1tR93CvvmmHfc7Vlw4f1zHnNUot21oQTXGd4zK0BaOWLiy2V0qa90JwQ4eUDb
	knkwCst6Fh7KiavJl6SoRAHnOPmuN4+JWWbfMjogpf3osBVyk8WK5WGccS4RsTCyUx1WAdXRJzY
	UcDPiFEbSQkTRbUng+CaQHeKgNJECmaZSfHHjGEqXOJiR/orbTYVmvWKutqlX+A5yboTCJ6qmGJ
	2GOXXz0WnJKEumK3EPZIgD0D4kr7UAzeymLASiEqY5ARb1DSBkAbQ6C4sI8uf4RJ5q4P6w83k9Y
	3Kr8+DMkr/PM30Ya+Hyplv438T7PF1IZZBUn0RFOaJvAXSY61L1MkaGWYgDLRSu8c6oONlyBnjA
	==
X-Received: by 2002:a05:6402:388c:b0:698:81d7:b822 with SMTP id 4fb4d7f45d1cf-69e652ed680mr1129854a12.22.1784301304599;
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] dt-bindings: watchdog: Add compatible for MediaTek mt8167
Date: Fri, 17 Jul 2026 17:11:10 +0200
Message-ID: <20260717151134.678839-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081506_401259_869BB86C 
X-CRM114-Status: UNSURE (   9.15  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and their order is different
from mt6589. Update the wdt binding to add a dedicated compatible for
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 953629cb9558..f514be8a5851 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt6795-wdt
           - mediatek,mt7986-wdt
           - mediatek,mt7988-wdt
+          - mediatek,mt8167-wdt
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
-- 
2.43.0


