Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE790C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dC+/yReVVtnmp1EFnfhA5gyiPu04TshQ+QR3r1EqXE=; b=n3l9nHVvM4LbESPfz52hMPwqd0
	7ozP28xfs0hGKBtMlBNGHDBmz0KMb4Qh+hPrMXyRRu7HXiZEPiaqqbDqRUnjTsw2c1FH/9If9gi5p
	rHlXLY+Yf33uy2ELgaRS1eq1AYfRQoH7VCu1PC6LIdsvfYeIv6DOpSmsS4ux1srNmGLP9BUAK619w
	d+ZKyAcPy7C1V3s2UsJTpEWRQgDqOT8AVdq3/b6laCbw6UdJz/1h+/+NSoXgAGJQPOKCD6S5wvaNn
	++tnYq/voBCOVFQeDZsXt8vvBfYWXa/SQpRZ0JKVc9X3x3AEYUrUnwkaHIh5IO85UjYg9Q8wc57HM
	zkhZv1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum7l-006z9r-I2; Tue, 15 Nov 2022 02:56:33 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5u-006yNG-8A
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:41 +0000
Received: by mail-ej1-f48.google.com with SMTP id t25so32874886ejb.8
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dC+/yReVVtnmp1EFnfhA5gyiPu04TshQ+QR3r1EqXE=;
        b=fdYDr7YwhQf3T6yIFyQ7MGYT6DsEuJKYYY0VfusCG77DrHgentotQmgPxKQbH4jQms
         CaU0woUtv6FB4PfzuXMGao7sXiPPqdJ3ezRLhdwaprQvGPuFCbEBHJZNLhEPjMnuAbND
         ix5l04a/f6f21SoFK4kPx0epmC1RNnJE6Gff5E8xKr670sElcztjY+CQugFF8y4igQNs
         N8HfwVsZU6YULzaCkQ9g/ApCqfcH9MNdOFezY7ukElKD+OCYZL2stFlBbhc/bTUZdjnJ
         X4TK6XXD9Sr5FvZPGs+HhON3ZV9L2cUUO+sGP3l2BRcttDoS2tgOe9oRJLNS4ShnOLkV
         Vnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dC+/yReVVtnmp1EFnfhA5gyiPu04TshQ+QR3r1EqXE=;
        b=q8IXaMHOrZIZRGTqGMEB+VF5c1kyPjKvXKCEbq9D1GuM+NXMVkSSt4aN/hXc+ks/lq
         NW1d8OdmZ20x7qY2+CrfXaDA/8WcS6M2O8d8mV4shwx9HRZiBn1FRDwArbh7QjfkVnwy
         vIdanH6OWuRDPqXJzfIElbYFv3tMPNtO/VaeAgeLXBEZgt/84rF143hXqfQxajJP/4sA
         z0JIv2Mx318Y8BLloznDuBIPgzImbvosiVKlx+cCMmqTXOE+5DgwgWbcdX8l4csmKgMz
         oRoUT0InnHEvoljjv4BH6KrIjb9Ytg6FaRB+hx+lzOa7+4KJ5Ga5VpzAcuIpkjA6lGOk
         4A8Q==
X-Gm-Message-State: ANoB5pk+lDTC8pM8tQCXoP6b6Wn4GwwePNAeqG1cFQrE2FzHDjNYxC4N
	9Nirgw9ltUdIlhNNayOFDbuhC70ht5thZSba
X-Google-Smtp-Source: AA0mqf43vKDWJvP387IvF/pav4o4KaaCLekdMIqywSmlrG137P42oFTN9+LzjZmETi7gFi7yY3TiwA==
X-Received: by 2002:a17:906:a1c6:b0:7ad:d250:b907 with SMTP id bx6-20020a170906a1c600b007add250b907mr11763109ejb.737.1668480875586;
        Mon, 14 Nov 2022 18:54:35 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:35 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 08/15] dt-bindings: nvmem: mediatek,efuse: add MT8365 bindings
Date: Tue, 15 Nov 2022 03:54:14 +0100
Message-Id: <20221115025421.59847-9-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185438_361322_C5A3BA11 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Fabien Parent <fparent@baylibre.com>

Add bindings documentation for the efuse driver on MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 75e0a516e59a2..6893f2a6ea225 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt8192-efuse
               - mediatek,mt8195-efuse
               - mediatek,mt8516-efuse
+              - mediatek,mt8365-efuse
           - const: mediatek,efuse
       - const: mediatek,mt8173-efuse
         deprecated: true
-- 
2.38.1


