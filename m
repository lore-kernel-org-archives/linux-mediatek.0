Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DCC1093190
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=; b=Q4nKuu4HdJ6QmgB7CDSxVwPQxF
	e5865SjLCYxtFWcVWWAPYgK/39F2w6fX5YKH6jV9yacnnq8OSipJoqefqwuuKcM2K6VL5YQjGxt3j
	OCifubhF9X3mVxzw/FeKCApL1w0eq3tU3y4FPvkqooHOMNxOOTpK0L8BCgZ6bBmdY2rjsatWVq4lN
	pw4AEn8GcbZd0ofxOYwCtOhl7FHgh7+Ewtwerqso6qcB5VT/KaOHHDzefOCWPL3hQun68+t2i/L67
	YOIKO1m5UQ/ERKcBMg7Xni+curLXOoSBSwrdQ1meqL86lLFPureVagCcJs7WTYuJ8A4vXuU3JBABR
	+v5oEN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSi-0000000CNfS-3Mq6;
	Fri, 20 Mar 2026 08:44:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSe-0000000CNbn-2sRt
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so651278a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996244; x=1774601044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=;
        b=R4f5CeqEXyL9fa6yaWjRAqgIZNrZhISHEDxP1e5B2krfUK7mL4SxII+lweqyBinita
         UuJeMh+4ehn/ZxENMHVo+8/LALdPIUuMNPYQ0JbzMXM6a1fAhHA0N1vMZn2u+LQHOTos
         r4wYrCGcsomG0mOhn4o7LcKmEJUnj+4kArQlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996244; x=1774601044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWqNbTB8lPl7NXUj5bx+sUi8aqMzplYLnizvMqOci1s=;
        b=r9YxJ3VfxD16ROYH/EgBiz8uFZelU+fYSww4AFUJr8BpqPXB+a92tTvx99SC2AYWH4
         tIhToCQW43Y/ak/Gmd5fCIsmWSQXFvhv41U/2DvALizJanlb7/V/vPQlD463L0tecE+H
         VTednr9yJFZ6lEJIkGlI5PLlKh2yYq/1CtNF3jJRqtQB+1Dm8vdQvisb5NiAlHfh3L4q
         HJ9XoQmNs49Abuxpiqs6lBi2bSdcN9k+5Zg2xpjHluOmRolTzPMWvy8af9lqqBOXbbET
         aC+fLPbZNLp/gzhRFnaeYcbIbQBQHuD/sqT4XTHuaDixgWLBXS8EbUN0LdjNaBuJbLRl
         njcg==
X-Forwarded-Encrypted: i=1; AJvYcCU5bCWGNCMLqLqaItUwC/f/WkphnCJJp6/qPa2tbNoX7wwOkoMKaXu5NEXHVmjWtmTjaY01StryZhcHOpJJ3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YztNOp8jpjMRXBFKZE+B3oBvdWKjRkbQqw35UFzYkSiaFAtXkTb
	GqLCfXrFNUnCTse3rDc4gRyqn4YZaWfEOPIetRQlASM3uTtWwmep/1M+Jb/33PnmZg==
X-Gm-Gg: ATEYQzxhUmjzRgn+/McMljjgINTvLD4YurYLaQJCWhciRj/rurQSN/Fk50uyqC4ih+s
	1kwewY5m64jKGk1CsDpcWQdGaBKfkstZ1v4FGBy3VDzkVt/um1mUVpP1Baf4vU6T58KHnhks1v3
	tVv9jZfiiSHCeiYCg2umYuHNk07LEYIBoj55z3u7D7OrQAysskMyMUGn271X26OXzof43RjsuBb
	pShAARHNwUwyRMmA9a6WWvb3bWbudfLZEwdPzb+rc7zly5nS54wI5XNkm/Tfi1UgJUep19GJmq7
	yv9LhBqQSwHEyHUI2NDrqpXxgO62qEx+7UEy8hSvCNcUxLnLehz6abCQeO/PVS4swBX/sIRgVIE
	CLS2nm+aYbu2LScJMRLuPzyYuI/UGy3ZaPkNVnQrCKmKDszANWD0HVF9Zq4+2og5iorTW/zWLX/
	UIlrL7ld+2XMBPx8D4EVpqSTFkSeR43D7dOFlwpJYfkd97gg4UU3EKDH9vuJA5/JpRtl3J2mHE1
	uPEIwRd
X-Received: by 2002:a17:902:e551:b0:2ae:6755:a258 with SMTP id d9443c01a7336-2b0826b8b9emr20276665ad.3.1773996244137;
        Fri, 20 Mar 2026 01:44:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/13] arm64: dts: mediatek: mt6359: Add label for regulator sub-node
Date: Fri, 20 Mar 2026 16:43:34 +0800
Message-ID: <20260320084351.2461060-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014404_728539_B9F76B5D 
X-CRM114-Status: GOOD (  11.52  )
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

The MT6359 regulator bindings gained supply name properties. Add a label
to the regulator sub-node so that board dts files can reference the node
to set the supplies.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 1c41c4701319..a3542186fc64 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -19,7 +19,7 @@ mt6359codec: audio-codec {
 			compatible = "mediatek,mt6359-codec";
 		};
 
-		regulators {
+		mt6359regulators: regulators {
 			compatible = "mediatek,mt6359-regulator";
 
 			mt6359_vs1_buck_reg: buck_vs1 {
-- 
2.53.0.959.g497ff81fa9-goog


