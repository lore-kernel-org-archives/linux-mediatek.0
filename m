Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4A8C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=; b=TnbycujjuNk+P2r2Bi2aRIXg1E
	c8reIlhh8QLMv8gLn9JJi0aJPTEi5IZ4uIdTc1RVCAx1dWrFGwjXqIGrbLZKhbrWFK7N95PHPv3v/
	GqENkofRa3B4S2nxFyH+FS3f2p11CSVhvRLZSgJdf/3RiPwi7kSRGNQy9jsGUin9sVQ9/YTaf13e+
	JWi39gPT9xuQSdEb7e11ha/wUqipodu3ib1N+dqbCdfbuuGsAzZ5lEbFSWXbnG9qW/gLxTyHv7ZIF
	4bNDxObl+S8eMueSUWINDarA+YFvcP1jS9lI2JeUtgAQ3q9d0ealbfmODq0Af1/fOcD4jLnSGlg/i
	qqx6n0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjN-00000002naQ-2uQf;
	Thu, 18 Apr 2024 15:31:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZg-00000002YWs-1uSY
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:25 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-418c979ddd2so6560245e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449832; x=1714054632; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
        b=oDcLqkg3r6nrF09khcsqnZpyF0CfmdFxJXS/bGjdk51/HarrrIDdpXixXSijFM+kYa
         5GmbhVSr4dSOqOYlQRo3ySF21onpmpIJB1vk14rOlSofsI1hkt23LB3q6kYLBPyMSuMu
         IkDmKvb6EMC8EXzPa5mMi25gNmYnrjcIvz6OPOp6EfhioqqWg9wPtG2w3Dw5qpxS4wDy
         Y7oWXSYiMO5XhQLdv1BqEeIcEPoOZf1kbW/PftHnqxiHaWxU80LOzympYgowdFSZ6vFg
         4TG19lKdd15k86l6z3cyyzf9kjADKPDEe9vap1h5+TNXbl7x6SsOIeiFXlDlQhNFkWcd
         cEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449832; x=1714054632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49BUJCpffUTma/23KKg2oGJXJqjsBZNRYKTB4uG1eb4=;
        b=cl3guHb1wIe7/xvIhboueMUNVVAz9Gr2Z29mnO5TETT2CyCgN7mU9Ku37xdWYYIFk+
         g1KW5OMqBpnBiZR9am3MQ7ISZuq/lfjNYcpUsd4wPq0qikWMv5A3deFX2x5TzH1tzXqr
         Z7BglanoqhLiLayJnCAleogRwlZOvd4XalFZTaW8TZWWts5B8825cEbJ/rcaObIvVBZE
         yvEt3gumy7TPQwd3GHuCsxznUY2KoSrNKLfxaJ6ukZHLyq4HTJMB1s41B1VLNJSTlz+u
         sH3FE97nbAcD8WCeNo4Z73KGH7YSKHmwetfhLAVwBpNhTM5PYnvmEBqzFKbD/GszU6yG
         sIWg==
X-Forwarded-Encrypted: i=1; AJvYcCV49CK/31sYXxJMkFlHoV0u8s8i1oB32iuOpfNmxQnTW2JdEmLqCLZ7sexC2vI503IGEmzMTMyWaHiMTaaAeVV6wmuMYtYGuSv3FdxzYJuqr4hs
X-Gm-Message-State: AOJu0Yz620lnffxzTOZfS3AvWSyNG71Bjpd5Bid+qLb3QMWgg5udWmtV
	rtVC73qkz0RzFuPjVIC2WqvPl2knk2xCNN2ln1tUCwc3Yl8gojlsHeAnhEoyp18=
X-Google-Smtp-Source: AGHT+IFTjzRpWK6iDi01DywjVdh8/v4t3z3199bOhoMDOHvDHlFawM4QhxRAJOfj2/Qsjae2GFxPbg==
X-Received: by 2002:a05:600c:4710:b0:418:829e:efa5 with SMTP id v16-20020a05600c471000b00418829eefa5mr2601682wmo.20.1713449832214;
        Thu, 18 Apr 2024 07:17:12 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:11 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:50 +0200
Subject: [PATCH v3 02/17] dt-bindings: display: mediatek: ccorr: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-2-53388f3ed34b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DLryLa8O7iEQrZUEVAGOL74G0qHULUzTiJ6209ggFjg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmISti5dQRvICs+TNWn9PcvcaXjHRymsUXz5cyKmOy
 gTr2alGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTCbD/
 0RoSlJPIusbA/ANyTOZy03WTuf6qpmm/7E76EPyETfQy89dcQx89oVWZG7tbWvZYTCLLYQdqDSIbXJ
 EW0M94hkg3BbwPvN8d1Y35T+9XjOZj2cX8RkgQt1HJ6mN+j43iIUqY73ZQUMVY5t2xXNqYdA6vy5tG
 RwvuL8F81Qu0WbD9S4pKCHDdN+yvIvMmA5og2KAw9RKnQZWZvE0DXVkHurMOHgZFGXFwqOppvCLF+6
 c7DKgP5D5yLPrGTdHYTjfZf6AI8PacTvv1KcaGGeCW1zq6cSpv6AKfjiGETGhJxyIURzmQ8acFhHYk
 fMNj+AxQczDMNk4KL3Neuyu38RLeDKmi2pnevus7THXSeOuKWUxHFO9Ns8+gwjAb62vOhiNiDcxR30
 u22RhSdXqMhNRnPNX59D1r36QGMrOHsemN7CzpMXxtf0lmdYXIvhwD14NTSkIVDQWdV+Ko2ZcObJyd
 PjAcqW7cirsORw8QcQAb74RODyEjKrZnDN3DSaNitv++UgqdT+Ph8Jw/K+yYrCnmvS4fXIY5+aEmSZ
 AQqnjibLgU7WtuTuGSkjjThwWhmlprsOrYQvqGb+bpOna0y9QxbaXpPWgWw2JLgiRyC3Y25ayG40fL
 gUuyPpivBHlfmrEQ8mvpA6d1e1NypftXdVe5aqr5gJGUXm89nrXYGVNU4v9w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071716_614089_9320CEB0 
X-CRM114-Status: UNSURE (   9.50  )
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

Document the display Color Correction on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 8c2a737237f2..9f8366763831 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -24,6 +24,9 @@ properties:
       - enum:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
+      - items:
+          - const: mediatek,mt8365-disp-ccorr
+          - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr

-- 
2.25.1


