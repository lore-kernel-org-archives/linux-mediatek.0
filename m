Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T67aByw65J3xfhCYAXL/z94/HpCBlMS/sX/BtGAHLTw=; b=d1DbhOohndMdBH
	7ajVd9TWo7BT7DIzZB2tRboiygHlKU0V7D+mQtjEDr0F8eNVALuvERX8Vz+LFNnN2ngLiFe+/fumo
	NQoJ3+4/uiFJdgkkFSkZA2CPcHRfJSRzn8mVtWPGjEhVCnhFpkt7kyzGNa82E55IGxwDzt6LV3iyS
	c6hP2RFasJfiP3w9TS67TAl+4LWqAra+3R0+GgVs1gcUBhUOMrrVV0WEXrPLEmYIYFCgBfYtlQQqc
	knffQMVQbeDjwr4icgqH4jHaWMjZNuCQ/eQJBmLsF73v+1bPa+8jvS1JYqYEQlpb8nqE/CaDNxhaX
	pfKRp8oTAEUUfWBp/dJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWnm-00DwmV-Uk; Mon, 14 Feb 2022 08:33:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWaP-00Dr80-LD
 for linux-mediatek@lists.infradead.org; Mon, 14 Feb 2022 08:19:55 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66E9C407DB
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826792;
 bh=twEcMK7D4MpQMmFx/xz45Xek8jdGQn3r+1Fp5P1lKZI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=TeG/jb3lwXluq02uJzsB4g9rDDLf951RPp4W9Ai2gjjj95POLOsRyAPZ+bRtMR5Go
 FPH7nI1mF1W3j1dggfdnAaIcr5Gzfld/EckrP+ClVCC8JQWKXNw9Fews2Dg7kTy+Eb
 Pa5CnT0pezzQEb3JDGxRPIweXCP0k6XlCOcyyvg7KXxg4eC9o39uh93oXkyMJaa7mB
 fhXZAgSoeIiLpDMKLlHHQ/7N9QcrG2PH6Zp97O17ajgw3+wIWrqQBp3lrfP0TBcxuQ
 vOpmJs52ztMtpbqkbZbsTBkH6yrdVVbaIpRynKxitqS87VxAnN4+b3c/3mhipur7vy
 mv6Rja+7WhByg==
Received: by mail-ed1-f69.google.com with SMTP id
 en7-20020a056402528700b00404aba0a6ffso9797307edb.5
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Feb 2022 00:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=twEcMK7D4MpQMmFx/xz45Xek8jdGQn3r+1Fp5P1lKZI=;
 b=Uk2DuELUbWNcdxx0c5eIHMvwMYds0wBL2y1e7LRESzAMvFwdhX9eyDYFspjUjU7of8
 rOx5HgT8hDdBEp+3KUPJpbuQjCKFWQLf7GlQhAdSU/H+PJKFI1JvufkAx+ozP2O/2J9a
 Xeaph96FpymkFi2DAqKVJCBdV7+0UHHxc7zaOT13xt4UxSgy9OHzABigtbf1gdbJyqg0
 3IL/BPGVDX00zGxO3Dw3jaHyJf2OCeKYEVl1qLI4O5sCVpovAjO2lsQVzEXRr1ISaDZw
 W+TxUSdCx3XzRvUfZCJrCe64wroEydEot3jSwkzezkjk9GR3IOTJOJQq+XxTpc4NywSZ
 vtgw==
X-Gm-Message-State: AOAM530uL9cE4IyBXRit9EhTUPShwdVlyu4l2nI+x7VjOqcccKCHannt
 m+0utuJYF966qqEF51WPtM6a3LstzdmJOAugKOG5gP65whIE6FFsUxkg89RpsEey1e8vKuTwSfr
 +GoDycOgi1QTXaNsayqBy1mXHRAStd99nKkKY8XwUBfE6YPaHkw==
X-Received: by 2002:a05:6402:490:: with SMTP id
 k16mr14100047edv.204.1644826791992; 
 Mon, 14 Feb 2022 00:19:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2KcC8ZeDmmjUgfK6kq1aeD1UrtI7pu7omHRR58fZiRCylZRo2PHSaI/KjoBiBhqpeH5FfTA==
X-Received: by 2002:a05:6402:490:: with SMTP id
 k16mr14100021edv.204.1644826791865; 
 Mon, 14 Feb 2022 00:19:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id b20sm2022941ede.23.2022.02.14.00.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:19:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Douglas Anderson <dianders@chromium.org>,
 devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 0/4] mfd/pwm: dt-bindings: google,
 cros-ec: include generic pwm schema
Date: Mon, 14 Feb 2022 09:19:12 +0100
Message-Id: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001953_861618_97D2EBB6 
X-CRM114-Status: GOOD (  11.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

DTS patches are independent. Not tested, but I really hope no downstream kernel
depends on pwm node naming... If it does, please change it to compatible. :)

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  dt-bindings: pwm: google,cros-ec: include generic pwm schema
  arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
  arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
  arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema

 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
 .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml          | 5 ++++-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi                 | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r0.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi               | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                   | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi      | 2 +-
 9 files changed, 15 insertions(+), 8 deletions(-)

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
