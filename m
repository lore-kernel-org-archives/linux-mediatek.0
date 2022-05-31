Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD44C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vbr2K724GqWMoAPEfeqies76ZKv5Xz4ME0djQ+wIOvo=; b=fnI3aYltS2Mxsa
	nBG8To6Wx2gtlH3UEJoot1TTWAOJV2FM5svAjE9lZqGiy+oQZvMVhA3Oa3aa245wdlFT2Uqb9aF+K
	cuL0ueG4BD2/ICVuahZSrtQvKZFK8Vu6mJoGguCP1Cl13X0MCJXYRR6cv4JrH9SfI73Q/R/7fG6GE
	XK/PVC4bp0oTHhL9lKCp5vamQc47U0OKR+n7+8WsZ5/IQnWKf5K47d2FTEYAzHX/JZJ2aF3X8yjzr
	mO8okYB0uDbJ/OvdQId9EGv3JBw3Lng3UMeQMooBm5V5oAD/i1w0iREYcwt2y3pLXSnWnHmKsIpt8
	knucovaCAHUKiniQCx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0KN-00AYzV-Ss; Tue, 31 May 2022 11:46:23 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0Jt-00AYkG-SW
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:45:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id v4-20020a1cac04000000b00397001398c0so1067298wme.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQ/9SuRW2gSNxyY7HSFEc0S6z28TQqq+nMHdkwJ6Hjs=;
        b=eShVvcrfk3gqYk2CaIpk67IugOw/7xJh08X9rt5dq/FTYWlqCHjqocwOSulr6rc/SZ
         0pN/1bbnmr9jDniFi1PhCd/EFfPtEwx/6M1d3KzJIGpFwUjBwyu7G9OHbP/+ra01qnyk
         L5N0C2IxkBFrqrEIJDtb4c1QFogW3rvLHvHTSs/lRGz+gVbJqtcFV2/mRN7RBPvonQeI
         Flmg752rG11r8oF352pxCHrDetidSJn3QzDJ+VrHT7tSuf3iQ5TcZA2pKlMBeRLstHNs
         pbZr/LYgOTivalc9VeAfiz9ddSB/Ulw8NfnZjKQRnc4djzSsiRpcuA/GAgwKXCuzlXYA
         9bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQ/9SuRW2gSNxyY7HSFEc0S6z28TQqq+nMHdkwJ6Hjs=;
        b=HGLm3DbvuYrfrQr6VKd4DcOQDuuK+mRgWaXb09Rs5fKdcy6U1ZKDUxgW7P9fC5y6ZG
         IeMmFJfhk8ZTnUKAi5BT+JYKYMqtJENSmnqeSaiCqcy86+LxgVV2Kcg9rFnfE+snRexU
         bGz/gkcIbaNTizyjXI0Dvkyo3SYeAFvEdTlazRKMrZhpS44edkfgE3NFEw6J1RfA0Zmv
         ZBaueTNhRvIBA0mAv6uF9A+w6pzJc4/TUd2bZAxpE53hJHQ6+Nkvg41Dkq8N1zO++nCY
         GO1OZaZoFDtQWiJpTzxRnHKdd+ctBrqSw7jwdqIJ97us3FAv7IlvHm+CyrWScPui5Sjx
         DYpw==
X-Gm-Message-State: AOAM533VgZ6kNI8+n4vyg5BdwLTuHE2QnxZd0zrtcgSzTWoL3TiRkP55
	F4IWFN7c8uMTBDqSDwwyPyeBEw==
X-Google-Smtp-Source: ABdhPJwJjhIwNfHDxLSY/eNUnC7ZtsMB76qjz5vk7LG+i1TjoIDN2lSFL9muj7ndGdSsaK4RYxe/Fw==
X-Received: by 2002:a05:600c:c5:b0:39c:1396:b489 with SMTP id u5-20020a05600c00c500b0039c1396b489mr7093277wmm.146.1653997551291;
        Tue, 31 May 2022 04:45:51 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i12-20020a05600c354c00b0039765a7add4sm2064154wmq.29.2022.05.31.04.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:45:50 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Lee Jones <lee.jones@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: pwm: mediatek: add pwm binding for MT8195
Date: Tue, 31 May 2022 13:45:43 +0200
Message-Id: <20220531114544.144785-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_044554_040276_B903055A 
X-CRM114-Status: GOOD (  10.41  )
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

MT8195's PWM IP is compatible with the MT8183 PWM IP.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
index 25ed214473d7..7b53355470d6 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
@@ -8,6 +8,7 @@ Required properties:
    - "mediatek,mt7628-pwm": found on mt7628 SoC.
    - "mediatek,mt7629-pwm": found on mt7629 SoC.
    - "mediatek,mt8183-pwm": found on mt8183 SoC.
+   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
    - "mediatek,mt8516-pwm": found on mt8516 SoC.
  - reg: physical base address and length of the controller's registers.
  - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
