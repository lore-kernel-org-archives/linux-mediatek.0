Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5E4C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 19:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=; b=myOStAtiGHKRs/
	jz2KJXyb0l6Z/i597hvaRxMBks41gIS1RIRXbnjyDbRiBAKHa5BWJlRiu04N1pg677r1MN9BJLJg7
	Bfy/ZDd/wxtaFQq0ycnZBj1KuGJi2zdDCoRq5CqSLC5rxEjIusYcSFFcuI92imb0c6gxCKTi7gm/Y
	PAimevsot6QR1Dxlhctlf7kDBD6AYy4YgoCL0wGzDM8pAXEXZSKUMrfhbh1eGS95Hz/soRaQoRoT+
	5CkA7PmI4CVynkTzg7fTLLxpBzpNusCz0YzPTgZW1DLA+gBPQpCHgKmdNYI2T0XgwAOV8ZLNbyVA1
	QsYtWCvd/43CjZGMwVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whub0-00000003Ug0-40lq;
	Thu, 09 Jul 2026 19:39:42 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuax-00000003Uei-3zo7
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 19:39:41 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cc827a68fbso511315ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625979; x=1784230779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=DR2dqw8enPzJbvKW1pbCGOqy0OOK32Ls4kDKuxxD4YH0OJ3WjxjsITi7dziSJxkIet
         mFHt/G8LDIPoDDg9WA79hGDAN2x4bVeKbihY1VqF00p7ieqZkd+2TzRTwVSeZOn9TW4Z
         G0xW2+EZGNKtSB0KaO1UMOKQVuM5wrK4H+QvR88erQaDuZRY9QkBcYUbZIPvz5xXGU1g
         2YCMJWkxh016oeDOmvrUNHNYljsLbFbOKzMrbWAiaPP6g+bjXmSD1d/73oimGoKzPSmt
         F9IEoDpc1Vf/fX7xWGhcYJ8Q6kP1y5VJ6msotClNtVvhe8AJexJ0/QWz41hxLHLOGh2Q
         rFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625979; x=1784230779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1C9Fd2DZvYyR1+upE043sUmS7e2RixbOHmD9oJqDM90=;
        b=QY3w6T/s4Hbx3hGCr5W9SZ9kiL0LPFBoMw7MQ2qSDpHL5glxDDk/HzxypnUtna0nw6
         MtzbhnhTEHKG67hxMT6KqQFhTAR7RGJ4h4LKrkUdouOJL1kAEOzuOX7zdfB3s5u5tUwK
         gyXcIWpNn/FN3ZJ/8ftJUJD4mPWRLLzjjAQQ0C+mRQzKnkNzHPgyW15jArVh9aGmRaO5
         DwdE6DIlHD9E0R9DBa7J/8kZlvOGdTp0+Y3kMp6ppfylPHh/qcCSKLk8Et0VoyOy2sFj
         XfqIJrxM8caGIKkG+QKAQehFOBAnDf82oDMCjEwlYKTnS0Luo3/9ICuJOZ6Yfb4yOExk
         /HRg==
X-Gm-Message-State: AOJu0YxrpplR2Q8fwClRHtaSVaC1mwXm5SU5w1/j1i5eqUEo0yTGCKaT
	E7qNQxf/ZbLOz63ocbnBGP+xD8XIwFphv//hT24AvO5NW4aWPBdFo+2F
X-Gm-Gg: AfdE7cmv/S9jlMgHeW8/auxi9KQCYnbNX75cy5z8YT3QEzO6dKbmQbxjhozy/wLhMMH
	BVw3WKUuzQncJNaXBiIyQxUTqOyH0Rv1O1jAAGBVEK3jlAKVjTwBR5T9z0OxmGl1bVve+7sq8CD
	lGzPX3ryELisnbS9iyNZy2OZVINbffBvVv2gVrv/Jc1OJbo5NYAjkFnI/XJCnAHAE2czXD/tWhB
	+4/lXdLVjPqhBmKlja64fZZCJNcALqEf4SSy1AHzhmp+ar2OrsKl17a8r7xIh/MFnUQZGqmCNSN
	kUjZUMHlsWHh40tCxJD/32/YhMA19caoQi4gvdPQWmBOa6BsOEwUMCpiFt/XQaDIYtvJ/o23Oey
	A21jbGuZXCcITBq4lHzj/FYUZawOomHppB4voktRa745x4Nf8naDVbSTiFl9vgs/aF4Jn+34UyX
	083Sotpr39a9geK5VdO/TR6A25sWawgpKi5GBjco1nQEx/6xxRDIIN9HZZ5WQwLr6SKg==
X-Received: by 2002:a17:903:90b:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2ccff09e0fbmr44702215ad.4.1783625978569;
        Thu, 09 Jul 2026 12:39:38 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bde9sm49018755ad.79.2026.07.09.12.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:39:37 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] dt-bindings: pinctrl: mt7622: allow gpio-hogs
Date: Fri, 10 Jul 2026 03:39:27 +0800
Message-ID: <20260709193927.108105-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_123939_989086_E0AA0627 
X-CRM114-Status: UNSURE (   7.95  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Yeh <chenyou910331@gmail.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 6e3b067d3c5e ("arm64: dts: mediatek: mt7622: Align GPIO hog
name with bindings") renamed the asm_sel GPIO hog to asm-sel-hog to
follow the GPIO hog naming convention, but the mt7622 pinctrl binding
only allows child nodes matching '-pins(-[a-z]+)?$', causing a
dtbs_check warning:

  mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000 (mediatek,mt7622-pinctrl):
  'asm-sel-hog' does not match any of the regexes:
  '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'

Allow gpio-hog nodes in the pinctrl node, following the same pattern
as commit 9322da935c9a ("dt-bindings: pinctrl: mt7988: allow
gpio-hogs").

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
index 6b925c5099cc..021307b6d801 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
@@ -65,6 +65,11 @@ then:
     - "#interrupt-cells"
 
 patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
   '-pins(-[a-z]+)?$':
     type: object
     additionalProperties: false
-- 
2.43.0


