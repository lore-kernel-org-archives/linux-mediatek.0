Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4257FC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=; b=bxl6PpW4IAz/G9h9HA2vv3Ny4S
	SPCd7IxERodNwockgxpYYQDwAkDdDBB4m0ZcKD3fnGUBLEAFYtuGsilzCxHXdySXYSugAmiqYWZWs
	TBjbh5DufEuYlhxN/dLacSeSSWDEUvs/yu+wCJKC94iK3praeYHNvErdizUtWl1W9oA9C6zComuKs
	wkmLMKRa+tzF1e5ecnMZkDUGCsrFlKkcxcLC47mL/rk1NiKaCxy7HR9tOo0vqwVRibx3W2il59yaD
	6tH0v2krQmyx5Q1zurY8HQ9RXwvDU0oD4X7UqFsWyxQMhvjc3eB2hOmLhQeWKVAlJMDlki4W0qQa9
	KhlVXtPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjU-00000002ngh-3pYo;
	Thu, 18 Apr 2024 15:31:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZw-00000002YhM-1NLF
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=; b=VpC9/MFcURAH0Y9zYMc/DXWYnT
	eHKhC7JmydoFTojRGkzL/VewJzvL+agf0O56xQ59Bz5V5HBa8GG0Fo9McHYuSomZzFFSxc8y8Cmmh
	EJmhaS59iKp6jEEDzGfKxa+2Zl/cRYIliv5iF8htkldIgXMKvsA7CrIwN5hiZGKdBFORcqgGJfsDq
	g7iqQQIOAKy407HYs0lEnRNAuzsXjEkFu5HtpctJTBMs5F/d8tT43YhTXMQnrXqK/KSW60V6qYCmX
	g7Vxy2gRSVyMFROMNahCk4QPt6glddC6jktHJl+h9UpjbVkrsgP2otOHqsAU43/7Dnl7LhKEov7aI
	3MxXS5MA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZj-0000000C24i-1Wjt
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-418bbc690e1so7945755e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449836; x=1714054636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
        b=jLwZ2pwz7A8Sm5cyNgETm7I0dUVBdd1QPGnjcyHPyd642zVByAqv1bKsXaRdrQ9hUI
         bjBx9ZYlqtFuTsgFWvzp8IoEaXeF5/3iBry5gTx6QTZzlc3VUDqIota/xqOiig8hZVXh
         +mG2RfTSrEqw2hSvJG6NBUgG5Yzq1Pn07j4Jot2yXcpDHsSV9wCI98wjXQtxyhdBJ2l0
         /pRIi6JPWuBsKTjMbyab5Olii344cHdWX80hZJJv5ipHRBlIobCaLCAqzg/MAryQo52X
         q9qSz5b8OcNDUQzb+RIy14mz5owAY4xLfhIV+BgKBACMsRyIMuBeqQRu+zY+C/3FH/vA
         H4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449836; x=1714054636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TwD5iNVfbehYnKEJbnpi7hogz0EJMx8yqC29CXBFCDM=;
        b=cKX7irwny7ZUlheo1KclJ2rHxikPktnuRAEscuc2hNk/QL2Ikqp3IuDzTMK0adxzct
         mEifXqBeQvSrJ+d0dJ6/ongoWwHYjKWoB5YOc8YZDMc2eS6Q77XMCrJHuY7apvG+5n1k
         LQ7uiV9rw53DTjpn6ndjvpCQs1dIya6kbbeVslKCh8p4lNlJ1swDwRma3hgaark7xMcm
         XPmsnQ9w9hmsvd+OBqdEuGNG8QTNk+jYDLVDyFDM7sWLGZp6FafJxpJU5WHC0Re0wJto
         L2k9T9r0UGM/cJkevlZ5IgKnZiX7mww8mngIAUEn0eiHe4lf4e4aKYRMvCe8XSo52aZM
         I49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkJkn/41nV+r8fcJmZjW5XHpKriA5rNkA9L6XMe5eRs67PBISpgfDOiEKTzI5E7x3sXXnPnxN/reSFHAU41Icte2U+8jZFS6t7IBNjHFOryFuC
X-Gm-Message-State: AOJu0YyEn5jB/NnG2f1YiYmLgIHhfwvEVxLGLAL++hgrP7oCIcinOO6i
	IuwjqmbCCOK31ao8rfyFKp18jcIlGg6TUkkovX+neo4zWbCQ3dnOjazZRJqjrGs=
X-Google-Smtp-Source: AGHT+IER62CdAE5/5oot4D2adTIVLRgUG/egF1vr5z7vePcV4RnBSZGtaXvV2hHCju1kll+OUBkpwA==
X-Received: by 2002:a05:600c:a12:b0:414:8abb:a96b with SMTP id z18-20020a05600c0a1200b004148abba96bmr2014596wmp.34.1713449836080;
        Thu, 18 Apr 2024 07:17:16 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:15 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:52 +0200
Subject: [PATCH v3 04/17] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-4-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zzCIaD8rTG1/kp/ZSileQtlNEnXTYcjPAL1DZHwA70o=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStitcbsX009PW5cbVFw1hXuGllJFI83TYn8zPhf
 rz/CcdeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURWNHEA
 CaKphXLr+uLHFI1nnefySVhPPO7is8O4I83eRLO4ymwrkeRxbJehmGXVQBbDqnwu5zjiP9BmmbP4R/
 Y0EVmGTML8JP7vH36fZ6AdfyOiZv6PLmpmQa/J0q2jhqpqnrFAZR0Qi+jt5XK+iKNEiqgToAOL8+LD
 pTwpgqfioGAjnRQAGLOIK6EvuAhrH/20NKL/PupWSb70Q/S6OyFX0Y6mGMOTeuHUXF1ergSHLcL1HF
 0XxUf2EH6vfCheLvExdzBlo5HvULGi4cSriAWBcQhKE5sgMIva7bMRF4QuyFcbcu5GUQVR6AlYb4/z
 l5YxaiDyxWKJVUM/Sg3yiI2fkS8HEF4B1KZDsmzo2j+vE5oXK1KwU2XzU9Yj7B/OWv3XIgFbbD8N+d
 xoV7Z8mhSCPE1zhfOPI4r4p0Vvi8LnuoadKK+rZd3fcmVYmX8hIA6RJ61z+cea1rgTkyd5qfty2yh0
 FR2z0DLsOJtyX3TKVXcFcU/vhq4YrS5cZvaIvACh35XH7UUWxMvaPJtPEZYXWiNtmUUuBu6QQIzHsB
 JPEKRk9/8aySxzP1IjYviwc7nuwqUCWDHug+A4+0KuffSSISRMUM6ReUhGazF7tbJIscFuZVWcI3Nl
 MdCF7okXP0MmThxayji4DOb68QmXDGLOLn1ONLwyZZVH2md/eHgFjvBLh6xA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151720_023869_A95DA21F 
X-CRM114-Status: UNSURE (   9.33  )
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 1588b3f7cec7..6fceb1f95d2a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1


