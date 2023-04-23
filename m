Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01230C77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Apr 2023 15:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IuLX6n22q+dbXa0VFAcvggvBNepD8bsnQ2lqmRcCa0c=; b=I2JS5hTfgVpH5CRDDPUx81wIDL
	b/SIi1YNt3VPsbWtDFAeuxPLzSeOp/SSfqppuIG33Y8HGhv7dnKau3KMlUCKqEDw2q0aUIrfJjYk+
	DdpWuDH6VeRuKgcuHtICguCiwvF6Po5rOKfDhyYYYZe+Tbuz0dTb68mP9Y1zb8Z2frI7O0Ai4bsaO
	LJ+fTnMS40Qwbh20JAvo2f2BR3RwWQXj/5pMGe0UQPgTM+761GmR556F42vI4HPxQEOxTlXA+A6Gf
	6YzBfVlPyAa/AAjwIk+h+2VUnTumE8js4V7M7DOoXWt/xHVi0pCUV9jcE2oDM3URVet43aO+rHY3+
	VeGWth0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqbKR-00ERwk-0C;
	Sun, 23 Apr 2023 15:08:39 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqbKN-00ERvc-2S
	for linux-mediatek@lists.infradead.org;
	Sun, 23 Apr 2023 15:08:37 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5050497df77so5169654a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Apr 2023 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682262508; x=1684854508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuLX6n22q+dbXa0VFAcvggvBNepD8bsnQ2lqmRcCa0c=;
        b=ljLj9ZrdHyUvR9noreY2cCdb6yGNNSBCGJYqjUt1XCpcsM4Kjax3u6xRTvQLDzwoY1
         /WPxALxkg5TrwMzjTimoJ7miZMGEjWw85XKv5ipNlZKCMbtAXZN6B+XjRfTTsJeSGLz6
         iLU4eC1g072IUshxzMlIzzQ6U7/9pztyXr9fTQJ5xw2Ns2oNza3GZBz4lJW1b8TefVfH
         h3oK6N+toYbCoFH/P/4077Aw9b2j4Dy2n3+izM+P6zgTgWfIQezGQMmgMItgtgHIvBBA
         IRCmHMq9mGmvuuYqgAYMAn/gk2jYpslPxe2AhOhCXGqNGDdkOhQQP9abwQW+IjeOn5Uq
         R0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682262508; x=1684854508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuLX6n22q+dbXa0VFAcvggvBNepD8bsnQ2lqmRcCa0c=;
        b=YGAKrcM5MOEgF1IX3c3PTmjgCGJgH1/1j4Z7F6zgTCqX02hjTMmldeeH+S6Bk5+9bR
         Nom75p5Sqc7nxJil6wICNv7E8/hUtwwbOlpUc9KYt/9mEOMEyD2ygkfI9lGpcjnDeKV/
         TLC2TdbVuR3Si1PBEmR26sUVzjrHP/wOvyUj91haV+9qkY8gCY5tuaPLdpGIY5vzS8bY
         X0DHdhvL+E90QF7MeEhrnYjKFwf6lE9oIcIYRQHNGxCAcvLeriz7KIR21NhN30Xe+McO
         hoj5ik2Ey9lJR+uvcvLehfkxy8B4dhMbb4VRNLk8yu16Iyt+HtwecPKu7/PmJblItgvT
         nbmg==
X-Gm-Message-State: AAQBX9dsyWX8i29F0IhAQ2x1MebkzlGGkp1Br7Lu44xW0Md9QhHxQBDm
	jv6dt5uHEB6WTLOPjKJorOf2/A==
X-Google-Smtp-Source: AKy350bDpsVMNhD58NOSG7sY6lnuKQeOJFhZMI5m9y6vPvn0snrtJoLgzwkjK0Y7Z2TUwtH2ccKERA==
X-Received: by 2002:a05:6402:110b:b0:504:8905:5218 with SMTP id u11-20020a056402110b00b0050489055218mr10098234edv.1.1682262508503;
        Sun, 23 Apr 2023 08:08:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5d52:d466:d57f:118c])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402181200b004c2158e87e6sm3741393edy.97.2023.04.23.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 08:08:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: en7523: add missing cache properties
Date: Sun, 23 Apr 2023 17:08:24 +0200
Message-Id: <20230423150824.118430-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_080835_806642_7543B347 
X-CRM114-Status: UNSURE (   9.11  )
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

As all level 2 and level 3 caches are unified, add required
cache-unified and cache-level properties to fix warnings like:

  en7523-evb.dtb: l2-cache0: 'cache-level' is a required property
  en7523-evb.dtb: l2-cache0: 'cache-unified' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/en7523.dtsi b/arch/arm/boot/dts/en7523.dtsi
index 7f839331a777..b523a868c4ad 100644
--- a/arch/arm/boot/dts/en7523.dtsi
+++ b/arch/arm/boot/dts/en7523.dtsi
@@ -81,6 +81,8 @@ cpu1: cpu@1 {
 
 		L2_0: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
 		};
 	};
 
-- 
2.34.1


