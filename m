Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DF2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=; b=1Vd4Eh55MUgWpFZA3bhObfStQp
	06gNPJin+mHcf0myWjnONIJVk5fclIEyIdnzr+1YjhXgFoC18DfgKxh4x1P7Hb+gQXybMWxrCXbCs
	ifLeFfCEJl9EuGiUZdOIuFfUjL2Dw69o34mZ7s4n2zj5nRc58tJLp32HPWEGe1X264uGtn9qQ1viN
	egqwFWAiK8LIsIrGjx+KHPOpC7msi/sYAslIsCw3CIMsjpF5DDmWO7UfPWW9pe7zzY6hxZAOX6gqN
	5w9kuSuvE+dUszIsUVtWDPbVjCv2U+4NsK6P1VrTUMIcXunPP8AQp52dyOPfMhEJ9IX327xYOpFEB
	sqYtbD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNv8-00C0j6-Ij; Thu, 09 Mar 2023 21:35:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNum-00C0bH-As
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 21:35:11 +0000
Received: by mail-ed1-x52c.google.com with SMTP id u9so12738050edd.2
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 13:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678397704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=;
        b=3KewT/q6ngZIc0ufTpR/r0Xx953GgwMCDFM248OUypVlz5UD6D7zajvtZVD1vO3Eyu
         fgLJk55a/qL5nQpZr5NP9g0VorvdSwZzqh382Iqb6a8UupxsxPjDDlxRkJVRHVg/7XOx
         sQqiSD+NoibdaGACFjHP0qWTB4YAluyDVuNstzT0kQC9vux6vRIqv98V6pzZzaLbSnDN
         XT4o2MjBbig3EQKpsEbcs/8OXbjCgzWW/YCRkWUabevY4QdpA/L6cNSH65pkG1J14Ttl
         O1nNXyMIe5yMnejmQEUDqCZwC5TUkAuq1v7NR5KnqnPsIZZt8FHqws/y/yMLRdtQle8H
         BA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvjNBXeeYphBWgNkcT8wLT8gdWY2M0B9Tjp0nJ/il2U=;
        b=qM1gwEvGFeWRVdSxxTuo5OM+vJ6Hm0xbqrMfH2NtfjGXv7upXzRE4yCwVQl959Ipep
         InmwpigV9b68MaTe1oJ+4N8XEFkVLEW3wAFF5IeED/NjHrlp9w81l8vBRsRUIRfN77Sj
         Bvceb2HFPo7tSao9NvivrR+wli8k3vFJ6NJJ8ueM+BM5+bnV4YHCjRiraz5UvB0mn4rh
         B2cl7CyrojyJq6xlOtnYQ8avdFfdZQvJnn+UN5tbQ1WmZEXXRmFrYokJXU7slYVJKS44
         C7+Dpp6PC8BF3lW0SdgrnCkJEy2ZueeQ+Cy0db5mhnck7N0ubaqmvY5UI3+S11tUh+ui
         eFTQ==
X-Gm-Message-State: AO0yUKVLYlUHO3eowHrpfG/3IeEEBIeTW9HVioM81e79mqkmGt+u5Suj
	XCPdFjIosmg+r6UKaDhcgZNYsQ1Gv6M7deVOssA=
X-Google-Smtp-Source: AK7set8/H9jiyeApQuJY4jmDkQHw3OFChM+1m+frQ+5xrQC0cZQ5kxnS7LOQNNshtSNIzKG08bG4dA==
X-Received: by 2002:a17:907:9721:b0:8b1:9e47:9101 with SMTP id jg33-20020a170907972100b008b19e479101mr27369379ejc.12.1678397704239;
        Thu, 09 Mar 2023 13:35:04 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id 8-20020a508748000000b004af7191fe35sm211486edv.22.2023.03.09.13.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:35:03 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de
Subject: [PATCH v11 1/3] dt-bindings: irq: mtk, sysirq: add support for mt8365
Date: Thu,  9 Mar 2023 22:34:59 +0100
Message-Id: <20230309213501.794764-2-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
In-Reply-To: <20230309213501.794764-1-bero@baylibre.com>
References: <20230309213501.794764-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133508_379135_8CADE388 
X-CRM114-Status: UNSURE (   8.95  )
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

Add binding documentation of mediatek,sysirq for mt8365 SoC.

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/mediatek,sysirq.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
index 84ced3f4179b9..3ffc60184e445 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,sysirq.txt
@@ -25,6 +25,7 @@ Required properties:
 	"mediatek,mt6577-sysirq": for MT6577
 	"mediatek,mt2712-sysirq", "mediatek,mt6577-sysirq": for MT2712
 	"mediatek,mt2701-sysirq", "mediatek,mt6577-sysirq": for MT2701
+	"mediatek,mt8365-sysirq", "mediatek,mt6577-sysirq": for MT8365
 - interrupt-controller : Identifies the node as an interrupt controller
 - #interrupt-cells : Use the same format as specified by GIC in arm,gic.txt.
 - reg: Physical base address of the intpol registers and length of memory
-- 
2.40.0.rc2


