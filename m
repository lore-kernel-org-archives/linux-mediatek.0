Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF558CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=; b=PUaJWzXWN+We6KiICcOgwRS0yw
	sc0fe1NqB699styriOwbF2D0EL+U1vt/K/5uRDg7HkgnTBZsN4X7mctmckpEcTIDvt6gFI5+mMibw
	xnJ2KnFCCU6G29QfjscFN3htTLEXDzLd4NmsQZcvpbKvuXLpuY7DZLzYYuwgOrC8muZgClmDg7lMe
	zgO2vQPP+UeM4Iv+CrWW6luRfPysZ5cZXm85fc7IQDNM35+yFm6nLMOX8cIOwIHLp8e/h2JAfJCCE
	fwcTJr91luxlXsKBOaoYLodb1kYBHNvC9yLzDM0wlXJuRNg1F0U6eZTcBEGL1qRPr8bNBO0oO6a1g
	6mGfST7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Y5-0000000BNVI-2gez;
	Mon, 01 Jun 2026 15:27:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU4Y4-0000000BNUg-0ahN
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 15:27:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490a765e68eso12909465e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Jun 2026 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780327646; x=1780932446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=F4J6yM2BdF1qVlpxX3fOhv7cXcMNnt2i4gzfuR1ochDzWeMYeIefy6N+kSvXVa+nDu
         3ehQO/jfwpSC+LVMA9IrE7jSjkgUy3D6piAMKFKwfna35hw7ZtpGQGFMS+za02ASyLwA
         FgGKIW1xXIaeRdIJ7FliB6xDgXN0p0pR1Xf9HzDxwPY2fHGKCgI1xqfj8g9mAmQDpkb4
         9kfgBUFhpzwl5oSdUUCM7ZFMkA8UBzFkPqu1xP1J72W7SakhNedcXOkLqB6HSax0AsE0
         9wD3wLT2qtZO29XV2nmuk+FuHoP9HsEGESBbIUN0w1OethJpHsqWio5Gd4U4SZJp9Evd
         sGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780327646; x=1780932446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGzIR3Ya12RsZQy65tkjnFhcSYwdslivQxR7gOO4emA=;
        b=TSM/11IU4cpdHLQnUkpnHUGDUzTq6fHD/GYuyF2J8qDJuObnGWvk43sTomN2jd37Yj
         8ciAPpCET8T4xalvfcLUONgpTTAaSaKn1qLo9VB5ZpvFFIwB8AXPuso89r5hmgKbBVIc
         Gm7oemd0PIu/bJnAOtg9AWX50E5LOfz8bj9HpxHnPJaxcxnRPZg43xky/uEg/KMVFOS3
         IX18HAfVg3UndPx/Ma3GwolgmqrhODGm2CHMQMOCjpSM5tHiWxHfoo67fcu5V/BruOjE
         pX3caleshuSaRkLZ1FkUWCChmQCGtOXMBm4lZlpozUEpzR+nXPT2j9ErknFyG1beiWno
         r6HQ==
X-Gm-Message-State: AOJu0Yx6QaheQQesFn0dtIevA2JNzQpCLGljt8wvJK4Q3dt9eqtCh9gV
	PEfHexN3oScsXf1aSROZkI8MzFe+lXNDQCeDp7q04JLqE6GvY13QY+4R6hEO64KFgT8=
X-Gm-Gg: Acq92OH4iLHvoiZbeC6tIFTsX0LCx/ITw7qhh1YpqN8DjXiE2nmUWSHza34gVXJZWzy
	zr48kpjwuVqWY6+gxsF0CdjOXcGge2IrOb6ss5PRCHIR9Pr9cdVLdMsuSuHR2lb5omg+xf/7NDo
	CPj2CiZLbZ1GxNLiOodXILXbrCOfmZVasHkRLMgDt7//NpA5E92Df6ZggcxN6ibIkyXx2R3fjYT
	5A1aq+q6BD4Wx9o5Ufj4sX2byh4Y06EPzUgRr0skelOzrBYA3PKD5Aj1sZ1tun7//RefVTieC9P
	NZ68q5HfWHJ2sxV9u70Zor2pUm1JyCPz6cYn9KP5TrNsnw5MPdjZw4XSljowsFlbkdkVJk2bIWQ
	qDRkUDsFqViqa66RdZwbMFnYQM+ijyX7/5UuNkU+YDKupPqoXYO0IlMRCp9xewqnRUMifkddB1X
	55p0L1eHcw8SCmroeZRJruisW94JY=
X-Received: by 2002:a05:600c:c285:b0:48e:5fb8:f80f with SMTP id 5b1f17b1804b1-490a2966ce7mr127746435e9.24.1780327646037;
        Mon, 01 Jun 2026 08:27:26 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ad63b34dsm14041635e9.27.2026.06.01.08.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:27:25 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the slew-rate property
Date: Mon,  1 Jun 2026 17:26:42 +0200
Message-ID: <20260601152707.29039-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_082728_187139_6F3A497E 
X-CRM114-Status: UNSURE (   8.90  )
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

The driver for MT6795 pinctrl already supports the slew-rate property.
Add its description to the documentation.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
index 68e91c05f122..9a937f414cc9 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6795-pinctrl.yaml
@@ -152,6 +152,14 @@ patternProperties:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1, 2, 3]
 
+          slew-rate:
+            description: |
+              Set the slew rate. Valid arguments are described as below:
+              0: Normal slew rate
+              1: Slower slew
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1]
+
         required:
           - pinmux
 
-- 
2.43.0


