Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40AFC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=; b=QutupPwm/1Faa7VCvO/Bop7kGT
	ybzENwkBFHBUFx358iPCvO8HEg1jSa8dv3l/v3q0hD1hWbHiFGXQQ4S9t7PuUqvbdXot9URQeYj5l
	xZfe/gcl/d9uSsKF9IGp5TtsgRw4aiMOG1aBr0wet2SfKq3GXbFYhjZ8K89BuPu/CNWOhvfbdszNf
	a9BW61AQcblk8Dbd6DJczlhi0eRit9RF7ETx33qKkc1NgL2SKc9OxQ3/WKolhABTjQf371lwuw7RF
	06R9aICoRnxPmfZFHfVLdLLd5RLQ9odMI3UHFHwDCo2TDw0SECHTkrpdu+4ls942sd+ya6+rAsJHI
	0NcvgKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHPI-00Aaa2-PI; Thu, 09 Mar 2023 14:38:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHMQ-00AZJq-9i
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 14:35:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id s11so7783953edy.8
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678372509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=;
        b=VWPDh6dtM1UkmUdD7p5LKK8/I9+WNmFbF+ajDTXODZ3BAiuXnUEvgLz40BtjcvPYRZ
         T/FpT9sG2LUdjcjm3BXeWIPvnqgqWZyrJCESFGxPJ/xizYSGzfwomH7IkORp0woQr4LV
         7EC6cWtPzN8QhwV9duy3AoX7PpW+T62soDi4eE1WhnElgDoIfmfONRcS6uw1NwhjYUo+
         J1QHsW611tFkrVCbFwA535WwMR8D8XWr/zaBP+l7NuVEzlrA50Z9CR0xzO4Hx0Ia1O6g
         a2AsWYRc9LvX0z9kSz0/n3T2dBk4IANbIxcNxbdgmP2N0sPCziJx7HE0+JOhe1IXKdET
         +Taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678372509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XGnTW8d5154ClkyTBOCffDzRAqbcCupwBDkGcyCWzM=;
        b=p7Uu+MufQeS2aStLgZUaIWwMTxxOY6G9rVxFbOjU8h/TGljbeSztZC239gls0v69Uv
         aQzr6It2ZfYST8gbBDpsG0D8G4z5hQys+nPWSVFFySYVEW9fFUPgDkGlLLr6ZLOZ1erm
         oecdLT1MBkiUh8OWE9F6eMpBrQqkaIaHhxIT7/uzp6r+Z5UBVQFA7+hHWxlbhxHvXtIi
         Dj+8efLmND7iuHyI9SiUc/a+HNCug9G2wYcSp86ry2VMFPpjhmdGIEP7S0mSqIdGPHmB
         rn0ohvA4URBPD0Goyo14y5rwWRjfwbwQS81NlO8WrBgoyFSq7ErGJZrLC/ZpaXNH4sMi
         3aLA==
X-Gm-Message-State: AO0yUKWI0pVrEpHahl/EsM3vHYaZGrG09q5AsQTaBwp2UUmoNNHR2iCl
	RrKPQjxjj3ahZBZhh7ghotzp9VYnpPCR6A/H2t4=
X-Google-Smtp-Source: AK7set9O4rl8P3uzhwE/hnhV/DPn1W87oDD35gpX7Y95gY0+bM2ivwGXgJy3SWXHzNLsycSnau36pw==
X-Received: by 2002:a17:907:72c9:b0:889:b38b:4bb2 with SMTP id du9-20020a17090772c900b00889b38b4bb2mr25849740ejc.49.1678372509238;
        Thu, 09 Mar 2023 06:35:09 -0800 (PST)
Received: from ryzen9.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id w4-20020a170906184400b008cb7473e488sm9046239eje.12.2023.03.09.06.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:35:08 -0800 (PST)
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
Subject: [PATCH v10 2/3] dt-bindings: serial: mediatek,uart: add MT8365
Date: Thu,  9 Mar 2023 15:34:58 +0100
Message-Id: <20230309143459.401783-3-bero@baylibre.com>
X-Mailer: git-send-email 2.40.0.rc2
In-Reply-To: <20230309143459.401783-1-bero@baylibre.com>
References: <20230309143459.401783-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_063514_446337_62F91AFC 
X-CRM114-Status: UNSURE (   7.34  )
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

Add binding description for mediatek,mt8365-uart

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index fe098d98af6ee..303d02ca4e1ba 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -45,6 +45,7 @@ properties:
               - mediatek,mt8188-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
+              - mediatek,mt8365-uart
               - mediatek,mt8516-uart
           - const: mediatek,mt6577-uart
 
-- 
2.40.0.rc2


