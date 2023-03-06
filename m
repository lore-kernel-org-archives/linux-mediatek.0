Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2369DC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZW1Oqg+WLuWWxkuIkyJR54a4c3JXn+NZetW0zwSCeSw=; b=4CECMXulN5a4Fm56zj+SoFEV+G
	BmY+nP7oV29zAYEyGOp8txCQCoEe7N71Lbn0oJeLYDVDPeL3XebpNY6NaK+LXcaOXI+WHMKT7sYLe
	arVbzlP2vWcurudTePE3TffrozMldQUg9ydtK1Ba1esn4J3MZzC7R/fUfBm8RxTeR2Dlr95C8g5bz
	HggCG/rbac6YTHYqSt+a6H5NJTF/PaZETHvvg34eQafUZ+Nw4TTrE9n5hGbu+Y19/n+GPNm/N+Z22
	nLRNV/u0Rr9L+gI1c0KNnPX/6fOTjwv3uB1TJj126Upupu4jue9p8XGxGaIH31cf55kWwrntGv+Q4
	6g65RJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB54-00CwMM-1O; Mon, 06 Mar 2023 13:40:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB4r-00CwHd-Qe
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 13:40:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id o12so38611985edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678110029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW1Oqg+WLuWWxkuIkyJR54a4c3JXn+NZetW0zwSCeSw=;
        b=cuvBAavVvAQVUP54IBvXmzklqerlQN2fNulM+x734wtvrCyyyrFSIbHxMeBokGLcIP
         pkkJ6uBVZTDQqpgRfgEM0/sIW+6WotEmGDeNJMHIFUnsKW3h8CT0EyAbw4DyCwPjrhpE
         WudN8Y2KYBCkeTqmo098LV4W0EhF8FQ9AG47GHRVeqay66sObxfm7csAncStrbk90EAh
         p9MuucTj6mF/pYqJInvyqLxpp9ZRxUGgvEILHxA+E3oSzZkir0BQGVEe8UTKEG9HPT3V
         keZBOsBoCo7mHVVRWvvMxGhqTWmwssFJzwzm/VEmYdUSYA4o6m1U5i9ucyxuwjw+8PSw
         r9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110029;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW1Oqg+WLuWWxkuIkyJR54a4c3JXn+NZetW0zwSCeSw=;
        b=06vmeHlYRg7n6iP8x7FFpPY7uxji9TPICz7y5dLmykRUx5KTvthr1N9Kks5NuCp7M5
         +1B+eiQRCqpQGh80RquJ+1klrs9WzuVSqqBZxV73tZ+v2mvpugWQP7Opa1VxpTZv3F+h
         1S8oziaoAr+j6pSM/DxNl7iNGE6nCSREqebI1GkTo1VnhSDVoA4ldUspNQ9VnGpsC8Gu
         aLw0iujC08VQgYKufhwnf4E/vOzAfgb4TdHYpZj6ZbD/Rv78jGXUUKnK3OwGqiHt4tz6
         JcWKMQUDFuFdN7c3gRLJZh9FiMpOPfY/zEIbOsFP16A11nvqRP5NdUUCbdkvzMioBQAQ
         sFMg==
X-Gm-Message-State: AO0yUKWn1nTCIx4v3f1KYinrR15FU5Jr7CKAdB6fYDLCkTyf55SV1FGK
	HV+vcWeRofTLTy13RCXrWAxL2A==
X-Google-Smtp-Source: AK7set/0XrGcKW6yxv/wJZcYC83SiD0kz0lIalXfaXFBbdXe/zoJAr5MHbFp08xZq8Th54ZnERWtsw==
X-Received: by 2002:aa7:cf90:0:b0:4bc:502e:e7de with SMTP id z16-20020aa7cf90000000b004bc502ee7demr9831944edx.32.1678110028679;
        Mon, 06 Mar 2023 05:40:28 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id u2-20020a170906c40200b008e2dfc6382asm4574959ejz.125.2023.03.06.05.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:40:28 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 06 Mar 2023 14:40:11 +0100
Subject: [PATCH] Fixes dt-bindings: display: mediatek: Fix the fallback for
 mediatek,mt8186-disp-ccorr
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230306-ccorr-binding-fix-v1-0-177d81d60c69@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Sllvr1qcJosNPm/127wltPmXLo/4qloGmkwT8rLTdQs=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBe1Lg8S54sdx+TkgJNo3Q94C1ufIjETI8glahloA
 wAMPhpWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAXtSwAKCRArRkmdfjHURYxBD/
 0TgSfGN1WScR5N5YN6E/+DvS8lJCRDx+Ky+06JfD0PD/Oskchz6XpYCjhFeSKztRXMpZZIbonI1aa0
 fyxq18BAhYPzBeELrCMD8fWqGuC069YvDqTVQeIE3pz9XpooTDesaQWHh59UgT4119MCpLnLHM2xE+
 rdpm+l7he9szKBSEdvS9RbBHYh/GUY22ipY6APt5qFgua2DsCr+QPrcNxlnY75p7DbifXqBu3V3NPZ
 QBywL/k0JnIraVsSTr20XYmhGtKYv1GmwimQ1uXxGjDbIQM9CxaM6Eg2Ngeob9m4KUZwa9AdPTo52l
 kP7dELhSgd+qei7U/kKgQVj0vCQv8w/JjRJkR2ylQO1SDTdoJmfbGOr49GWsWE/aqp3AV5QsBHiful
 17Xcw5DcnpG/5wbbuNc472Fr7uWwxIkSvvLZxuiER3g8+3oF8O0rx/JXFKTZvzf3S4fzNNuyglXTt+
 fOMYxL3iB5pjsOMJmPtRKenLhJnde6pGHcBMFJo28ZG9aRVLQDOV+Mp8kAPRwjqaI1bPWOLrDyOsfj
 Z9w8RwWVBKXHC3XXkRiSMtER76zkOZdiTHo3An37wNV98cTQ5VWuyuiscunseNUjqqnbdad17m2Moj
 /8HwAtPOqMmrdoWqDXF1RAzdGPD/BuXBlelZvYCVZN20LXGywmz0hMDFG3Yw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_054034_076446_07A90189 
X-CRM114-Status: UNSURE (   9.20  )
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

The item which have the mediatek,mt8192-disp-ccorr const compatible already
exist above. Remove duplicated fallback.

Fixes: 137272ef1b0f ("dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr")

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Fix MTK color correction binding

The fallback compatible has been duplicated in the 137272ef1b0f commit.

To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..3aaf44719786 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -29,9 +29,6 @@ properties:
           - enum:
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
-          - const: mediatek,mt8192-disp-ccorr
-      - items:
-          - enum:
               - mediatek,mt8186-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
 

---
base-commit: add072536971d7ce891fde3cdbf68c55e7cfa95a
change-id: 20230306-ccorr-binding-fix-718c6d725088

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

